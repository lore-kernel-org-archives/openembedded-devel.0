Return-Path: <Tillmann.Severin@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03727C982C1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 05:44:38 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] smolkit: Add low-footprint drop-in replacement for polkit
To: openembedded-devel@lists.openembedded.org
From: "Severin Tillmann, DE-862" <Tillmann.Severin@bmw.de>
X-Originating-Location: Munich, Bavaria, DE (160.46.252.58)
X-Originating-Platform: Linux Firefox 150
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 16 Sep 2026 22:44:31 -0700
References: <20260914122927.87418-1-tillmann.severin@bmw.de> <E76E2C6A-43C3-4E87-BDBA-D8DDA125E2A4@arm.com>
In-Reply-To: <E76E2C6A-43C3-4E87-BDBA-D8DDA125E2A4@arm.com>
Message-ID: <546192.1789623871363509840@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="wJ4sYCYDJhNHHMY19JZx"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 05:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130091

--wJ4sYCYDJhNHHMY19JZx
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

thanks a lot for your feedback!

On Tue, Sep 15, 2026 at 06:30 AM, Ross Burton wrote:

>=20
> On 14 Sep 2026, at 13:29, Severin Tillmann, DE-862 via
> lists.openembedded.org <Tillmann.Severin=3Dbmw.de@lists.openembedded.org>
> wrote:
>=20
>> +CONFLICT_DISTRO_FEATURES =3D "polkit"
>> +REQUIRED_DISTRO_FEATURES =3D "smolkit"
>=20
> This makes the claim of =E2=80=9Cdrop-in replacement=E2=80=9D suspicious,=
 because it would
> mean every recipe that currently depends on polkit and respects the polki=
t
> DISTRO_FEATURE needs to be modified.
>=20
> Could smolkit not PROVIDE polkit, so the distro can just switch the
> preferred provider and everything just works?

You are of course right, smolkit is not a complete drop-in replacement (yet=
), it is only a drop-in replacement for a certain subset of polkit's interf=
ace, I will try to rephrase that in the next version of the patch. smolkit =
does not provide any helper tools like e.g. `pkexec` and also does not impl=
ement the whole featureset that polkit has. This might lead to issues if ot=
her recipes expect tools, libraries or other features polkit provides, but =
smolkit does not provide. Do you think it nevertheless makes sense to switc=
h to a PROVIDES based approach here? I have checked that the build succeeds=
 also with `PROVIDES` and `PREFERRED_PROVIDER_polkit =3D "smolkit"`, so it =
should not make a big difference, I am just worried regarding expectations =
from other recipes. I would send a patch v2 once it is decided which way to=
 go.
>=20
>=20
>=20
>> +PV =3D "0.2+git"
>> +
>> +SRC_URI =3D "\
>> + git://github.com/bmwcarit/${BPN}.git;protocol=3Dhttps;branch=3Dmain \
>> +"
>> +SRCREV =3D "46bbfd5c922a8d03a534398ee129ded822dfcafe"
>=20
> I notice a lack of tags upstream=E2=80=A6

Tags are now present on the upstream repository.
>=20
>=20
>> +S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
>=20
> You can drop this line.
>=20
> Finally, I absolutely love the name.
>=20
> Ross

I will drop the line in the next version and am happy that you like the nam=
e ;-)

Best regards,
Tillmann

--wJ4sYCYDJhNHHMY19JZx
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Ross,</div>
<div>&nbsp;</div>
<div>thanks a lot for your feedback!</div>
<div>&nbsp;</div>
<div>On Tue, Sep 15, 2026 at 06:30 AM, Ross Burton wrote:</div>
<div>
<blockquote>On 14 Sep 2026, at 13:29, Severin Tillmann, DE-862 via lists.op=
enembedded.org &lt;Tillmann.Severin=3Dbmw.de@lists.openembedded.org&gt; wro=
te:<br />
<blockquote>+CONFLICT_DISTRO_FEATURES =3D "polkit"<br />+REQUIRED_DISTRO_FE=
ATURES =3D "smolkit"</blockquote>
This makes the claim of &ldquo;drop-in replacement&rdquo; suspicious, becau=
se it would mean every recipe that currently depends on polkit and respects=
 the polkit DISTRO_FEATURE needs to be modified.<br /><br />Could smolkit n=
ot PROVIDE polkit, so the distro can just switch the preferred provider and=
 everything just works?</blockquote>
You are of course right, smolkit is not a complete drop-in replacement (yet=
), it is only a drop-in replacement for a certain subset of polkit's interf=
ace, I will try to rephrase that in the next version of the patch. smolkit =
does not provide any helper tools like e.g. `pkexec` and also does not impl=
ement the whole featureset that polkit has. This might lead to issues if ot=
her recipes expect tools, libraries or other features polkit provides, but =
smolkit does not provide. Do you think it nevertheless makes sense to switc=
h to a PROVIDES based approach here? I have checked that the build succeeds=
 also with `PROVIDES` and `PREFERRED_PROVIDER_polkit =3D "smolkit"`, so it =
should not make a big difference, I am just worried regarding expectations =
from other recipes. I would send a patch v2 once it is decided which way to=
 go.
<blockquote>
<blockquote>+PV =3D "0.2+git"<br />+<br />+SRC_URI =3D "\<br />+ git://gith=
ub.com/bmwcarit/${BPN}.git;protocol=3Dhttps;branch=3Dmain \<br />+"<br />+S=
RCREV =3D "46bbfd5c922a8d03a534398ee129ded822dfcafe"</blockquote>
I notice a lack of tags upstream&hellip;</blockquote>
Tags are now present on the upstream repository.
<blockquote>
<blockquote>+S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"</blockquote>
You can drop this line.<br /><br />Finally, I absolutely love the name.<br =
/><br />Ross</blockquote>
I will drop the line in the next version and am happy that you like the nam=
e ;-)<br /><br /></div>
<div>Best regards,</div>
<div>Tillmann</div>

--wJ4sYCYDJhNHHMY19JZx--

