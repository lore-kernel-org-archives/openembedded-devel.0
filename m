Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpcKM-0005eY-1M
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:29:18 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so3832023iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kOfdgrkqmX8GXDo72fa2v+FhSTfHuP5RzV3tTdxJBtY=;
	b=uFY/w9yXzcc2ov52Re1TyI0zpDZwLArKy8heQi9tmuZZlblbNkmOBaDptfAxIzj3pI
	aVZ61V7ei4DRL+fCcDcSQZtfw9WUH4TfA4mtwL1uVPOKBa/rq3WmNd5XwFDbTwJN33Bb
	ptDTrY8N+4oigeV9UFaCEhZQL7CAl2xABUGGI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=eTJEY1KwXU9Jp7wD/80GpgNby3L9nwjvPI4A50MfOaNdc2UKfWeE23BPU4jf0B8Vm1
	bapMjUTNKVfrZoSKtu4LweFhJym+/KfeirQYgbECXpDVQ5nhnrKxoEuW8G4zlm/ochVt
	Om+pYC+v4QJM2BP+5IVsHMlTp+iG1cUzb7yMQ=
MIME-Version: 1.0
Received: by 10.231.190.203 with SMTP id dj11mr3439641ibb.93.1283066926278;
	Sun, 29 Aug 2010 00:28:46 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:28:46 -0700 (PDT)
In-Reply-To: <1283027073-12308-3-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-3-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:28:46 +0200
Message-ID: <AANLkTi=MZu5=GuMttLQf+RspkVeUXLpM_+3VV_T9JhON@mail.gmail.com>
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
Subject: Re: [PATCH 02/23] clutter_0.6svn.bb, clutter-gtk-0.6_git.bb: Unused and unbuildable for long hence removed.
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
X-List-Received-Date: Sun, 29 Aug 2010 07:29:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/clutter/clutter-gtk-0.6_git.bb | =A0 10 ----------
> =A0recipes/clutter/clutter_0.6svn.bb =A0 =A0 =A0| =A0 10 ----------
> =A02 files changed, 0 insertions(+), 20 deletions(-)
> =A0delete mode 100644 recipes/clutter/clutter-gtk-0.6_git.bb
> =A0delete mode 100644 recipes/clutter/clutter_0.6svn.bb
>
> diff --git a/recipes/clutter/clutter-gtk-0.6_git.bb b/recipes/clutter/clu=
tter-gtk-0.6_git.bb
> deleted file mode 100644
> index e37c4c9..0000000
> --- a/recipes/clutter/clutter-gtk-0.6_git.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require clutter-gtk.inc
> -
> -SRCREV =3D "2ba362a1a223c2b28541030a80aa11191615340a"
> -PV =3D "0.6.0+git${SRCREV}"
> -
> -DEPENDS +=3D "clutter-0.6"
> -
> -SRC_URI =3D "git://git.clutter-project.org/clutter-gtk.git;protocol=3Dgi=
t;branch=3Dclutter-gtk-0-6"
> -
> -S =3D "${WORKDIR}/git"
> diff --git a/recipes/clutter/clutter_0.6svn.bb b/recipes/clutter/clutter_=
0.6svn.bb
> deleted file mode 100644
> index e86cbaf..0000000
> --- a/recipes/clutter/clutter_0.6svn.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require clutter.inc
> -
> -PV =3D "0.6.0+svnr${SRCPV}"
> -PR =3D "${INC_PR}.0"
> -SRCREV =3D "3240"
> -
> -SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/branches;module=3Dclutte=
r-0-6;proto=3Dhttp \
> - =A0 =A0 =A0 =A0 =A0file://enable_tests-0.6.patch "
> -
> -S =3D "${WORKDIR}/clutter-0-6"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


