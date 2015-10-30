Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2630C770A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:23 +0000 (UTC)
Received: by wmff134 with SMTP id f134so10430567wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=KU96U5IbFbMVOX6cU11cyiU+3X0FzNzQGYQXSK7FpF8=;
	b=CkkVUG/XutIf6TYfYRF841QEdudEJPYllClliHKbHUYHzzZVn22JOaXRQrEfuKrEO7
	OiddrhU7y01FUbZA1cGGxSZxQiZtWRT/0EtJRG6CdMnGK/fDfIfUzaZz98DMy3DaeSoB
	v6GVydBzcXH9plmtdvA4mGbPxT26IybQfML7Z3jqOUpn5B1nLntznqn1BwhEBraI6mg8
	EhoEmyn0gSCOMa1ZmJFBDYz0TIJkctKAF0YfjK40cbXiIq2CHJVkvpna9KNbuzuxlJdv
	FHbDsnP13U4ybT50iYSbf/bIDKoOUI3FRJZ1UoqnSxHpSuGmFVnEtoII9ONrlOhO2LVG
	aGHw==
X-Received: by 10.28.132.69 with SMTP id g66mr2918226wmd.69.1446207263287;
	Fri, 30 Oct 2015 05:14:23 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:40 +0100
Message-Id: <1446207225-15386-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 08/13] bootstrap.bbclass: initial add
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2015 12:14:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bootstrap is another magic script which is intended run before autotools. The
class created runs this script at the right time and ensures that sources of
gnulib are not cloned during configure.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/bootstrap.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/classes/bootstrap.bbclass

diff --git a/meta-oe/classes/bootstrap.bbclass b/meta-oe/classes/bootstrap.bbclass
new file mode 100644
index 0000000..2acd6d8
--- /dev/null
+++ b/meta-oe/classes/bootstrap.bbclass
@@ -0,0 +1,20 @@
+# Inherit this class if you want to build with bootstrap/autotools
+inherit autotools
+
+DEPENDS += "gnulib"
+
+do_configure_prepend() {
+    currdir=`pwd`
+    cd ${S}
+
+    # avoid bootstrap cloning gnulib on every configure
+    cat >.gitmodules <<EOF
+[submodule "gnulib"]
+	path = gnulib
+	url = git://git.sv.gnu.org/gnulib
+EOF
+    cp -rf ${STAGING_DATADIR}/gnulib ${S}
+
+    ./bootstrap
+    cd $currdir
+}
-- 
2.1.0


