Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D864CC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 08:59:33 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.65473.1680512371964874793
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 01:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kS0Fde7q;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512370; i=@fujitsu.com;
	bh=DktvrUgY2obIycwuVPlteSUzKaF7v2HpHWyS/M18eMY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kS0Fde7q82dhhUgWMAeyzWTUOeBgF5V3mn3kPnMgCmFspnSNgmtOhCcBJpapwfwaB
	 wiAiZu7tnm5oss8yb1tT9FoYKOKIWV3K1Z6jDYK5JBYBeqYWv0u/kKXgYvNRQLLsuP
	 JluhHMs4wyKcbVWQpeK4oKSnisFlL0hw5f6dfej9Vmeem5UTURm4X/AWRuCY6VW/Ra
	 5FApWMCvykushMSoQR+6rweWCkpuuO9uzc5mudB8jZtM5vJEv0Q4NZubvusPzNKOwM
	 XAU5sgapiJo2udQ+5oRS9NbO8kLG3cSAHZJsEY9uAAEGK8bX2NdUB9k4MKKJlleBwk
	 AW2fV9lL3XLvA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqFs4VSv
  FoL9FzuLi4aXMDowe5zauYAxgjGLNzEvKr0hgzXh9sJmpYLdwxZffl5kaGL8LdDFycggJPGGU
  uHYurIuRC8i+ziRxa9YaVghnN6PEl4f3mUGq2ASkJG7c/88GYosI6Essnb0HLM4soCLx4ncPO
  4gtLGAvseTpO7A4C1B89vY2sHpeASeJ7nsPwGokBBQkpjx8D1bDKeAsMbnnOTPEFU4SfV+fs0
  PUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCskGqcfYoKw1SSuntvEPIFRcBaS9llI2hcwMq1
  iNCtOLSpLLdI1NNJLKspMzyjJTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctL
  LdnECAzelGLmFzsYf/T91TvEKMnBpCTKK1ivlSLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvfgB
  KCcYFFqempFWmYOMJJg0hIcPEoivMG9QGne4oLE3OLMdIjUKUZdjqtXruxlFmLJy89LlRLn9Z
  sCVCQAUpRRmgc3AhbVlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ876aCDSFJzOvBG7TK6A
  jmICOaI3SADmiJBEhJdXAJL7a7tDlowKzrp312bKjynqRWlmLW1vtwauta2cnnyreunPOxLu9
  ZwxWq875tCLFbvWsF0ssGJQt5tyd8andPL6J8/yPJVP+Rs1ILfK+u2WtY//5v5cjT8euERO8E
  9Rekmvessb9pcj3DY/8kk9JmTcrnZk8baF6asBDle2di7Jr21/zsZpv0wq5uErh0bXkV+ccT+
  9+lP16/paIpWFrZeP0hP81u+RfSBFJU/rAO/1m7/r7loJOyyyz6mp3s2ce+1CpZ5s4801r+en
  Eh935bV3xrduDVjzfzPj+L/+yCKOMpb3fkh8FcuicaRPWlRfrkDHrEvHbtIyvOHuLtr/SgQ3d
  lyR1kl7nWL8W2Mp7VYmlOCPRUIu5qDgRAC7qdFVlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-585.messagelabs.com!1680512369!438635!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26017 invoked from network); 3 Apr 2023 08:59:29 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 08:59:29 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 121461001B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 09:59:29 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 04FCE10019A
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 09:59:29 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 09:59:27 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libbytesize: upgrade 2.7 -> 2.8
Date: Mon, 3 Apr 2023 16:58:42 +0800
Message-ID: <1680512323-30344-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680512323-30344-1-git-send-email-wangmy@fujitsu.com>
References: <1680512323-30344-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 08:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101895

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added translation using Weblate (Kazakh)
- Translated using Weblate (Kazakh)
- Added translation using Weblate (Georgian)
- Translated using Weblate (Georgian)
- Sync spec with downstream
- README: Remove the Travis CI badge
- Add a GitHub action for running csmock static analysis
- ci: Run rpmbuild tests in GitHub actions
- ci: Update the csmock GitHub actions configuration
- ci: Rename csmock.Dockerfile to ci.Dockerfile
- ci: Update Fedora versions for RPM build tests
- spec: Change license string to the SPDX format required by Fedora
- misc: Remove "warn: false" from Ansible "command"
- ci: Update chroots for RPM builds
- configure.ac: Remove invalid email address for bug reports
- ci: Add Packit configuration for RPM builds on pull requests
- ci: Remove GitHub action for RPM builds
- ci: Use Packit for daily builds in Copr
- spec: Bump release to 21 for Packit daily builds
- ci: Add Packit automation for downstream builds
- spec: Fix source archive URL
- Make use of error optional
- Replace C++ style comments with C style
- Various docstring fixes
- docs: Remove information about Python 2 support
- Remove unused test dependencies variables from Makefile
- Do not hardcode pylint executable name in Makefile
- ci: Do not use release descriptions for Packit builds
- Update translation files
- Translated using Weblate (Korean)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbytesize/{libbytesize_2.7.bb => libbytesize_2.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libbytesize/{libbytesize_2.7.bb => libbytesize_2.8.bb} (93%)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.7.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb
similarity index 93%
rename from meta-oe/recipes-support/libbytesize/libbytesize_2.7.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb
index c83ee926d..0afe8a6c0 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.7.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "0f47dde41f92f00b12160387659501edefd05b38"
+SRCREV = "12b8e6bff611eecb0343ee8a765151e7d9d3547b"
 SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master;protocol=https"
 
 inherit gettext autotools pkgconfig python3native
-- 
2.34.1


