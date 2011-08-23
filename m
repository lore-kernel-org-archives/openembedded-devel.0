Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippe.corbes@gmail.com>) id 1QvyI5-0002bV-6t
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 23:13:45 +0200
Received: by yia28 with SMTP id 28so419655yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2011 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=0jWQAcTjo7Zbt/LiH9DqIGCF3K8L2/n0+mX9ru/yEWU=;
	b=P444Hi7kwZj+ddK4/4W971BS5jQpnHcpiDX9QbtkXyVX6aoEcHIj8aNRk1jajSaeeE
	+edbA72DXS8X7UkxbxDmnB0//JSi4a08B3idIMISwsPtyppqmWnYHZtGamTncPQ61dli
	q0vNQnCGuBhgUi9TbOmBo1Tj15gVYQerro7wo=
MIME-Version: 1.0
Received: by 10.43.49.193 with SMTP id vb1mr501508icb.321.1314133738836; Tue,
	23 Aug 2011 14:08:58 -0700 (PDT)
Received: by 10.42.225.136 with HTTP; Tue, 23 Aug 2011 14:08:58 -0700 (PDT)
Date: Tue, 23 Aug 2011 23:08:58 +0200
Message-ID: <CAGHsZCP03Kc_pJanwztMQxST4o4yrHVr3XbVNphevrhtFUmWwQ@mail.gmail.com>
From: Philippe Corbes <philippe.corbes@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Update tzcode and tzdata to last code
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
X-List-Received-Date: Tue, 23 Aug 2011 21:13:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I send you today in this mail an update to solve error on the timezone
packet.

Have a nice day,
Philippe Corbes
------------------------------------------------------------------------------------------------------------

commit 36b84c5b1ef5d261986cfd60685967a71a72d318
Author: Philippe Corbes <philippe.corbes@gmail.com>
Date:   Tue Aug 23 22:47:07 2011 +0200

    Update to use last tzcode and tzdata from ftp://elsie.nci.nih.gov/pub/

diff --git a/recipes/tzcode/tzcode-native_2011e.bb b/recipes/tzcode/
tzcode-native_2011e.bb
deleted file mode 100644
index 280840c..0000000
--- a/recipes/tzcode/tzcode-native_2011e.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require tzcode-native.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://README;md5=3ae8198f82258417ce29066d3b034035"
-
-# Note that elsie.nci.nih.gov removes old versions when new is coming out
-# So if this doesn't build for you because of missing source file, just
-# bump it to the latest available version, removing old one
-# Also, tzdata (and it is needed to build tzcode) version can differ from
-# tzcode version, thus this variable
-
-TZDATA_PV = "2011e"
-
-PR = "${INC_PR}.0"
-
-SRC_URI[tzcode-2011e.md5sum] = "fbfc05dbf9ebcfe7c4bba18549870173"
-SRC_URI[tzcode-2011e.sha256sum] =
"8fb00f8763aa51d83d6f3190d144124bb7176ca829fc08823d6205297bf0426b"
-SRC_URI[tzdata-2011e.md5sum] = "044a07072300a0ee72b046e5a9a4ec90"
-SRC_URI[tzdata-2011e.sha256sum] =
"44fef01de4589a4979eb6b5fdbbfd21a3b135852af1ecbfb9e0368ae47392c79"
diff --git a/recipes/tzcode/tzcode-native_2011g.bb b/recipes/tzcode/
tzcode-native_2011g.bb
new file mode 100644
index 0000000..d4ac755
--- /dev/null
+++ b/recipes/tzcode/tzcode-native_2011g.bb
@@ -0,0 +1,19 @@
+require tzcode-native.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://README;md5=3ae8198f82258417ce29066d3b034035"
+
+# Note that elsie.nci.nih.gov removes old versions when new is coming out
+# So if this doesn't build for you because of missing source file, just
+# bump it to the latest available version, removing old one
+# Also, tzdata (and it is needed to build tzcode) version can differ from
+# tzcode version, thus this variable
+
+TZDATA_PV = "2011h"
+
+PR = "${INC_PR}.0"
+
+SRC_URI[tzcode-2011g.md5sum] = "ecb564279b28c5b184421c525d997d6c"
+SRC_URI[tzcode-2011g.sha256sum] =
"636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
+SRC_URI[tzdata-2011h.md5sum] = "546d27b6c1e5e1097bd512651815017f"
+SRC_URI[tzdata-2011h.sha256sum] =
"c098786d053736dd18d4f1fbebdf41554c6fd702a36f75c18f1c66712d2abc24"
diff --git a/recipes/tzdata/tzdata_2011e.bb b/recipes/tzdata/tzdata_2011e.bb
deleted file mode 100644
index c0f5291..0000000
--- a/recipes/tzdata/tzdata_2011e.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require tzdata.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM =
"file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
-
-# Note that elsie.nci.nih.gov removes old archives after a new one is
-# released. So if this doesn't build for you because of missing source file
-# just bump it to the latest available version, removing the old one
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "044a07072300a0ee72b046e5a9a4ec90"
-SRC_URI[sha256sum] =
"44fef01de4589a4979eb6b5fdbbfd21a3b135852af1ecbfb9e0368ae47392c79"
diff --git a/recipes/tzdata/tzdata_2011h.bb b/recipes/tzdata/tzdata_2011h.bb
new file mode 100644
index 0000000..23d1549
--- /dev/null
+++ b/recipes/tzdata/tzdata_2011h.bb
@@ -0,0 +1,13 @@
+require tzdata.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM =
"file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
+
+# Note that elsie.nci.nih.gov removes old archives after a new one is
+# released. So if this doesn't build for you because of missing source file
+# just bump it to the latest available version, removing the old one
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "546d27b6c1e5e1097bd512651815017f"
+SRC_URI[sha256sum] =
"c098786d053736dd18d4f1fbebdf41554c6fd702a36f75c18f1c66712d2abc24"

