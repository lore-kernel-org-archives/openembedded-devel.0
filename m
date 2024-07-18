Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BC4C3DA6F
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 14:49:42 +0000 (UTC)
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
 by mx.groups.io with SMTP id smtpd.web11.16964.1721314178036830052
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 07:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=Fg5GhbxS;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.189, mailfrom: dev@g0hl1n.net)
X-Envelope-To: tim.orling@konsulko.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1721314174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1lcaKa+PwGYWmZtOsLMykLX6/x1h44jfY+hQyvhgxwo=;
	b=Fg5GhbxSfo/TXRDZKeTLPANB+GUxrKH5oudgp3M1E83he8gAJlB9eRxSLkOAh+jZAFlndi
	MP9rFIy8pPvkF+jYq/Do/p7chYKwzl633ptXSjsCfHUmXUXYZb+igw+zzazE/jNLLJG0PM
	x9grEWGLECD/65V5avLy6QV2txRFbzA=
X-Envelope-To: akuster808@gmail.com
X-Envelope-To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jul 2024 16:49:30 +0200
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <dev@g0hl1n.net>
To: Tim Orling <tim.orling@konsulko.com>
Cc: akuster808 <akuster808@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
Message-ID: <lhsjaroyl6ivizrhqd6dmwtibvcgjynf756u5o6turi7aqxzb6@cdl46qnvnn4t>
References: <20240706180810.1707296-1-dev@g0hl1n.net>
 <26a61314-0aa1-4e5c-ac71-d0ece3591362@gmail.com>
 <w24ywr4aiiqxecb46semqmbw4ulstn4rz25mwbiurkwh4xzxva@oyphvy5wc7nj>
 <CAOyo-87-wojy-WxNs98qWp9kev2Dpui-Nk8ffLzwWQbmsvpvjQ@mail.gmail.com>
 <CAOyo-86Zds3bvy0GvmiBEDRignUn2Z509SkD7Lw1xZ-0Ky30bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOyo-86Zds3bvy0GvmiBEDRignUn2Z509SkD7Lw1xZ-0Ky30bg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 14:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111399

Hi Tim, Hi Armin,

sorry for the late response, just came back from vacation.

On Wed, Jul 10, 2024 at 12:10:01PM GMT, Tim Orling wrote:
> On Wed, Jul 10, 2024 at 8:14=E2=80=AFAM Tim Orling <tim.orling@konsulko=
.com> wrote:
> > On Tue, Jul 9, 2024 at 5:54=E2=80=AFAM Richard Leitner <dev@g0hl1n.ne=
t> wrote:
> >
> >> Hi Armin,
> >>
> >> On Tue, Jul 09, 2024 at 08:12:06AM GMT, akuster808 wrote:
> >> > Hello Richard,
> >> >
> >> > On 7/6/24 2:08 PM, Richard Leitner via lists.openembedded.org wrot=
e:
> >> > > The currently available python-3-pydantic v2.7.0 requires
> >> > > python3-pydantic-core to be updated to v2.18.1.
> >>
> >
> I don't know what we want to do with scarthgap. Part of me thinks we sh=
ould
> revert the 2.7.0 upgrade to one which is compatible with 2.16.3
> python3-pydantc-core. Part of me thinks upgrade python3-pydantic-core t=
o
> 2.18.1, but we won't have that in master. Right now, it appears to me t=
hat
> we need new recipes (python3-tzdata) in order to build 2.19.0 (I did no=
t
> look at 2.18.x). Adding new recipes sounds against stable policy to me.

Tbh it wasn't clear to me why the pydantic (not -core) update to 2.7.0
was accepted at all (for scarthgap) as it bumps the minor version. Is
this sane/desired? ... Even after reading "Stable/LTS Patch Acceptance
Policies" by YP [1] this isn't completely clear to me (does OE have a
own policy on this?.

For the update (2.16.3 to 2.18.1) there isn't anythin in the
pyproject.toml diff which results in dependency changes.
So IMHO this should be safe.

Nonetheless applying this patch to scarthgap definitely breaks the
"backport only"/"master first" principle. So maybe downgrading is the
"policy friendly" approach?

>=20
> > > I don't see the updated or later version in master? Am I missing
> >> something?
> >>
> >> I found a series from Tim [1] which updates python3-pydantic and
> >> python3-pydantic-core
> >> to 2.7.4/1.9.0 for master.
> >> As those are newer versions I didn't send this patch for master.
> >>
> >
> > That series needed to be rebased, per khem. Just because it is on
> > patchwork does not imply merging or correctness.
> > During the rebase I discovered missing dependencies.

Thanks for the clarification. Next time I will follow up the already
existing series first.

> >
> > Also, python3-pydantic-core has a QA warning about TMPDIR
> >  WARNING: python3-pydantic-core-2.19.0-r0 do_package_qa: QA Issue: Fi=
le
> > /usr/lib/python3.12/site-packages/pydantic_core/_
> > pydantic_core.cpython-312-x86_64-linux-gnu.so in package
> > python3-pydantic-core contains reference to TMPDIR [buildpaths]
> >
> > Which seems to be RUSTFLAGS being injected into the .so for some reas=
on
> > (where 14 is the .rodata section):
> > readelf -p 14 pydantic_core/_pydantic_core.cpython-312-x86_64-linux-g=
nu.so
> >
> > <snip>
> >   [   f7c]  i
> > ...skipping...
> >
> > model-fieldsdataclasstuplefrozensetdefinition-refdefinitionsUnknown s=
chema
> > type: "2.19.0a-alphab-beta__version__profile=3Drelease pgo=3D -L
> > /srv/build/ttorling/workspace-upgrades/build/tmp/work/core2-64-poky-l=
inux/python3-pydantic-coas
> >   [ 2ae09]  kwargs
> >   [ 2ae10]  (args,
> > kwargs=3DNone)ArgsKwargs(kwargssrc/argument_markers.rsCreating instan=
ces of
> > "UndefinedType" is not supportednew()\n
> > <snip>
> >
> > The above seems to be a backtrace from the schema generation script, =
but I
> > haven't figured out yet how to troubleshoot further.
> >
>=20
> Filed an issue upstream:
> https://github.com/pydantic/pydantic-core/issues/1365
>=20
> >
> > Meanwhile, upstream has updated again.
> > My working branch:
> >
> > https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/=
python3-pydantic-upgrade
> >
>=20
> Found more ptest RDEPENDS missing for python3-pydantic. That branch
> currently passes ptests for:
> bitbake (-c testimage) meta-python-image-ptest-python3-pydantic-core
> bitbake (-c testimage) meta-python-image-ptest-python3-pydantic
>=20

Do you got failing ptests for scarthgap (with this patch applied) too?
Or did you just tested master?

[1] https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS

Thanks & regards;rl


