Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Onncf-0007Qt-QY
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 09:09:00 +0200
Received: by iwn2 with SMTP id 2so3709064iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 00:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wPHXBVXXNZzoBUg27Vc5nrAhyNxfbAHwi3A01z6bOPg=;
	b=Cucm4WbI4PwFLuI6S+0BIDquQ/DKh50QzeZfe1jRoj5aQDcjGWu2p/zbk2N8LDgAEE
	1yrBocImcszKyaaKySPaRBQdbErwPvlogwKbHoomYi0SfcY0jGU9CwZ1L9FKPSRC4kqZ
	DY0iBrXKUwVs6gPTyjH1rR49WKFeqh0uLRA/c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HP+9En/gKLl5veBtR6tEb5av9cumStFke2mMPZKEBQyDo8KT/d8TsCS20O6OvMZ0XR
	NRTW1rnRpQ7kp693wRyZUuEYsDyXdLvn33htzYoO5AwLErqBhaaqtqq6jO997D1xdBY+
	qedi8OgL2WuAehiTMpLjfAHqS/znKEbOYzp7s=
MIME-Version: 1.0
Received: by 10.231.146.135 with SMTP id h7mr7779955ibv.149.1282633698154;
	Tue, 24 Aug 2010 00:08:18 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Tue, 24 Aug 2010 00:08:18 -0700 (PDT)
In-Reply-To: <1282633007-664-1-git-send-email-noor_ahsan@mentor.com>
References: <1282633007-664-1-git-send-email-noor_ahsan@mentor.com>
Date: Tue, 24 Aug 2010 09:08:18 +0200
Message-ID: <AANLkTi=Zg5a2bwLVWinyaaXnUDG9AfbW9TqkpYnhXSOn@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] uicmoc-native.inc: Changed PR to INC_PR
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
X-List-Received-Date: Tue, 24 Aug 2010 07:09:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/24 Noor Ahsan <noor_ahsan@mentor.com>:
> * Converted PR to INC_PR
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
> =A0recipes/uicmoc/uicmoc4-native.inc | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/uicmoc/uicmoc4-native.inc b/recipes/uicmoc/uicmoc4-n=
ative.inc
> index 1124226..ea6a469 100644
> --- a/recipes/uicmoc/uicmoc4-native.inc
> +++ b/recipes/uicmoc/uicmoc4-native.inc
> @@ -4,7 +4,7 @@ SECTION =3D "libs"
> =A0HOMEPAGE =3D "http://www.trolltech.com"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> -PR =3D "r1"
> +INC_PR =3D "r1"
>
> =A0SRC_URI =3D "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opens=
ource-src-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0 =A0 =A0file://configure-fix.patch"
> --
> 1.6.3.3
>
>
> From b5ec4b836699cc8780524a214a9e884ca0936212 Mon Sep 17 00:00:00 2001
> Date: Mon, 23 Aug 2010 18:28:38 +0600
> Subject: [PATCH] uicmoc4-native: Introduced PR in the recipe file
>
> * Introduced PR and set it to ${INC_PR}.0
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
> =A0recipes/uicmoc/uicmoc4-native_4.4.3.bb | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/uicmoc/uicmoc4-native_4.4.3.bb b/recipes/uicmoc/uicm=
oc4-native_4.4.3.bb
> index d1816d2..0ef53e1 100644
> --- a/recipes/uicmoc/uicmoc4-native_4.4.3.bb
> +++ b/recipes/uicmoc/uicmoc4-native_4.4.3.bb
> @@ -1,3 +1,4 @@
> +PR =3D ${INC_PR}.0
> =A0require uicmoc4-native.inc
>
> =A0inherit native
> --
> 1.6.3.3
>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Actually it might be desirable to start with an INC_PR that is one
bigger that the largest value of PR. Then again the functionality of
the recipe does not change at all, so in the end it does not matter
(afaik)


