Received: from mail-bk0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1TvG5H-0006RO-8j
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jan 2013 00:38:45 +0100
Received: by mail-bk0-f44.google.com with SMTP id w11so390672bku.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2013 15:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=pzQ2cHt9SN7Z0UD5lGYh035l7PXl4vIxwrn4sPonJtE=;
	b=KqWNm+RW1zymRt54twsMnMZCGgacEWKYQyc8ujCezda2KaDwog+2N3G/vKW5AS1kgA
	cP6CGLu7cCvG3CERe1wys4YhwVCLn3bwT+NG7HqkcvUO2DkihCZggA62mPjdk8+ObnVv
	4nwpaziXc94bMvctUlfKCfNPs8qDQ9+XoSYAUCQhzBroNL2YwrVBExWOtz250/CIXrql
	AKxUwLGF0Fqt8qx+Y8yzHlgcNe/WXPGimIZrncTTYJ2dbhI165l5hKtuSVGkgco0O1HA
	yUa5lSMiCesiMKzx54l2nUF8d57LsJQ3JojvOHB37IMHq8GdxJBjrua784l+hcJ67JoY
	edPw==
Received: by 10.204.133.219 with SMTP id g27mr40968382bkt.65.1358292182128;
	Tue, 15 Jan 2013 15:23:02 -0800 (PST)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.205.102.72 with HTTP; Tue, 15 Jan 2013 15:22:40 -0800 (PST)
In-Reply-To: <CAAQYJAu+J-cVAqJttdaz161X6paUbziaZ_yn6Ep_4BHuFRSZxA@mail.gmail.com>
References: <1358201403-22227-2-git-send-email-hmatrjp@users.sourceforge.jp>
	<CAAQYJAuoSYreWC6oanAkwW-4Mqv5LsKL+kHr3NhFrKf4t2o7qg@mail.gmail.com>
	<CAPESJy7AAUbiTtU0h1sAM0Eu6konxcyF3mmZi3mfVRE-+3BQcQ@mail.gmail.com>
	<CAAQYJAu+J-cVAqJttdaz161X6paUbziaZ_yn6Ep_4BHuFRSZxA@mail.gmail.com>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Wed, 16 Jan 2013 08:22:40 +0900
X-Google-Sender-Auth: wbQRK9d8Mcl7pBowTuLE9CXBj-Q
Message-ID: <CAPESJy7q0tzZJULzm9eTMYSOOibf2grR4=JjxRzXgta+c3TmGw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-initramfs][PATCH] symbolic link to resource.h is also necessary to build with linux kernel 3.2.
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
X-List-Received-Date: Tue, 15 Jan 2013 23:38:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

2013/1/15 Andrea Adami <andrea.adami@gmail.com>:
> Ah, I see now: you are using the denzil branch with klibc_1.5.25.
>
> This version was the last one built against kernel headers: starting
> with 1.5.26 the recipe uses linux-libc-headers for building.
> So for denzil, with kernel 3.2,  I suggest you to:
>
> a) add your patch and be happy with 1.5.25
> b) update to 1.5.26, backporting the commits form master
> c) checkout meta-initramfs master and get klibc_2.0.2 (pls remove
> linux-yocto-tiny-kexecboot_3.4.bb or you'll get errors)

I choose a) for a while, say, until Angstrom 2012.12 is released.
b) and c) are also helpful advice, thank you so much.
-- 
Takeshi hamasaki


