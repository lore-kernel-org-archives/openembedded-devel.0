Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PKE8K-00020L-NT
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 18:55:25 +0100
Received: by wwj40 with SMTP id 40so1212506wwj.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 09:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=HoYMFpC+tGQgKT6SIyHiuvwoUtZkw0o8qmXifPCMwMo=;
	b=ijQeJ+mrUMMYx2grvNL43jLhMu1Tt3RSxayzjIZnYgzhaBo4cAKyHMQhOMS9+YnNLp
	caHsEHIXb2WGGMZ/I6DdFMDD/8s3hnEx5jW07xZOBDJBsf1q4kq1ZU5F0/SIPEUG4Qu8
	lHMZ929pm4I9JAOD3AHtIcZMLKeAfYn6F7gIU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=T+wpQ3Hw5uJngfQzZSQCr5bUh7MhB1/wr+N1SWuoC+Enku0ldes/N23aR/r8sejvA+
	89cslYloYViWuhjRNChIPQCrlNhZ6lTyj2KBe7cvZKZkjOh0WHNPXhFatcY6aBsoNGmT
	zbl5Y8LPbbus9sv8lxeH4/oqvBrkeD1a6nqJc=
Received: by 10.216.59.193 with SMTP id s43mr3253038wec.42.1290362051747; Sun,
	21 Nov 2010 09:54:11 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Sun, 21 Nov 2010 09:53:51 -0800 (PST)
In-Reply-To: <1290352792-2563-1-git-send-email-eric@eukrea.com>
References: <4CE56C6B.1050009@eukrea.com>
	<1290352792-2563-1-git-send-email-eric@eukrea.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 21 Nov 2010 10:53:51 -0700
X-Google-Sender-Auth: CGCVcyE3McH25VxrdhqN-88AdF4
Message-ID: <AANLkTimB+pvrtjXGMrHds-MDQC5SOMw-kS=L5fG6UAGb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [PATCH] handle PACKAGE_ARCH change in an amend.inc
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
X-List-Received-Date: Sun, 21 Nov 2010 17:55:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/11/21 Eric B=C3=A9nard <eric@eukrea.com>

> +    #
> +    # We always try to scan SRC_URI for urls with machine overrides
> +    # unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=3D0
> +    #
> +    override =3D bb.data.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', d, 1)
> +    if override !=3D '0' and is_machine_specific(d):
> +        bb.data.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}", d)
> +        bb.data.setVar('MULTIMACH_ARCH', mach_arch, d)
> +        return
> +
> +    multiarch =3D pkg_arch
> +
> +    packages =3D bb.data.getVar('PACKAGES', d, 1).split()
> +    for pkg in packages:
> +        pkgarch =3D bb.data.getVar("PACKAGE_ARCH_%s" % pkg, d, 1)
> +
> +        # We could look for !=3D PACKAGE_ARCH here but how to choose
> +        # if multiple differences are present?
> +        # Look through PACKAGE_ARCHS for the priority order?
> +        if pkgarch and pkgarch =3D=3D mach_arch:
> +            multiarch =3D mach_arch
> +            break
> +
>

This is wrong.  You do the loop here, set multiarch =3D mach_arch, and then
never do anything with multiarch.  If this function is really supposed to b=
e
setting MULTIMACH_ARCH, then you need to do so here as well.
 bb.data.setVar("MULTIMACH_ARCH", multiarch, d)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

