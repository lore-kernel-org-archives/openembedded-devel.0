Return-Path: <ashwin.naik@sasken.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5698FC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 13:05:05 +0000 (UTC)
Subject: [master][PATCH] SRC_URI master branch is deprecated and main is the new master branch
To: openembedded-devel@lists.openembedded.org
From: ashwin.naik@sasken.com
X-Originating-Location: US (136.226.254.122)
X-Originating-Platform: Linux Chrome 119
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 10 Nov 2023 05:04:59 -0800
Message-ID: <9B6z.1699621499757734697.wXhd@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="zQXq3NLRNpRbvbdN75lH"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 13:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106546

--zQXq3NLRNpRbvbdN75lH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From 23c3517e62158e390617686abd1a5525d27fa223 Mon Sep 17 00:00:00 2001
From: "ashwin.naik" <ashwin.naik@sasken.com>
Date: Fri, 3 Nov 2023 15:24:24 +0530
Subject: [PATCH] SRC_URI master branch is deprecated and main is the new
master branch

Below failure log is observed while using master branch to fetch.

ERROR: googletest-1.10.0-r0 do_fetch: Fetcher failure:
Unable to find revision 703bd9caab50b139428cea1aaff9974ebee5742e
in branch master even from upstream
ERROR: googletest-1.10.0-r0 do_fetch: Bitbake Fetcher Error:
FetchError('Unable to fetch URL from any source.',
'git://github.com/google/googletest.git;branch=3Dmaster;protocol=3Dhttps')

Signed-off-by: ashwin.naik <ashwin.naik@sasken.com>
---
meta-oe/recipes-test/googletest/googletest_git.bb | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-oe/re=
cipes-test/googletest/googletest_git.bb
index 898f23faf..35fe1bed0 100644
--- a/meta-oe/recipes-test/googletest/googletest_git.bb
+++ b/meta-oe/recipes-test/googletest/googletest_git.bb
@@ -11,7 +11,7 @@ PROVIDES +=3D "gmock gtest"

S =3D "${WORKDIR}/git"
SRCREV =3D "703bd9caab50b139428cea1aaff9974ebee5742e"
-SRC_URI =3D "git://github.com/google/googletest.git;branch=3Dmaster;protoc=
ol=3Dhttps"
+SRC_URI =3D "git://github.com/google/googletest.git;branch=3Dmain;protocol=
=3Dhttps"

inherit cmake

--
2.25.1

--zQXq3NLRNpRbvbdN75lH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>From 23c3517e62158e390617686abd1a5525d27fa223 Mon Sep 17 00:00:00 2001=
</div>
<div>From: "ashwin.naik" &lt;ashwin.naik@sasken.com&gt;</div>
<div>Date: Fri, 3 Nov 2023 15:24:24 +0530</div>
<div>Subject: [PATCH] SRC_URI master branch is deprecated and main is the n=
ew</div>
<div>&nbsp;master branch</div>
<div>&nbsp;</div>
<div>Below failure log is observed while using master branch to fetch.</div=
>
<div>&nbsp;</div>
<div>ERROR: googletest-1.10.0-r0 do_fetch: Fetcher failure:</div>
<div>Unable to find revision 703bd9caab50b139428cea1aaff9974ebee5742e</div>
<div>in branch master even from upstream</div>
<div>ERROR: googletest-1.10.0-r0 do_fetch: Bitbake Fetcher Error:</div>
<div>FetchError('Unable to fetch URL from any source.',</div>
<div>'git://github.com/google/googletest.git;branch=3Dmaster;protocol=3Dhtt=
ps')</div>
<div>&nbsp;</div>
<div>Signed-off-by: ashwin.naik &lt;ashwin.naik@sasken.com&gt;</div>
<div>---</div>
<div>&nbsp;meta-oe/recipes-test/googletest/googletest_git.bb | 2 +-</div>
<div>&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)</div>
<div>&nbsp;</div>
<div>diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-=
oe/recipes-test/googletest/googletest_git.bb</div>
<div>index 898f23faf..35fe1bed0 100644</div>
<div>--- a/meta-oe/recipes-test/googletest/googletest_git.bb</div>
<div>+++ b/meta-oe/recipes-test/googletest/googletest_git.bb</div>
<div>@@ -11,7 +11,7 @@ PROVIDES +=3D "gmock gtest"</div>
<div>&nbsp;</div>
<div>&nbsp;S =3D "${WORKDIR}/git"</div>
<div>&nbsp;SRCREV =3D "703bd9caab50b139428cea1aaff9974ebee5742e"</div>
<div>-SRC_URI =3D "git://github.com/google/googletest.git;branch=3Dmaster;p=
rotocol=3Dhttps"</div>
<div>+SRC_URI =3D "git://github.com/google/googletest.git;branch=3Dmain;pro=
tocol=3Dhttps"</div>
<div>&nbsp;</div>
<div>&nbsp;inherit cmake</div>
<div>&nbsp;</div>
<div>--&nbsp;</div>
<div>2.25.1</div>
<div>&nbsp;</div>

--zQXq3NLRNpRbvbdN75lH--

