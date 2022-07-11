Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A8FCCA47B
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:45:19 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.26143.1657529108730967953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IlcMhBNQ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657529106; i=@fujitsu.com;
	bh=pqjcdzs+lRRcaO+npcgkFLNNjjzmLXvPZ5ibGS9Ij5s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IlcMhBNQQ8Bt1CzigjALGpZ34vOuRCLZ3TZqv/fqL8PCkiv8YzJ3WTv23lQwx354P
	 IBqs0RnWIgKMTQwx158kbbCGk5buvtrsCiNN0A2Z9Vy03WPrf4C3W7WL6Wiai3gbg1
	 KLdkHfnsFpw7xRdC5tq1HQwy6m1QiSRv7wNmd3Lz3mXtdNbO5epzqVBhdeBscSmab3
	 Oyve7n+LZ9TJXRRJFkiQ+2n/ee5DFZQ1em/nf+DxyXy7H9vJAX4Mo9IRzheluK5GDo
	 X3myKBcZKSEjKGguezS3rjdsUfZsVWWcMAdLcrUm+ckzglg4PccIDvTw4ChZvERByT
	 UBseYVpHIZwSw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORpCv0+HS
  SwasXHBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8apvmdMBS85KnrerGZsYPzL3sXIySEk8JBR
  YuLbzC5GLiD7MpPEn62L2SGcPYwSF87+ZQGpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  qAGDg5hAXuJ10sSQcIsAqoS71dfAlvAK+AkcezkN7ByCQEFiSkP3zNDxAUlTs58wgIxRkLi4I
  sXUDWKErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIGRfxaS9llI2hcwMq1itEkqykzPKMlNzMzRNTQ
  w0DU0NNW1NNM1NDbUS6zSTdRLLdXNyy8qydAF8suL9VKLi/WKK3OTc1L08lJLNjECwzKlOKF5
  B+O9fb/0DjFKcjApifIKnzydJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV+YhUE6wKDU9tSItM
  wcYIzBpCQ4eJRHeqyeA0rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0uVEuc9AzJDAKQoozQPbg
  QsXi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuYNeQQ0hSczrwRu0yugI5iAjohLOQFyREk
  iQkqqgam58uDp3XNX3vQI4ne78HXxXOWGpzJBK68qnjggbfaFjzltu87pu3M+PbDcxpa79nHn
  JB73g1rvV580nO0jWl/gVpuvnLRZUij+2tXf809q2GsdORLs9K/20K3mA69uHt+fkt6QnWU++
  ape2dvfR57dL93h9Dv/yjrjDJ47Jmvmi11lzg+tyv34XOXZ9+i9+Yc28K7keTzZ98cR2XnLFg
  cyJhbstTqrmJcVZN6odLSj8PJPj2/VcV7svSE/fuqxh+7RMZt6UX+6if7j6wvuPHg+/f7cpQH
  81+r+8JbpiXo7uTK+OLOhYFHaRGkfS7UZbVtLZVd7s1mtFOa8K1gjFVT59saaZZtWNLDH+d0+
  9q1SiaU4I9FQi7moOBEAfjL0zlIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-728.messagelabs.com!1657529105!7430!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14425 invoked from network); 11 Jul 2022 08:45:06 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Jul 2022 08:45:06 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 902CA1AC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:45:05 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 84C6C7C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:45:05 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Jul 2022 09:45:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] evince: upgrade 42.2 -> 42.3
Date: Mon, 11 Jul 2022 16:44:40 +0800
Message-ID: <1657529083-24142-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Jul 2022 08:45:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97802

Changelog:
==========
shell:
  * Disconnect signal handler to prevent invalid read

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/evince/{evince_42.2.bb => evince_42.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_42.2.bb => evince_42.3.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_42.2.bb b/meta-gnome/recipes-gnome/evince/evince_42.3.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/evince/evince_42.2.bb
rename to meta-gnome/recipes-gnome/evince/evince_42.3.bb
index b84674fa9..0c97f75e9 100644
--- a/meta-gnome/recipes-gnome/evince/evince_42.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_42.3.bb
@@ -24,7 +24,7 @@ inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection g
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "ff7f81f308cf8d4956ed97fb724a7e49448c214beeab998812ef9efbb38df8ae"
+SRC_URI[archive.sha256sum] = "49aecf845c946c96db17ba89d75c8002c5ae8963f504a9b0626d12675914645e"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.25.1


