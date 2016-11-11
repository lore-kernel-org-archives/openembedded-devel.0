Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC20719D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2016 14:05:06 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f82so93866599wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2016 06:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HtOWYi8h6/bF0j7R75DaY3kZAn/k3ri6TwUN9nDHyZg=;
	b=F5hCWvfuHC2xdSm7GOHdAYD8z4Ac9xxiRbxS+zbCjooyaksj8qVXqBNoUZmhzD1ugk
	7zuKfkD12J7LU+8ZA1QlcO3XZOBhzbYi0Ur9g4AgC8esUIPlSiKiU6QSlG3NWCJ9I2WE
	e9eGnl7qR5QDS4/XD6MRB62ZYSIgzqFvSwWf3K4Mj+K8/yhESwpU4aK4QCyyGoVfM84b
	RGdSVxhyHdYcKacl0Vu04GceHi+vH5RgrmzI9HE7Ol2/WNOf3mu2PnV7rGJFi0NbrWIq
	thIQED14AilbEyL0Gxlp+Bi3xodIzSFzy16Ghd/V14ZQwFi86kMG/Eg273aVkzjRoJfi
	U29Q==
X-Gm-Message-State: ABUngvcHp99uMlBzkzrwEyq+xf7jaIQBELRw8PubmJEDwy2tyg1P5jkUtmnWZose0E6INQ==
X-Received: by 10.28.210.1 with SMTP id j1mr12186684wmg.86.1478873107293;
	Fri, 11 Nov 2016 06:05:07 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	cy7sm11652813wjc.26.2016.11.11.06.05.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 Nov 2016 06:05:06 -0800 (PST)
Message-ID: <1478873105.5713.3.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Nov 2016 14:05:05 +0000
In-Reply-To: <1478712645.31848.5.camel@andred.net>
References: <1478712645.31848.5.camel@andred.net>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: Re: copy combined kernel+initramfs into main image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Nov 2016 14:05:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-11-09 at 17:30 +0000, André Draszik wrote:
> Hi,
> 
> I have a need to copy my bundled initramfs+kernel image into the main
> filesystem image. So far I have failed miserably...
> 
> I have tried to achieve this by:
> 1) adding a new kernel PACKAGE and adding the bundled image file to it
> 2) moving the 'bundle_initramfs' task in kernel.bbclass before do_package
> (rather than before do_deploy)
> 
> 1) on its own is not helpful, because do_bundle_initramfs hasn't run yet,
> i.e. the resulting package will be empty.
> 2) causes a recursive dependency, basically
> kernel:do_bundle_initramfs -> initramfs:do_image_complete ->
> initramfs:do_rootfs -> kernel:do_packagedata
> I think because of do_rootfs[recrdeptask] += "do_packagedata" in
> image.bbclass:
> 
> 
> Now I can't figure out why the kernel's do_packagedata ends up in my
> chain,
> I am not adding any kernel modules to the initramfs image.

If anybody is interested - I basically have a dependency on
do_install[depends] += "virtual/kernel:do_shared_workdir"

in one of the recipes that end up in my initramfs. Just this alone seems to
cause the dependency on kernel:do_packagedata mentioned above...


> [...]
> More generally, is there a way to achieve what I want? Maybe in a
> different
> way?

The solution I came up with instead so is for my image recipe to:

do_rootfs[depends] += "virtual/kernel:do_deploy"
ROOTFS_POSTPROCESS_COMMAND += "copy_kernelinitramfs; "
copy_kernelinitramfs() {
  cp ${DEPLOY_DIR_IMAGE}/bundled-initramfs ${IMAGE_ROOTFS}/boot/
}

Cheers,
Andre'


