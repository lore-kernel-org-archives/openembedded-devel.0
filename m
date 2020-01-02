Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB4097FBFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 17:47:48 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q8so22354607pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 09:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Uh3L2fDcRAg5BaPeidUfcDvZM565MtiSyP2f29/IyfE=;
	b=o6lmtQE9A1WnT67UCfnJJKpvIZZPH66tnBV4/UEMB+3Ah32KXS9Bv1WtZDGBQYuCxi
	7wQpX98qVUL0BWf0wNIYjEj2hqesFHFJSeJafcmyuVepZoAdAABcDuhR+chNPyCSxvJ8
	zsNqHQ9sNuMnNBUKxUqaYYmdxt4gcOnJCpZUIWpqhcHPnJFG4CdZfFJDC/ehmxnIwLmH
	e8u1mbTY4dyE9p6wAp7G68jTgrNHDU+PIgf4dYC6bwE99TCODKkLkVKw+McSMIWRt6PO
	t3rKa3KO2n4KMgBx28gbTLNKWe+TwpbI9fhHSsOamB8N6JyXzG9Ac9AVW8Lr4al3mL4X
	tqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Uh3L2fDcRAg5BaPeidUfcDvZM565MtiSyP2f29/IyfE=;
	b=f5X14vz+lqFmIlnAmZY81UkhEwn0QKHAhr75fMouPwxvKvrBhPoNOzNckvJDvgHQ07
	f3ZEZ2kDvRJjBwIw8jFDHAFmbAEfqdo7Cv73LTXawO4/DBV1tJ58p/Xf2ylbORS/XoXP
	EnCL6cBrslQYI20UebgGz51Ik/p/XNmPO6gGhcV+kbRPjSJMGXWqKgrTCKGAKXfjcere
	lTs/X67TON5v1+xww6m21/zt4EF0PbecGt3iBMQkucRrCy32xRKTyNHv4P7tlheZUN+v
	3LqYRBQ64wPDtoMawF7MOqynwY5kimrbAB1LDlr9zYAtvtDK9AVFmeE1TrV8IUZu7BTU
	ARxg==
X-Gm-Message-State: APjAAAXUzue6OMkw2HRiG5d2NHgmb+SP3iLtjMvrM8ZsajG8C0oNP1Oj
	eWfKdOMEXEuOfdeANfEovm0jEh19lqA=
X-Google-Smtp-Source: APXvYqwFfoqfjgQeRzw/fZ3mrTLm/A7DU4PxXdJouDmMFgUqeshwMdgn1kKpk7pbWCU9gopqxAdV2g==
X-Received: by 2002:a63:e14b:: with SMTP id h11mr87644285pgk.297.1577987269398;
	Thu, 02 Jan 2020 09:47:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	l14sm58566815pgt.42.2020.01.02.09.47.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 09:47:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 09:47:40 -0800
Message-Id: <20200102174742.2228874-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102174742.2228874-1-raj.khem@gmail.com>
References: <20200102174742.2228874-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 2/4] gtkperf: Fix build with latest gettext 0.20.x
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

 .../gtkperf/gtkperf/gettext.patch             | 36 +++++++++++++++++++
 .../recipes-graphics/gtkperf/gtkperf_0.40.bb  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gtkperf/gtkperf/gettext.patch

diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf/gettext.patch b/meta-oe/recipes-graphics/gtkperf/gtkperf/gettext.patch
new file mode 100644
index 0000000000..4a727d3c06
--- /dev/null
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf/gettext.patch
@@ -0,0 +1,36 @@
+Fix build with gettext 0.20.x
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3,7 +3,7 @@
+ ## If you don't want it to overwrite it,
+ ## 	Please disable it in the Anjuta project configuration
+ 
+-SUBDIRS = intl po src pixmaps
++SUBDIRS = po src pixmaps
+ 
+ gtkperfdocdir = ${prefix}/doc/gtkperf
+ gtkperfdoc_DATA = \
+--- a/configure.in
++++ b/configure.in
+@@ -31,8 +31,7 @@ AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE, "$GE
+ 
+ dnl Languages which your application supports
+ ALL_LINGUAS=""
+-AM_GNU_GETTEXT
+-AM_GNU_GETTEXT_VERSION(0.10.40)
++AM_GNU_GETTEXT([external])
+ 
+ dnl Set PACKAGE_LOCALE_DIR in config.h.
+ if test "x${prefix}" = "xNONE"; then
+@@ -100,7 +99,6 @@ AC_DEFINE_UNQUOTED(PACKAGE_SOURCE_DIR, "
+ 
+ AC_OUTPUT([
+ Makefile
+-intl/Makefile
+ po/Makefile.in
+ src/Makefile
+ pixmaps/Makefile
diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
index 6fe258271d..b4d94ff6a2 100644
--- a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://prdownloads.sourceforge.net/${BPN}/${BPN}_${PV}.tar.gz \
            file://Makevars \
            file://0001-Include-stdlib.h-for-exit-API.patch \
            file://0002-timing.c-Fix-format-security-errors.patch \
+           file://gettext.patch \
            "
 
 SRC_URI[md5sum] = "4331dde4bb83865e15482885fcb0cc53"
-- 
2.24.1


