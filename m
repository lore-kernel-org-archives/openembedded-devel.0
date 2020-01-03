Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id D78AA7F95D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:35 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id q10so22907714pfs.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GwKI2nhYZCjhaPnstKAv5fPzHA5x50zB6A3TSfwCNco=;
	b=icDyae3tGU5Cbx79a+kxBoVwcvOT0Kc827sV/tVICH1yGT/Hy3DLkQcw2BoVv05Frj
	hxYUkjh5h0RWRtamIEttZn1H+dsacBXibhb6qHlUjGHPrIOURR3kLHxMvKrvmTJMGLHl
	D+R9QYLwkk47BTe+gBIUK9ozN5iGtjOwEQqi3/YMJE5eWOLUPcHZ13PH8LUXmolszc+B
	TBQH0UXpr7uEGZIHiUGn7xwUvXC8+BhWLATeP1qA8shXOenQhq6Rsdu4q7NTwaadchN0
	IVAwAdgKWrsDxwZiWU4mxXk0vUp0UER6YuddTFLiSHSiQyAlOV64zvUQORkun/sXf4GJ
	Svkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GwKI2nhYZCjhaPnstKAv5fPzHA5x50zB6A3TSfwCNco=;
	b=KPK95MA9amCqcqCRWbut4fsBsIvNWLtOa2Eb8Smw0W59cK90pNqphFy2tFGJXKSWow
	wKKsDlZ8hv+5mQb/1aET/PwO66Zwj/QdV08WVaqCDDxSxK8uG/FUlIXhBAminHlnrkmQ
	UEUNHeti81e3UTSBSVtrzNk+FzulhL4sumcp38aI6mRcILhRzgdnwBX8Xu/hUr+dyYBG
	H9pFHptMBlvpuXRrjV+b+j8FQ+YAHVoLNCeaWXFNw+onzOmlBYYCNiOxOCKJX4Pnah0O
	qnQ0A6q68U3vc64MkpnZqfGOcSsrj7rYwhWBa6WxSri0HQX9IhRK9eB7nhd08dwYi3qW
	SnUw==
X-Gm-Message-State: APjAAAUemURoKaASH9cPsEpZH7pmhM//cqwA1nl2AoIb3GrMF6nIMNt0
	9BXmstZE2oTH3cUix7ZeY585MMMr9DQ=
X-Google-Smtp-Source: APXvYqzAGOeqbKJ2NZ6+LgMLIn6wGSvCrcr1Z1Q2wlUyV/yF/PwyDNM0gyNm5S8gP3QRa3HDt8bVkA==
X-Received: by 2002:a65:46c6:: with SMTP id n6mr93868998pgr.15.1578019776845; 
	Thu, 02 Jan 2020 18:49:36 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:03 -0800
Message-Id: <4a0b08db55bd6176882ef861bfa729d451a80f85.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 06/17] syslog-ng: Fix multilib header conflict - syslog-ng-config.h
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:37 -0000

From: zhangxiao <xiao.zhang@windriver.com>

Header file conflict between 32-bit and 64-bit versions.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b6c9a83e3622a82d990c926a5e8686f9be19502f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index b00cb91ee14..737c5e8bc3e 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 
-inherit autotools gettext systemd pkgconfig update-rc.d
+inherit autotools gettext systemd pkgconfig update-rc.d multilib_header
 
 EXTRA_OECONF = " \
     --enable-dynamic-linking \
@@ -98,6 +98,8 @@ do_install_append() {
     else
         install ${WORKDIR}/syslog-ng.conf.sysvinit ${D}${sysconfdir}/${BPN}/${BPN}.conf
     fi
+
+    oe_multilib_header syslog-ng/syslog-ng-config.h
 }
 
 FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools ${systemd_unitdir}/system/multi-user.target.wants/*"
-- 
2.17.1


