Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id C769460138
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 05:34:47 +0000 (UTC)
Received: by iecmd7 with SMTP id md7so50037759iec.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 22:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fXs9LpLHsL3wdN/nxw74+0OJEvMtzVpZXD7kJNEKjNk=;
	b=wYs+pAcExiMW+V2GvmFx4j3robo3o8+1zM4H1OndsUx4Qa8E+Mvo5iYtcObZp47GN+
	9sGh2DjJXieuxxZkGDA0OW4u3wed9xMIR075wleql392zYJxvEDrZym0hxfRm2qJopeP
	Sr9SEVromqGQDW/gHfVgZDYII86oTqNiWVVmLVpjcnFODqbmfKzq2zbw6YfVHPiSMwZX
	8o7ZHpI1Ly8tHkVrWL254jVrxv8qoUrM/JjrVfuRR2xS6qCpMZJmJheN9tRbGFqoTqNe
	1RYz7m3pJvql9IDTEDA0qmGWfGHQ1hxbGQ3FVyVcATZs2HH29ZMONzFE1FkQM/QwqE9G
	awCA==
X-Received: by 10.42.178.7 with SMTP id bk7mr1138518icb.79.1431408888917;
	Mon, 11 May 2015 22:34:48 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id r4sm627130igh.9.2015.05.11.22.34.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 May 2015 22:34:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2015 22:34:41 -0700
Message-Id: <1431408883-7222-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-gnome][PATCH 1/2] site: add arm-64 and x86_64-linux files
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
X-List-Received-Date: Tue, 12 May 2015 05:34:47 -0000

ORBit2 configure needs some presets
lets define them here in meta-gnome since
thats the layer providing it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/site/arm-64       | 13 +++++++++++++
 meta-gnome/site/x86_64-linux | 17 +++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-gnome/site/arm-64
 create mode 100644 meta-gnome/site/x86_64-linux

diff --git a/meta-gnome/site/arm-64 b/meta-gnome/site/arm-64
new file mode 100644
index 0000000..f474d2c
--- /dev/null
+++ b/meta-gnome/site/arm-64
@@ -0,0 +1,13 @@
+# ORBit2
+ac_cv_alignof_CORBA_boolean=1
+ac_cv_alignof_CORBA_char=1
+ac_cv_alignof_CORBA_double=8
+ac_cv_alignof_CORBA_float=4
+ac_cv_alignof_CORBA_long=4
+ac_cv_alignof_CORBA_long_double=8
+ac_cv_alignof_CORBA_long_long=8
+ac_cv_alignof_CORBA_octet=1
+ac_cv_alignof_CORBA_pointer=4
+ac_cv_alignof_CORBA_short=2
+ac_cv_alignof_CORBA_struct=1
+ac_cv_alignof_CORBA_wchar=2
diff --git a/meta-gnome/site/x86_64-linux b/meta-gnome/site/x86_64-linux
new file mode 100644
index 0000000..eba1fee
--- /dev/null
+++ b/meta-gnome/site/x86_64-linux
@@ -0,0 +1,17 @@
+# ORBit2
+ac_cv_alignof_CORBA_boolean=1
+ac_cv_alignof_CORBA_char=1
+ac_cv_alignof_CORBA_double=8
+ac_cv_alignof_CORBA_float=4
+ac_cv_alignof_CORBA_long=4
+ac_cv_alignof_CORBA_long_double=8
+ac_cv_alignof_CORBA_long_long=8
+ac_cv_alignof_CORBA_octet=1
+ac_cv_alignof_CORBA_pointer=8
+ac_cv_alignof_CORBA_short=2
+ac_cv_alignof_CORBA_struct=1
+ac_cv_alignof_CORBA_wchar=2
+
+lf_cv_sane_realloc=yes
+as_cv_unaligned_access=${as_cv_unaligned_access=yes}
+
-- 
2.1.4


