Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B651BC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:15:34 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.6995.1651130128793627877
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=slvRsILP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651130127; i=@fujitsu.com;
	bh=QgJ4AQmKHpN5+5Fgev9ogo6H5XK03yjDTeNcWwyCX4Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=slvRsILPjbV+iaFTH59iTSvhBJzIFW541v8p4kAMocMBImgzZyDqGAslaMY+Bz5rd
	 btghIzrat7zy1wzyths/efr/3fX5BFXQLISEIxK80N446Q35PnB8KR4g4bRvs7emXn
	 TukH8nOZBrqENyL8Stl6h/ylmPWCEcHJ9qQIbemWlaFGJ0RS7RHzZtK+vY4p/vLYev
	 lyZo9KCN+mr+fsTAUKcnMcqjyNop3HumZVruXPuDjxisd6F62bU/Qvl02evo26M+KH
	 R+Rry66VtsG89KkPef2yQKs2oHiLdvqxzfv+3gFvTHf+PK5ot1RFmg21hRoxrF0Zu2
	 hmzlo6OhLmKNQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxSZfPPiv
  JYMc0I4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePpvY8sBW+5K97MmsLUwHibq4uRi0NI4Amj
  xIy5q9ggnAtMEgvaHzN1MXICOQcYJd7etwGx2QR0JV78WMwCYosI6Essnb2HGcQWFvCT+Lp8H
  SOIzSKgKrFoxxqwXl4BD4nn97aC1UsIKEhMefieGSIuKHFy5hOwOLOAhMTBFy+A4hxANYoSs6
  fLQ5RXSLw+fIkZwlaTuHpuE/MERr5ZSLpnIelewMi0itEqqSgzPaMkNzEzR9fQwEDX0NBU11D
  XyNBcL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMPRSihlv7mBs7fupd4hR
  koNJSZTXyjQrSYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr5MdUE6wKDU9tSItMwcYBzBpCQ4eJ
  RFeGWOgNG9xQWJucWY6ROoUoy7H3YV79zILseTl56VKifPeswUqEgApyijNgxsBi8lLjLJSwr
  yMDAwMQjwFqUW5mSWo8q8YxTkYlYR5W0Au4cnMK4Hb9AroCCagI1YWZYIcUZKIkJJqYFKQFJ0
  y3S8tIYP/hMddS8kcsbSPge3NH/vcOs/VTUownK1+i319kMjp4AkrTHv5djwpiFz59XrQli/n
  D+5Ov5JjWvxjxaX51zZ9POffKtf8m++Cfr3urAeWj3f+KFySvcjQeZ6uoHRT+pHfPJlFj1Zf1
  xXY1h//7JrOtRUBbGUZ93MfXZJJz9SScO2yfXTDKGC5WG2a+utYc63UrSXH2RcfP8kqVTl/Da
  uWoueHd84SSr8Uf7JnF1VOuHZXuov98raIyASzw0sDje+eqxfN+lNwffcahlJP33PTdwRHJdU
  8/rrkbLTjBQbz+4dO1//k/ZHAVeW+Imqv/noPRfXT02wf5x6QCDQxbNpo3252VomlOCPRUIu5
  qDgRAJ9gm6ZEAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1651130126!7887!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22886 invoked from network); 28 Apr 2022 07:15:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:15:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5A03110044A
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:15:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4CEDC1000FD
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:15:26 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:15:20 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 3.20.0 -> 3.20.1
Date: Thu, 21 Apr 2022 18:00:26 +0800
Message-ID: <1650535226-15491-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:15:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96836

Changelog:
=========
PHP
-------
    Fix building packaged PHP extension (#9727)
    Fixed composer.json to only advertise compatibility with PHP 7.0+. (#9819)

Ruby
----------
    Disable the aarch64 build on macOS until it can be fixed. (#9816)

Other
-------
    Fix versioning issues in 3.20.0


Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-protobuf_3.20.0.bb => python3-protobuf_3.20.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.20.0.bb => python3-protobuf_3.20.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.20.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.20.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.20.0.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.20.1.bb
index 5c4de4ac2b..976d2aa9b4 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.20.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "71b2c3d1cd26ed1ec7c8196834143258b2ad7f444efff26fdc366c6f5e752702"
+SRC_URI[sha256sum] = "adc31566d027f45efe3f44eeb5b1f329da43891634d61c75a5944e9be6dd42c9"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


