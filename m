Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ojnpe-0007ZV-HJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 08:33:38 +0200
Received: by gyd8 with SMTP id 8so802603gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 23:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=uflX+A/alhFxM0oEdNeO8m+aoznoazOJplibYW22A/I=;
	b=j9Aq0rpy+LmwhrRWusG8bYGUGsnR6iVfBRGbLvvjzNH1pP9YtAIATGEOXyigGCM4F4
	xmLSh/I1O2P/OXuUkR331744FHixDe00p1sGAK6Bd+DApG7zo5lhIK8ScjL1NzVXk+Qu
	J0j2oHNHaYjaWFumefoVEIfff3S74aOA1uHTI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=a0Fz9jHuM6Us1fAwZ5Vax7AJkqBUnggtomZp8LZVpMY1UmTATPKB+o/cdpNBO1YnjS
	LQ+hkTNpZsdmVd0S71picPR5jC2HWFDvAHGhlMfV176GCH5a2b1lHLvARRQOZ9AwzZ9T
	uWpNPpXAceHKHap4TmeMUcKG9j4CPA2/mHQOA=
MIME-Version: 1.0
Received: by 10.231.160.17 with SMTP id l17mr1244340ibx.102.1281681191269;
	Thu, 12 Aug 2010 23:33:11 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Thu, 12 Aug 2010 23:33:11 -0700 (PDT)
In-Reply-To: <1281677417-15063-4-git-send-email-vjensen@gmx.de>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
	<1281677417-15063-4-git-send-email-vjensen@gmx.de>
Date: Fri, 13 Aug 2010 08:33:11 +0200
Message-ID: <AANLkTi=1OMPdFsveXFjtgMn64Ot6-Bz09Bc3moaP1fJH@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] canutils: update to version 4.0.6
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
X-List-Received-Date: Fri, 13 Aug 2010 06:33:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/13 Vitus Jensen <vjensen@gmx.de>:
>
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> ---
> =A0recipes/socketcan/canutils_4.0.5.bb | =A0 =A04 ----
> =A0recipes/socketcan/canutils_4.0.6.bb | =A0 =A04 ++++
> =A02 files changed, 4 insertions(+), 4 deletions(-)
> =A0delete mode 100644 recipes/socketcan/canutils_4.0.5.bb
> =A0create mode 100644 recipes/socketcan/canutils_4.0.6.bb
>
> diff --git a/recipes/socketcan/canutils_4.0.5.bb b/recipes/socketcan/canu=
tils_4.0.5.bb
> deleted file mode 100644
> index c084bcd..0000000
> --- a/recipes/socketcan/canutils_4.0.5.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -TAG =3D "v${PV}"
> -require canutils.inc
> -
> -PR =3D "${INC_PR}.0"
> diff --git a/recipes/socketcan/canutils_4.0.6.bb b/recipes/socketcan/canu=
tils_4.0.6.bb
> new file mode 100644
> index 0000000..9ddb697
> --- /dev/null
> +++ b/recipes/socketcan/canutils_4.0.6.bb
> @@ -0,0 +1,4 @@
> +TAG =3D "canutils-${PV}"
> +require canutils.inc
> +
> +PR =3D "${INC_PR}.0"
> --
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


