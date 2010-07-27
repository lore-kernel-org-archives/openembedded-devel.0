Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <developer@alexandfliss.com>) id 1Odgvm-0000nO-VS
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 11:58:39 +0200
Received: by wwb39 with SMTP id 39so887550wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 02:58:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.210.206 with SMTP id u56mr8683008weo.50.1280224701733; 
	Tue, 27 Jul 2010 02:58:21 -0700 (PDT)
Sender: developer@alexandfliss.com
Received: by 10.216.236.97 with HTTP; Tue, 27 Jul 2010 02:58:21 -0700 (PDT)
Date: Tue, 27 Jul 2010 10:58:21 +0100
X-Google-Sender-Auth: rkq2le9FpdQI1Rkm6EMUjmHDTVA
Message-ID: <AANLkTi=JK37hYh26rGz3sY5byksJ0js_ihjk4y7tq-ad@mail.gmail.com>
From: Alex Bennee <kernel-hacker@bennee.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: developer@alexandfliss.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Version bump tzcode/data to 2010k
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Jul 2010 09:58:40 -0000
Content-Type: text/plain; charset=UTF-8

From 73f2553c2549f9c7aea1eeb5e4505e734cb78771 Mon Sep 17 00:00:00 2001
From: Alex Bennee <ajb@cbnl.com>
Date: Tue, 27 Jul 2010 10:57:35 +0100
Subject: [PATCH] Version bump tzcode/data to 2010k

---
 recipes/tzcode/tzcode-native_2010j.bb |   16 ----------------
 recipes/tzcode/tzcode-native_2010k.bb |   16 ++++++++++++++++
 recipes/tzdata/tzdata_2010j.bb        |   10 ----------
 recipes/tzdata/tzdata_2010k.bb        |   10 ++++++++++
 4 files changed, 26 insertions(+), 26 deletions(-)
 delete mode 100644 recipes/tzcode/tzcode-native_2010j.bb
 create mode 100644 recipes/tzcode/tzcode-native_2010k.bb
 delete mode 100644 recipes/tzdata/tzdata_2010j.bb
 create mode 100644 recipes/tzdata/tzdata_2010k.bb

diff --git a/recipes/tzcode/tzcode-native_2010j.bb
b/recipes/tzcode/tzcode-native_2010j.bb
deleted file mode 100644
index 7e1ae77..0000000
--- a/recipes/tzcode/tzcode-native_2010j.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require tzcode-native.inc
-
-# Note that elsie.nci.nih.gov removes old versions when new is coming out
-# So if this doesn't build for you because of missing source file, just
-# bump it to the latest available version, removing old one
-# Also, tzdata (and it is needed to build tzcode) version can differ from
-# tzcode version, thus this variable
-
-TZDATA_PV = "2010j"
-
-SRC_URI[tzcode-2010j.md5sum] = "5ba8345720296d3a659b349b2052d139"
-SRC_URI[tzcode-2010j.sha256sum] =
"f32b46405190e3a5f1ee4db9fb50aaf1379e6af4e5493402ebfc8ee757058e97"
-SRC_URI[tzdata-2010j.md5sum] = "f668f66b260e14b477eac3f48bcfb5f4"
-SRC_URI[tzdata-2010j.sha256sum] =
"dcf2101d0c5bb20a7f182866ea3e52b54c8f4d129c025a96c9a31377676f554b"
-
-PR = "${INC_PR}.0"
diff --git a/recipes/tzcode/tzcode-native_2010k.bb
b/recipes/tzcode/tzcode-native_2010k.bb
new file mode 100644
index 0000000..21796d6
--- /dev/null
+++ b/recipes/tzcode/tzcode-native_2010k.bb
@@ -0,0 +1,16 @@
+require tzcode-native.inc
+
+# Note that elsie.nci.nih.gov removes old versions when new is coming out
+# So if this doesn't build for you because of missing source file, just
+# bump it to the latest available version, removing old one
+# Also, tzdata (and it is needed to build tzcode) version can differ from
+# tzcode version, thus this variable
+
+TZDATA_PV = "2010k"
+
+SRC_URI[tzcode-2010k.md5sum] = "63cd2199679c91bed972a0248d6916af"
+SRC_URI[tzcode-2010k.sha256sum] =
"96671eac3a98d0c974833c8bfa7ea9b537cc9d32573e902103846b90f6dccdbd"
+SRC_URI[tzdata-2010k.md5sum] = "5e2086249d6a6bb116534d358661ad3f"
+SRC_URI[tzdata-2010k.sha256sum] =
"ef69c99504c0fd9864ba8ef1daae5f2d4df097cf7dc350f09b8f70386272408d"
+
+PR = "${INC_PR}.0"
diff --git a/recipes/tzdata/tzdata_2010j.bb b/recipes/tzdata/tzdata_2010j.bb
deleted file mode 100644
index 79b7769..0000000
--- a/recipes/tzdata/tzdata_2010j.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require tzdata.inc
-
-# Note that elsie.nci.nih.gov removes old archives when new is being
-# released. So if this doesn't build for you because of missing source file
-# just bump it to the latest available version, removing old one
-
-PR = "${INC_PR}.0"
-
-SRC_URI[tar.md5sum] = "f668f66b260e14b477eac3f48bcfb5f4"
-SRC_URI[tar.sha256sum] =
"dcf2101d0c5bb20a7f182866ea3e52b54c8f4d129c025a96c9a31377676f554b"
diff --git a/recipes/tzdata/tzdata_2010k.bb b/recipes/tzdata/tzdata_2010k.bb
new file mode 100644
index 0000000..216ae75
--- /dev/null
+++ b/recipes/tzdata/tzdata_2010k.bb
@@ -0,0 +1,10 @@
+require tzdata.inc
+
+# Note that elsie.nci.nih.gov removes old archives when new is being
+# released. So if this doesn't build for you because of missing source file
+# just bump it to the latest available version, removing old one
+
+PR = "${INC_PR}.0"
+
+SRC_URI[tar.md5sum] = "5e2086249d6a6bb116534d358661ad3f"
+SRC_URI[tar.sha256sum] =
"ef69c99504c0fd9864ba8ef1daae5f2d4df097cf7dc350f09b8f70386272408d"
-- 
1.7.2



-- 
Alex, homepage: http://www.bennee.com/~alex/
http://www.half-llama.co.uk


