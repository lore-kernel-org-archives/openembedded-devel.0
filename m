Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NiXbB-0001D9-UY
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Feb 2010 19:29:13 +0100
Received: by iwn10 with SMTP id 10so944436iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2010 10:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RUeeP9hBf9lKaJuw1KnrBoWSWxT96QlftsRK8oYai30=;
	b=uuvu/mLEbLS1qUEHBPwuLbVNgtdFWfJvheZrwQc+w3YDxjruYKMs+6VWllWKdyvof4
	hJeHf3+R3mla6itNyEw/CzA8ejWTihFg3G064Uy4UOX0++FNaMLLavk+GFL6OiDjeNRw
	fxOx++9Sjim0cRM01sqWhxuegBc9ToJ6gj9Qs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ML1zHZaK/RbpMCcSRzjnI7as/0wXgSmF0tzExsiiGJte2lVVpF5dn2vTMMQ+WgQmyO
	T1LKGo+6uQ7TSIOm41pr7+r4NGHpaRn6XIodqAiULZ+nPaA6RpwxfzqgHliX0pU6X8co
	9bNKYqtHjXCi3pnQytRWr59wmIlVyNNSmitd0=
MIME-Version: 1.0
Received: by 10.231.168.133 with SMTP id u5mr1852923iby.29.1266603987550; Fri, 
	19 Feb 2010 10:26:27 -0800 (PST)
In-Reply-To: <1266337930-2440-1-git-send-email-aalonso00@gmail.com>
References: <1266337930-2440-1-git-send-email-aalonso00@gmail.com>
Date: Fri, 19 Feb 2010 10:26:27 -0800
Message-ID: <19c1b8a91002191026p3b06577ay9375f944daa661c1@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/4] tune-ppc440.inc: add ppc440 to PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Fri, 19 Feb 2010 18:29:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2010 at 8:32 AM, Adrian Alonso <aalonso00@gmail.com> wrote:
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
> =A0conf/machine/include/tune-ppc440.inc | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/=
tune-ppc440.inc
> index feca186..0c41db4 100644
> --- a/conf/machine/include/tune-ppc440.inc
> +++ b/conf/machine/include/tune-ppc440.inc
> @@ -1,4 +1,4 @@
> =A0TARGET_CC_ARCH =3D "-mcpu=3D440"
> =A0BASE_PACKAGE_ARCH =3D "ppc440"
> =A0FEED_ARCH =3D "ppc440"
> -PACKAGE_EXTRA_ARCHS +=3D "ppc440e"
> +PACKAGE_EXTRA_ARCHS +=3D "ppc440 ppc440e"


I wonder why this would be needed, I would think that PACKAGE_ARCHS
consists of PACKAGE_EXTRA_ARCHS and PACKAGE_ARCH (which is default
arch constructed from  BASE_PACKAGE_ARCH)
if that was the case then ppc440 would be added to supported archs
list already but it seems there is a disconnect between PACKAGE_ARCH
and  PACKAGE_ARCHS I am not sure if it
is deliberate or an oversight. If it is an oversight then it should be
fixed in bitbake.conf and that would avoid this patch.

> --
> 1.6.6
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


