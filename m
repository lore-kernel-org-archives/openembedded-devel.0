Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpbzY-0001lk-0s
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:07:48 +0200
Received: by iwn2 with SMTP id 2so3823880iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=jQGcbzOSgNmEWXYziqRR3QgU9mOvd9BaM6/4tYJsnzY=;
	b=aHy9AXVM5JdWccdSwdsuSr6nuB0DfYDerkmehxgOaxddu0MBCjSbWpgK/kuSzuBAGU
	XGoEdrt2Op+yQAcYsXrbcK61wmxTXBobSwvGdFcQRIg290wowPzs26swscl7z8awEtiy
	ps/K3ePHxTbMuubi7JhReTps0PLjGwy2MLgEY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LITxp0EzGIKjyzRTibvuiDq8rxf/rHr/X2ASzznlYdKpuEmXFp5l7jRxj94rx7pjEZ
	hJUMfeUBx0AubKZLNGLcnHvHeMRUVapu2XogTOmnJngpzsNA51SAa/ZhDMyYsDxYJJF3
	CTRWwh66NUknM6LRlUDYAf/TEksWLJ3zRiE8o=
MIME-Version: 1.0
Received: by 10.231.19.197 with SMTP id c5mr3454531ibb.91.1283065638825; Sun,
	29 Aug 2010 00:07:18 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:07:18 -0700 (PDT)
In-Reply-To: <1283027073-12308-16-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-16-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:07:18 +0200
Message-ID: <AANLkTikKkMhiDcOYZ2xe4OKLADzsyPRCUek4XD4KWf2C@mail.gmail.com>
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
Subject: Re: [PATCH 15/23] libmsgenabler2_svn.bb: Replace gsmd-lips with gsmd in DEPENDS
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
X-List-Received-Date: Sun, 29 Aug 2010 07:07:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/gpephone/libmsgenabler2_svn.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/gpephone/libmsgenabler2_svn.bb b/recipes/gpephone/li=
bmsgenabler2_svn.bb
> index 6b5c326..cbd068a 100644
> --- a/recipes/gpephone/libmsgenabler2_svn.bb
> +++ b/recipes/gpephone/libmsgenabler2_svn.bb
> @@ -2,7 +2,7 @@ LICENSE =A0 =A0 =3D "LiPS"
> =A0DESCRIPTION =3D "LiPS message backend library."
> =A0SECTION =3D "gpe/libs"
> =A0PRIORITY =A0 =A0=3D "optional"
> -DEPENDS =A0 =A0 =3D "glib-2.0 dbus-glib librecord2 liblipsevent2 telepat=
hy-mission-control libgsmd-lips"
> +DEPENDS =A0 =A0 =3D "glib-2.0 dbus-glib librecord2 liblipsevent2 telepat=
hy-mission-control libgsmd"
> =A0PV =3D "0.0+svnr-${SRCREV}"
> =A0PR =A0 =A0 =A0 =A0 =A0=3D "r2"
>
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


