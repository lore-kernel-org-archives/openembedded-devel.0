Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 436E47CE5E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 05:26:43 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id i130so10330811pgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Mar 2019 21:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5N+rlsLW+3MbuEYTIazWwzpYnbypsiEqVMS+PjFKQRU=;
	b=o4JR8KLiSGUInTSdSuQolQXzcDSDbS8X2UZ7mm5RJa3gy2iTpN5KonrKVEUpPzZ3Ec
	UkAg+ovWXTIb3/QrDbx4D46bF2TO0ogFqOHXlaCRRcLux2W7TdoGzSpLbM1h5xG59BES
	jmZIo0O2MgSeO3NFeVTnwdMwmz674DnsZvxRWbbmcm7B0sUdIU9Ad/0Ty4lThS3I5j3H
	cbMIjZMjvDhcRGbGqxjj6Zkr2bs/BcU1B4Gj/AKr4y+kAK8EIl8KYh4Rc45Hy8ZFYMcK
	XvF452ZthPzgCHV00z6Gn5xsjLoFrT0hKJelb3QbbQOQl+R9ecssRcVhkYLUE5DO+yd8
	nuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5N+rlsLW+3MbuEYTIazWwzpYnbypsiEqVMS+PjFKQRU=;
	b=Q2AOTlaZe5HPeDDHOjUQKttD6gZmNrZJ59avnw8Th0j0W2Owf8fKbxjj2nc+bf2pDB
	c0TIzM+jFpxjzyB92pRUkcclewSmlM8cWLu3pnXnXr1tQuNPXzkkEUDu2TfwgCVJNKeA
	hbOUP1lzMR4Yt8LbTdGBVU7P6da09bLdjvx0tVKI/qRsqAZVCWCu+/5efj3TliJP18WO
	KMRfF5lcJzSzBNhyhSLSpFRqnTgjWBVSXeXjzFJeIC4+fhOAIoItnbJUpI88ZWYYVtSS
	2t1uLfOxjVxoBuzoXNqgSWQTD1YVRmLFIz4vCImE5Dn6NuroJNjJkvKZ9Qt5QGZzcMfT
	smNQ==
X-Gm-Message-State: APjAAAWD5FCsUAsn3XV/MJ9kG1vAyVrlKrWSQyHSWvkbCzmK6u2+0LvV
	5RG74w+a0POtcS+blP9g2mX7fRbN
X-Google-Smtp-Source: APXvYqyaSpx1m2YkF7FSGYZxJhDbe7V+Nv3L7yHK3MIj+sR7AX6LMODtMk4FLWGn3IGcPPpJQKsAew==
X-Received: by 2002:a17:902:846:: with SMTP id
	64mr10843925plk.266.1551936403844; 
	Wed, 06 Mar 2019 21:26:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id
	11sm4617531pfh.131.2019.03.06.21.26.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 21:26:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Mar 2019 21:26:27 -0800
Message-Id: <20190307052628.38454-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] php_7.3.2.bb: Switch to mysqlnd
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
X-List-Received-Date: Thu, 07 Mar 2019 05:26:43 -0000
Content-Transfer-Encoding: 8bit

With mariadb 10.x it fails to find headers in right location during
builds

https://bugs.php.net/bug.php?id=75612

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/php/php_7.3.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_7.3.2.bb b/meta-oe/recipes-devtools/php/php_7.3.2.bb
index db04ce3756..634facd4a0 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.2.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.2.bb
@@ -16,8 +16,8 @@ SRC_URI_append_class-target = " \
 SRC_URI[md5sum] = "c893ff828945c274d90e026528142439"
 SRC_URI[sha256sum] = "946f50dacbd2f61e643bb737021cbe8b1816e780ee7ad3e0cd999a1892ab0add"
 
-PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
-                        --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
+PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
+                        --with-pdo-mysql=mysqlnd \
                         ,--without-mysqli --without-pdo-mysql \
                         ,mysql5"
 PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
-- 
2.21.0


