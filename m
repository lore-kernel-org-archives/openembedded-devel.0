Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670D0C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:12:21 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.85546.1677485535585100108
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Lx7CvUKe;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485533; i=@fujitsu.com;
	bh=fhtFKJnYOalLQ9YrmogR5Iu38A6yNn0qncIb91ILv/E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Lx7CvUKebi8mNI/nwBaBd3E93hJXHZv5C4RQ+3MVxgwhG07DCKZPCx37tDopYSpqR
	 EfIfBi2v6JpHhhvg0nGt3wGZMum2FGKP6jvANe/LZUzuVgcd3gTmPDP1zdbT0a4wsL
	 k0vvPD2hu+2eg7E37Rc/Rr0KDNeTOy5NUiuMdHPb1RnYjclt5j9xqGO8HF7MdwpC66
	 T04/AhCBEa3KiwOo3Gl+r9jQJsMjV7ycSAuhaF9urDcYOUx+cKFJ5V6OWebu3fyLSg
	 9TwXG5RNGdqwK5cPXbUsq7mkN11uqiZhBxgop+71zEtYs0YK64AH6ICfJ2nOn/3Dxw
	 UIW5lxwOEiY7g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORpHs39U+
  ywefvohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ahtd1MBfe5Km5NfMvSwPiZs4uRi0NI4CGj
  xM3f1xkhnCtMEhP2vGPqYuQEcvYySuw45AhiswlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  3sXIweHsECgxMubESBhFgFViSP/zrGC2LwCThIv14KUcHJICChITHn4nhkiLihxcuYTFogxEh
  IHX7xghqhRlJh9uZkFwq6UaP3wC8pWk7h6bhPzBEb+WUjaZyFpX8DItIrRrDi1qCy1SNdEL6k
  oMz2jJDcxM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMBRTihPSdjC2
  9v3VO8QoycGkJMq7yOlPshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3oNJQDnBotT01Iq0zBxgX
  MCkJTh4lER4mY2A0rzFBYm5xZnpEKlTjIpS4rx8iUAJAZBERmkeXBssFi8xykoJ8zIyMDAI8R
  SkFuVmlqDKv2IU52BUEuaNSgCawpOZVwI3/RXQYiagxdsf/gBZXJKIkJJqYOLR2xOk5bbtVEH
  3Th3jvbdU9mTNXMDV9HLZWp1pXasW8Ukd375FSaLrO/ss8buGq5Sqotev2KKxil/VoGuzrJmX
  dme7zJe+W7fifu/ZnF+wfdeKOPkExg/vcpfNW+Q043reM/kjgSsyazv1T15Rs3Dju/++2J27P
  +ZHtlb2wfyjym1XD7k2hZ6p3ep1vVVgybOCLQXJ7Q+3f2S8wzK19t+hBsFb73T8hXUfr9JOmx
  ybqLlbwYavoOSMoZfhtpKG6vjf2le2/+wwY/GUL7nU6Nsi5eTxftGbP84JdhMeiileb5kV5yn
  t/5u9u/JX30SnmVdyN+z15OBkesNrfvQPW+zazcq3Gh+//i9+advTZ0osxRmJhlrMRcWJANE5
  opRAAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1677485532!129477!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28054 invoked from network); 27 Feb 2023 08:12:13 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:12:13 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BB3CE1AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:12 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id AF1F17B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:12:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-forked: upgrade 1.4.0 -> 1.6.0
Date: Mon, 27 Feb 2023 16:11:59 +0800
Message-ID: <1677485523-11699-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101283

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Relaxed dependency requirements (#77).
 Dropped support for Python 3.6.
 Added official support for Python 3.11.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pytest-forked_1.4.0.bb => python3-pytest-forked_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-forked_1.4.0.bb => python3-pytest-forked_1.6.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb
index 2e6a32a24..f573bf052 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-forked"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
 
-SRC_URI[sha256sum] = "8b67587c8f98cbbadfdd804539ed5455b6ed03802203485dd2f53c1422d7440e"
+SRC_URI[sha256sum] = "4dafd46a9a600f65d822b8f605133ecf5b3e1941ebb3588e943b4e3eb71a5a3f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


