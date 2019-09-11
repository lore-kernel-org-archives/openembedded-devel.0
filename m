Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 273C87E684
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 04:54:04 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id w22so12857698pfi.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 21:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BndrKhj90rjCXBtRiOJkKrFVzjE5jyeW4ZnLCp7Wke8=;
	b=g/P4pf+WQ3eA02/pe4Q8N9IH9yYcI1znd6/AQ11PoApKHBEEBwut/N1WMTP5fBI5Oq
	JTST+ntiab0OONpD+5hD4ce+iwuj8kbJDLtchWDwfDL/TSMg3cNbWGpBucgXbPBNScwq
	d/xlCDIFjC8PR3gyu7s4qZiJs6g1regPd9840Qni8eh6TJ14Khq8jqyqDu/8wLLoNnYz
	LflzCp86U8SR2PBKabw30kWtb4WXXeZYSQHksOI0lUr6n/AbZxfaeIpXr+UVzyKT9B/T
	PAB4ZCcpH3dbpd7CVRs1H/Y++9SjXbroOYQhdCqaD82hvJtSOAhHb+g6tBFR5jCqOne+
	mJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BndrKhj90rjCXBtRiOJkKrFVzjE5jyeW4ZnLCp7Wke8=;
	b=qE4L6WQdgDUbVXKYP92q9a6lB0Mkv/t1tcKGn//AzRZmr0C91/icbh4m9hDCz0I/RF
	bU/ZqfbMkiuKHhwCxqzcbyB3z+lXX+dz44cYsz96tSuqRIr0LOLqLQY1cdhh8yB3Crr7
	MqdEv9zbm3AFUzq8n4061M4ny1/333jbQUgZMG+SpZh74bSDTG+JP8Mh4++DrwOLKHPg
	BT2bLSMr5TL9E3egkBcDlTmARYLHUusYJQTbZkk5OmTHLL42tGyw8EidziBoZY1tTNta
	6DOQv0eVwOkmAca1D5j46i89rQpcM4LZLqN0vK7QI9+8d+rC9qrnxh/A2VSmymja2ppp
	Dw0g==
X-Gm-Message-State: APjAAAX6z/xIfHRftJudbuuKteoZjnn/cXvoIEFusN/pgIt+tz9KJGw9
	qYAPp8gqOyJzaLjt3HxcswVqIMgZYX8=
X-Google-Smtp-Source: APXvYqz/uqwcQhVH+M8Y+m751/a+r29sYwSXYM7jsmF0beFXI3NFBenkoHdVIO9FJXt003I6AJjaZw==
X-Received: by 2002:a65:6284:: with SMTP id f4mr10024808pgv.416.1568177644667; 
	Tue, 10 Sep 2019 21:54:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	i6sm36123311pfq.20.2019.09.10.21.54.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 21:54:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Sep 2019 21:53:47 -0700
Message-Id: <20190911045348.3308507-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911045348.3308507-1-raj.khem@gmail.com>
References: <20190911045348.3308507-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] android-tools: Recognise i686 for HOST_ARCH
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
X-List-Received-Date: Wed, 11 Sep 2019 04:54:04 -0000
Content-Transfer-Encoding: 8bit

qemux86 now uses i686

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 34b0b7a3b6..c0d08db174 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -102,7 +102,7 @@ do_compile() {
       powerpc|powerpc64)
         export android_arch=linux-ppc
       ;;
-      i586|x86_64)
+      i586|i686|x86_64)
         export android_arch=linux-x86
       ;;
     esac
-- 
2.23.0


