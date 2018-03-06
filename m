Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id CACFC78A82
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 19:00:10 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b130so26101515qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 11:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dnmZcejazLPr7PWB9hNDCSme76qpREoNuxWnLGOZgCY=;
	b=VEJa3djhpJDfn1j7+w2V4vKC8jR0YPd2zPPvvLeZ0tNT+kkvwwGMpaLXsm1F2fLtk6
	biBsuE43L3QkU1f3I5UlWLegSm28Dj12y6V6bkpU3C1HRRvQs7K5ic7Z/hMzI+IKDhT7
	tkuACOvBogK73Opk1IG8/SAcj0e3UMi8BUuM/R69zk4ZCv8AWghI2x5OHL/rcGgN2Lzg
	ZiaKHGj+XBPBHFiDT3FzLOHeAPl9G6+AiZrt6IYPY3F0S0cRZD3ozDYWZmZTStMTX9Lc
	XZiToJgjeTVq1Y1mUAj3vT/AARwEoppcse6uQ9nCACkLZOIB8/ODyZR7f+IgCoZOu0yU
	3xMA==
X-Gm-Message-State: AElRT7GmMdiiEFuBw3DbvAg6SY2xSYErWUlHRWKqFJWi/q3TimckHzXJ
	/2e4t1gizZxB/iq5XYAagO2tUFRo
X-Google-Smtp-Source: AG47ELtmhteFNdyLwbRY6cnKTVBJwoVvQLkPynJkZ63JfnPoJR9c5SvgFZA2pm0cSuObBnit684JBA==
X-Received: by 10.55.141.67 with SMTP id p64mr27325621qkd.43.1520362811477;
	Tue, 06 Mar 2018 11:00:11 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	a73sm9983568qkb.14.2018.03.06.11.00.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 11:00:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 13:59:04 -0500
Message-Id: <1520362744-27047-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] mongodb: update to version 3.4.13
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
X-List-Received-Date: Tue, 06 Mar 2018 19:00:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index 8acbf07..723663f 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -7,8 +7,8 @@ DEPENDS = "openssl libpcre libpcap zlib python boost"
 
 inherit scons dos2unix siteinfo
 
-PV = "3.4.6+git${SRCPV}"
-SRCREV = "c55eb86ef46ee7aede3b1e2a5d184a7df4bfb5b5"
+PV = "3.4.13+git${SRCPV}"
+SRCREV = "fbdef2ccc53e0fcc9afb570063633d992b2aae42"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v3.4 \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-mongo-Add-using-std-string.patch \
-- 
2.7.4


