Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oui1S-0003cC-MI
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 10:34:51 +0200
Received: by iwn2 with SMTP id 2so3992907iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 01:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GJ2uI0XXunOmsCFx80H0LgdYpEyftxc+2PSR9WRKxbY=;
	b=l1TfP1EXJBtg9+mCFK9yG1W5THXowUqErpMzM+D/7j7Xfs9iPSzVqu+pdO82aVvSOS
	DcmAN4DvK5wrhIV9C6Iyl+KXtSuO4+O7+LAZc4KzNevPNjRio2s49ewi84cWzYFD2VVq
	Gr/AJgG8MmMJcAx2hzwkAs0tOdk6XbqUVuwPY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=K0ssCfJckTTha9Ph/qTJGnY50UfHaJRXY0kcOntfMPT+wNyN5daVIMf4JdwJ7ukoao
	tcmMfB2ohdNkAkWPmsPBI2/tiskQFgGyykP0FPIy6E8oEQu3/ZSv5G1bex1wtz661UH+
	hS4MWrdrU7JOJT86Dhu8XJz7d+0i8IFLRn6+U=
MIME-Version: 1.0
Received: by 10.231.174.5 with SMTP id r5mr3969636ibz.132.1284280446347; Sun,
	12 Sep 2010 01:34:06 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 12 Sep 2010 01:34:06 -0700 (PDT)
In-Reply-To: <i6fc40$90f$1@dough.gmane.org>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>
	<i6629i$d5c$1@dough.gmane.org> <201009081609.32135.pieterg@gmx.com>
	<4C879EC5.10402@balister.org> <4C8ADB7A.4000303@techsol.ca>
	<i6f9uu$39o$1@dough.gmane.org> <i6fc40$90f$1@dough.gmane.org>
Date: Sun, 12 Sep 2010 10:34:06 +0200
Message-ID: <AANLkTimZ1Vzyj0+wT1amdtrxjXkVy=fNbKzCWNG_LrOW@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patch to fix libstdc++ problem, was Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Sun, 12 Sep 2010 08:34:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/11 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Can people ack or nack the following please:
>
>
> diff --git a/recipes/gcc/gcc-package-cross.inc
> b/recipes/gcc/gcc-package-cross.inc
> index 0c4ea2d..59e7dde 100644
> - --- a/recipes/gcc/gcc-package-cross.inc
> +++ b/recipes/gcc/gcc-package-cross.inc
> @@ -2,6 +2,8 @@ PACKAGE_STRIP ?=3D ""
> =A0OLD_PACKAGE_STRIP :=3D "${PACKAGE_STRIP}"
> =A0PACKAGE_STRIP =3D "no"
>
> +SHLIBSDIR =3D "${STAGING_DIR_TARGET}/shlibs"
> +
> =A0PACKAGES =3D "libgcc libssp libstdc++ libg2c libgfortran"
>
> =A0# Called from within gcc-cross, so libdir is set wrong
>
>
Haven't had time to test this yet, but I feel at least a PR bump is
missing (or perhaps a set of PR bumps)

Frans


