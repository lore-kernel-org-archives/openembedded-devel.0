Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CC33571ABD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 09:41:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so18579631wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 01:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Uku0SlDQag0oKbEj36AZbPkWJq8kTieY/qXQg4ZYgZ8=;
	b=CHhkvFYlvfJMVHFnfw9j2jAOFWc4FxFihN5gFWGuHNAeTw8fujmwkYXVey+/TJ0Voc
	SzkrRdMGMAXxKnIV8DiqqROEuYeHA1HI/UpE7754td9xzwK8WyZyr/BdTECSINmmWlKm
	IZgf6dSMAbi2NG6AVZM8w5l5/r8v550CwBqMPUca1O/JXlmwDBJp5oeIMhpzRU16sxMl
	KrGFbVZVzua5op/3VR14tbCy2EMJnetSRmOiA1yWHYRm+uK/4NdYku0pz+B6woIoiG1B
	JkBIFmNFOfgPbJg7eNOIBXuPmhdp1exma+YdQqZGrQ1KGtvfauCja2iCiYyhvlqH8kNb
	mDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Uku0SlDQag0oKbEj36AZbPkWJq8kTieY/qXQg4ZYgZ8=;
	b=DQgl+NFplbqINpnXuoidjd7oIhDMJ4rsGRuNMgygM3f0ZxB8ujnmfmIIPfnG8IALiQ
	Wa0m1jqElSqaaRHNGTh0NdbWkYXibf0VFel7+varuINdRbUvODHg3GMyb0onbZ2IrPeV
	r6JmPkjSCgH9PaEIUuduEjlT3YSkpl30waEL+yVLxo+F3TpZq1EPjDEhuIgl0jevl3Nr
	DUOwT1bilDJuWJ+L2FFyF8vTscAEexYOFdNoBSNZw2hQI3GXtBWD/3a0nDwJvAK7+wMr
	2OfltvEk9dgPMUYKHJbMz1IdGoNb5UzgVREfbgKVepw+ruh6m0FBjQdnDFUrLo69WOWj
	u+xg==
X-Gm-Message-State: AMke39mqnLxlYbRaaWwaisk9KTcIKCBQjdmXML6qaGgKE2TWgH87AhUCUXx+JtJmO8RtM63hgRJENzCQZJ2Yog==
X-Received: by 10.28.211.205 with SMTP id k196mr22673365wmg.124.1487670105112; 
	Tue, 21 Feb 2017 01:41:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.212.30 with HTTP; Tue, 21 Feb 2017 01:41:44 -0800 (PST)
In-Reply-To: <20170220180700.29836-32-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
	<20170220180700.29836-32-schnitzeltony@googlemail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Feb 2017 10:41:44 +0100
Message-ID: <CA+chaQfDaJL8E8W9howaZDD_bJkqEHCgFLP9DPMJvbz=z4rGiQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 31/44] libqmi: unblacklist - libmbim is back
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2017 09:41:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

libqmi itself is now failing:
http://errors.yoctoproject.org/Errors/Details/133834/

On Mon, Feb 20, 2017 at 7:06 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
> b/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
> index fa2e67d..679b102 100644
> --- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
> +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
> @@ -16,5 +16,3 @@ SRC_URI =3D "http://www.freedesktop.org/
> software/${BPN}/${BPN}-${PV}.tar.xz \
>             "
>  SRC_URI[md5sum] =3D "4970c110f160b33637a3515004c637b2"
>  SRC_URI[sha256sum] =3D "7ab6bb47fd23bf4d3fa17424e40ea5
> 552d08b19e5ee4f125f21f316c8086ba2a"
> -
> -PNBLACKLIST[libqmi] ?=3D "Depends on blacklisted libmbim"
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

