Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpbyU-0001W4-U3
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:06:45 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so3823337iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DbZxSrjKpx3tcO3cUIFFg7r7oTbt2z94C8Z6Bhuz42A=;
	b=ZXKIgFoHplquipAI2mc49rBA9wPcTE8uABUq3WfmlSSVkTduqYzff4oXB8YaeOwErd
	AaS8pyIESfDkVgIpWHQobAEabzkEg4P4H8Frd7rJ4H4TYsOTdnMMVzQ5WNQjRwOedjg8
	4EPwLaX1RYZMNpEz4EKHcpiyM4OFMlgKCfK9k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hviEjDeoekltM848RTeDhVVt8I9iaHcddF/9qYyc0q3S56yoWxl12gqSK7u2qjq791
	mKMVzJcd0MnLo27MPu21Qvx63oT+Dqu6Vhwt7pDRK+M2MxWTvmb4wO7Hzjp7Pocl0NrO
	Vz8nXDaEDiSbjrkYF/8vGcHOg/G1yvGPAuO1A=
MIME-Version: 1.0
Received: by 10.231.79.213 with SMTP id q21mr3394456ibk.137.1283065574361;
	Sun, 29 Aug 2010 00:06:14 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:06:14 -0700 (PDT)
In-Reply-To: <1283027073-12308-13-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-13-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:06:14 +0200
Message-ID: <AANLkTimyhvATfwb_w2PuLS9L6Aq7F+tdWou-3iS0oUKm@mail.gmail.com>
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
Subject: Re: [PATCH 12/23] vlc-davinci_0.8.6h.bb: Rename codec-engine to ti-codec-engine
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
X-List-Received-Date: Sun, 29 Aug 2010 07:06:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/vlc/vlc-davinci_0.8.6h.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/vlc/vlc-davinci_0.8.6h.bb b/recipes/vlc/vlc-davinci_=
0.8.6h.bb
> index ed53508..c7fa7b4 100644
> --- a/recipes/vlc/vlc-davinci_0.8.6h.bb
> +++ b/recipes/vlc/vlc-davinci_0.8.6h.bb
> @@ -10,7 +10,7 @@ PR =3D "r6"
>
> =A0PV =3D "0.8.6h+${PR}+gitr${SRCREV}"
>
> -DEPENDS =3D "codec-engine dbus libxml2 gnutls tremor faad2 ffmpeg flac =
=A0\
> +DEPENDS =3D "ti-codec-engine dbus libxml2 gnutls tremor faad2 ffmpeg fla=
c =A0\
> =A0 =A0 =A0 =A0 =A0 =A0${@base_conditional('ENTERPRISE_DISTRO', '1', '', =
'libmad libid3tag liba52 mpeg2dec', d)}"
>
> =A0SRC_URI =3D "git://git.videolan.org/vlc.git;protocol=3Dgit;branch=3D0.=
8.6-neuros"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


