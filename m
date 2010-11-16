Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIV9n-00042p-P8
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:41:48 +0100
Received: by ywg8 with SMTP id 8so373528ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=ryY3kSW2Cbnqd7yiXYaictsy3se/OZaoe4v7OhsnEC8=;
	b=aZXkwdu2wcm0qvqjbS/NWVZNRI0HtRhNnDTiOB/a0Pjiw4zy/Yg6B6oNnpvT5ZurqX
	+Fu4ECXe3il3Te7aDnedU9siupHgR3EPzMCIvG9zku3iCBV0LAPa7s9PBrhe86zKcjt5
	VHzwa0QxuuZlyRoZYneWXLo1e/EqYxTgapdog=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=AckHvRsQOuNVukWBPw1avA5jmpOyz80Hplu0L72eyfGxGtGyjw70IvKZLWREDilfUN
	msOJKeD9sFMwteiDbbJSZGR+NlPhaDiz13CJzH9L+1mN3PIOPiJyAh6AR5DsQp2F+tez
	McHcYOiRqbCrnxRnd7d5+FjxveGMwAwmaeKJ4=
Received: by 10.91.12.18 with SMTP id p18mr10511373agi.48.1289950841977; Tue,
	16 Nov 2010 15:40:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 15:40:21 -0800 (PST)
In-Reply-To: <1289064270-20041-2-git-send-email-moncelier@devlife.org>
References: <1289064270-20041-1-git-send-email-moncelier@devlife.org>
	<1289064270-20041-2-git-send-email-moncelier@devlife.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 15:40:21 -0800
Message-ID: <AANLkTiksrxSauzYBx+EupT+vkLyt_C0VgUDeXb8PxtF8@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: Re: [PATCH 02/11] dropbear: Removed openmoko references. Added /etc/default/dropbear
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
X-List-Received-Date: Tue, 16 Nov 2010 23:41:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 6, 2010 at 10:24 AM, Camille Moncelier
<moncelier@devlife.org> wrote:
> Signed-off-by: Camille Moncelier <moncelier@devlife.org>
> ---
> =C2=A0recipes/dropbear/dropbear.inc =C2=A0 =C2=A0 | =C2=A0 =C2=A04 +---
> =C2=A0recipes/dropbear/dropbear/default | =C2=A0 =C2=A04 ++++
> =C2=A02 files changed, 5 insertions(+), 3 deletions(-)
> =C2=A0create mode 100644 recipes/dropbear/dropbear/default
>
> diff --git a/recipes/dropbear/dropbear.inc b/recipes/dropbear/dropbear.in=
c
> index 1569ea3..db1b26e 100644
> --- a/recipes/dropbear/dropbear.inc
> +++ b/recipes/dropbear/dropbear.inc
> @@ -15,8 +15,6 @@ SRC_URI =3D "\
> =C2=A0 file://fix-2kb-keys.patch \
> =C2=A0 file://allow-nopw.patch;apply=3Dno \
> =C2=A0 file://init \
> -"
> -SRC_URI_append_openmoko =3D "\
> =C2=A0 file://default \
> =C2=A0"
>
> @@ -82,4 +80,4 @@ pkg_postrm_append () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives --remove scp ${bindir}/dro=
pbearmulti
> =C2=A0}
>
> -CONFFILES_${PN}_openmoko +=3D "${sysconfdir}/default/dropbear"
> +CONFFILES_${PN} +=3D "${sysconfdir}/default/dropbear"
> diff --git a/recipes/dropbear/dropbear/default b/recipes/dropbear/dropbea=
r/default
> new file mode 100644
> index 0000000..a4f2bfd
> --- /dev/null
> +++ b/recipes/dropbear/dropbear/default
> @@ -0,0 +1,4 @@
> +# DROPBEAR_BANNER=3D""
> +# DROPBEAR_RSAKEY=3D"/etc/dropbear/dropbear_rsa_host_key"
> +# DROPBEAR_DSSKEY=3D"/etc/dropbear/dropbear_dss_host_key"

        ^^^
should this be dsa ?

> +# DROPBEAR_KEYTYPES=3D"rsa"
> --
> 1.7.3.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


