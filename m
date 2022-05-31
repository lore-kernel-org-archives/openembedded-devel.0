Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A048BC433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 09:45:56 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.47372.1653990349728394854
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 02:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ousczpti;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653990347; i=@fujitsu.com;
	bh=t/RtNYeY5NxgaipNSlE1Vv9Y1q4DM+HNlw+JzPButTI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ousczptijwtkRb7KxZ5/wiKAofuKX4c6dY1W9rz4ZIAauvFPnMw0kh2XYxlfbD7Au
	 kmizaI8onkCtJWD1dTLbdM7OgDpMaj7vG0YH9Sr77vjbWJf7ifitnas8DdvTV1rHkz
	 nBZtGUUkuxcT4UV4RuTTCafPDurf74/ewGJylVRY+yPPeOEf/WyAW0mfuukpfStsCB
	 ozELWlL5QZs6xMf/a1TmWxAl8oCxEFJgWzjmMVBE8L68+ge1OlA9tKsffPARXb5eXS
	 ZIaKg6DGyyCXkDfsXwZhhpMJQoJ/UFgsKRo0gQCpNpxaejKKzHaLDPFcEqYnnN5VNL
	 n89EDvBkdyNVQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8OxWff046l
  JBl+fMVtcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBlP1r9kK/jAUdGz+wJbA2MbRxcjF4eQwENG
  ifNffrNAOGeZJKZfnskI4exhlPi9rR0ow8nBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICdRPe2j4wgNouAqsTid7PBangFnCSWPdsEZksIKEhMefgeKi4ocXLmExaIORISB1+8gK
  pRlJh9uZkFwq6QmDFjGxuErSZx9dwm5gmM/LOQtM9C0r6AkWkVo01SUWZ6RkluYmaOrqGBga6
  hoamupYWukbGxXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFlbnJOil5easkmRmBophQnvdzB
  eH7fL71DjJIcTEqivMGXpyYJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuBdAgx2IcGi1PTUirTMH
  GCcwKQlOHiURHjdHwKleYsLEnOLM9MhUqcYLTmmzv63n5ljOZic+bXtALMQS15+XqqUOO/ka0
  ANAiANGaV5cONgsXyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvL8hansy8Eritr4AOYgI
  66Nq3KSAHlSQipKQamAzY1vEsEvUVXfj1ufQTAZ4fz76fzWdKYfRJ2s5UVbs8MmTLsYyFfA03
  TqlfUvgov/+EffDq262sP4p6GISu7I0v/fbP2KDs9XsWh+tq+20+Kv/6+6h3if1Fvc7JzmxBi
  4PTtmu1vm1ikxc9oz5xiqHKCTHxynO/vn45xOPZJ/B5vnr06p/MfYd3ZErNYZPNnOXhvEmrb8
  m1yD0zH3hVlElUmqm5+EfudZi6Z+/vJ9d47y+Sz7xj/+lEvWMc24r3W8vFpNUMdU+48YbtVlz
  AGB358eJ61hKzZwdVrzJMWvJP/Vl85VfHY+FJtybPtKx2K7x1Irdrdmtkgp5f3N6D/nfZAzbM
  eWt7eNf37CnxCUosxRmJhlrMRcWJAJ2kW7BgAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-745.messagelabs.com!1653990346!221157!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8387 invoked from network); 31 May 2022 09:45:47 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 May 2022 09:45:47 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 6B64F89C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:45:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 447C380E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:45:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 31 May 2022 10:45:32 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gedit: upgrade 42.0 -> 42.1
Date: Tue, 31 May 2022 17:45:17 +0800
Message-ID: <1653990320-31470-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 09:45:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97343

Changelog:
Translation updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gedit/{gedit_42.0.bb => gedit_42.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_42.0.bb => gedit_42.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
index 5bb5525d5..e2bbf1889 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
@@ -21,7 +21,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc val
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "a87991f42961eb4f6abcdbaabb784760c23aeaeefae6363d3e21a61e9c458437"
+SRC_URI[archive.sha256sum] = "7f1fd43df5110d4c37de6541993f41f0fbc3efc790900e92053479ba069920e9"
 
 # gobject-introspection is mandatory and cannot be configured
 # x11 is needed for tepl and gtksourceview4
-- 
2.25.1


