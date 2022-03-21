Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49EBC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 11:23:01 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.29137.1647861780320463915
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 04:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fhy0SNtj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647861778; i=@fujitsu.com;
	bh=2t6jBxTj0q8M5ygffGzyBBlOnjIua6CmdC3P2hIHJW4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fhy0SNtjwtA0KbUm5oy+KAom0ICK+48e9e7/oPGrEEI44sPI3FA3cxUzxAOOS6/J/
	 6G4WbSz2VFRrVtU4ai52HEnwcUN8NGWj/l0ariDUQq/g+cSZKzUmiqkw6HD/k3g4SA
	 v+RJXwAbOOOzvP5V0K5L8j6w8d/XCuFbrWYq/I02QJkK6s6eZQe7Txf2tlJ6LyLgH6
	 jlhJAdzdA9PoyWUkGLCqXzsIK1if4rzhlDQZUZxkChdRW8FR67KDesZFu7Une8pcK1
	 9RG5uvFEsCZ0WRCHZzgn0y9j6l6BgcHDep8R38AwWoUdOf0gXyJ+12KL4A5rXDmvFk
	 ZZlcQnItnPJwg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRWlGSWpSXmKPExsViZ8MxRVcwwSL
  JYOknfYuLh5cyW9ybv4DNgcnj3MYVjB4dv68zBjBFsWbmJeVXJLBmfO89xFKwmaNi2QaDBsYr
  7F2MXBxCAi8ZJfa+3MIM4exhlPiwdCtTFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzALyEss3/
  WHrYuTgEBZwlPg+IRwkzCKgKnF+5yJGEJtXwEnixaQF7CC2hICCxJSH75kh4oISJ2c+YYEYIy
  Fx8MULZogaRYnZl5tZIOwKiVmz2pgmMPLOQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hoa
  musa6FmZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBIZdSzBy2g/FP70+9
  Q4ySHExKorx1RhZJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4r8cA5QSLUtNTK9Iyc4DhD5OW4
  OBREuHdEwuU5i0uSMwtzkyHSJ1iVJQS5+WLA0oIgCQySvPg2mAxd4lRVkqYl5GBgUGIpyC1KD
  ezBFX+FaM4B6OSMG8zyBSezLwSuOmvgBYzAS3WZzUDWVySiJCSamDSamERd5D/5slgde9Y1nY
  Bn2lexT+cvjT/ClrxuvrvlQNP3qbwu7WKS/0ITjoqLSMSOX3hLhO75T6ygRviEiyjOk4837fx
  lIdUi0RxX/pRre2rpuqbVel+rtJm5+WS5OTb7fsofE7A69xtdybv5ah+M21R7o3JTXt+sffUv
  /M3s89bL3BRaabvjejFN9/++GqsUbWraraa1PJlVvxqQRtTZnzky1ixJtFprpY+79mQhMr9tY
  6zbnqo+ZpwG57cPt3++K3YjddbdzNzzwh7aLmv+3Zsb+Cl6JYGfVNH7w7d9uuW2/amXOgw9Np
  4Q+12QHzojWU6fTz30g/kFK859Ogc55G5mmvYDx6c4t1RJaPEUpyRaKjFXFScCACF0keyNAMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1647861777!217396!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28065 invoked from network); 21 Mar 2022 11:22:57 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Mar 2022 11:22:57 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22LBMqcI021465
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 21 Mar 2022 11:22:54 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 21 Mar 2022 11:22:50 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>
Subject: [oe] [meta-oe] [PATCH] libpeas: upgrade 1.30.0 -> 1.32.0
Date: Mon, 21 Mar 2022 19:22:40 +0800
Message-ID: <1647861760-30539-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 11:23:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96105

From: Upgrade Helper <uh@not.set>

---
 .../libpeas/{libpeas_1.30.0.bb => libpeas_1.32.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libpeas/{libpeas_1.30.0.bb => libpeas_1.32.0.bb} (88%)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.30.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.32.0.bb
similarity index 88%
rename from meta-oe/recipes-gnome/libpeas/libpeas_1.30.0.bb
rename to meta-oe/recipes-gnome/libpeas/libpeas_1.32.0.bb
index 0ef733ce99..944b21d1a9 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.30.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.32.0.bb
@@ -12,7 +12,7 @@ inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "0bf5562e9bfc0382a9dcb81f64340787542568762a3a367d9d90f6185898b9a3"
+SRC_URI[archive.sha256sum] = "d625520fa02e8977029b246ae439bc218968965f1e82d612208b713f1dcc3d0e"
 
 PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
 
-- 
2.25.1


