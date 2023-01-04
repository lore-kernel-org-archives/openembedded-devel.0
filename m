Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA12C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 10:00:40 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.8498.1672826435675471176
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 02:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=iiFhAoQh;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OSiJ1gk6zUtn4c2e1F3PNWrtIeT1AyhTKSYbXf/tziM=; b=iiFhAoQhm1ZfV2IDukSx45Pk5m
	iReSnSZvgTYONq40aMpe/hsFNuu7jE/VVEzsDLvA4x9PRtdsJRN6Gl95l+rVkat9R4BS/XDeT/55p
	G8VgErf5SfNKKMBrdV4mbzucwSc1rgppivpf63Q4zM1S80bSfCoIR6DBRhB4dZu+L7Z2FIoVsd8XH
	oLkxqlt7xmuklXu3V2sS2/U/QLs71P63lIbpfabCXF+Ys+6vwK5Q4dP3MVg0fmsjq1xLEqQ+2UJWg
	rDtRyqVIYHFjzrsFYlM0dKD6Dlvf5BPu50RzbnQYBpugeIg0EMj8Fcmhz4gnq0SVQ7nFnU12ry+YU
	FezUeMxA==;
Received: from lan.nucleusys.com ([92.247.61.126]:35460 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pD0aC-000Cd7-V2;
	Wed, 04 Jan 2023 12:00:33 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-simplejson: Upgrade 3.18.0 -> 3.18.1
Date: Wed,  4 Jan 2023 12:00:16 +0200
Message-Id: <20230104100016.268755-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104100016.268755-1-leon.anavi@konsulko.com>
References: <20230104100016.268755-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 10:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100396

Upgrade to release 3.18.1:

- Remove unnecessary `i` variable from encoder module namespace
- Declare support for Python 3.11 and add wheels

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-simplejson_3.18.0.bb => python3-simplejson_3.18.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.18.0.bb => python3-simplejson_3.18.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.18.0.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.18.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.18.0.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.18.1.bb
index ccdd4ddba..1aaa1eab0 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.18.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "58a429d2c2fa80834115b923ff689622de8f214cf0dc4afa9f59e824b444ab31"
+SRC_URI[sha256sum] = "746086e3ef6d74b53599df31b491d88a355abf2e31c837137dd90f8c4561cafa"
 
 inherit pypi setuptools3
 
-- 
2.30.2


