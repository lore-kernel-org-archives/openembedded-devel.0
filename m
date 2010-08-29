Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Opc6r-0002Ai-Pq
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:15:23 +0200
Received: by iwn2 with SMTP id 2so3826833iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ur3ycyOA3QFa4RLSoLbC34Wcm4MVB4RioWGjdVqjE/M=;
	b=n7/haCgYJmlSWuAQp3t884O9EkNCPsIXVGs7Y2kVt7Z1SzZxhB56tHbJJAPomu4M9B
	WbfDBs+uaV/vNcZZNYYFyAuqW+gyVZuKoj2kIfqYCtrzjgnf/uhfnuep5++eE3QZ43TH
	WUFfAtYTOSaGDkHCNOrwpURO9iy+Wt4sLQGts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NSaPzLOHWZKJATFPQ+AuKqVjB1ycegDd8nl+Vao6A7ERA4wPsz6+IrQzu4MfilewUj
	5Wgv8HhLegWNA0HgAKQ9h7mH7Sdd8TOkxbTfI5vYwxMxAwyoN5d8lRPoyQ0hw0K43ior
	XVMvgj64pHtk/jPiD/Qf48AqgD6D6d/y9oUIA=
MIME-Version: 1.0
Received: by 10.231.170.79 with SMTP id c15mr3413944ibz.82.1283066092601; Sun,
	29 Aug 2010 00:14:52 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:14:52 -0700 (PDT)
In-Reply-To: <1283027073-12308-17-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-17-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:14:52 +0200
Message-ID: <AANLkTinQ1dUAfzObfZp4eCdwZ=0ocaAjZx4BxCOb=zUH@mail.gmail.com>
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
Subject: Re: [PATCH 16/23] meta-angstrom-2007.bb, meta-opie.bb: task-opie-bluetooth is added only if it appeas in COMBINED_FEATURES
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
X-List-Received-Date: Sun, 29 Aug 2010 07:15:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/meta/meta-angstrom-2007.bb | =A0 =A01 -
> =A0recipes/meta/meta-opie.bb =A0 =A0 =A0 =A0 =A0| =A0 =A06 ++++--
> =A02 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/meta/meta-angstrom-2007.bb b/recipes/meta/meta-angst=
rom-2007.bb
> index 8355b10..fbd7f0b 100644
> --- a/recipes/meta/meta-angstrom-2007.bb
> +++ b/recipes/meta/meta-angstrom-2007.bb
> @@ -15,7 +15,6 @@ RDEPENDS_${PN} +=3D " \
>
> =A0# Browsers know to work on all archs
> =A0RDEPENDS_${PN} +=3D " \
> - =A0 =A0 =A0 =A0 gpe-mini-browser \
> =A0 =A0 =A0 =A0 =A0midori \
> =A0 =A0 =A0 =A0 minimo \
> =A0 =A0 =A0 =A0 =A0openmoko-browser2 \
> diff --git a/recipes/meta/meta-opie.bb b/recipes/meta/meta-opie.bb
> index 0a8ed86..1584765 100644
> --- a/recipes/meta/meta-opie.bb
> +++ b/recipes/meta/meta-opie.bb
> @@ -7,11 +7,13 @@ RDEPENDS_${PN} =3D "task-opie-applets task-opie-apps ta=
sk-opie-base \
> =A0 =A0 =A0 =A0 =A0 =A0 task-opie-base-applets task-opie-base-apps \
> =A0 =A0 =A0 =A0 =A0 =A0 task-opie-base-decorations task-opie-base-inputme=
thods \
> =A0 =A0 =A0 =A0 =A0 =A0 task-opie-base-pim task-opie-base-settings \
> - =A0 =A0 =A0 =A0 =A0 =A0task-opie-base-styles task-opie-bluetooth \
> + =A0 =A0 =A0 =A0 =A0 =A0task-opie-base-styles \
> + =A0 =A0 =A0 =A0 =A0 =A0${@base_contains("COMBINED_FEATURES", "bluetooth=
", "task-opie-bluetooth", "",d)} \
> =A0 =A0 =A0 =A0 =A0 =A0 task-opie-datebookplugins task-opie-decorations \
> =A0 =A0 =A0 =A0 =A0 =A0 task-opie-extra-apps task-opie-extra-settings \
> =A0 =A0 =A0 =A0 =A0 =A0 task-opie-extra-styles task-opie-extra-games \
> - =A0 =A0 =A0 =A0 =A0 =A0task-opie-games task-opie-inputmethods task-opie=
-irda \
> + =A0 =A0 =A0 =A0 =A0 =A0${@base_contains("COMBINED_FEATURES", "irda", "t=
ask-opie-irda", "",d)} \
> + =A0 =A0 =A0 =A0 =A0 =A0task-opie-games task-opie-inputmethods \
> =A0 =A0 =A0 =A0 =A0 =A0 task-opie-multimedia task-opie-pim task-opie-sett=
ings \
> =A0 =A0 =A0 =A0 =A0 =A0 task-opie-styles task-opie-todayplugins task-opie=
-wlan"
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


