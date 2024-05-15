Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D2CC25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 08:34:10 +0000 (UTC)
Subject: Re: [meta-python][scarthgap][PATCH 1/2] python3-twisted: remove obsolete python3-twisted-flow
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 15 May 2024 01:34:03 -0700
References: <9f3e2f66-0ef3-497f-9eb0-97fa35861eeb@kernel.crashing.org>
In-Reply-To: <9f3e2f66-0ef3-497f-9eb0-97fa35861eeb@kernel.crashing.org>
Message-ID: <19808.1715762043628074244@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="X9R36InV2MB0d7BJ4jgr"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 08:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110404

--X9R36InV2MB0d7BJ4jgr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 03:38 PM, Mark Hatle wrote:

>=20
> I see this change made it into meta-openembedded master. But hasn't been
> pushed to scarthgap yet.
>=20
> I've having a problem with this recipe in scarthgap, and so far it looks
> like these two changes do fix the problem I'm having.
>=20
> The two commits I cherry-picked back to scarthgap and tested are:
>=20
> bd1b5cde348dbc20e3d332de69617a8a95fe5ff3 - python3-twisted: prepend split
> PACKAGES
>=20
> 3fd6f0feec002c85df23b37c04d745a43674ee66 - python3-twisted: remove
> obsolete python3-twisted-flow
>=20
> This resolves the issue I was having.
>=20
> --Mark

Hi Mark, thanks for confirming the fix. The issue unfortunately wasn't foun=
d until just after the initial scarthgap release. If anyone is to blame it'=
s me, though I've updated my testing setup moving forward so this won't hap=
pen again when sending patches upstream (I forgot to test 'installing' the =
package into the minimal image so didn't get the proper error message).

It's my understanding that this will only get merged into scarthgap in the =
next release (5.0.1) which happens about 1 once a month. According to the Y=
octo Project status from yesterday, 5.0.1 is in QA.

Best regards,
Gudni

--X9R36InV2MB0d7BJ4jgr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 03:38 PM, Mark Hatle wrote:<br />
<blockquote>I see this change made it into meta-openembedded master. But ha=
sn't been pushed to scarthgap yet.<br /><br />I've having a problem with th=
is recipe in scarthgap, and so far it looks like these two changes do fix t=
he problem I'm having.<br /><br />The two commits I cherry-picked back to s=
carthgap and tested are:<br /><br />bd1b5cde348dbc20e3d332de69617a8a95fe5ff=
3 - python3-twisted: prepend split PACKAGES<br /><br />3fd6f0feec002c85df23=
b37c04d745a43674ee66 - python3-twisted: remove obsolete python3-twisted-flo=
w<br /><br />This resolves the issue I was having.<br /><br />--Mark</block=
quote>
Hi Mark, thanks for confirming the fix. The issue unfortunately wasn't foun=
d until just after the initial scarthgap release. If anyone is to blame it'=
s me, though I've updated my testing setup moving forward so this won't hap=
pen again when sending patches upstream (I forgot to test 'installing' the =
package into the minimal image so didn't get the proper error message).<br =
/><br />It's my understanding that this will only get merged into scarthgap=
 in the next release (5.0.1) which happens about 1 once a month. According =
to the Yocto Project status from yesterday, 5.0.1 is in QA.<br /><br />Best=
 regards,<br />Gudni

--X9R36InV2MB0d7BJ4jgr--

