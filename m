Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Eh-0007hY-7E
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:44 +0100
Received: by mail-wi0-f176.google.com with SMTP id hm14so8141540wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=3TcpnVljUIlsSwgzo7kVk1BBwRNQYV5370rWOrlUH2Y=;
	b=BjvPl21a4CQmp2LZtee4riWNoHFD00Om1EVTNtwdXD9wc8wOCsjlIO0VgmhgHofJ16
	Jlzn97O8kcj2AMqL2shpCp2gt47PxTSNMtE9H6nRoOUGuntYSzAl3gemzWmPSqXIX/3z
	hZGvi0QV2TUv/RQRAM2d51USyrHysK61ko3tm0DOR9HfDaN6gzpmb2sNLt99EIZRrQYf
	g6Tz1rf1UNrLzw3eLg7ZAYWlleTf/gFMD2R2w3oaoUruxISYfMlIl7UeLsDKWABpQFlI
	hOAwbt11osw87eb7OsYfeUlFN/pdf3LRvopZmMJmHNrAVCdF7gTN3rMLBx5Oy+iAsvU5
	qmDg==
X-Received: by 10.180.24.229 with SMTP id x5mr4640562wif.17.1363974105406;
	Fri, 22 Mar 2013 10:41:45 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.44
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:31 +0000
Message-Id: <ff6603ee188d9eee99d68d59535abe4c26f781d0.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQko5OBlc4nNoQqzdlROO6dfijfY4fXPgbBFWrVPNGqDsrKF1s7sc+fTjO+5OmkGzp3D9KLe
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/22] update-rcd: drop depends to recommends, check for update-rcd in scripts
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:34 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/update-rc.d.bbclass |   15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 06b91c1..0997702 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -6,7 +6,7 @@ UPDATERCD_virtclass-cross = ""
 UPDATERCD_class-native = ""
 UPDATERCD_class-nativesdk = ""
 
-RDEPENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
+RRECOMMENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
 
 INITSCRIPT_PARAMS ?= "defaults"
 
@@ -18,7 +18,9 @@ if test "x$D" != "x"; then
 else
 	OPT="-s"
 fi
-update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
+if type update-rc.d >/dev/null; then
+	update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
+fi
 }
 
 updatercd_prerm() {
@@ -28,10 +30,13 @@ fi
 }
 
 updatercd_postrm() {
-if [ "$D" != "" ]; then
-	update-rc.d -f -r $D ${INITSCRIPT_NAME} remove
+if test "$D" != ""; then
+	OPT="-f -r $D"
 else
-	update-rc.d ${INITSCRIPT_NAME} remove
+	OPT=""
+fi
+if type update-rc.d >/dev/null; then
+	update-rc.d $OPT ${INITSCRIPT_NAME} remove
 fi
 }
 
-- 
1.7.10.4



