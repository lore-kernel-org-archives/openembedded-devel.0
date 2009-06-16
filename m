Received: from [17.148.16.97] (helo=asmtpout022.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGcPZ-0007xN-1S
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Jun 2009 19:25:30 +0200
MIME-version: 1.0
Received: from [87.201.169.67] by asmtp022.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLC00FNRD8YD110@asmtp022.mac.com> for
	openembedded-devel@lists.openembedded.org; Tue,
	16 Jun 2009 10:15:05 -0700 (PDT)
Message-id: <C960916A-B754-4AD4-9751-67D7025AC8C1@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Jun 2009 21:14:47 +0400
X-Mailer: Apple Mail (2.935.3)
Subject: Patch for libfann-2.0.0 recipe
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
X-List-Received-Date: Tue, 16 Jun 2009 17:25:34 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	I'm attaching a patch for the libfann-2.0.0 recipe for inclusion into  
the oe repository.

Best regards,

Elvis

 From edb273d68849fd968f83a0bf59efba120b578fa3 Mon Sep 17 00:00:00 2001
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Tue, 16 Jun 2009 21:12:52 +0400
Subject: [PATCH] Added libfann-2.0.0 recipe

---
  conf/checksums.ini               |    4 ++++
  recipes/libfann/libfann_2.0.0.bb |   23 +++++++++++++++++++++++
  2 files changed, 27 insertions(+), 0 deletions(-)
  create mode 100644 recipes/libfann/libfann_2.0.0.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 37d55c7..7c38ea9 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -286,6 +286,10 @@  
sha256=1f8504c7f08d2d59c71a70915fc834a285b99587444ee33e23ee3f135c071da0
  md5=a8cf945d09c6458cb27228218e9a2f45
   
sha256=8416e162d6fc921f14a61c8905e9f9a28dc25e67e1c71b75574360a13f0c28c7

+[http://prdownloads.sourceforge.net/fann/fann-2.0.0.tar.bz2]
+md5=4224efa533265dcf39237667973d0e20
+sha256=762a1313a9b935300cb66ebf052d469d04823ca721fe6dd2a49c01e13e8ab30a
+
  [http://downloads.sourceforge.net/fordiac/FORTE-0.3.5.zip]
  md5=d207d3b389ee9f2702df095681459f99
   
sha256=2b87b331e931db2db07408c1b07bdb557227e0c16f8fe37f72e40b08fca0a09c
diff --git a/recipes/libfann/libfann_2.0.0.bb b/recipes/libfann/ 
libfann_2.0.0.bb
new file mode 100644
index 0000000..d3166ec
--- /dev/null
+++ b/recipes/libfann/libfann_2.0.0.bb
@@ -0,0 +1,23 @@
+# libfann-2.0.0 recipie
+SECTION = "libs"
+DEFAULT_PREFERENCE = "1"
+
+# Package information
+DESCRIPTION = "libfann, Fast Artificial Neural Network Library is a  
free open source neural network library, which implements multilayer  
artificial neural networks in C with support for both fully connected  
and sparsely connected networks."
+LICENSE = "BSD"
+PN = "libfann"
+PV = "2.0.0"
+PR = "r01"
+
+SRC_URI = "http://prdownloads.sourceforge.net/fann/fann-${PV}.tar.bz2"
+
+S = "${WORKDIR}/fann-${PV}"
+
+inherit autotools pkgconfig
+
+do_stage () {
+	oe_libinstall -a -so -C src libfann ${STAGING_LIBDIR}
+	install -d ${STAGING_INCDIR}/fann
+	(cd ${S}/src/include; cp compat_time.h config.h doublefann.h fann.h  
fann_activation.h fann_cascade.h fann_data.h fann_error.h  
fann_internal.h fann_io.h fann_train.h fixedfann.h floatfann.h $ 
{STAGING_INCDIR}/fann/)
+	install -m 0644 ${S}/aclocal.m4 ${STAGING_DATADIR}/aclocal/
+}
-- 
1.6.0.3




