Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1F961921
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:56:34 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id x21so3573299iox.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 05:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ca2prFz07RHsC/aCn3cKsprUg1eR6Q06AkU71nLF6UQ=;
	b=eGao+0972IbasjUz6c3Ot25QK3g9EACzTGOskX17YC/rQZcCcIuyjCOf4+8fxbw2aH
	u3+4PyTfhQulK4F1JS/6LPJ422pNoDou39wyiuf/eIeH6e/iUkcnC/D9rX8hsQ0dM0OM
	6Lg60g2LlnqDcI49304FGPDGt4BfRTyFoM48m/YyHV182rpbaTsXJHxN0lmpOPxWYiIY
	uxXvYlAbkkn2PsPV00WMXCeDto2e6jvv+LeJeV2K1qGE3qNcKA5evoeK2cWCP8nltow2
	aoTMHfd+4OS1FUFUWsPDyF17eKwYWia4gRYV6FZ2g448z0CGNofJzonhv+PvJJumfwAa
	Y1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ca2prFz07RHsC/aCn3cKsprUg1eR6Q06AkU71nLF6UQ=;
	b=RH+1cvV86bPy+/Mfyu14yDG8uCdHKttRdsjU4/vbIec/BHLas5bi0CjHO5ntAyimwK
	f9V+NVT3qsha2AwaCpgcJai2z0T5Tat0DCpyF5/7sOxBd1MfCRN87ZFZlMWUzIiDotsp
	59TGSObKk7FVD4ZK54Ngzgifkfj8xU1DmIPXUJtjR2bsgiYt2TuoiGgpuJlL1niYn7il
	vUSuBf6xIb01Ov1eIMIp+uSdzsCGfAycmHiUPJyvB9toi/bTNmlIUAvmSHKe0RZhwu9O
	RkuOANQaMNv3rAGfDJL46xu28DcamL8PtXpzVxLjAxjt+bidP2OMWLUE96mL6wRgi2gl
	CHrw==
X-Gm-Message-State: ANhLgQ3C8Qzl0zy/61wvWGgQi9+0RdAgSsbdnynoM1tSaaaVQZd+AhRt
	tKpRTTELoqGmtAVze+m5KPt5LfsXX2f/kc97Ik/VHA==
X-Google-Smtp-Source: ADFU+vvHrjXDTKz0uZkejMV3uvu3dp5+FDcq20QMnv5xedFITAqWqAW2d08Rr4U1eRTrwx3xDdmzSqCMuqxWkhy9JCE=
X-Received: by 2002:a02:844c:: with SMTP id l12mr3950842jah.57.1583243795956; 
	Tue, 03 Mar 2020 05:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20200228150345.11829-1-brgl@bgdev.pl>
	<CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
	<CAMRc=MftVskWMFZQhbFKZLwNAR9a1+4zbayWTbXFuSJgG-ZgbA@mail.gmail.com>
	<CAP9ODKpVW6qxw7+5oA7auBMW1ApLdqjicZf8Ahe3RhYG8QjmgQ@mail.gmail.com>
	<CAMRc=MeJ0R81s-ui7J78pe89JE6c-_wx3RGUZx-tzMLc3pzthQ@mail.gmail.com>
	<dd3d6ea7-2bac-6a06-823d-fd070f547784@gmail.com>
In-Reply-To: <dd3d6ea7-2bac-6a06-823d-fd070f547784@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Mar 2020 14:56:24 +0100
Message-ID: <CAMRc=MevN3tAfBkLZuOiW0BVbOWkq_T_HiD6XTMwh5d32xrGeQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ota][PATCH] meta-ota: add support for binary-delta images in a new layer
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
X-List-Received-Date: Tue, 03 Mar 2020 13:56:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 2 mar 2020 o 19:25 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a):
>
> >
> > Khem, Armin: any thoughts?
>
> there are many ota layers on OE, most of them are self-contained, so a
> question arises, how is this different, somethings here say it could be
> a base layer for all OTAs, which actually seems quite valuable, but it
> has to be such that the existing OTA layers start using pieces from this

No, it's actually the other way around. The existing OTA layers are
focused on supporting specific tools and they usually provide full
support for some reference platforms. However in every custom project
I worked on we needed to extend those layers and those extensions
became quite repetitive, hence the idea for a layer that gathers
common elements but that is independent from project-specific layers.

If anything the goal is to use this *in conjunction* with specialized
OTA layers.

> layer, Other part seems to be that its yet another OTA using binary
> delta update techniques, so in such a case, it should be thought of as
> another OTA and perhaps maintained independendently, if there are
> features which are common across all OTAs we can host them in core or
> meta-oe,
>

No, this is not an OTA on its own and the generation of binary delta
patches is just one of the features.

Let me give you more context on why I started to do this. We've had a
downstream layer for a client's project compatible with thud with a
complete verified boot chain of trust including dm-verity protected
rootfs mounted by an initramfs stored in signed fitImage + OTA
support. Generating this image required us to alter a couple
inter-task dependencies (fitImage needs to wait for initramfs, but
initramfs needs the dm-verity meta-data which needs the rootfs
partition, and then we need to sign the fitImage etc. etc.).

Then some time during warrior development commit 67628ea66b7d
("uboot-sign.bbclass: fix signature and deployment") was merged in
OE-core which caused us a lot of trouble with our dependencies when
trying to update the layer. In order to not make the same mistake
twice - we thought it's best to upstream our development too for
others to use and to be able to object when someone breaks it for us
(I'm mostly a kernel developer and this is how it works in linux, I'm
not sure if it's the same for yocto).

BTW I'm also preparing a series of patches for meta-security with
dm-verity images as part of this effort.

If this is not something that should be part of meta-openembedded - is
there any way to have it hosted at https://git.yoctoproject.org/cgit/
as an official yocto layer? I'm sorry if this is a dumb question, I
don't know exactly what the policy is for that.

Best regards,
Bartosz

