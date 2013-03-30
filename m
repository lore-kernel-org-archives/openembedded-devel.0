Received: from mail-bk0-f46.google.com ([209.85.214.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1ULvjj-00033n-0w
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 14:22:23 +0100
Received: by mail-bk0-f46.google.com with SMTP id je9so454904bkc.33
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Mar 2013 06:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=FHTktV1d8bCOYNQOhvR3XZ+u4Si06vSgCanvJnl0H1Y=;
	b=FLW96puTGdBVPSmyUhc0cFerMsqMV0pZUOpjTj8xslDGPv0oXP2UmuPmHq4ZthNzjt
	yGKZk5qyhDFmgjQ2CL5oHNVIQ4Xvk9aYEgv17qNLSU/FyFWTjQxkv79Kk1lQt/H9mKac
	m1uftvRyv4HHv4JlH2zmezmJQnOth4ihgtjFsVjOHWIDXP1sZ1+ulayNAIXx5qsFwOv6
	2yd74Jtpf+WzH0x1gyqlZszGhv95BiW7elyQy0XLgU2PfFPcCjtMzxCL1wO0YvuVlNV/
	axm2ie4LVCifwnrN3/LXgI920FFip76bmY90euFwYitw0Bb5vvHDUvqdoODRZGfYkRR6
	HlsA==
X-Received: by 10.204.172.80 with SMTP id k16mr2442581bkz.123.1364648717211;
	Sat, 30 Mar 2013 06:05:17 -0700 (PDT)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.204.25.141 with HTTP; Sat, 30 Mar 2013 06:04:57 -0700 (PDT)
In-Reply-To: <5156DB73.4040507@emagii.com>
References: <5156DB73.4040507@emagii.com>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Sat, 30 Mar 2013 22:04:57 +0900
X-Google-Sender-Auth: YO7X2gZmuTQGCuYHS7AOFmTMNeE
Message-ID: <CAPESJy7cfZvAePoLrVnvqoxaYRRxz1=U5L5ROP5MHbiWZEEBCA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Finding out the IMAGE_BASENAME of the image beeing built
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Mar 2013 13:22:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Ulf,

$ MACHINE=beagleboard  bitbake -e some-image

shows all variables including $IMAGE_BASENAME without actually
building the image.
Using grep you can take the value of IMAGE_BASENAME, like as:

$ MACHINE=beagleboard  bitbake -e some-image | grep ^IMAGE_BASENAME

Does it help you?

If possible, consider to use hooks, for example, IMAGE_POSTPROCESS_COMMAND .
Refer image.bbclass for details. It might make things straiter.

Regards,
-- 
Takeshi Hamasaki

2013/3/30 Ulf Samuelsson <openembedded@emagii.com>:
> Trying create a programming script recipe and need to find out the
> IMAGE_BASENAME of the bitbake target
> so I can get the filename of the image
>
> ${MACHINE}-${IMAGE_BASENAME}.ubi
>
> I.E: if I do
>
> $ MACHINE=beagleboard  bitbake some-image
>
> and "some-image_1.0.bb" contains
>
> IMAGE_BASENAME = "renamed-image"
>
> Then the resulting image will be
>
>     "beagleboard-renamed-image.ubi"
>
> How get this info from another recipe?
>
> BR
> Ulf Samuelsson
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


