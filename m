Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id DBBF37FE2F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 21:05:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d139so2918900wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 13:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oVbOqtkIUIHOe9xUmsBqAVeVEEzpX8Ugij141C2u/zg=;
	b=ZfU6y7JBaF5eNANjOEj4Q61+RlQto2OsIN8FbyilqizS7yOjB1MI/0fxF7SqIk3unQ
	+vQXWngL6tX0fk3u+yrkatypiQSodGzNFrMwW6A+HAlOWRXKLgJrFqdl7hpAoIr1RqDb
	/OeUVgGAJzUUEdfMFF9qFepN8XRoepxBew7vrYBNMOeVHNTumOTDyehqE0OriLq4dFPb
	r0uHqEDUuQ+1Aqal7k2LtLaTM8rR2j3FrMGnfqxdX5ocmbB+Pf1dPg8ZDYB7vhmyl+Je
	lezo7mtIA1cxpMGz1+3t+t46EdTHINX8wFf6yrHWi6O87kDV7IJ4FXdd6eIp7q1bVpVc
	lsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oVbOqtkIUIHOe9xUmsBqAVeVEEzpX8Ugij141C2u/zg=;
	b=gbtj3klXYVnTFVsMlbGtm3U1xAId6+oI9IqLiuZdSOyjHHm+acG1bGnuitYSxQumSl
	ENm4AvduWuCKudQ8VgjIBqRcB1berQ6j4Z3KeMc0A39d0xmu3MrxMTGl9enIh6bT9Far
	jkEeNEtUAIHJSLNs3krK9kg2Om9HFa/YYUcTd3N1ZnmisN9GnwjSEdbCWBJW6mTU0XKd
	aVyn3hSLlawjVFq5UURdv8Ij98yEfChdRFWqZpGN+fNzLXpwvR8p0vL9OjKOpzBjkSDN
	mOWmt4MhsP5SEo6PLNzxCL9Y4qMRVkSbpZkjBG2dqqtbivKfOzTKKJJPQxnranidHEmU
	zXog==
X-Gm-Message-State: APjAAAUMLzrh1bzStYr7U8zbNrupI7qJNJgQlTdwd2Ef1UUQb9YrKKhZ
	EZmpL389dfdDHN3RxEw/mver8Vvgw0M=
X-Google-Smtp-Source: APXvYqxAy9RQHbn25EEDHbpYkUpkQaFlTOuFTNsYTQsZdICdOFR6Xo1zU9ZyY+kmNZuZYLWHwAW00g==
X-Received: by 2002:a05:600c:251:: with SMTP id
	17mr6574086wmj.88.1578603932364; 
	Thu, 09 Jan 2020 13:05:32 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id q6sm9825041wrx.72.2020.01.09.13.05.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 13:05:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 22:05:17 +0100
Message-Id: <20200109210518.22451-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109210518.22451-1-schnitzeltony@gmail.com>
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] libsigc++-3: upgrade 3.0.0 -> 3.0.2
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
X-List-Received-Date: Thu, 09 Jan 2020 21:05:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

3.0.2 (stable)

* Build: Meson build improvements.
  (Kjell Ahlstedt, Chun-Wei Fan)

From [2]:

3.0.1 (stable)

* Build:
  - Add meson build, alongside the existing autotools and CMake builds.
  (Kjell Ahlstedt, Chun-Wei Fan)
  - CMake: Fix the MSVC build, enable warnings, and disable unnecessary
  warnings, with MVSC.
  (Stuart Dootson)
* connection: Allow copying of empty connections.
  (Aigrind)
* sigc++/adaptors/bind.h: Make bind_functor::bound_ public.
  (Used by sigc::visitor::do_visit_each().
  (Kjell Ahlstedt) Bug #26
* test_limit_reference: Avoid virtual-move-assign warning
  (seen with g++ 9.2)
  (Murray Cumming)
* signal: slot_iterator_buf: Remove unused T_result default type
  (Murray Cumming)
* tests: Slight cleanups
  (Murray Cumming)
* Remove unused #ifdefed code.
  (Murray Cumming)

[1] http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.0/libsigc++-3.0.2.news
[2] http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.0/libsigc++-3.0.1.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libsigc++-3_3.0.0.bb => libsigc++-3_3.0.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-3_3.0.0.bb => libsigc++-3_3.0.2.bb} (77%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
similarity index 77%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
index 3c0330f50..0acdb3e98 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=959bffe2993816eb32ec4bc1ec1d5875"
 DEPENDS = "mm-common"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/3.0/libsigc++-${PV}.tar.xz"
-SRC_URI[md5sum] = "6ffe924f1d8624b5716468cde67dc03f"
-SRC_URI[sha256sum] = "50a0855c1eb26e6044ffe888dbe061938ab4241f96d8f3754ea7ead38ab8ed06"
+SRC_URI[md5sum] = "1f93f8ed4ead38e876157834b2c57c21"
+SRC_URI[sha256sum] = "4b77676de1e74774ec456bcc6ac6f04a2791a12cc1fe07f8305d4c3c86e2f339"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
2.21.0


