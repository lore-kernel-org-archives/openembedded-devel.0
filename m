Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUWmQ-000116-Vi
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 05:19:08 +0200
Received: by iwn34 with SMTP id 34so2802646iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 20:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=eiqO4XgaBpw57sh5rWtQYW16MvyQ5IzxmvtPg7pfdsA=;
	b=GVkWt1uWjeu3olacJbLq+PJzVC2klNnJ3/RuCG/IihA53Nal+dThEttSH/j9deEezq
	UYN068YvwSCWXLcYZ6dThk2bJguMiUdXcuILM0uQMr7we6eVnNqoiftwu6XSvGEy1sX+
	Dy5Mt6Y0RnVlyY2wtrSLGVSn/0SBlp2NVulCk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gNoQPLuafKZvcTmJglAjAxg4pb52hZnfD9Wu7fOHdtooZDd9Pbv31V6YuitpmAbKxp
	uY4esJsp00rmAJUHi4878qctN+Unvg2FAQdClclrMhKgHB8wsypc8/OTaMC20aFcETpl
	DK02ZTVdPna7JW2XGQFkE2N6p4BpfP4nSLbA0=
Received: by 10.231.157.17 with SMTP id z17mr96729ibw.124.1278040462092; Thu, 
	01 Jul 2010 20:14:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 1 Jul 2010 20:14:01 -0700 (PDT)
In-Reply-To: <4C2D3185.6050803@gmail.com>
References: <4C2D3185.6050803@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Jul 2010 20:14:01 -0700
Message-ID: <AANLkTikig4AO1C-Pm5j4fDP6Y8q0wO8K0kUVLBDJs-Gw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gnupg_1.4.10.bb: fix build on mips(el) with recent gcc.
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
X-List-Received-Date: Fri, 02 Jul 2010 03:19:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 1, 2010 at 5:23 PM, Graham Gower <graham.gower@gmail.com> wrote=
:
>
> Patch "borrowed" from openwrt.
> https://dev.openwrt.org/browser/packages/utils/gnupg/patches/001-mips_gcc=
4.4.patch
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

a minor nit


<---snip--->

> =A0SRC_URI +=3D "file://long-long-thumb.patch"
> +SRC_URI +=3D "file://mips_gcc4.4.patch"

you could have just added to SRC_URI above

SRC_URI +=3D "file://long-long-thumb.patch \
            file://mips_gcc4.4.patch \
           "


> =A0SRC_URI[src.md5sum] =3D "dcf7ed712997888d616e029637bfc303"
> =A0SRC_URI[src.sha256sum] =3D "a2907f4432d67894e425e48ae85785dd60ecb01658=
c9682bcd96f5e91043bb38"
>
> =A0S =3D "${WORKDIR}/gnupg-${PV}"
>
> -PR =3D "r2"
> +PR =3D "r3"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


