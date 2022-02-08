Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C690FC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 00:25:28 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.4898.1644279926781176748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 16:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=w+XG61ac;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644279924; i=@fujitsu.com;
	bh=Ht4Qh+Ox0YZq5JmQma6KTpNtzG6HH2Pi/x3mIZcVZZk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=w+XG61acVhs/BsmdlxVFK24WbCH9L5ADkGo5Fe/Kgx76WNc8xinsXsFVLuigjWjRN
	 yiNxOLzuEcMhq7rhDEbzTiIcCd49P9MH0WUVu+IiuY/bbj2ZzBTeikByovEi30GtXw
	 CQLEsrLbZi05GgJTyP3nSFAaaLcTu/6DnIBu3HsPCaHsL+4ov7KgkqmNseL+LB/FmA
	 R7NtcOqCdpB/bel+GB6hmudn24CPqDw1HZgfTF8h2G4iXwWqjeJECVl8ER/zDQUqJZ
	 nnBcLCQ/5iOjUjNFsgY354QHCyRecUk41x3+BEExpKgvqU3xKUR7SYJhNhevAvokPh
	 WgDhKZNmHcYWw==
Received: from [100.115.69.41] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 C8/50-04599-478B1026; Tue, 08 Feb 2022 00:25:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MxRbd4B2O
  Swbouc4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP/wlPGgkn8FcdOTWNuYJzL28XIxSEkMINJ
  4tnqVkYI5zijxKkL05m6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EFhZwlriy5
  wNYnAUofub2SkYQm1fAUeJF9z6wORICChJTHr5nhogLSpyc+YQFYo6ExMEXL5ghahQlZl9uZo
  GwKyRmzWpjmsDIOwtJyywkLQsYmVYx2iUVZaZnlOQmZuboGhoY6BoamuqaWeoaWprqJVbpJuq
  lluomp+aVFCUCpfUSy4v1UouL9Yorc5NzUvTyUks2MQKDLaXY9fAOxt19P/UOMUpyMCmJ8mam
  MyYJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuA9ux0oJ1iUmp5akZaZAwx8mLQEB4+SCK82SJq3u
  CAxtzgzHSJ1itGe483aJYuYOdru3QWSMxccXM3Mcb/90GpmIZa8/LxUKXFeU5A2AZC2jNI8uK
  GwSL3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZi3AWQKT2ZeCdzuV0BnMQGd9XXRv0Sgs0o
  SEVJSDUyTDyg/yVtc4FTLormM49ZsmX1/zzB/7jkn/PX+xOYfiS96v89vrbIok/x4TJ6n5O++
  jFzNE/GhKZOWGOnMj9owSyWwa+ZH02tFes/tj5xrNhZkDXtSf2a7lXjB9WeWV6L/b7U+2vDRY
  1No+Q7JEx1z1FxqWqSOl339s9X7piLjZ9H5U415Hl7kyl76zCPD+46Y0I9Ag5gCA9nbe0TqpD
  NaJrLuudy6sujfw6KMAxov7ypc2jwt4PqKHVzuszR2iIcZrTpyn11ZTeyxwfICkYuaMaEpGb/
  XP/cViDLoW3MuxGzat/wjep9/7bgjcOSS7eIvia/llu7SfnNq3WWHvD3iq88Klk7WbNp8kz3Z
  azGHEktxRqKhFnNRcSIANpCyq08DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-532.messagelabs.com!1644279923!17889!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9172 invoked from network); 8 Feb 2022 00:25:23 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-8.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 00:25:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2180PHpH021762
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Feb 2022 00:25:23 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 00:25:16 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] devilspie2: upgrade 0.43 -> 0.44
Date: Tue, 8 Feb 2022 08:25:05 +0800
Message-ID: <1644279908-4266-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 00:25:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95251

Changelog:
=========
* Default to Lua 5.3, and permit use of other versions
* Add support for setting and deleting window properties
* Add get_process_name(), which returns the name of the process
  owning the window (if possible)
* Add get_monitor_index() and get_monitor_geometry(); improve
  monitor index/geometry discovery
* Add get_window_is_decorated() (which uses the Motif window hints)
* Alias center() as centre()
* Extend centre() to allow centring on a given monitor and to allow
  horizontal or vertical only
* Extend set_window_position() to allow positioning on a given
  monitor and control which corner is measured from.
  (Behaviour with two parameters is unchanged.)
* Quote the option hyphens in the man page (preventing replacement)
* Various const & compiler warning (gcc -Wextra) fix-ups
* Support for UTF-8 strings in window properties
* Allow replacements for pkg-config at compile time

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../devilspie/{devilspie2_0.43.bb => devilspie2_0.44.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/devilspie/{devilspie2_0.43.bb => devilspie2_0.44.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
rename to meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
index 8372448432..8e048170bc 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
@@ -8,7 +8,7 @@ DEPENDS = "gtk+ glib-2.0 libwnck libxinerama lua virtual/libx11"
 
 PV .= "+git${SRCPV}"
 
-SRCREV = "a3ee65b815a0247a0dbdaa39353444cef6f93499"
+SRCREV = "b9d7ad9c09a5fb17a1562ee1d892798c646e9ec9"
 
 SRC_URI = "git://github.com/dsalt/devilspie2;branch=master;protocol=https \
     file://default.lua \
-- 
2.25.1


