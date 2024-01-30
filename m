Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F97C4828E
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 20:34:28 +0000 (UTC)
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
 by mx.groups.io with SMTP id smtpd.web10.7266.1706646862450580802
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jan 2024 12:34:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=fYBbYLB2;
 spf=pass (domain: g0hl1n.net, ip: 95.215.58.183, mailfrom: dev@g0hl1n.net)
Date: Tue, 30 Jan 2024 21:34:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1706646860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJzknYa5swsEX/8xSKY98aTFRQsbmcIAGk1Di7YL2ts=;
	b=fYBbYLB2UCFyyrdQXgNBNiLo8rSAvySCS+dAhKR5jOKvE9dr6Z2/zV5M7TV+grYE/PmipB
	cH9g321le/We3IS0tk0qozzc9YHLrQfwYULfAIL1uxSvqxZJtiu8sakAHBfor/1Cg7bE4w
	3xhleB1JEj6IIf/hSA8xE/ibjihKmB0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <dev@g0hl1n.net>
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][PATCH] python3-janus: add recipe for v1.0.0
Message-ID: <av7vtmjh5cemjjvbapyanzmdcphqb7xai6264vjka4hccjpefq@54zqlsyztlbi>
References: <20240123233625.38469-1-dev@g0hl1n.net>
 <CANx9H-BsbHJZ=Qf0Py2u8xK+a6feL92FU=jiyh2UusZYAw_f2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANx9H-BsbHJZ=Qf0Py2u8xK+a6feL92FU=jiyh2UusZYAw_f2g@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 20:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108501

On Tue, Jan 23, 2024 at 03:41:15PM -0800, Tim Orling wrote:
> On Tue, Jan 23, 2024 at 3:36=E2=80=AFPM Richard Leitner via lists.opene=
mbedded.org
> <dev=3Dg0hl1n.net@lists.openembedded.org> wrote:
>=20
> > janus is a python library providing a mixed sync-async queue to
> > interoperate between asyncio tasks and classic threads. This recipe u=
ses
> > pypi as source:
> >
> >         https://pypi.org/project/janus/
> >
> > Signed-off-by: Richard Leitner <dev@g0hl1n.net>
> > ---
> >  .../python/python3-janus_1.0.0.bb                 | 15 +++++++++++++=
++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/
> > python3-janus_1.0.0.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-janus_1.0.0.=
bb
> > b/meta-python/recipes-devtools/python/python3-janus_1.0.0.bb
> > new file mode 100644
> > index 000000000..be1f284d8
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-janus_1.0.0.bb
> > @@ -0,0 +1,15 @@
> > +SUMMARY =3D "Mixed sync-async queue to interoperate between asyncio =
tasks
> > and classic threads"
> > +SECTION =3D "devel/python"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D23878c357ebb4c8ce1109be36=
5043349"
> > +
> > +SRC_URI[sha256sum] =3D
> > "df976f2cdcfb034b147a2d51edfc34ff6bfb12d4e2643d3ad0e10de058cb1612"
> > +
> > +inherit pypi setuptools3
> >
> inherit python_setuptools_build_meta
> https://github.com/aio-libs/janus/blob/master/pyproject.toml#L3

Thanks for the pointer! v2 will go out soon.

regards;rl

