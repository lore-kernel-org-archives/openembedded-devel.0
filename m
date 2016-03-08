Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3090373175
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Mar 2016 02:00:18 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id 124so1370241pfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2016 18:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Xb8o+5pMfG5qPWpQoIUtK2No0HqaYToM7nJyFap6HQ0=;
	b=U1UHvZ44nFlLY0mm9iXp5Hxq1ELI6RUh0qMssBf6T5q3kmsfhV02dtlnof5sLyvxGZ
	XqWR/yyvyssCijSyzWIIqCrOtaFwVNrdRowf2EVYnFDLOYmOnObFxy6G5xQbdK9/ipqn
	WGc9cmnmeu2y2MW6o1Rotc7Xo84aR/e/FyEnbRw0UpSNeOasqbXKaznDtMIE8xwRNKKR
	6eVY3zTkRsTbwzOY/btTceThxKt4l4+owH43tTarIcPeBmm5vpInveuA1pX0ZFIilUPS
	BsLjEgahh9RaS1yQdraO7+YDv8Wv93T8BVeJTF04gyW2lLZC6lHuUIOonEnMpti4ED4L
	nYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Xb8o+5pMfG5qPWpQoIUtK2No0HqaYToM7nJyFap6HQ0=;
	b=E4koWOpfMhR4Q1Fqzn2Hk+46Qji4ybLSBzAzhghJm7FRX0FNCnLjzG07XP2tabU3wT
	p2wh0toPdowPqO/5/jRe3rpMdo+hH8wAkFUcemBjfby1CSXC7PQQklfCzGgdFj56R4+w
	1O+6n5jviah3yyTG4vysFPmbAa2cseP5Hg/A/dqlrL0RLhxiD9Z6zIhQoXaYpwwIetPN
	xc4Nd6wK5mOnvEfkJGeoEjk0SIjwLIlJiGMX1w2nLmC0eNVRr17aUQCiX/R4IIAHqE2Y
	ofUSrkETvEydOBUoq8JfYUH5B1e6TRDzzVKE8DSd+TYrBlVNFPWL6zwPH8cVcgjWvLJY
	qXdw==
X-Gm-Message-State: AD7BkJKDxBzHBlOax9IP72qk2CvJLvAFVqNP+IwzgQbvcuxB/J0RlE9rs5FuSshqwUer4Q==
X-Received: by 10.98.42.207 with SMTP id q198mr38284890pfq.103.1457402418938; 
	Mon, 07 Mar 2016 18:00:18 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id cq4sm425130pad.28.2016.03.07.18.00.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Mar 2016 18:00:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Mar 2016 18:00:14 -0800
Message-Id: <1457402414-14879-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1457402414-14879-1-git-send-email-akuster808@gmail.com>
References: <1457402414-14879-1-git-send-email-akuster808@gmail.com>
Subject: [meta-python][PATCH] python-m2crypto: fix build issue
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
X-List-Received-Date: Tue, 08 Mar 2016 02:00:19 -0000

restore swig file fiddling:

tmp/sysroots/qemux86/usr/include/openssl/opensslconf.h:45: Error: Unable to find 'openssl/opensslconf-64.h'
error: command 'swig' failed with exit status 1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python-m2crypto_0.23.0.bb               | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb
index af8ca09..f6f0e1f 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb
@@ -27,4 +27,26 @@ SWIG_FEATURES_x86-64 = "-D__x86_64__"
 SWIG_FEATURES ?= ""
 export SWIG_FEATURES
 
+# Get around a problem with swig, but only if the
+# multilib header file exists.
+#
+do_compile_prepend() {
+    if [ "${SITEINFO_BITS}" = "64" ];then
+        bit="64"
+    else
+        bit="32"
+    fi
+
+    if [ -e ${STAGING_INCDIR}/openssl/opensslconf-${bit}.h ] ;then
+        for i in SWIG/_ec.i SWIG/_evp.i; do
+            sed -i -e "s/opensslconf.*\./opensslconf-${bit}\./" "$i"
+        done
+    elif [ -e ${STAGING_INCDIR}/openssl/opensslconf-n${bit}.h ] ;then
+        for i in SWIG/_ec.i SWIG/_evp.i; do
+            sed -i -e "s/opensslconf.*\./opensslconf-n${bit}\./" "$i"
+        done
+    fi
+}
+
+
 BBCLASSEXTEND = "native"
-- 
2.3.5


