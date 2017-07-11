Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id A5DB262133
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 07:06:46 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id a12so6611260ywh.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 00:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7q+WS2B1uqlFFFYYdH1yVCzo9QHcZz1q1UI0OFQOjNU=;
	b=GrA+VL38zu3AMDnk1uVKB1VcV27eBx7AEbqYvG3AGS9xVp+nAvq3FAhAMj6TeBOHYu
	JBQAVHq6pRhntOYGQ19NCz7pWJeKTvHa6HZmnAdBg+Vhi72jHzlaYoQzfqj2z++KT2il
	9ZvniRmuu8DJsJl4U/XUmSMKbUPMsirhkNU+exPc0mEiRDReS/UKL3D927rNwXxFE5if
	AVx43x1bTNkGN869U7uLkRGB/f5f/4sTdseFcNg2WCyy63ZOK9adzFuX+N1tc9G1zlWa
	uwNVAvlV+7y5U9ska24KcQYANPtIWme3Lnm/wXzZ+poHoo1jz7HnjB/erZ601yBQIJrS
	0p3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7q+WS2B1uqlFFFYYdH1yVCzo9QHcZz1q1UI0OFQOjNU=;
	b=nDn9Uhl/t9Jlu6BmDStNdZ1ZoxvmxhuzIUAxEDoTWhy8RqY2kBFABaK807Qe3hRG9m
	pnS6gwAejZ4AgZ/SB5Eu76mwzkmUFLfe8JQwWcTti0JozdA1klHyK68jTAPw3rSDstxJ
	xfG79J6wR3zSLW+1Lf5xQNDl3Tdot6yjEiqnjpo/j1S7Pm2Jf/kmR0zelG0hrb7u86rg
	/IimlzijKASShTLX0RPoDWZJDG2EJNWAG184Q9HPM/n0x0v7DN/zKrtZYDS2nz+rJUiB
	qGHzsX8Bydv+G60+cL5qsIV2mbGqlOf3EDdput1vbVihAvzgq+gRTCafzMjcla/ycl32
	zsXQ==
X-Gm-Message-State: AIVw113pnTW3Z+jTaw75cYAuwe+Znnil8v1/aKcdZvdAdkdj9ANs2GLC
	rsppONOaOULzCkqpCHc1tNZVMnXRPu/c
X-Received: by 10.13.221.10 with SMTP id g10mr3505490ywe.306.1499756808171;
	Tue, 11 Jul 2017 00:06:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Tue, 11 Jul 2017 00:06:47 -0700 (PDT)
In-Reply-To: <CAHvQdo3L34KbWREUuVAn+SqrSo6Q3UMwCvSKiX=4Va6s9htFQw@mail.gmail.com>
References: <20170706093039.30435-1-johannes.pointner@br-automation.com>
	<CAD4b0_LYeFonQzv7bqTZxO=vq0fwcHtEw49ZDL_vDuki-UXH4w@mail.gmail.com>
	<CAHvQdo3L34KbWREUuVAn+SqrSo6Q3UMwCvSKiX=4Va6s9htFQw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Jul 2017 09:06:47 +0200
Message-ID: <CA+chaQeFbZrhDVUbRZN4Bu35UjNrVheoLq+viXdEvUUrYyJJ5Q@mail.gmail.com>
To: Johannes Pointner <h4nn35.work@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libtinyxml2: upgrade to 5.0.1
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
X-List-Received-Date: Tue, 11 Jul 2017 07:06:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just FILES_${PN}-dev +=3D "${libdir}/cmake/" should be enough.

On Tue, Jul 11, 2017 at 8:24 AM, Johannes Pointner <h4nn35.work@gmail.com>
wrote:

> 2017-07-11 8:13 GMT+02:00 Maciej Borz=C4=99cki <maciej.borzecki@rndity.co=
m>:
> > On Thu, Jul 6, 2017 at 11:30 AM, Johannes Pointner
> > <johannes.pointner@br-automation.com> wrote:
> >> Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
> >> ---
> >>  .../{libtinyxml2_4.0.1.bb =3D> libtinyxml2_5.0.1.bb}          | 13
> ++++++++++++-
> >>  1 file changed, 12 insertions(+), 1 deletion(-)
> >>  rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2_4.0.1.bb =3D>
> libtinyxml2_5.0.1.bb} (63%)
> >>
> >> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
> b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
> >> similarity index 63%
> >> rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
> >> rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
> >> index 3a6659815..edf836814 100644
> >> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
> >> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
> >> @@ -6,10 +6,21 @@ LIC_FILES_CHKSUM =3D "file://tinyxml2.cpp;endline=3D
> 22;md5=3Dc19221dbd8a66ad3090462af4
> >>
> >>  SRC_URI =3D "git://github.com/leethomason/tinyxml2.git"
> >>
> >> -SRCREV =3D "74d44acb176f8510abf28ee0a70961eb26631988"
> >> +SRCREV =3D "37bc3aca429f0164adf68c23444540b4a24b5778"
> >>
> >>  S =3D "${WORKDIR}/git"
> >>
> >>  inherit cmake
> >>
> >> +FILES_${PN} =3D " \
> >> +    ${libdir}/lib*${SOLIBS} \
> >> +    ${includedir}/* \
> >
> > pretty sure whatever is in ${includedir} it should be a part of -dev
> package.
> You are right.
> But this would still leave us with this rule:
> FILES_${PN}-dev =3D " \
>     ${includedir}/* \
>     ${libdir}/lib*${SOLIBSDEV} \
>     ${libdir}/cmake/* \
>     ${libdir}/pkgconfig/* \
>     "
> Is this OK?
> >
> >> +    "
> >> +
> >> +FILES_${PN}-dev =3D " \
> >> +    ${libdir}/lib*${SOLIBSDEV} \
> >> +    ${libdir}/cmake/* \
> >> +    ${libdir}/pkgconfig/* \
> >> +    "
> >> +
> >>  BBCLASSEXTEND =3D "native"
> >> --
> >> 2.13.2
> >>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> > --
> > Maciej Borzecki
> > RnDity
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

