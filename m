Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 285066D470
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 17:47:48 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id s7so3643140pjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 09:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b8NsklY1HnQGCGS4KkjncgOyFtpi7qqDHLF8KGuueAs=;
	b=JDYhTcxJ0t8+xvWKU/VtVUMQ7iPQOk5/xQfmKr/KitnssiMBfsna/u3rNyiMfopqqy
	ul1A5mPJ5bgu8yr7VKjdt9ffD+UJFrygnDr1HOtHQUlL+pakqmWnK1UamtBR+kTx56wS
	KtvIp9odhOJ7dAky9x6HJbHQYE2ZdcS14y1zBn0ZU85xisTWbTMzdUyQtmVrcDg6Scdz
	L7inm1vXYyws5ghh6ipYPcbNytR2y1PYzjP+VYap3iykxkscR1nj1r5WURCT7PX6A+hB
	ZgRW64ti/b/pft5WHhmKn/+cXP620INp0Q/gWoM+3InYdXnwebgigxHmaTVu3M9IqXeN
	Cybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b8NsklY1HnQGCGS4KkjncgOyFtpi7qqDHLF8KGuueAs=;
	b=bGcwPFXoPWSM56vI9WA4vAPMOSBvAOc1ZFBMJJXpTrHREHFdkIBY3+a9YhKPhJKCDH
	12aHhACGsfa5jxdfr8ADUKckjUfqwpnXfHuQqQkL/VKWD/nhwOSZIrLLx81ogp953/hf
	6mi1zrcXMJevJviTpO7sJmvZk/E84xd+v5SRAnLukF3Uov+A8Uw7jGKJti7hUn8jAWEZ
	1z2kamiwjwZ2tpfQ+sKKG4sGsqjOpudAYISbd2YyfHuq2zCxM2shx3pQMn0siPG2xskX
	ggnITcmOLj0MINNIr81Vq5lzeqL1ICD1dAnF9zJ0s/3uveSMCE+sG4Zmra7X0Pnl7Mqb
	F5Kw==
X-Gm-Message-State: APjAAAUN7VOKHH56+CK9L1spDrMkgFEqN+hTPjBY/lojUA0JRtAVvdPP
	IUslVl5/hsv+IUxLlPgeZkkd4Lx4PAA=
X-Google-Smtp-Source: APXvYqzO/SsVB5HR/2hBJK/lO2P3VVTHIOH4OSvpNNUK+1CjizgXB946cEbk+RHmsnw3WARDrZI7Jg==
X-Received: by 2002:a17:90a:6587:: with SMTP id
	k7mr20307758pjj.40.1577987268748; 
	Thu, 02 Jan 2020 09:47:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	l14sm58566815pgt.42.2020.01.02.09.47.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 09:47:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 09:47:39 -0800
Message-Id: <20200102174742.2228874-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2 1/4] netcat: Fix build with gettext 0.20.x
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
X-List-Received-Date: Thu, 02 Jan 2020 17:47:48 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Do not remove intl/ directory

 .../recipes-support/netcat/netcat/gettext.patch  | 16 ++++++++++++++++
 .../recipes-support/netcat/netcat_0.7.1.bb       |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta-networking/recipes-support/netcat/netcat/gettext.patch

diff --git a/meta-networking/recipes-support/netcat/netcat/gettext.patch b/meta-networking/recipes-support/netcat/netcat/gettext.patch
new file mode 100644
index 0000000000..f2e5f99270
--- /dev/null
+++ b/meta-networking/recipes-support/netcat/netcat/gettext.patch
@@ -0,0 +1,16 @@
+Fix build with gettext 0.20.x
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -49,7 +49,7 @@ AC_SUBST(all_libraries)
+ dnl I18n support
+ ALL_LINGUAS="it sk"
+ AM_GNU_GETTEXT([external], need-ngettext)
+-AM_INTL_SUBDIR
++#AM_INTL_SUBDIR
+ 
+ dnl find resolver functions and the socket library on some broken OS
+ AC_LBL_LIBRARY_NET
diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index d961af542c..14d743f820 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -8,6 +8,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2 \
            file://obsolete_autoconf_macros.patch \
            file://netcat-locale_h.patch \
            file://make-netcat_flag_count_work.patch \
+           file://gettext.patch \
 "
 
 SRC_URI[md5sum] = "0a29eff1736ddb5effd0b1ec1f6fe0ef"
-- 
2.24.1


