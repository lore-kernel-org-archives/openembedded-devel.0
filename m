Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA231E64016
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:27:50 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.9808.1732224464815218741
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b54LJNMH;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e60f6ea262so712478b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 13:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732224464; x=1732829264; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dibV/I54RQ44uWQm2UEgyc42ptDfYmourP5A7cSmj4Q=;
        b=b54LJNMHgu8T0zpQRReTdd0n1EiNUsiqs6Sj3qRzUQtGW4loyV2ZHM8gwSF7AODMq2
         fjeKFGOcXiuK7rbSnEo5Y6ejaZ9CSAMU+yVNZmV3gwjhMN33EGtWUQLIVbqGpfzIxDGr
         n7iI97YFpEZ6pfRPT9AVBcSugiq1YfKsMT6pgGFlh6eEz+mwZa6HoC8WELs0LdYFU1iS
         9iK9LNJ0YcHo/DMTGj0+nzhrFqguBsbq2zB4Uv4L6u2T3hULxn9TfPM9q/VMXpiE59K8
         y+7nCAHLyTYHjf5ipTCWwlbKH1LU+JLb/DXRM/czZ1u/hGp+cUxndxCSuhp0w9f/HdnK
         N94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732224464; x=1732829264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dibV/I54RQ44uWQm2UEgyc42ptDfYmourP5A7cSmj4Q=;
        b=YH8Zi+YsSnWOwpBCElZvPj7pnov+BH2t2dC2eOztjFoJKW2Mb5yzcXJ9wYS0zHCpxF
         HshfGx4r8Du0/olKVGVa4Xe9CSLqfSTT2RobuRCIU7e1tdAABqFffH45/p4ubnxmNAET
         vwK9rIydf2OcdqDkt8am2xpRN0gcXHZPa4+Md5KpKI2jBbVoTRX9Lx7gQwaIuqo0LjR1
         UXW/ZN+cHhirXigcShNdBdvEY1OAbheAZhSusvjkx1xoXDb9mYm/OfXe4q4HTZ35gS1w
         OIEjc3CRrzTNBhmtWGosC1JNLtp18nMgdq/RfaKwKz8O7mjodzFeN7WvE0kYvY//H6gn
         o56A==
X-Gm-Message-State: AOJu0Yza8Nal9ots9GrZ+Sd1YxGv1Gb14R2RjLijRwaMzpEU+oyqGXWi
	nKBEnr8k2GtZqba7AfuIcmFZIHhGR/teHgIjj9MNc+Zu+3Dyd9dR+5vwbDAqH3WULKVipS38M1Q
	OpKXR+ZGVmHnQz29rtDu5Oa9kFi0=
X-Gm-Gg: ASbGnctIAnNaWiDo+7kv6OJqGjzZIyAuIX5NndyLPihv36siNaEYcpjdlInTW8gfZSL
	S+WMR3RJjPrVEBGaUv4nLGmIReDERGig=
X-Google-Smtp-Source: AGHT+IF8Xk7AWY19nwEodUGi2hC+ek6ctgsOT9XpU6xK11ztTHA3riymRzwdlqplPhtgdI1IRBoFPYUfQFbwbCbS+FY=
X-Received: by 2002:a05:6808:2519:b0:3e6:206:e3da with SMTP id
 5614622812f47-3e9158e18d3mr555219b6e.22.1732224463952; Thu, 21 Nov 2024
 13:27:43 -0800 (PST)
MIME-Version: 1.0
References: <20241121093022.272900-1-raj.khem@gmail.com> <NOPANS.EOTL1S9CQ69M@t-online.de>
In-Reply-To: <NOPANS.EOTL1S9CQ69M@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2024 13:27:18 -0800
Message-ID: <CAMKF1sr2HkDpY93L4MedFz8hoLV=G2aDKQrJEAGqpWNoaatLMg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] geary: Specify location of iso-codes xml files
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 21:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113979

On Thu, Nov 21, 2024 at 2:09=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Hi Khem,
> can your issue also be fixed like this?
>                  -Diso_639_xml=3D${datadir}/xml/iso-codes/iso_639.xml \
>                  -Diso_3166_xml=3D${datadir}/xml/iso-codes/iso_3166.xml \
>

thats not going to work in cross compile env.

> When I include STAGING_DATADIR, I see this error:
> ERROR: geary-46.0-r0 do_package_qa: QA Issue: File /usr/lib/geary/libgear=
y-client-46.0.so in package geary contains reference to TMPDIR [buildpaths]
> ERROR: geary-46.0-r0 do_package_qa: Fatal QA errors were found, failing t=
ask.
> ERROR: Logfile of failure stored in: /home/flk/poky/build/tmp/work/corei7=
-64-poky-linux/geary/46.0/temp/log.do_package_qa.232522
> ERROR: Task (/home/flk/poky/meta-openembedded/meta-gnome/recipes-connecti=
vity/geary/geary_46.0.bb:do_package_qa) failed with exit code '1'

yeah I see this as well. Let me look into where it's getting added.

>
> On Thu, Nov 21 2024 at 01:30:22 AM -08:00:00, Khem Raj via lists.openembe=
dded.org <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> During cross-compiling it needs to know the location of staging area wher=
e these files are installed in RSS Signed-off-by: Khem Raj <raj.khem@gmail.=
com> --- meta-gnome/recipes-connectivity/geary/geary_46.0.bb | 5 ++++- 1 fi=
le changed, 4 insertions(+), 1 deletion(-) diff --git a/meta-gnome/recipes-=
connectivity/geary/geary_46.0.bb b/meta-gnome/recipes-connectivity/geary/ge=
ary_46.0.bb index 2ca27c4f36..6d6d9f5443 100644 --- a/meta-gnome/recipes-co=
nnectivity/geary/geary_46.0.bb +++ b/meta-gnome/recipes-connectivity/geary/=
geary_46.0.bb @@ -47,7 +47,10 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFE=
ATURES}" REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data opengl" G=
IR_MESON_OPTION =3D "" -EXTRA_OEMESON =3D "-Dprofile=3Drelease" +EXTRA_OEME=
SON =3D "-Dprofile=3Drelease \ + -Diso_639_xml=3D${STAGING_DATADIR}/xml/iso=
-codes/iso_639.xml \ + -Diso_3166_xml=3D${STAGING_DATADIR}/xml/iso-codes/is=
o_3166.xml \ + " PACKAGECONFIG[libunwind] =3D "-Dlibunwind=3Denabled,-Dlibu=
nwind=3Ddisabled,libunwind" PACKAGECONFIG[tnef] =3D "-Dtnef=3Denabled,-Dtne=
f=3Ddisabled,libytnef"
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#113963): https://lists.openemb=
edded.org/g/openembedded-devel/message/113963 Mute This Topic: https://list=
s.openembedded.org/mt/109700823/3618223 Group Owner: openembedded-devel+own=
er@lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/ope=
nembedded-devel/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-

