Return-Path: <p.chernikov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0676C10DCE
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 14:23:31 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web10.70533.1701699807472271404
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 06:23:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=fHOTkqpg;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=czzlxre3;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: p.chernikov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 10E71C000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1701699803; bh=qGF5UVOf4fpVikBHe7PUqJPRl5V7pie3ufFqidLccuE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=fHOTkqpgASjCXL0HImq8lsdYOTkBVRECLybtYzPQnphXtweaCWaulzAdVm+xTcAmG
	 EdpsPbE/SnuNfWeh7UI+GC8tY6SnjOhlO9n8PhhQ0k/dd1GbcXGWvnvm4vspUgRHMv
	 1VOcxfP4cg6gBrdgPTpmIZuO0fgQ/8gSPPwXIIk42hGhFyc5M7oJ27CV0PdFsqzIji
	 S5BvrEq68Vv57bxtGZsqzVNWNDqAqAdY5LqQCa+f6mV4jZ2hcDimBrRC0J89Rxubg5
	 iiJpV9GFDMq2/oYg0D/Absg1J/8w1EqFcpsYAHEFDlzaL1xKacfNujgBMiaN6+1P84
	 rQYv0+WcvMpIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1701699803; bh=qGF5UVOf4fpVikBHe7PUqJPRl5V7pie3ufFqidLccuE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=czzlxre35ifhh1uApDNCsdZqHeNpUKRcv8BGKEk0Clr3nBBGohdUxkItRGsywR0ho
	 GffpL2Ko9JBn8mjahM73sTK4mbUalwOjYjFJFuNqBEMmzUhor2z1RDWc9TX91mPUe6
	 YHR8TkXJGut6QjdISIBmgfgs9wvZlVNU4oxk3LGm6hGtLqUQkO6KD8QCl9PByXzSok
	 CNHV085j1Ewh3SVqkNiem+zjBXcCmf0/IBLX4YxYvxMOydo8P7V2NC9y6pr7MNs62U
	 mLO9acP52izReZfLL9LjXZihQwZqwxSGgxMkr1noUWpF2DIPzS6yM05AJeeyYshOqW
	 fdnjoU2eIiu3A==
From: Petr Chernikov <p.chernikov@yadro.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Petr Chernikov <p.chernikov@yadro.com>
Subject: [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from extra_oecmake
Date: Mon, 4 Dec 2023 17:18:56 +0300
Message-ID: <20231204141856.2977926-1-p.chernikov@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-10.corp.yadro.com (172.17.11.60) To
 T-EXCH-11.corp.yadro.com (172.17.11.242)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 14:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107204

Old versions of abseil-cpp could not be compiled using C++ Standard 17.
For now this cmake flag is not needed.

Signed-off-by: Petr Chernikov <p.chernikov@yadro.com>

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta=
-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index f847ebf15..4705b6f8c 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -26,7 +26,6 @@ inherit cmake
=20
 EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
                  -DBUILD_TESTING=3DOFF    \
-                 -DCMAKE_CXX_STANDARD=3D14 \
                  -DABSL_ENABLE_INSTALL=3DON \
                 "
=20

