Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 34D34719C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Nov 2016 17:30:45 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p190so30690632wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2016 09:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=xBKD4OQkI6TCtHViWtq10TSf0NJvYetSt+N6yCzfaqc=;
	b=AS+CTs1Y1hgvzVDtTx3nhnvKkq2Ewr47I909qPbN/JZHASG/6fHvALPCFOltFyMZD6
	WwmlXpi+HFPOFLQ/0YA4b9x7U94QhT7wktCw4kvvUskaY4GTyX3oS/VcyZiDG6fYngVb
	M+oyezHvkIx+eolj97bf77V08lC8yIjHlpHXPDEWQSonoYx8FZ3ig2ufpQDA6r7x6FCW
	QrQ9BclTqqcSxiqD67lygytBpX/rZUhOPm1pWft1ghnEFJSGXsbgDsTYviZ8haHSv5Cy
	Lsrk3TBOi3efkiL7ojwlp6OZpXuXAFx2dn5ZOUPnjLShI5c+n/VhfSSftoK/1lzsc8Gy
	pycg==
X-Gm-Message-State: ABUngvcp8fGdJsecokXpm5W4ZROCVqWfJgvGvlHqSOgWaDRum/z+i42jG07MixNAd33WJQ==
X-Received: by 10.194.186.177 with SMTP id fl17mr603238wjc.143.1478712646671; 
	Wed, 09 Nov 2016 09:30:46 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id l19sm1410011wmg.5.2016.11.09.09.30.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 Nov 2016 09:30:46 -0800 (PST)
Message-ID: <1478712645.31848.5.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 09 Nov 2016 17:30:45 +0000
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: copy combined kernel+initramfs into main image
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
X-List-Received-Date: Wed, 09 Nov 2016 17:30:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I have a need to copy my bundled initramfs+kernel image into the main
filesystem image. So far I have failed miserably...

I have tried to achieve this by:
1) adding a new kernel PACKAGE and adding the bundled image file to it
2) moving the 'bundle_initramfs' task in kernel.bbclass before do_package
(rather than before do_deploy)

1) on its own is not helpful, because do_bundle_initramfs hasn't run yet,
i.e. the resulting package will be empty.
2) causes a recursive dependency, basically
kernel:do_bundle_initramfs -> initramfs:do_image_complete ->
initramfs:do_rootfs -> kernel:do_packagedata
I think because of do_rootfs[recrdeptask] += "do_packagedata" in
image.bbclass:


Now I can't figure out why the kernel's do_packagedata ends up in my chain,
I am not adding any kernel modules to the initramfs image.

Is there a way to break this loop? Or explicitly remove the
kernel:do_packagedata from my initramfs recrdeptasks? So that I can end up
with a non-empty a kernel-image-bundled-initramfs PACKAGE?


More generally, is there a way to achieve what I want? Maybe in a different
way?



Thanks.
Andre'


PS: I could probably do a two-staged approach, build the bundled initramfs
first, and then manually copy it from DEPLOYDIR during rootfs creation time
of the main image. But that seems cumbersome and I was hoping for a neater
solution :-)


