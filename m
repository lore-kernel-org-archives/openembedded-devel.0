Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E94AE73180
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 22:45:04 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b14so19404707wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eo6NqGeTOPp5oyoftKkO+I1cMmDk8/G+HZt7Aroegso=;
	b=jVOAjieZFa3FZxLyba2p/YwFvmeiNlZK9Hm/97OB8AhvbmVD8uvr52c/XWmu0MsQu4
	Uq/+411s/Eci+RRVl39Bl/yt6+H2/CNFJG9cCyGvx9OY1AqRP1SwN5yoWQxMZJZgwJGs
	RTNYf9oFfVKtdns65wBmvq0Vnjt1fyG+RgYxrlmVph9PYNQHgre4ECfu96TrxNDBdy70
	4zknJ9Crdr9jEr0N1hC6w5pmFWqQyJYyOhttHc+QQVhuKeycROAgUvrDqKQHTMuoVBVn
	7XkFsqvzdPYbfGUzRbAA+VsfJkhJJOdXXhAalu2XhODwM4jYSl9nh6Ig+Oy52D5FKXNb
	Si/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eo6NqGeTOPp5oyoftKkO+I1cMmDk8/G+HZt7Aroegso=;
	b=i50FhY8t5X5RDQeul/z+ZJieZYrISodz+AxWryBdYjcgDInjOccM50lO/WaKcEgVti
	4NWPsa6IlUk8G5hIv4YuJ3Y7ZNhfY2ogt7L5MxAC2oYCOOw0JgAa5HzlvlwLfujfvgp/
	ObAn9d+faZoNqjcY029mOq7T0wZ6BDStahsipfTsVFcvCA4Nn5YEwI/u3U4Ej56OZUMz
	jAZZVIrtX0TCDWciig1jk0chcqtzLKrVZ3RXqRDYL1KKBPB7+AdRcG8T6c0ETEKMv40q
	bfagr1ZZKkEcDOgwRRIMH+LBONYZoyDLy6QVj1/5ciDBWxS+ouX5WUsehNDT3UKZiFE4
	m7Gw==
X-Gm-Message-State: ALoCoQneoADvWHhTcaSWkUMpENwbWycWnt90DFSrssL3Kmkts5EpMFPcx8nn5DzEcPW+5rUiMElrgywV5Yc2BJgqBo03gs3r5A==
X-Received: by 10.194.104.5 with SMTP id ga5mr26999819wjb.155.1453157105174;
	Mon, 18 Jan 2016 14:45:05 -0800 (PST)
Received: from wsadrian.local (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	df10sm25734738wjb.44.2016.01.18.14.45.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jan 2016 14:45:04 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jan 2016 23:44:05 +0100
Message-Id: <1453157047-6614-2-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453157047-6614-1-git-send-email-adrian.freihofer@gmail.com>
References: <1453157047-6614-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH v4 1/3] networkmanager: 1.0.6 -> 1.0.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jan 2016 22:45:05 -0000

From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>

Upgrade networkmanager from 1.0.6 to 1.0.10.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../{networkmanager_1.0.6.bb => networkmanager_1.0.10.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.6.bb => networkmanager_1.0.10.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
index c2b00ed..81ce953 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
@@ -16,8 +16,8 @@ SRC_URI = " \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
     file://0002-add-pkg-config-for-libgcrypt.patch \
 "
-SRC_URI[md5sum] = "00f5f9ec69725a9f9b99366853c6f73e"
-SRC_URI[sha256sum] = "38ea002403e3b884ffa9aae25aea431d2a8420f81f4919761c83fb92648254bd"
+SRC_URI[md5sum] = "a8f54460a4708efd840358f32d0968fd"
+SRC_URI[sha256sum] = "1bcfce8441dfd9f432a100d06b54f3831a2275cccc3b74b1b4c09a011e179fbc"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.5.0


