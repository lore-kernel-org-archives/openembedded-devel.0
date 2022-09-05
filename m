Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6033EECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 14:10:13 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.25277.1662386994255750584
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 07:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Y9vrHgDG;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5bkMKk5CzZvPOcDMIqDXD8RwULyCzix/dZyBgQJNjMA=; b=Y9vrHgDGdW7nQCvvZi6iQoaglw
	0vxPmiKJi9CpjHm4Nnl6Ic6Ro7lFgytVVgZsY3YibBTwTKfm1PSkYrp9F88Olof6B00abd7k1aT//
	S7z53x45tSHWU11GcMjKV9cuX2O7hKYhcpfWgoMakHFJrvp4FZo/gqYQw0hiwaekeFOKeKhR9tiOv
	0O+wL6/UrhZ3J+fdL678n0SyM5WZiD+uCxnm4hs19ykeseQxwM2dLtAw2uZG1RBiYa42lKPlDNP5g
	l3oHkNkublVaWfWtbYaHhfyx+2vIYc42o3e3lDsHAK9gRSh0yTMaLwQ5rz5Az/CZDR6RZYul3wS6J
	8amCtkWw==;
Received: from lan.nucleusys.com ([92.247.61.126]:51094 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oVCnd-0009xE-7y;
	Mon, 05 Sep 2022 17:09:53 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-imageio: Upgrade 2.21.1 -> 2.21.2
Date: Mon,  5 Sep 2022 17:09:43 +0300
Message-Id: <20220905140944.2017445-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Sep 2022 14:10:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98666

Upgrade to release 2.21.2:

- Allow v3.imread to read dicom
- Revert to asanyarray
- Add missing numpy import in example

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.21.1.bb => python3-imageio_2.21.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.21.1.bb => python3-imageio_2.21.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.21.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.21.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.21.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.21.2.bb
index 5c792a5db..06af2a15f 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.21.2.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "5f0278217c1cf99d90ef855dab948f93d9fce0ab7ab388e13a597c706b7ec4e5"
+SRC_URI[sha256sum] = "5702e7b4874bdb2f428b08c7491699b44842129d412cdaa7177ba7ff059deb2c"
 
 inherit pypi setuptools3
 
-- 
2.30.2


