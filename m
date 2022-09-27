Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07620C6FA86
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:08:33 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.8838.1664269705285925124
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sEEmlAa1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664269703; i=@fujitsu.com;
	bh=bpEk7wwblX8+/q0erMIcdsCwnAGmjqrOX1tdC4DgpoM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sEEmlAa1hkM+/U6jn63w9NW/AImddiZ8ZN0ib+x3nB9Mx5aaHjPwCkxhFDYi4WytV
	 4ahtJa5vAqbDORYjeNi2JME+4zY1i967BeRsvlQftBqEGKktQg0hRsj/sAklbnL/lL
	 +RlmO8md3c2BnrHASc7qgVLllzx6vEIFQY140JaOg53ZlnkHFEv8VIZkJmSoz6K/5j
	 6awgHuFZyZtN/Xkza4EFSfKEEWSRWO4pPtRVh6A+SL3KyWWR9IQco7RneMP1++Dq5Y
	 pDR43Svsiby5mM5F5aHW7GK4S6Z9bVmPFh3+wMMlz0ZcrVI7eE9JpsfjrPHx+Tt0Oh
	 m7V2ZjF2+7uhA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8OxWbdtr1G
  ywdcdFhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8anHyfZCzp4Kl4/aGdtYGzg7mLk4hASeMgo
  sW7pckYI5zKTRNevi0wQzh5GiZXHFwJlODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCVOLhuP1Ccg4NFQFXi/qNCkDCvgKPE5fvPwEokBBQkpjx8D9bKKeAk0bx8JROILQRUs/
  7xXEaIekGJkzOfsECMl5A4+OIFM0SvosTsy80sEHaFROP0Q0wQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjFZJRZnpGSW5iZk5uoYGBrqGhqa6ZrqGZpZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBQZxSzLZyB+PKvp96hxglOZiURHntFxklC/El5adUZiQWZ8QXleakFh9il
  OHgUJLgldwNlBMsSk1PrUjLzAFGFExagoNHSYR33RKgNG9xQWJucWY6ROoUoyXH1Nn/9jNzLA
  eTM7+2HWAWYsnLz0uVEuc13QLUIADSkFGaBzcOFvWXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinM
  wKgnzmu4BmsKTmVcCt/UV0EFMQAfZ8emDHFSSiJCSamCqMkgKVljsWzPvk9yJxdpvlqzfkZd8
  V/fv8jf8WsF5254nK8/IfXrPON+qYWlKo+I7j5gHE5hEnU5OSYhfo+cYmqnJlHJs1rp15lMZ1
  h9yef1I9Qhr7B8RCTO5e9pfLr7xY9l+L5Nj2UXF65G303mSRDxK7f5ZnOCf5z7RaybH5ueCNw
  uvcWa+VfV48eiyTEGxQCz/hs2p/CG+TCoep4LX/NjOut4xZ5PfvOfGzzJrdxyad9rlleLL4kW
  FRX+efvd69JSFg01wplHez8CSsEcbjohtvf5P8vmqT5++l5w3NeE7tHvet2XsSqtmBbB2NjG8
  KcpImxu05ELvhpDy+Sovio8G2voYRbAEbJwo6uypxFKckWioxVxUnAgAVzIjjnUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-585.messagelabs.com!1664269702!268517!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9834 invoked from network); 27 Sep 2022 09:08:22 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:08:22 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 84442142
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:08:22 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7794073
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:08:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:08:21 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 2.0.4 -> 2.1.0
Date: Tue, 27 Sep 2022 17:08:02 +0800
Message-ID: <1664269685-2594-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664269685-2594-1-git-send-email-wangmy@fujitsu.com>
References: <1664269685-2594-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:08:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98975

Changelog:
==========
  Add to_etree() to document API
  Improve generic encoding with wildcards
  Clean document API and schema decoding

License-Update: Copyright year updated to 2022.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xmlschema_2.0.4.bb => python3-xmlschema_2.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_2.0.4.bb => python3-xmlschema_2.1.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_2.0.4.bb b/meta-python/recipes-devtools/python/python3-xmlschema_2.1.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-xmlschema_2.0.4.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_2.1.0.bb
index abc7c8a5d7..d7988b8761 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_2.1.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "The xmlschema library is an implementation of XML Schema for Python (supports Python 3.6+)."
 HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0ab20f8e337bea2e6874f372edfd12c0"
 
-SRC_URI[sha256sum] = "00d34f97c761c191c20e822899c490930d2c4c9ea6cc7e98f25360fde498f1ab"
+SRC_URI[sha256sum] = "e7f70c305e0def2a2293ab7110827086c477ab3c6f8757d2acb3ccbfa6b425a4"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.25.1


