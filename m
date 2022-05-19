Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8410C433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 06:03:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.4341.1652940226547847762
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 23:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LD08TEL9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652940224; i=@fujitsu.com;
	bh=zO8c0PsJGkfgU11B6joTDzPFE6+1VeokpSOVhWw1Uv4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LD08TEL9RjLMd5n24akznYHZIZwmzt64NNZQqpc6+gfJFwsx4xU21QM9Ykix1GSMb
	 j4yvEyE/EWKFhXu4YCKtUHciEALpiJYEgGcDVsk0PZYzca81TPPmT8NjVRHirlOSWx
	 K5Yx0GDIOJApsSNnphnjNuo8f/wlDviX3sE0GcgL6enBBHHL6CkYBVB2rq9WVOAGS9
	 Ilw7fyX+Kq3tiYkvZC8OxxMQHE3xtm6z2INBA8uZ8ql3ZfmKl3W5adE7HTvA6kZGKh
	 TPm/ty4fOVQDTzNzKrZpP6M3hn/Cb/M2ySEEYzG2JrKD4Ri8AfSyOIXdutzExy3u+a
	 OUsM0jRSE6+JQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORqHvgbmu
  SQf9SEYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPl2RTmgh7RihWzPrM3MP4U7GLk5BASeMIo
  8fmScBcjF5B9gUli8+R/7BDOSUaJCROa2EGq2ATUJR7ffM0IYosI6Essnb2HGcRmFlCV6L64B
  qxGWMBTonfVUbAaFqD45Z4/rCA2r4CbxIW/F5hAbAkBBYkpD9+D9XIKuEss3fGbEeIKN4n7V5
  +zQdQLSpyc+YQFYr6ExMEXL5ghepUkTqz4CDWnQuL14UtQcTWJq+c2MU9gFJyFpH0WkvYFjEy
  rGC2TijLTM0pyEzNzdA0NDHQNDU11DXVNLfUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQJDOKWY0XoHY0ffT71DjJIcTEqivO5HWpOE+JLyUyozEosz4otKc1KLDzHKcHAoS
  fB+vgGUEyxKTU+tSMvMAcYTTFqCg0dJhLdlF1Cat7ggMbc4Mx0idYpRl+Pvp797mYVY8vLzUq
  XEeRPuABUJgBRllObBjYDF9iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrypIFN4MvNK4Da
  9AjqCCeiIW8pgR5QkIqSkGpgWGcg8Pa4rXWhheu4n605e3i4J/QcaCjM2FEzelP/i93GZz/km
  8t/PHFwov9xoUmlqL5PqKgfL9dKPhWXfvUndPTf5cPmvS4X+3zeYhwUpa53sWaR6Szl9Wu36q
  o1/yiYo7A824uJ+0vs+zfnjK+v1BzL1FKtc/kWtfDpvUw2TeWKfcYWh6/0tb6/MDBConuEQ6c
  7oL8jNYLF09yu7vo5O4/hLp/c2eb+X9VqoxXBx/hrhmMr50/b0SAX2mp1a6bJnr3jL1N3dF0T
  dHkw6W/oknoPTo5zBjuvE955QzoqDXqwHk/YKxFsw3r92uDI/44cU5xaWyS6OL3V2rxQs5hUL
  mP5X7uf+7rqTh3ikgpRYijMSDbWYi4oTAcunnX5oAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1652940224!20626!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18608 invoked from network); 19 May 2022 06:03:44 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 May 2022 06:03:44 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CE4D610019B
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C0694100191
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:43 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 19 May 2022 07:03:26 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.2.2 -> 4.3.1
Date: Thu, 19 May 2022 14:03:05 +0800
Message-ID: <1652940188-8005-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1652940188-8005-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1652940188-8005-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 06:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97177

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
changes:
--------
    Fix asyncio Search crash
    Replace OSError exceptions from can_read with redis.ConnectionError
    Updated FUNCTION LOAD changes (from release 7.0 rc3 to support redis 7.0 final)

New Features
--------------
    Get command keys for subcommands
    Add support for CLUSTER SHARDS
    Add support for COMMAND LIST
    Add Async RedisCluster
    ACL SETUSER - add selectors and key based permissions
    Support for redis 7 streams features
    Async Connection: Allow PubSub.run() without previous subscribe()
    Implemented LATENCY HISTOGRAM by always throwing NotImplementedError
    Add async supoort for SEARCH commands
    Retry(): Support negative retries value
    Add support for MODULE LOADEX
    INFO - add support for taking multiple section arguments
    CONFIG SET - add the ability to set multiple parameters in one call
    CONFIG GET - add the ability to pass multiple pattern parameters in one call
    Add support for COMMAND GETKEYSANDFLAGS
    Support CASESENSITIVE for TAG fields

Bug Fixes
---------
    Rename 'update_supported_erros' to 'update_supported_errors' in Retry module
    Fix execute_command() determining nodes error when no key command
    Fix incorrect return statement in aut

Maintenance
------------
    Add unittest for PubSub.connect()
    Fix incorrect return annotation in asyncio.lock
    Minor cleanups in commands/cluster.py
    Update xtrim type annotation
    Async tests for redis commands, json, bloom, timeseries
    Fixed typing in getex command

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-redis_4.2.2.bb => python3-redis_4.3.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.2.2.bb => python3-redis_4.3.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.2.2.bb b/meta-python/recipes-devtools/python/python3-redis_4.3.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-redis_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.3.1.bb
index 1e70cf484..c0d9c0064 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.3.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
 
-SRC_URI[sha256sum] = "0107dc8e98a4f1d1d4aa00100e044287f77121a1e6d2085545c4b7fa94a7a27f"
+SRC_URI[sha256sum] = "94b617b4cd296e94991146f66fc5559756fbefe9493604f0312e4d3298ac63e9"
 
 inherit pypi setuptools3
 
-- 
2.25.1


