Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpcFN-0003sg-Pm
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:24:11 +0200
Received: by iwn2 with SMTP id 2so3830162iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bYpDJLu9w55pevRj2CkqRVdBBhf60lfmD8wKMd5HriI=;
	b=VPETUcvwPd6Vbtt0O8yeR0MS8esh6/maRJAUGINB8zSVx2uQ6BDVzTSQCMwxaUwRkS
	XtdtxPWJsvc0DuVpNtsFPqKCpM7253/Sz4nF3P8YdcmP6VEyoqCx0gjCZTSRdJ8Ad2Ve
	ndNcpS6G9sgrpwlfIIwIxPomUfjKYx9APNwF8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vQ57XJfQY8YGfhd9pN2Cklb9YiDK/evoy0ZOnc/EpvHSO21mJD2VJiPFWuQeIaRpL+
	Muq0rXpPPAU4agIYt1XVfFge+3aDVQTI2LKHwLI/jPJBd5mYF6BFFni1gJ6kffT4S/IQ
	npAIeX6Q3MumsZrgG8n1z8zeZpAIG256bqD1Y=
MIME-Version: 1.0
Received: by 10.231.151.135 with SMTP id c7mr2753042ibw.184.1283066620412;
	Sun, 29 Aug 2010 00:23:40 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:23:40 -0700 (PDT)
In-Reply-To: <1283027073-12308-8-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-8-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:23:40 +0200
Message-ID: <AANLkTi=9m7CTcpofRQjmqYGpBzy807qkD5k4AddLN5hX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 07/23] task-arago-toolchain-target.bb: remove libpng12-dev which is not provided and e2fsprogs-libs-dev is now e2fsprogs-dev
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
X-List-Received-Date: Sun, 29 Aug 2010 07:24:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

good catch, there are some more

meta/foonas-packages.bb:	e2fsprogs-libs \
meta/openprotium-packages.bb:	e2fsprogs-libs \
meta/oplinux-packages.bb:	e2fsprogs-libs

maybe I overlooked things (still early here) but I didn't see an e2fsprogs-=
libs
Guess those 3 should be fixed too
(or moved to nonworking so someone can pick them up if they are not working=
)

For this one
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/tasks/task-arago-toolchain-target.bb | =A0 =A03 +--
> =A01 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/tasks/task-arago-toolchain-target.bb b/recipes/tasks=
/task-arago-toolchain-target.bb
> index aa592b6..496910e 100644
> --- a/recipes/tasks/task-arago-toolchain-target.bb
> +++ b/recipes/tasks/task-arago-toolchain-target.bb
> @@ -14,14 +14,13 @@ RDEPENDS_${PN} =3D "\
> =A0 =A0 alsa-lib-dev \
> =A0 =A0 alsa-utils-dev \
> =A0 =A0 curl-dev \
> - =A0 =A0e2fsprogs-libs-dev \
> + =A0 =A0e2fsprogs-dev \
> =A0 =A0 i2c-tools-dev \
> =A0 =A0 freetype-dev \
> =A0 =A0 jpeg-dev \
> =A0 =A0 lzo-dev \
> =A0 =A0 libopkg-dev \
> =A0 =A0 libpng-dev \
> - =A0 =A0libpng12-dev \
> =A0 =A0 readline-dev \
> =A0 =A0 libts-dev \
> =A0 =A0 libusb-compat-dev \
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


