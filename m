Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 18C187F994
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 16:58:56 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id q22so7676199pgk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 08:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KuzXSRF5PCaTYvf/grL3dv8QifqzhQwYjQV8vOGuIF8=;
	b=oypO+Yd82woz3OoWRnlr5jAEdQF7RSrlbH5FMLIxoWYs7cORTuwgdQTr20L4VNFZ4s
	dUGbnKFoUfi+hcwH/Z/ZYQTVE9WmZ1nr41F12qCCDaAzQJshRmWQFtDvH9fZVBM/3e9X
	8j7ZT63FjxCgGndbgbxzRQW53eCJsoM5mLZCsII3gxLenU48LhKLAK7fE0p3q4w660k2
	AXiop9pYF+Bl0OSktOUhtWCm0rsfOhpQOZzAGd2rnHsFVD8mPHxXTnvBJF7vz/yHQeEt
	4I5IFuEqd8i75jRGkl6jyRJXoRNiaatC8VraTmb1BiJcd0peygc36z9XIy5omejpG2vK
	bBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KuzXSRF5PCaTYvf/grL3dv8QifqzhQwYjQV8vOGuIF8=;
	b=lFAP7ozvgmq0rTzBVmU2HDKi/RuKTcmP/XWqXndu2GcTc0iu5S13n7tD19pQY76NyB
	+zfEjvrovPj2NiHcC8gfi9C7qhVlfPiyosmQeKz6vPd5fPXDDlxvcmkG3hdzWZfNiChm
	1qPRmIaeLnL6Fd8qaCXTt3SZudF5+sekfgSIBKnh2jxVFJB0X253vzXEG40iz7i6guvQ
	irYTCIHe+A+JnufVpU4n9tWz4v+ZvtMvHKdRAro1nd5PqSZvQb2bAanIPIX1zZiD7WSM
	nsTHddSX5WKTNyIohVYLcHKu7PdxPzYXvhZYWCYMM8JiwumKQrmRwL2Ih7et0qJ39bNw
	/qwg==
X-Gm-Message-State: APjAAAUYaoe1JtzfPhqw58qRPBoDQhtiSAn3BHWGGE9nbszrVMje4G8B
	OUwzoT+QIgOf1maL7JkbzWLcH7xkUbc=
X-Google-Smtp-Source: APXvYqwPBODouqE0SbmcuDZqsncDk6VkV1v9McMSKxdeUy3jB5TfwT0IfEYCh9aK6HAU7R/RrOeiXw==
X-Received: by 2002:a63:d011:: with SMTP id z17mr18580503pgf.119.1573405137196;
	Sun, 10 Nov 2019 08:58:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a99e])
	by smtp.gmail.com with ESMTPSA id
	q200sm13352139pfq.87.2019.11.10.08.58.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 10 Nov 2019 08:58:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Nov 2019 08:58:42 -0800
Message-Id: <20191110165842.4105728-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] cherokee: Update to latest
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
X-List-Received-Date: Sun, 10 Nov 2019 16:58:57 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/cherokee/cherokee_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
index 3f7eae4c16..69d64725e5 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "unzip-native libpcre openssl mysql5 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SRCREV = "75f041e2255e6dd0692db2f14611c2647dbe8425"
+SRCREV = "9a75e65b876bcc376cb6b379dca1f7ce4a055c59"
 PV = "1.2.104+git${SRCPV}"
 SRC_URI = "git://github.com/cherokee/webserver \
            file://cherokee.init \
-- 
2.24.0


