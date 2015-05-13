Return-Path: <andrey.rusalin@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id D03CC7402C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 11:42:34 +0000 (UTC)
Received: by layy10 with SMTP id y10so27223370lay.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=vkQPwJbGSuPRSO1urs/pK1bBIu3kPhuh4Ij2lWzV8Rg=;
	b=dOD5vpe3aZHRop4Iz6TzW/gqNKrtGhI8rJEScqyVQeyjk8Uap7+ykFI22yJMnN4w9z
	Zye9D1l924rGJIqpiSt3n6SUb0jJcVsEdB8yu7BZx+e4h4mzjL/LdUedsz8vr70C6v+z
	rRWmkwfoqu3GsyBmsRmlYRlPxT5BUT6eYgUMtzH7XflmAIY4tBP2vbE4CTvZNwoxAqGw
	7PWsn3U5zPiIaq3YSFjMQrIom0WtQXrQGZuEOqEpfKMwsBUDSCevnRyTLAsbNou/Bqps
	KBxScW7bVNN5RMW/RNSqbwH0K3NNLZwx0kK3xcdmngsZ0RpMsKAJVJvvxAltfMJlWP3y
	uAyg==
X-Received: by 10.112.161.197 with SMTP id xu5mr15502073lbb.69.1431517354081; 
	Wed, 13 May 2015 04:42:34 -0700 (PDT)
Received: from [192.168.14.119] (mail.dev.rtsoft.ru. [213.79.90.226])
	by mx.google.com with ESMTPSA id f2sm4892691lah.39.2015.05.13.04.42.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 04:42:33 -0700 (PDT)
Message-ID: <555338B0.5060401@gmail.com>
Date: Wed, 13 May 2015 14:42:40 +0300
From: Andrey Rusalin <andrey.rusalin@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <55532B2B.8050209@dev.rtsoft.ru>
In-Reply-To: <55532B2B.8050209@dev.rtsoft.ru>
X-Forwarded-Message-Id: <55532B2B.8050209@dev.rtsoft.ru>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5][PATCH]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 May 2015 11:42:35 -0000
X-Groupsio-MsgNum: 55494
Content-Type: multipart/mixed; boundary="------------040900080100050506010509"

--------------040900080100050506010509
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit




-------- Forwarded Message --------
Subject: 	[meta-qt5][PATCH]
Date: 	Wed, 13 May 2015 13:44:59 +0300
From: 	arusalin <arusalin@dev.rtsoft.ru>
To: 	openembedded-devel@lists.openembedded.org



-- 
Best Regards,
Andrey Rusalin.





--------------040900080100050506010509
Content-Type: text/x-patch;
 name="0001-Fixed-dependency-for-sql-mysql-option-of-qtbase-pack.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Fixed-dependency-for-sql-mysql-option-of-qtbase-pack.pa";
 filename*1="tch"

From 7040c6382af3d99f53b3f9fa45336cb911438923 Mon Sep 17 00:00:00 2001
From: Andrey Rusalin <arusalin@dev.rtsoft.ru>
Date: Wed, 13 May 2015 14:25:42 +0400
Subject: [PATCH] Fixed dependency for sql-mysql option of qtbase package

---
 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 50cb505..d2654ef 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -84,7 +84,7 @@ PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
 PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
 PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
 PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
-PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql"
+PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql5"
 PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
 PACKAGECONFIG[sql-odbc] = "-sql-odbc,-no-sql-odbc"
 PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
-- 
1.9.1



--------------040900080100050506010509--
