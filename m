Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id C0C6D7C5F0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2019 20:12:36 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id z1so10549553ljb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2019 13:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=X2HzIyrGmM3iS/7C5eLO/hwG9NbiGXIt7NyevTYFmyU=;
	b=s3o+vYjoRYILI/w3eGZjEz7aHXZzcYep5aaRv9C4zTK2WgLCjHtFzIxd8SKSIUPPaG
	WiSrL9UXdCuVkkG9nt8z2p/BmGp4qTV+QEEfm46EhlZ2jRO1FTG22y4G5xdW5jhBKVot
	EVTat20zkNQGkFfbebmMaCmAGNDm5Ql+OrEOd/r2t5NzhNJXK7iCALdL2mWD8fw6ALV8
	7sfoUu9kR14OKuLcC+XsX6bzUAxFF/eOnRjsfiwUCA7KZYnXOUeyg8QSeTOF4L95QoSi
	+zK8QHOKC2e12LYx/mdBuNILn/b/sp/lUAdAZfgDRkz7ZWO5cLk4krwT9XhmMI/vVEX8
	B69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X2HzIyrGmM3iS/7C5eLO/hwG9NbiGXIt7NyevTYFmyU=;
	b=HaeVH83CAfFmpidAOLi4L+gbWd1VJCMWIJFt8cmEHv1HGtTcalaK6+EpnKoyVYjj50
	amBoBboW0ckCQA/amZnmPrjnRxjscGzP+8pXuXgptuPQmJ7+42PtoF2CrkrxrVFxLehJ
	R0gKBI9lzxEKVtMKmBaLkUALHMZL320RLIHrqvJksza4SP8Q4MRwK5akrV5S+MM2i8Cm
	jGdF4U1JpNgyEC1BNpReXkKWZN/zcGnHpGGhMfFH4cB1r6CNkl8pgoqj1EdiCCWaoI35
	jjrKKo2UdAHRjDJwtyHb5NGw9hrZlrMX2Z/FhJf1ta6SlpiW16rW6FLmwwJttYn0AL5d
	e4DA==
X-Gm-Message-State: APjAAAX2pDTo/DLIyuO2IgqjBvHpwh4IPcWQyyialu3t1hdSGFyW1aiG
	TFtSHlD3TFKjjxfmePQMO1AekfmtRzM=
X-Google-Smtp-Source: APXvYqz4EWY7sF61/BB4HTeNV1IzLElEpr+o6rnUzIUu693wBHruP7ysiZSTB6n2PFGtrVo9jHMscg==
X-Received: by 2002:a2e:7411:: with SMTP id p17mr18769257ljc.24.1558296756665; 
	Sun, 19 May 2019 13:12:36 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id n9sm42633ljj.10.2019.05.19.13.12.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 May 2019 13:12:35 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2019 22:12:33 +0200
Message-Id: <20190519201233.11108-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] opensaf: update to 5.19.03
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
X-List-Received-Date: Sun, 19 May 2019 20:12:39 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ch-std-ifstream-failure-by-reference.patch |  67 ------------
 ...0001-Fix-string-overflow-in-snprintf.patch |  76 -------------
 .../0002-Fix-format-truncation-errors.patch   | 100 ------------------
 ...-check-for-size-before-using-strncpy.patch |  33 ------
 ...{opensaf_5.19.01.bb => opensaf_5.19.03.bb} |   8 +-
 5 files changed, 2 insertions(+), 282 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-Catch-std-ifstream-failure-by-reference.patch
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-format-truncation-errors.patch
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0008-check-for-size-before-using-strncpy.patch
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.19.01.bb => opensaf_5.19.03.bb} (88%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Catch-std-ifstream-failure-by-reference.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Catch-std-ifstream-failure-by-reference.patch
deleted file mode 100644
index 30fdb8bf1..000000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Catch-std-ifstream-failure-by-reference.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 38c5343f84799fc5041575f3ec808f7476b6eea3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 16 Apr 2018 14:33:35 -0700
-Subject: [PATCH] Catch std::ifstream::failure by reference
-
-Fixes
-error: catching polymorphic type 'class std::ios_base::failure' by value
-[-Werror=catch-value=]
-   } catch (std::ofstream::failure) {
-                           ^~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/base/conf.cc           | 4 ++--
- src/dtm/dtmnd/dtm_main.cc  | 2 +-
- src/dtm/dtmnd/multicast.cc | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/base/conf.cc b/src/base/conf.cc
-index d5755a1..4820357 100644
---- a/src/base/conf.cc
-+++ b/src/base/conf.cc
-@@ -189,7 +189,7 @@ std::string Conf::ReadFile(const std::string& path_name,
-   try {
-     str.open(path_name);
-     str >> contents;
--  } catch (std::ifstream::failure) {
-+  } catch (std::ifstream::failure& e) {
-     contents.clear();
-   }
-   return (str.fail() || contents.empty()) ? default_contents : contents;
-@@ -203,7 +203,7 @@ void Conf::WriteFileAtomically(const std::string& path_name,
-   try {
-     str.open(tmp_file, std::ofstream::out | std::ofstream::trunc);
-     str << contents << std::endl;
--  } catch (std::ofstream::failure) {
-+  } catch (std::ofstream::failure& e) {
-     success = false;
-   }
-   str.close();
-diff --git a/src/dtm/dtmnd/dtm_main.cc b/src/dtm/dtmnd/dtm_main.cc
-index 585e11e..5cf6ad7 100644
---- a/src/dtm/dtmnd/dtm_main.cc
-+++ b/src/dtm/dtmnd/dtm_main.cc
-@@ -367,7 +367,7 @@ void UpdateNodeIdFile(DTM_INTERNODE_CB *cb) {
-       try {
-         str.open(PKGLOCALSTATEDIR "/node_id", std::ofstream::out);
-         str << std::hex << node_id << std::endl;
--      } catch (std::ofstream::failure) {
-+      } catch (std::ofstream::failure& e) {
-       }
-       str.close();
-     }
-diff --git a/src/dtm/dtmnd/multicast.cc b/src/dtm/dtmnd/multicast.cc
-index cadc002..7c25fea 100644
---- a/src/dtm/dtmnd/multicast.cc
-+++ b/src/dtm/dtmnd/multicast.cc
-@@ -199,7 +199,7 @@ bool Multicast::GetPeersFromFile(const std::string &path_name) {
-         }
-       }
-     }
--  } catch (std::ifstream::failure) {
-+  } catch (std::ifstream::failure& e) {
-     LOG_ER("Caught std::ifstream::failure when reading file '%s', peers=%zu",
-            path_name.c_str(), static_cast<size_t>(peers_.size()));
-     peers_.clear();
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch
deleted file mode 100644
index 93c75777f..000000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 88661a60629894353512c53ed32f2b901f64149c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 16 Apr 2018 18:29:17 -0700
-Subject: [PATCH] Fix string overflow in snprintf
-
-Fixes errors like
-error: '%s' dir
-ective output may be truncated writing up to 255 bytes into a region of size 32 [-Werror=forma
-t-truncation=]
-   snprintf(reinterpret_cast<char *>(Healthy.key), sizeof(Healthy.key), "%s",
-                                                                        ^~~~
-            hlth_str);
-            ~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/log/logd/lgs_util.cc           | 4 ++--
- src/rde/rded/rde_amf.cc            | 2 +-
- src/smf/smfd/SmfUpgradeCampaign.cc | 4 ++--
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/log/logd/lgs_util.cc b/src/log/logd/lgs_util.cc
-index ac93d5a..cce80f3 100644
---- a/src/log/logd/lgs_util.cc
-+++ b/src/log/logd/lgs_util.cc
-@@ -200,12 +200,12 @@ char *lgs_get_time(time_t *time_in) {
- 
-   stringSize = 5 * sizeof(char);
-   snprintf(srcString, (size_t)stringSize, "%d",
--           (timeStampData->tm_year + START_YEAR));
-+           (timeStampData->tm_year + START_YEAR) & 0x4dU);
- 
-   strncpy(timeStampString, srcString, stringSize);
- 
-   stringSize = 3 * sizeof(char);
--  snprintf(srcString, (size_t)stringSize, "%02d", (timeStampData->tm_mon + 1));
-+  snprintf(srcString, (size_t)stringSize, "%02d", (timeStampData->tm_mon + 1) & 0x2dU);
- 
-   strncat(timeStampString, srcString, stringSize);
- 
-diff --git a/src/rde/rded/rde_amf.cc b/src/rde/rded/rde_amf.cc
-index 81e521e..d53cc48 100644
---- a/src/rde/rded/rde_amf.cc
-+++ b/src/rde/rded/rde_amf.cc
-@@ -102,7 +102,7 @@ static uint32_t rde_amf_healthcheck_start(RDE_AMF_CB *rde_amf_cb) {
-   SaAmfHealthcheckKeyT Healthy;
-   SaNameT SaCompName;
-   char *phlth_ptr;
--  char hlth_str[256];
-+  char hlth_str[32];
- 
-   TRACE_ENTER();
- 
-diff --git a/src/smf/smfd/SmfUpgradeCampaign.cc b/src/smf/smfd/SmfUpgradeCampaign.cc
-index c30ea14..098f17a 100644
---- a/src/smf/smfd/SmfUpgradeCampaign.cc
-+++ b/src/smf/smfd/SmfUpgradeCampaign.cc
-@@ -447,7 +447,7 @@ SaAisErrorT SmfUpgradeCampaign::tooManyRestarts(bool *o_result) {
-   TRACE_ENTER();
-   SaAisErrorT rc = SA_AIS_OK;
-   SaImmAttrValuesT_2 **attributes;
--  int curCnt = 0;
-+  short int curCnt = 0;
- 
-   /* Read the SmfCampRestartInfo object smfCampRestartCnt attr */
-   std::string obj = "smfRestartInfo=info," +
-@@ -473,7 +473,7 @@ SaAisErrorT SmfUpgradeCampaign::tooManyRestarts(bool *o_result) {
-     attrsmfCampRestartCnt.SetAttributeName("smfCampRestartCnt");
-     attrsmfCampRestartCnt.SetAttributeType("SA_IMM_ATTR_SAUINT32T");
-     char buf[5];
--    snprintf(buf, 4, "%d", curCnt);
-+    snprintf(buf, 4, "%hd", curCnt);
-     attrsmfCampRestartCnt.AddAttributeValue(buf);
-     imoCampRestartInfo.AddValue(attrsmfCampRestartCnt);
- 
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-format-truncation-errors.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-format-truncation-errors.patch
deleted file mode 100644
index f98e28da9..000000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-format-truncation-errors.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From c5034fe42df8923bcefc10e163151997d70b6241 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 16 Apr 2018 14:56:47 -0700
-Subject: [PATCH] Fix format-truncation errors
-
-Fixes errors with gcc8 eg.
-error: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 254 [-Werror=format-truncation=]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/base/daemon.c  | 4 ++--
- src/mds/mds_c_db.c | 8 ++++----
- src/mds/mds_core.h | 4 ++--
- src/mds/mds_dt2c.h | 2 +-
- 4 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/src/base/daemon.c b/src/base/daemon.c
-index 361dd8d..4001b73 100644
---- a/src/base/daemon.c
-+++ b/src/base/daemon.c
-@@ -95,11 +95,11 @@ static int __create_pidfile(const char *pidfile)
- {
- 	FILE *file = NULL;
- 	int fd, rc = 0;
--	char pidfiletmp[NAME_MAX] = {0};
-+	char pidfiletmp[NAME_MAX+12] = {0};
- 	pid_t pid;
- 
- 	pid = getpid();
--	snprintf(pidfiletmp, NAME_MAX, "%s.%u.tmp", pidfile, pid);
-+	snprintf(pidfiletmp, NAME_MAX+12, "%s.%u.tmp", pidfile, pid);
- 
- 	/* open the file and associate a stream with it */
- 	if (((fd = open(pidfiletmp, O_RDWR | O_CREAT, 0644)) == -1) ||
-diff --git a/src/mds/mds_c_db.c b/src/mds/mds_c_db.c
-index e6b95cd..3d4a222 100644
---- a/src/mds/mds_c_db.c
-+++ b/src/mds/mds_c_db.c
-@@ -124,10 +124,10 @@ void get_adest_details(MDS_DEST adest, char *adest_details)
- 	}
- 
- 	if (remote == true)
--		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN,
-+		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN+24,
- 			 "<rem_nodeid[0x%" PRIx32 "]:%s>", ncs_node_id, process_name);
- 	else
--		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN,
-+		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN+24,
- 			 "<nodeid[0x%" PRIx32 "]:%s>", ncs_node_id, process_name);
- 
- 	m_MDS_LOG_DBG("MDS:DB: adest_details: %s ", adest_details);
-@@ -207,10 +207,10 @@ void get_subtn_adest_details(MDS_PWE_HDL pwe_hdl, MDS_SVC_ID svc_id,
- 	}
- 
- 	if (remote == true)
--		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN,
-+		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN+24,
- 			 "<rem_node[0x%" PRIx32 "]:%s>", ncs_node_id, process_name);
- 	else
--		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN,
-+		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN+24,
- 			 "<node[0x%" PRIx32 "]:%s>", ncs_node_id, process_name);
- done:
- 	m_MDS_LOG_DBG("MDS:DB: adest_details: %s ", adest_details);
-diff --git a/src/mds/mds_core.h b/src/mds/mds_core.h
-index 37696d4..7f5225d 100644
---- a/src/mds/mds_core.h
-+++ b/src/mds/mds_core.h
-@@ -163,7 +163,7 @@ typedef struct mds_subscription_results_info {
-   uint32_t msg_snd_cnt; /* Message send count to this destination */
-   uint32_t msg_rcv_cnt; /* Message rcv count from this destination */
-   char sub_adest_details
--      [MDS_MAX_PROCESS_NAME_LEN]; /* <node[slotno]:processname[pid]> */
-+      [MDS_MAX_PROCESS_NAME_LEN+24]; /* <node[slotno]:processname[pid]> */
- 
- } MDS_SUBSCRIPTION_RESULTS_INFO;
- 
-@@ -194,7 +194,7 @@ typedef struct mds_subscription_info {
-     count is grater than ZERO bcast (multi-unicast) */
-   uint32_t prev_ver_sub_count;
-   char sub_adest_details
--      [MDS_MAX_PROCESS_NAME_LEN]; /* <node[slotno]:processname[pid]> */
-+      [MDS_MAX_PROCESS_NAME_LEN+24]; /* <node[slotno]:processname[pid]> */
- 
- } MDS_SUBSCRIPTION_INFO;
- 
-diff --git a/src/mds/mds_dt2c.h b/src/mds/mds_dt2c.h
-index 012999c..006b722 100644
---- a/src/mds/mds_dt2c.h
-+++ b/src/mds/mds_dt2c.h
-@@ -143,7 +143,7 @@ typedef struct mdtm_send_req {
-                        */
-   MDS_DEST adest;      /* MDTM to do local/remote routing, destination adest */
-   char sub_adest_details
--      [MDS_MAX_PROCESS_NAME_LEN]; /* <node[nodeid]:processname[pid]> */
-+      [MDS_MAX_PROCESS_NAME_LEN+24]; /* <node[nodeid]:processname[pid]> */
-   MDS_SEND_PRIORITY_TYPE pri;
-   MDS_CLIENT_MSG_FORMAT_VER
-       msg_fmt_ver; /* message format version specification */
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0008-check-for-size-before-using-strncpy.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0008-check-for-size-before-using-strncpy.patch
deleted file mode 100644
index 497bb07d8..000000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0008-check-for-size-before-using-strncpy.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 29510dd81e3a5e96151afdb0702863cbfd640766 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 22 Jun 2018 18:58:59 -0700
-Subject: [PATCH] check for size before using strncpy
-
-ensures that size is never execeding the string length
-that execPath can hold
-
-Fixes
-error: '__builtin___strncpy_chk' specified size between 18446744071562067968 and 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Werror=stringop-overflow=]
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/imm/immnd/immnd_proc.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/imm/immnd/immnd_proc.c b/src/imm/immnd/immnd_proc.c
-index 015932a..c8f115e 100644
---- a/src/imm/immnd/immnd_proc.c
-+++ b/src/imm/immnd/immnd_proc.c
-@@ -1902,6 +1902,10 @@ static int immnd_forkPbe(IMMND_CB *cb)
- 		LOG_ER("Pathname too long: %u max is 1023", newLen);
- 		return -1;
- 	}
-+	if (execDirLen > 1023 || execDirLen < 0) {
-+		LOG_ER("Execdir name too long: %u max is 1023", execDirLen);
-+		return -1;
-+	}
- 
- 	strncpy(execPath, cb->mProgName, execDirLen);
- 	execPath[execDirLen] = 0;
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.01.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.03.bb
similarity index 88%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.19.01.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.19.03.bb
index 3e4d33e00..0cccebdfc 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.01.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.03.bb
@@ -24,13 +24,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-configure-Disable-format-overflow-if-supported-by-gc.patch \
            file://0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch \
            file://0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch \
-           file://0001-Catch-std-ifstream-failure-by-reference.patch \
-           file://0002-Fix-format-truncation-errors.patch \
-           file://0001-Fix-string-overflow-in-snprintf.patch \
-           file://0008-check-for-size-before-using-strncpy.patch \
            "
-SRC_URI[md5sum] = "d9f44f778e23cf739085f74c5ff793b1"
-SRC_URI[sha256sum] = "5713fbe21c557c9a992af6805bc44521f2cf6cf950ae873036d9a81c73364b60"
+SRC_URI[md5sum] = "4dd1497ccd82d275735853bf0db5c510"
+SRC_URI[sha256sum] = "de42c8dd850990716ca494ca598165cc7a23b5b7f2bc21af5d71a3d971ddd595"
 
 inherit autotools useradd systemd pkgconfig
 
-- 
2.17.1


