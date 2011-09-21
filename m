Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rus-0001xX-U4
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 20:53:06 +0200
Received: by bke11 with SMTP id 11so2130253bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=D7wrHVTh2BO8A8Hlp5qZP3fEk6T57++N3Wn7iWYWPyY=;
	b=PX1BOe8/NysqApsMlC80LzdHPDAty1AkGN/Di5AgaINOA+U2jToTeNg0kdQOLtNIav
	OKp6hD33cqwtxVLeb+yciHZ89hbcC/ZGA136tw/RIQotlQSLDvPmyiHZNQigym3xafQN
	zvUQn3DLaPIHPKYht+srN1nmDk41SlcUjIcHc=
Received: by 10.204.130.137 with SMTP id t9mr892776bks.237.1316630868339;
	Wed, 21 Sep 2011 11:47:48 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id d1sm5850905bku.1.2011.09.21.11.47.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:47:47 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:47:40 +0400
Message-Id: <1316630860-13893-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-angstrom] angstrom: do also pin -nativesdk packages
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
X-List-Received-Date: Wed, 21 Sep 2011 18:53:07 -0000

Pin versions of -nativesdk packages, so that sdk libc corresponds to
packaged libc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 conf/distro/angstrom-2010.x.conf   |    6 ++++++
 conf/distro/angstrom-bleeding.conf |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/conf/distro/angstrom-2010.x.conf b/conf/distro/angstrom-2010.x.conf
index 6622a1f..6421141 100644
--- a/conf/distro/angstrom-2010.x.conf
+++ b/conf/distro/angstrom-2010.x.conf
@@ -75,10 +75,16 @@ PREFERRED_VERSION_linux-libc-headers-nativesdk = "${LINUX_LIBC_HEADERS_VERSION}"
 #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
 PREFERRED_VERSION_glibc 		?= "2.10.1"
 PREFERRED_VERSION_glibc-initial 	?= "2.10.1"
+PREFERRED_VERSION_glibc-nativesdk 	?= "2.10.1"
+PREFERRED_VERSION_glibc-initial-nativesdk = "2.10.1"
 PREFERRED_VERSION_uclibc        	?= "0.9.32"
 PREFERRED_VERSION_uclibc-initial	?= "0.9.32"
+PREFERRED_VERSION_uclibc-nativesdk     	?= "0.9.32"
+PREFERRED_VERSION_uclibc-initial-nativesdk ?= "0.9.32"
 PREFERRED_VERSION_eglibc		?= "2.12"
 PREFERRED_VERSION_eglibc-initial	?= "2.12"
+PREFERRED_VERSION_eglibc-nativesdk	?= "2.12"
+PREFERRED_VERSION_eglibc-initial-nativesdk ?= "2.12"
 PREFERRED_VERSION_eglibc-locale		?= "2.12"
 
 #powerpc needs additional patches to gcc
diff --git a/conf/distro/angstrom-bleeding.conf b/conf/distro/angstrom-bleeding.conf
index 62bfe7c..1aec38e 100644
--- a/conf/distro/angstrom-bleeding.conf
+++ b/conf/distro/angstrom-bleeding.conf
@@ -6,10 +6,14 @@ ANGSTROM_BINUTILS_VERSION                        ?= "2.21.1"
 
 PREFERRED_VERSION_eglibc                         ?= "2.13"
 PREFERRED_VERSION_eglibc-initial                 ?= "2.13"
+PREFERRED_VERSION_eglibc-nativesdk               ?= "2.13"
+PREFERRED_VERSION_eglibc-initial-nativesdk       ?= "2.13"
 PREFERRED_VERSION_eglibc-locale                  ?= "2.13"
 
 PREFERRED_VERSION_uclibc			?= "0.9.32+0.9.33%"
 PREFERRED_VERSION_uclibc-initial		?= "0.9.32+0.9.33%"
+PREFERRED_VERSION_uclibc-nativesdk		?= "0.9.32+0.9.33%"
+PREFERRED_VERSION_uclibc-initial-nativesdk	?= "0.9.32+0.9.33%"
 
 
 require angstrom-2010.x.conf
-- 
1.7.2.5



