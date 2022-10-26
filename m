Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC8EFA3741
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 11:51:43 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.6577.1666785095170144442
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Oct 2022 04:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=kUCAFr7G;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3YNoFmJJAhns2jKUYtrufmwUM54R0bR6wQ3z/fXX26c=; b=kUCAFr7Gp9RKAfiuSMmQ/qzSSp
	xiiQUgBN9hzDNSs20WSNWu/b9nSyWDe1pD8glB6SDNboIuypIN/F0ozgrdu2Gn9qyHi6dKODB42GX
	j+V/5ecLzBRe55sNlBsVPXqo7NdQ82TKUPG1SWANIkLT/MwXTWW1cxK3npwiMNSs/q2aK19pjKxyW
	5KpBHmu0FnZDN/yslL4tpHEhmz1CCmnuIiK95i3jz2XWeTUC7z3Bf1VJ/xqCfhn6FtDOd0Dwx8hXL
	Wqbk9QGc0V3zJSzX1eAFHNodkY3Dlp01ehqWFPTW+EsPceP0JrV+WxfvxO0Q5vseAvQgPM7bZ/1I4
	KZaODxlw==;
Received: from lan.nucleusys.com ([92.247.61.126]:60144 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1onexW-0002xU-Ka;
	Wed, 26 Oct 2022 14:51:34 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pythonping: Upgrade 1.1.3 -> 1.1.4
Date: Wed, 26 Oct 2022 14:51:22 +0300
Message-Id: <20221026115124.289505-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Oct 2022 11:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99311

Upgrade to release 1.1.4:

- count parameter can now go beyond 16-bit
- README.md is updated to describe how the module works in detail
- Linting issues have been fixed

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pythonping_1.1.3.bb => python3-pythonping_1.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pythonping_1.1.3.bb => python3-pythonping_1.1.4.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pythonping_1.1.3.bb b/meta-python/recipes-devtools/python/python3-pythonping_1.1.4.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pythonping_1.1.3.bb
rename to meta-python/recipes-devtools/python/python3-pythonping_1.1.4.bb
index 5e016fb92..62f5c0caa 100644
--- a/meta-python/recipes-devtools/python/python3-pythonping_1.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pythonping_1.1.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=12;endline=12;md5=2d33c00f47720c7e35e1fdb4b9fab027"
 
-SRC_URI[sha256sum] = "3555a03439eb48d5e0e8c201f7c334c1e13b997d744f93453d4d601c0fc8330f"
+SRC_URI[sha256sum] = "acef84640fee6f20b725f2a1d2392771f2845554cfabcef30b1fdea5030161af"
 
 inherit pypi setuptools3
 
-- 
2.30.2


