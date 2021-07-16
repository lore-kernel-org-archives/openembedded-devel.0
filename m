Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web12.599.1626398012574094114
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 18:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MatGlhcF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626398010; i=@fujitsu.com;
	bh=+cgYDAWZc6rdKKsCsPoINRYvsN3Kfb3VYVOARBTLa8A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MatGlhcFcHP5k7A65sAKScxZEv55I+I+7S+y8blupXLGOolD+g0F0WdfOHusyfQKf
	 z5muBWPriKg7S/felzwPrLh98OD5LReYVguCMoH7B0PmR3/ncXAUDiCZy+z4ZWaooL
	 1pbQ3t4scBZ+Pjq4PEgZgG/BDEcuwR2x3OkO7havLkmI4nmEbFiyWXIYGXs1mXlnDW
	 fFa3xFBhGxI1vO0FiEHgx1RApkjF2xkvDttdzgdvUYGRzFi85ikfrjixKZf+7AdEME
	 JXVgKnlcPk404NKYOs+PXozuK5vlt7Ja+0ianUFBYbSuIyn9a7s/Q0PUH0yGZ873QP
	 safzebgduq3zg==
Received: from [100.113.6.189] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 9F/5A-07230-93DD0F06; Fri, 16 Jul 2021 01:13:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRomt590O
  Cwe0zehYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bRoyEFb9grLq77wtjA2M/excjFISSwjUmi
  u3EZC4RzklFi1rXrjF2MnBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DDmILC9hKHN+8A
  ayGRUBVYuGiTWC9vAJOEqeeHAaLSwgoSEx5+J4ZIi4ocXLmExaIORISB1+8YIaoUZSYfbkZKM
  4BZFdK3HicOoGRdxaSjllIOhYwMq1itEwqykzPKMlNzMzRNTQw0DU0NNY10zW0MNNLrNJN0ks
  t1U1OzSspSgTK6iWWF+sVV+Ym56To5aWWbGIEhldKIduuHYyfX3/QO8QoycGkJMq7/vKHBCG+
  pPyUyozE4oz4otKc1OJDjDIcHEoSvJK3gXKCRanpqRVpmTnAUIdJS3DwKInwRoGkeYsLEnOLM
  9MhUqcYFaXEea/dAkoIgCQySvPg2mDxdYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO9GkC
  k8mXklcNNfAS1mAlqsveYtyOKSRISUVAOT7tZjgU1WFl/StF72HeXZuPb8hM8lP9zXM0cF9i+
  7uVWlKEvI99qjlHmHll/89Ko5NVlda9bZbZPL3vxK2s8QItnMW+fB0jBJbUXNh6WT6/KOtex/
  yD1zs2LfqyoGvbxLHHV+6z5XnbUXt/500GHmAS17psXqd3ta5iz5HCryJyfsxFKziNmTeONPB
  1QaLujjDwzLnBsUpfCl44jpobTU7O15d5RbJ6w6ajtlmskiu//yrDuCDaIV+5PPHjZ0u73tzJ
  Kwmy67VDje1P+xPPCO96/OnTTB1SKu9yKvnd/F/eSs+yZX85ualQ/DvU1YJHT36fZZ3Wp9Evn
  K7aP0vFuvn9vfnJO51D7UYXuAgG2DEktxRqKhFnNRcSIA3fGvYSoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-248.messagelabs.com!1626398009!105377!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12757 invoked from network); 16 Jul 2021 01:13:29 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jul 2021 01:13:29 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16G1DT4u005789
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 02:13:29 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 16 Jul 2021 02:13:26 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] yelp: upgrade 40.2 -> 40.3
Date: Fri, 16 Jul 2021 09:13:15 +0800
Message-ID: <1626397995-27466-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/yelp/{yelp_40.2.bb => yelp_40.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp_40.2.bb => yelp_40.3.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_40.2.bb b/meta-gnome/recipes-gnome/yelp/yelp_40.3.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/yelp/yelp_40.2.bb
rename to meta-gnome/recipes-gnome/yelp/yelp_40.3.bb
index f62f8b1bd6..3ea497845e 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_40.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_40.3.bb
@@ -9,7 +9,7 @@ inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc features
 # for webkitgtk
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "8aaaaf753ef4d97526f6a5308f1faee4aa627c4451ec92698a12e528535b5a1c"
+SRC_URI[archive.sha256sum] = "a173847851f26189be78ecbb10015d539d8cceffc7c23e8635492bc3ada5ee23"
 
 DEPENDS += " \
     libxml2-native \
-- 
2.25.1

