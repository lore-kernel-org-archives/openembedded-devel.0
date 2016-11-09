Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8C10F6AC00
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Nov 2016 17:35:51 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id t79so314758523wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2016 09:35:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vAnA/ws8qrJDMKB/THquW7Oo2PajxBCN7pYbCeL7EXI=;
	b=IcrAPL5f4ttlshdVFQD5O1JWoBtj10xiq5AwDIvgzo59yQehtsh+HLlbhKNieHp4AV
	Z7/eyrygmhRdb1IaxshFCQ5+3pfAA6zRlO2JbzuL9pggPROodr/+zUQ1f+jvaMFNsLvP
	HMogE9xUlnijfPK0hqRgvxlkkkhNfCtcLeZuZsuGXLU1aLwiSY6EZcLQIicUusbmf7Y/
	hoNW9oGM2fG7Eg+RmYRNxEdF1zzdxTb1BVFgAHmbmaScNjlUnzyxulPZGqxPywLbBFi2
	+muCRN7J68NerkCgm1cbbpow/xBNvn/6WTsEr3kLHnkTNyGQoSJAbfS1mLbgGYdwSWFL
	ZJaw==
X-Gm-Message-State: ABUngvdfuhEiljhnCj5pg45nEObL29FfkNVE8jxGKcQldSGWQy8qxN4EcysYvXe3Q0B1ZA==
X-Received: by 10.28.157.137 with SMTP id g131mr1421318wme.29.1478712952680;
	Wed, 09 Nov 2016 09:35:52 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	m194sm1416378wmg.11.2016.11.09.09.35.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 Nov 2016 09:35:52 -0800 (PST)
Message-ID: <1478712951.16264.3.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 09 Nov 2016 17:35:51 +0000
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
X-List-Received-Date: Wed, 09 Nov 2016 17:35:52 -0000
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

Just one more - I did see KERNELDEPMODDEPEND in image.bbclass and am
clearing it in my initramfs recipe, but that alone doesn't seem to be
enough.


> Is there a way to break this loop? Or explicitly remove the
> kernel:do_packagedata from my initramfs recrdeptasks? So that I can end up
> with a non-empty a kernel-image-bundled-initramfs PACKAGE?
> 
> 
> More generally, is there a way to achieve what I want? Maybe in a
> different
> way?
> 
> 
> 
> Thanks.
> Andre'
> 
> 
> PS: I could probably do a two-staged approach, build the bundled initramfs
> first, and then manually copy it from DEPLOYDIR during rootfs creation
> time
> of the main image. But that seems cumbersome and I was hoping for a neater
> solution :-)
> 

