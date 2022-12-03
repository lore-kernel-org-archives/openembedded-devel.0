Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD827C352A1
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:20:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.101816.1670066427490967395
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Lm4Vqo1q;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066425; i=@fujitsu.com;
	bh=TUF3TX3iqWnAw5ryjPk25pF8+K/85yA5Y+9ugZJovyc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Lm4Vqo1qJVOnaJylJfG4eExzMb/5TQBtpO800myEyTro/d7c7ayZGVpDn9+UymQdV
	 4FdGVsRvK6j7GuOey+k1KYknICt5JiXqJUjcRRba/9MWXsqN/RQN/+AwNZkxdYFZoc
	 bdw+vd5mc+67XV8TzktrZsdj7tN2hGsz/dzxYKYxHIglTtUCrSxHbv7rASku+Iiv7b
	 QEpFWlNHVa2kdam4HSfCCa9fl99RXNpCZ+sHcsXX3WaZRvmqHme4q8gW6DTFljQgqb
	 Lxqq07Jdvd2bNsfciEXYb1VZXe/RSwXbM2b8HZh6kYwERhfgLOd3CNFNzoDaBCZPh9
	 ywRjqla8h/CPw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8MxSfeHQXe
  ywekbJhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bSdVoFWzkrDq8Sb2C8wNHFyMUhJPCEUeLK
  lfOsEM51JomF079BObsZJSZs2M3WxcjJwSYgJXHj/n8wW0RAX2Lp7D3MIDazgIrEi9897F2MH
  BzCAl4Su1cGg4RZgMKLtu1nBQnzCjhJ7JviCBKWEFCQmPLwPVgnp4CzRNfGxawgthBQyeSuuS
  wgNq+AoMTJmU9YIKZLSBx88YIZoldRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGs+LUorLUIl1DS72kosz0jJLcxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwU
  vbzUkk2MwLBNKWa7voNxxrI/eocYJTmYlER5j4V1JQvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  A3U704WEixKTU+tSMvMAcYQTFqCg0dJhLdLFSjNW1yQmFucmQ6ROsVoyTF19r/9zBzLweTMr2
  0HmIVY8vLzUqXEeZVA5gmANGSU5sGNg8X5JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGJ
  6QFN4MvNK4La+AjqICeigjfxdIAeVJCKkpBqYjGI5hOoszjhJdct/k/OcVPrU++iPU5lsc6ec
  3SXe0TKlnl0nXFrc7daNuH0rbreIB1upuC4WFGUVcbm6Uv3d8mC7+UylAvYnf4TZTC5SLk2N+
  sk/+aFL6iHR6gnb3l64+VrB2IjJ696cN9nCp76qb1p/8Frh3xlP5/xzP8sb/vOe/hueAkbDPU
  9mv74T48j81j5D5P2L+IUXhTu4nvbGvpTuiUr9tKcyRe2rxZqTLw6XrFilkcEe8zW64tWTXh6
  HoLx1fZ0nHNI7nLzXP7dTDrgv8f9/RB/PnF3e17sW35rh7lruxrTcffbj3Xx7rpUuYDr7bFoK
  W3yU14rl9aumqMz9cL9uSoOqmKznFmd5JZbijERDLeai4kQAO9nN6G4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-587.messagelabs.com!1670066424!249698!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22443 invoked from network); 3 Dec 2022 11:20:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:20:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7B57B1000D7
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:20:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6E9AE1000C1
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:20:24 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:20:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-path: upgrade 16.5.0 -> 16.6.0
Date: Sat, 3 Dec 2022 19:19:53 +0800
Message-ID: <1670066396-24989-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066396-24989-1-git-send-email-wangmy@fujitsu.com>
References: <1670066396-24989-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99937

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
mtime and .atime are now settable.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-path_16.5.0.bb => python3-path_16.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-path_16.5.0.bb => python3-path_16.6.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-path_16.5.0.bb b/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-path_16.5.0.bb
rename to meta-python/recipes-devtools/python/python3-path_16.6.0.bb
index 3dc5d7cde..41fe37461 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A module wrapper for os.path"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "2722e500b370bc00d5934d2207e26b17a09ee73eb0150f651d5a255d8be935a2"
+SRC_URI[sha256sum] = "bea3816e1d54f4e33aac78d2031a0b0ed2f95e69db85b45d51f17df97071da69"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


