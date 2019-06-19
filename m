Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id E4FFA6D50C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 04:24:00 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id r1so8928514pfq.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 21:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=C2ZevHa8Avb24lq+q9pFsmfbhWDiNhJfQXzS1nbhWDA=;
	b=h0ZSX9A3cMX7xLvGBhMr9+9eBwsvYf5gTVB8D9efJYZW+/j47zJi7lsmdCVJFi6FSQ
	Dge+sji8lgoCxPWaFcMFmu/UZ1695hX5rN79M6vfVEJe1ZR2KkdY3NPiOkLYQAVNrW5M
	YfrQ6m2L2wRz2xqFt1uOIdQjjs9WTQkzNkc0HNkXa2F01y3zxrjWPyY3dyU2Kx5pqMRj
	VMC+esX+6JBd1x9uvdXdhtRjT0W3CC3BM/k5NERcOo+1WbYzeP3qbaWfVO+5C2ybBprQ
	h9yBMN0HNAlK42SPN4db1/ElY236NweUll5aDALyFdTDPLvUh5TM3fDu+smC2AANNDaZ
	D5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C2ZevHa8Avb24lq+q9pFsmfbhWDiNhJfQXzS1nbhWDA=;
	b=N33yNDx+CRk1XiEbeH78nKOjgm4FmNyDgLdaYDgQ8oQnuUkwb16ymXooJFhFES7y0S
	up5nmQ3wslndbl6Nt58dpw/wekUwMOlv6GP2o3E0aUXANTlEn2OPfbz1BX5rXA85LEZh
	Bg4WBo0gde1Q1ggpLcKiiUZ67sxUQteqEz5yd+yj+YfyPyPXXNBPDICIh2mn7QyhL8H5
	iuXqL3zd9ga9bcy9qZo1fyeaKf1CW+RhXe8VYfantSojSJydvsjWGv8u8t3bUMsh7xu4
	6sXGKPAc0EHeNx/coQtBpaIWu0V6owKu83ejzrrKnC+iqUpw3iBH61riZqglPkV97LGW
	x2XQ==
X-Gm-Message-State: APjAAAUYYYBv0WNmC9uhl2v/l5k1SzIHZ9t7S7GwJEmiVpz0Ns+1b3kD
	SZNVQqpSUY6xxOdcfV/rENCTNPJDvnU=
X-Google-Smtp-Source: APXvYqyYeRvK7kYnEVxHq1icuSk2oWkpaulzAz1WN0bWglRnNlGdwWrfJN+ju6QUdFRUGn6vi5Cj0Q==
X-Received: by 2002:a17:90a:1951:: with SMTP id
	17mr8938872pjh.79.1560918241632; 
	Tue, 18 Jun 2019 21:24:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::32b0])
	by smtp.gmail.com with ESMTPSA id
	r7sm26092845pfl.134.2019.06.18.21.24.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 21:24:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2019 21:23:52 -0700
Message-Id: <20190619042352.22919-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190619042352.22919-1-raj.khem@gmail.com>
References: <20190619042352.22919-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] pidgin-sipe: Depend on gmime
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
X-List-Received-Date: Wed, 19 Jun 2019 04:24:01 -0000
Content-Transfer-Encoding: 8bit

gmime is used if detected, some build hosts the detection logic
fails, make the dependency unconditional to fix build failures
when it detects host's gmime install

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
index beae281a30..7632fd2de7 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
@@ -3,7 +3,7 @@ SECTION = "webos/services"
 LICENSE = "GPLv2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "pidgin intltool-native glib-2.0-native"
+DEPENDS = "pidgin gmime intltool-native glib-2.0-native"
 
 inherit pkgconfig
 inherit autotools
@@ -19,7 +19,7 @@ PACKAGECONFIG[nss] = "--enable-nss=yes,--enable-nss=no,nss"
 PACKAGECONFIG[openssl] = "--enable-openssl=yes,--enable-openssl=no,openssl"
 PACKAGECONFIG[krb5] = "--with-krb5=yes,--with-krb5=no,krb5"
 #PACKAGECONFIG[voice_and_video] = "--with-vv=yes,--with-vv=no,libnice gstreamer"
-PACKAGECONFIG[telepathy] = "--enable-telepathy=yes,--enable-telepathy=no,telepathy-glib gmime"
+PACKAGECONFIG[telepathy] = "--enable-telepathy=yes,--enable-telepathy=no,telepathy-glib"
 #PACKAGECONFIG[gssapi_only] = "--enable-gssapi-only=yes,--enable-gssapi-only=no,krb5"
 PACKAGECONFIG[debug] = "--enable-debug=yes,--enable-debug=no,valgrind"
 
-- 
2.22.0


