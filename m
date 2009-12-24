Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NNrYC-0007eA-Un
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 18:32:40 +0100
Received: by iwn32 with SMTP id 32so5432848iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 09:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=EuvgKOjyHC/xkKswXRbRdUnS22F9P/JTZoWN+cekdf0=;
	b=MidBWPNLSh2xhcXho1BpBtdBXDvhqoSGUB/9NhAt5y1eFuMCfzIInkz9tg0araZ+rW
	9mYs1E1ken4SjHW2znVfBKpeC0qQhrc3KCLl06dGc/fYAaqtMJE4+9B419yfhVJITP+O
	9m85rL3PPRrZVWNl/9gsEy2fZKzGRNQcFJf4M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=S0gzjGpCgFIbi21855ieJE2YnpuPQHUY85s85c31VrEO17iY7scq75oVcud3CBZ5yM
	pq87V3YziYrP1oi08pKb9iP/6dbnFcTaGJBLoeUjFU/8L10MGgQiMrps4bCgUtmThMVy
	Uk00D+3pqE/n832XIRA7BT9UAIRNtfZXyiHEE=
MIME-Version: 1.0
Received: by 10.231.6.79 with SMTP id 15mr698879iby.36.1261675842806; Thu, 24 
	Dec 2009 09:30:42 -0800 (PST)
In-Reply-To: <1261657898-18357-1-git-send-email-camelguo@gmail.com>
References: <1261657898-18357-1-git-send-email-camelguo@gmail.com>
Date: Thu, 24 Dec 2009 09:30:42 -0800
Message-ID: <19c1b8a90912240930p30171325y8135a730fa281255@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Update preferred version util-macros from 1.1.6 to 1.4.1
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
X-List-Received-Date: Thu, 24 Dec 2009 17:32:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 24, 2009 at 4:31 AM, Guo Hongruan <camelguo@gmail.com> wrote:
> xcmiscproto and xf86bigfontproto requires util-macros 1.2 or later, this =
patch fix the dependence failure.
> ---
> =C2=A0.../include/preferred-xorg-versions-X11R7.4.inc =C2=A0 =C2=A0| =C2=
=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.4.inc b/co=
nf/distro/include/preferred-xorg-versions-X11R7.4.inc
> index 156653f..eb0820e 100644
> --- a/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
> +++ b/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
> @@ -233,8 +233,8 @@ PREFERRED_VERSION_xproto ?=3D "7.0.13"
> =C2=A0PREFERRED_VERSION_gccmakedep ?=3D "1.0.2"
> =C2=A0PREFERRED_VERSION_imake ?=3D "1.0.2"
> =C2=A0PREFERRED_VERSION_makedepend ?=3D "1.0.1"
> -PREFERRED_VERSION_util-macros-native ?=3D "1.1.6"
> -PREFERRED_VERSION_util-macros ?=3D "1.1.6"
> +PREFERRED_VERSION_util-macros-native ?=3D "1.4.1"
> +PREFERRED_VERSION_util-macros ?=3D "1.4.1"
> =C2=A0PREFERRED_VERSION_xorg-cf-files ?=3D "1.0.2"

this should be already fixed by 37199f5dbabe9a95bfdb3a2b028cde8c506f85dc

>
> =C2=A0# xserver
> --
> 1.5.4.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


