Return-Path: <marek.belisko@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id B0C0D7E3B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 12:58:03 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id m3so6176530wrv.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 05:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=0q2g0/I8rxh94qoTDZdDQ/oZQbVzZqvGtwVgufr3JlI=;
	b=lBI3lYQ1OIR9iEgM4YhJTAqgxQFcrVXTV8cwSaEYSUWhLXVqsAsWg1bVCjaOm+DMAa
	y99RF3n+FcEE9r5lI1l3uCqDs8UuPAQoitrvj4ZIivPvmjoZoYJmT+WOpmNgxY0/abHn
	PMYqFCBadH9BRzG4fXXjvSpN6YYWr7QbJYvziZR8P+2aqRJ7g5YgEWbRUuUUqUzg+hQ3
	UzokQEo/giWgosEtj2wty8/0u+A7BGZrIPZTOob+vtoPc2qtDK7JoG33Z/3snYHlzi+G
	m4RimEdAppDAvi9vMaSslca4dOW5YlSek5BsX/6N+2HhhfjaVLOXoevN7DPgVBLcqjba
	QxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=0q2g0/I8rxh94qoTDZdDQ/oZQbVzZqvGtwVgufr3JlI=;
	b=KfDPgrdi0TZbiwk3NDk7MdTcEoOdL8v9QQDqbyK5A8dbk2lUFlulNw+xGt0Q30BiO8
	dAaJ9fcUIt3pNDvLaGwisro0LglxRAbC/WcCPhYYKTUI+WPt35QUBKxZvH9FS4hQIw0l
	9Na4/p1JpAJu6htRyTovCVIMW3feR/JNJAMoN6h2HJIPwmR8UCN0DeI6ypy40qX/m7Qi
	wLmca+aF3uUP1Gjcn6aKwfZYEIpeJHNU8oWADtRxQPS+AnBfO64iiDL28ao5dyIwpzEG
	TSWRWOh7pzi6FPQjYXKY2oI775xww8k2i+7XLGhRevHD/eaHc2Ej8ndY8I/u9JMyjIuB
	9O3Q==
X-Gm-Message-State: APjAAAXa/OCHkAW26YSZZGCLF3jzRB43MsQ63K0LocHCV54U5sUgumAq
	yfIoh584Mc/ZvOeDYHCSB7qyrGV/DIU=
X-Google-Smtp-Source: APXvYqzurjfbqrXTMsIjRP1P8H2M9NGOfdXdJDkGAmWPSKZp8MLeQEWeMiJ9ihtp9K4Uap+H9tMJPw==
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr935784wrp.67.1558616284100;
	Thu, 23 May 2019 05:58:04 -0700 (PDT)
Received: from localhost.localdomain (178-143-25-215.dynamic.orange.sk.
	[178.143.25.215]) by smtp.gmail.com with ESMTPSA id
	t7sm35360700wrq.76.2019.05.23.05.58.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 May 2019 05:58:03 -0700 (PDT)
Sender: Belisko Marek <marek.belisko@gmail.com>
From: Marek Belisko <marek.belisko@open-nandra.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 14:58:00 +0200
Message-Id: <1558616280-31053-1-git-send-email-marek.belisko@open-nandra.com>
X-Mailer: git-send-email 2.7.4
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Subject: [meta-multimedia][thud][PATCH] libsrtp: Fix compilation and add pkgconfig
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
X-List-Received-Date: Thu, 23 May 2019 12:58:04 -0000

With current recipe state only static library was
build. Add extra option to build dynamic library
and also inherit pkgconfig to have installed library
pkgconfig

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 meta-multimedia/recipes-support/libsrtp/libsrtp_1.6.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.6.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.6.0.bb
index d3ab5b7..6c86818 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.6.0.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.6.0.bb
@@ -11,6 +11,8 @@ SRC_URI = "git://github.com/cisco/libsrtp.git;protocol=https;branch=1_6_x_thrott
            file://0001-Rename-conflicting-variable-mips.patch \
            "
 
-inherit autotools
+inherit autotools pkgconfig
+
+EXTRA_OEMAKE += "shared_library"
 
 ALLOW_EMPTY_${PN} = "1"
-- 
2.7.4


