Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351EFC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 16:07:54 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.40720.1701274065240858202
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 08:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=wunbCMF0;
 spf=pass (domain: smile.fr, ip: 209.85.218.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a06e59384b6so894888266b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1701274063; x=1701878863; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e8FxOHCpaAB0TYC9ksaNpF6Xbx5haydgP5sdPBFdpQA=;
        b=wunbCMF0L8J9pa/JE2A3C4vpeDUWojGqS4qjYmjC4mfhTRlsEeLdARGIl3BU3/RJ7Y
         zAYN0fV2ejSeVjjtvabdsNHuUp1IRe1XF58WC7LlFbhJh3WUWRBiYnbB6XJtTOj7LOG1
         xQH0M1b+S+NqyZSFQQ/ilSrEgnR6+Nd6C09ZPuXzaufLPsfBL6adTZH/Q3sgdVmWPnac
         8b9DNvJpudQwNfFPDBshkGE+RtdFHcphqNlyni3EvdgXwv9iZggcO1bZgSTnXjih/7ic
         gJsZOVT2bXwClDn5Jklg4NRsDrVIWHzgktwEpZqwAP64WDe5R7CGczd2hLZe6FDxsc3z
         TeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701274063; x=1701878863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8FxOHCpaAB0TYC9ksaNpF6Xbx5haydgP5sdPBFdpQA=;
        b=o0ywslTPsUDxCzUpFgsQYBNhmrYCYf0GlHm0Vy7g+g6OzdinAygqO5eUGW1Ft47KP6
         jt0eizC4fNd9W0dDd9BwFre7UDX8B1ZRdhmi+mC+S7ybNdTG/yWmh2cmLUk6gFUNCq14
         wKML9CckWcvL6u6WOe5BVpt9aYZ08/y1bSWeBYZpjNHx9E0/x+UDiB1r7XKDiEf1j+gH
         LMu2gqcwEiLmRH4LAEwGcpbmVSnFXLMJ8gPJdGuTHK6scRgpftCDWpvxVo0FXQ5Qom+e
         cZzjrkeczOnwgxNnZwPzzdZsFyTcWZr0dZHfg3xCS1hVfGNNoSijjpTmGZD5uXsQjhHD
         jMeA==
X-Gm-Message-State: AOJu0YzP9r5GBMkWrW4oVKn/AYWmkwnoIPUm2tU91Pre/vVOszNjIcWg
	vCBFru137B5Ep18OL37z5kmeQPGK0GK+Fr9rMmsYyQ==
X-Google-Smtp-Source: AGHT+IECuC+ZgrAbBYzPzhS7af1n4k2/rYgOIpSoVCAmzXv3YBIvkhGZA1/ZI3B+s6KKN7tXHrGB583huhYqJOHabvs=
X-Received: by 2002:a17:906:2306:b0:9e4:b664:baa8 with SMTP id
 l6-20020a170906230600b009e4b664baa8mr12637852eja.7.1701274063251; Wed, 29 Nov
 2023 08:07:43 -0800 (PST)
MIME-Version: 1.0
References: <522d304e-5148-4d3f-ad9b-caccc8a9fb31@gmail.com> <CAMKF1sqVDapwZhf4kf8q8E3g1msefrLGc5=bRtyCcHYjouyRZw@mail.gmail.com>
In-Reply-To: <CAMKF1sqVDapwZhf4kf8q8E3g1msefrLGc5=bRtyCcHYjouyRZw@mail.gmail.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Wed, 29 Nov 2023 17:07:17 +0100
Message-ID: <CAMSfU+6dXxL4jeye6_SoBEA7XrpUDjRZScFu3+YEK-w7_FCLAg@mail.gmail.com>
Subject: Re: [oe] kirkstone merge request: Nove 29th
To: Khem Raj <raj.khem@gmail.com>
Cc: akuster808 <akuster808@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000034bde6060b4cbcae"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 16:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107141

--00000000000034bde6060b4cbcae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 29 nov. 2023 =C3=A0 17:02, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :

> merged thanks Armin
>

Thanks Armin and Khem :-)


> On Wed, Nov 29, 2023 at 4:32=E2=80=AFAM akuster808 <akuster808@gmail.com>=
 wrote:
> >
> > The following changes since commit
> 7da6cb848bc42b3e6bd5d2b37b52ba75510a6ca0:
> >
> >    indent: fix CVE-2023-40305 (2023-11-03 10:52:59 -0400)
> >
> > are available in the Git repository at:
> >
> >    https://git.openembedded.org/meta-openembedded kirkstone-next
> >
> > for you to fetch changes up to 8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4=
:
> >
> >    nginx: upgrade to 1.24.0 release (2023-11-18 10:03:19 -0500)
> >
> > ----------------------------------------------------------------
> > Archana Polampalli (1):
> >        open-vm-tools: fix CVE-2023-34058
> >
> > Bartosz Golaszewski (1):
> >        python3-cson: fix run-time dependencies
> >
> > Khem Raj (1):
> >        emlog: Add PV
> >
> > Michael Haener (1):
> >        nginx: upgrade to 1.24.0 release
> >
> > Mingli Yu (1):
> >        nlohmann-json: Add ptest support
> >
> > Narpat Mali (2):
> >        open-vm-tools: fix CVE-2023-20900
> >        traceroute: upgrade 2.1.0 -> 2.1.3
> >
> > Peter Kjellerstedt (1):
> >        libwebsockets: Support building for native
> >
> > Richard Purdie (4):
> >        meta-perl: Drop broken BBCLASSEXTEND variants
> >        meta-networking: Drop broken BBCLASSEXTEND variants
> >        meta-oe: Drop broken BBCLASSEXTEND variants
> >        meta-python: Drop broken BBCLASSEXTEND variants
> >
> > Yoann Congal (3):
> >        emlog: ignore CVE-2022-3968 & CVE-2023-43291
> >        python3-soupsieve: Break circular dependency with beautifulsoup4
> >        packagegroup-meta-oe-extended: RDEPENDS on an existing mozjs-91
> > package
> >
> >   .../recipes-connectivity/mosquitto/mosquitto_2.0.18.bb          | 2 +=
-
> >   .../recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb            | 2 +=
-
> >   .../open-vm-tools/open-vm-tools/CVE-2023-20900.patch            | 36
> +++++
> >   .../open-vm-tools/open-vm-tools/CVE-2023-34058.patch            | 241
> > ++++++++++++++++++++++++++++
> >   .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb       | 2 +
> >   .../traceroute/{traceroute_2.1.0.bb =3D> traceroute_2.1.3.bb} |   3 +=
-
> >   .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend    | 2 +=
-
> >   .../recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb   | 3 +
> >   meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb           | 2 -
> >   meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb               | 2 -
> >   meta-oe/recipes-core/emlog/emlog.inc                            | 2 +=
-
> >   meta-oe/recipes-core/emlog/emlog_git.bb                         | 2 +
> >   meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb           | 2 +=
-
> >   meta-oe/recipes-devtools/nlohmann-json/files/run-ptest          | 12 =
++
> >   meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb  | 20
> ++-
> >   meta-oe/recipes-devtools/unifex/unifex_git.bb                   | 2 -
> >   meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb             | 2 +=
-
> >   meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb             | 2 -
> >   meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb             | 1 -
> >   .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb     | 2 +=
-
> >   meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb     | 2 -
> >   meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb           | 2 -
> >   meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb          | 2 -
> >   meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb    | 2 -
> >   .../recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb       | 2 -
> >   meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb  | 2 -
> >   meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb    | 2 +=
-
> >   .../python/python3-robotframework-seriallibrary_0.3.1.bb        | 2 -
> >   meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb     | 2 -
> >   meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb  | 4 -
> >   meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb     | 2 -
> >   meta-python/recipes-extended/python-cson/python3-cson_git.bb    | 3 +=
-
> >   .../recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb   | 2 -
> >   meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb              | 6 +
> >   34 files changed, 329 insertions(+), 48 deletions(-)
> >   create mode 100644
> >
> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-2090=
0.patch
> >   create mode 100644
> >
> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-3405=
8.patch
> >   rename meta-networking/recipes-support/traceroute/{traceroute_2.1.0.b=
b
> > =3D> traceroute_2.1.3.bb} (91%)
> >   create mode 100755
> meta-oe/recipes-devtools/nlohmann-json/files/run-ptest
> >   create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107140):
> https://lists.openembedded.org/g/openembedded-devel/message/107140
> Mute This Topic: https://lists.openembedded.org/mt/102870656/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--00000000000034bde6060b4cbcae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mer. 29 nov. 2023 =C3=A0=C2=A017:=
02, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</=
a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">merged thanks Armin<br></blockquote><div>=
<br></div><div>Thanks Armin and Khem :-)<br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
On Wed, Nov 29, 2023 at 4:32=E2=80=AFAM akuster808 &lt;<a href=3D"mailto:ak=
uster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; The following changes since commit 7da6cb848bc42b3e6bd5d2b37b52ba75510=
a6ca0:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 indent: fix CVE-2023-40305 (2023-11-03 10:52:59 -0400)<br=
>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded=
" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-op=
enembedded</a> kirkstone-next<br>
&gt;<br>
&gt; for you to fetch changes up to 8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e=
4:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 nginx: upgrade to 1.24.0 release (2023-11-18 10:03:19 -05=
00)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Archana Polampalli (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 open-vm-tools: fix CVE-2023-34058<br>
&gt;<br>
&gt; Bartosz Golaszewski (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-cson: fix run-time dependencies<br>
&gt;<br>
&gt; Khem Raj (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 emlog: Add PV<br>
&gt;<br>
&gt; Michael Haener (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 nginx: upgrade to 1.24.0 release<br>
&gt;<br>
&gt; Mingli Yu (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 nlohmann-json: Add ptest support<br>
&gt;<br>
&gt; Narpat Mali (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 open-vm-tools: fix CVE-2023-20900<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 traceroute: upgrade 2.1.0 -&gt; 2.1.3<br>
&gt;<br>
&gt; Peter Kjellerstedt (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 libwebsockets: Support building for native<=
br>
&gt;<br>
&gt; Richard Purdie (4):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-perl: Drop broken BBCLASSEXTEND varian=
ts<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-networking: Drop broken BBCLASSEXTEND =
variants<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-oe: Drop broken BBCLASSEXTEND variants=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-python: Drop broken BBCLASSEXTEND vari=
ants<br>
&gt;<br>
&gt; Yoann Congal (3):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 emlog: ignore CVE-2022-3968 &amp; CVE-2023-=
43291<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-soupsieve: Break circular dependenc=
y with beautifulsoup4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 packagegroup-meta-oe-extended: RDEPENDS on =
an existing mozjs-91<br>
&gt; package<br>
&gt;<br>
&gt;=C2=A0 =C2=A0.../recipes-connectivity/mosquitto/<a href=3D"http://mosqu=
itto_2.0.18.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.0.18.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0.../recipes-support/netsniff-ng/<a href=3D"http://netsniff=
-ng_0.6.8.bb" rel=3D"noreferrer" target=3D"_blank">netsniff-ng_0.6.8.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0.../open-vm-tools/open-vm-tools/CVE-2023-20900.patch=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 36 +++++<br>
&gt;=C2=A0 =C2=A0.../open-vm-tools/open-vm-tools/CVE-2023-34058.patch=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 241<br>
&gt; ++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../recipes-support/open-vm-tools/<a href=3D"http://open-v=
m-tools_11.3.5.bb" rel=3D"noreferrer" target=3D"_blank">open-vm-tools_11.3.=
5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +<br>
&gt;=C2=A0 =C2=A0.../traceroute/{<a href=3D"http://traceroute_2.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">traceroute_2.1.0.bb</a> =3D&gt; <a href=
=3D"http://traceroute_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">tracer=
oute_2.1.3.bb</a>} |=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 =C2=A0.../recipes-core/packagegroups/packagegroup-meta-oe.bbappe=
nd=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0.../recipes-connectivity/libwebsockets/<a href=3D"http://l=
ibwebsockets_4.2.2.bb" rel=3D"noreferrer" target=3D"_blank">libwebsockets_4=
.2.2.bb</a>=C2=A0 =C2=A0| 3 +<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-connectivity/ser2net/<a href=3D"http://ser=
2net_4.3.5.bb" rel=3D"noreferrer" target=3D"_blank">ser2net_4.3.5.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 -<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-connectivity/zeromq/<a href=3D"http://czmq=
_4.2.1.bb" rel=3D"noreferrer" target=3D"_blank">czmq_4.2.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 -<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-core/emlog/emlog.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-core/emlog/<a href=3D"http://emlog_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">emlog_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +<=
br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-devtools/heaptrack/<a href=3D"http://heapt=
rack_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">heaptrack_1.2.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-devtools/nlohmann-json/files/run-ptest=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-devtools/nlohmann-json/<a href=3D"http://n=
lohmann-json_3.10.5.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-json_=
3.10.5.bb</a>=C2=A0 | 20 ++-<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-devtools/unifex/<a href=3D"http://unifex_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">unifex_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 -<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-graphics/openjpeg/<a href=3D"http://openjp=
eg_2.4.0.bb" rel=3D"noreferrer" target=3D"_blank">openjpeg_2.4.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-graphics/xorg-app/<a href=3D"http://xkbuti=
ls_1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">xkbutils_1.0.4.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 -<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-graphics/xorg-app/<a href=3D"http://xsetro=
ot_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">xsetroot_1.1.2.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 =C2=A0.../recipes-perl/libconfig/<a href=3D"http://libconfig-aut=
oconf-perl_0.319.bb" rel=3D"noreferrer" target=3D"_blank">libconfig-autocon=
f-perl_0.319.bb</a>=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0meta-perl/recipes-perl/libio/<a href=3D"http://libio-socke=
t-ssl-perl_2.074.bb" rel=3D"noreferrer" target=3D"_blank">libio-socket-ssl-=
perl_2.074.bb</a>=C2=A0 =C2=A0 =C2=A0| 2 -<br>
&gt;=C2=A0 =C2=A0meta-perl/recipes-perl/libnet/<a href=3D"http://libnet-dns=
-perl_1.33.bb" rel=3D"noreferrer" target=3D"_blank">libnet-dns-perl_1.33.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 -<br>
&gt;=C2=A0 =C2=A0meta-perl/recipes-perl/libnet/<a href=3D"http://libnet-lda=
p-perl_0.68.bb" rel=3D"noreferrer" target=3D"_blank">libnet-ldap-perl_0.68.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 -<br>
&gt;=C2=A0 =C2=A0meta-perl/recipes-perl/libstatgrab/<a href=3D"http://libun=
ix-statgrab_0.112.bb" rel=3D"noreferrer" target=3D"_blank">libunix-statgrab=
_0.112.bb</a>=C2=A0 =C2=A0 | 2 -<br>
&gt;=C2=A0 =C2=A0.../recipes-devtools/python/<a href=3D"http://python3-aioh=
ttp-jinja2_1.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-aiohttp-jin=
ja2_1.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 -<br>
&gt;=C2=A0 =C2=A0meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-autobahn_22.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-autoba=
hn_22.3.2.bb</a>=C2=A0 | 2 -<br>
&gt;=C2=A0 =C2=A0meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-pyudev_0.23.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_0=
.23.2.bb</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-robotframework-serial=
library_0.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-robotframewo=
rk-seriallibrary_0.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 -<br>
&gt;=C2=A0 =C2=A0meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-snappy_0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-snappy_0.=
6.1.bb</a>=C2=A0 =C2=A0 =C2=A0| 2 -<br>
&gt;=C2=A0 =C2=A0meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-soupsieve_2.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-soupsi=
eve_2.3.1.bb</a>=C2=A0 | 4 -<br>
&gt;=C2=A0 =C2=A0meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-txaio_22.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-txaio_22.=
2.1.bb</a>=C2=A0 =C2=A0 =C2=A0| 2 -<br>
&gt;=C2=A0 =C2=A0meta-python/recipes-extended/python-cson/<a href=3D"http:/=
/python3-cson_git.bb" rel=3D"noreferrer" target=3D"_blank">python3-cson_git=
.bb</a>=C2=A0 =C2=A0 | 3 +-<br>
&gt;=C2=A0 =C2=A0.../recipes-extended/pywbemtools/<a href=3D"http://python3=
-pywbemtools_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pywbemt=
ools_1.0.0.bb</a>=C2=A0 =C2=A0| 2 -<br>
&gt;=C2=A0 =C2=A0meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx=
_1.24.0.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.24.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +<br>
&gt;=C2=A0 =C2=A034 files changed, 329 insertions(+), 48 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644<br>
&gt; meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-2=
0900.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644<br>
&gt; meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-3=
4058.patch<br>
&gt;=C2=A0 =C2=A0rename meta-networking/recipes-support/traceroute/{<a href=
=3D"http://traceroute_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">tracer=
oute_2.1.0.bb</a><br>
&gt; =3D&gt; <a href=3D"http://traceroute_2.1.3.bb" rel=3D"noreferrer" targ=
et=3D"_blank">traceroute_2.1.3.bb</a>} (91%)<br>
&gt;=C2=A0 =C2=A0create mode 100755 meta-oe/recipes-devtools/nlohmann-json/=
files/run-ptest<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/<a h=
ref=3D"http://nginx_1.24.0.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1=
.24.0.bb</a><br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107140): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107140" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107140</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102870656/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102870656/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--00000000000034bde6060b4cbcae--

