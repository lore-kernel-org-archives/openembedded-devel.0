Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id C91A374553
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 07:25:44 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g14so11757643pfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 00:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/tGs6fSSjLqrIH6FgFGPmzEeJEXBBfivpyGvSp6DHj8=;
	b=Q1awV5iVQkwHGMu04zujLhzYlbfJV4XSrpHasII6gbBf+r1GdKgZULZ5ncs80uCtU7
	OA2xnM0OC9P5Py2VtM8w+8PirDtN3155GtjY79uSUvW/Pcw9WmWH/T9oZIomiJmXhkE9
	OxiZMKyJF+DyQZBk/dUpoIdgrGbV9wu4m4w2mXPQwWdCNR5Znt8VDyafnD3Y5hLt7IR9
	VmVMSAOzmuvxOAcAEzGOvAcZn3Hi8JUVGGRWTkoyBQOikSQniOhZSihurZP14y9MfbiA
	FnB9lMSU2ygv0/SrEnzf4fNW8un1OxbJqwRn+yQyrsJl7AqxFvP7EFgSVaZqImuqp+w7
	awjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/tGs6fSSjLqrIH6FgFGPmzEeJEXBBfivpyGvSp6DHj8=;
	b=mPbR3YdvzeVuexmllHXUMZrA9I8Dl2B2wJKn4Q8/fMO4mkxcx4AXe5eDtUCiC+kJN+
	91gH3a4xKe+vuBOpMei1myfY/gIM6yxPAkxcLDJ3GwhD4QjI5cL3YIPaTbOQGBc/Kq9v
	JcOp2EXYFtKbVtgOVGhgI6j4zMhBhhV5MiAz15QX9IQVFkYZNyl5ZnBw5ZiKrv24juyf
	i+vMlKZxfDe2FY9p5oL/Wrc38EtyuAzAFLMOlEHPVGjv3OsQgmBfyrr4Lpxcot4AyCu8
	D2DdOrSn8Irgk8nRPiUfPgMEq6GaBXKdLwqAzPwmrUdOc9f594UwtT6Qq/p+K0yrXOR9
	ykrw==
X-Gm-Message-State: ALQs6tA+FXXbpSOCA9+aUfRWiq7+OtkVv+Vm8Z4x+XYteC+rZkcv/nHU
	G42nuNaK5tAHFcue58Oa1juKlQ==
X-Google-Smtp-Source: AIpwx49XnTsuHXXpmNmTd7XkH6i6xHrs9UQZwh7x84LSOrxY151VbjZZ41cjUsehwZivgER/1wSCyg==
X-Received: by 10.99.45.2 with SMTP id t2mr882400pgt.356.1523949945323;
	Tue, 17 Apr 2018 00:25:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	t25sm22832313pfh.184.2018.04.17.00.25.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Apr 2018 00:25:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Apr 2018 00:25:35 -0700
Message-Id: <20180417072535.18114-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180417072535.18114-1-raj.khem@gmail.com>
References: <20180417072535.18114-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] opensaf: Fix warnings found with gcc8
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
X-List-Received-Date: Tue, 17 Apr 2018 07:25:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ch-std-ifstream-failure-by-reference.patch |  69 ++++++++++++
 ...0001-Fix-string-overflow-in-snprintf.patch |  75 +++++++++++++
 .../0002-Fix-format-truncation-errors.patch   | 102 ++++++++++++++++++
 .../opensaf/opensaf_5.18.02.bb                |   5 +-
 4 files changed, 250 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-Catch-std-ifstream-failure-by-reference.patch
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-format-truncation-errors.patch

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Catch-std-ifstream-failure-by-reference.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Catch-std-ifstream-failure-by-reference.patch
new file mode 100644
index 000000000..8f8dba054
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Catch-std-ifstream-failure-by-reference.patch
@@ -0,0 +1,69 @@
+From 77d50b8d92ef1903cbc50d8f39e05fc828696bb9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Apr 2018 14:33:35 -0700
+Subject: [PATCH 1/2] Catch std::ifstream::failure by reference
+
+Fixes
+error: catching polymorphic type 'class std::ios_base::failure' by value
+[-Werror=catch-value=]
+   } catch (std::ofstream::failure) {
+                           ^~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/base/conf.cc           | 4 ++--
+ src/dtm/dtmnd/dtm_main.cc  | 2 +-
+ src/dtm/dtmnd/multicast.cc | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/base/conf.cc b/src/base/conf.cc
+index d5755a1..4820357 100644
+--- a/src/base/conf.cc
++++ b/src/base/conf.cc
+@@ -189,7 +189,7 @@ std::string Conf::ReadFile(const std::string& path_name,
+   try {
+     str.open(path_name);
+     str >> contents;
+-  } catch (std::ifstream::failure) {
++  } catch (std::ifstream::failure& e) {
+     contents.clear();
+   }
+   return (str.fail() || contents.empty()) ? default_contents : contents;
+@@ -203,7 +203,7 @@ void Conf::WriteFileAtomically(const std::string& path_name,
+   try {
+     str.open(tmp_file, std::ofstream::out | std::ofstream::trunc);
+     str << contents << std::endl;
+-  } catch (std::ofstream::failure) {
++  } catch (std::ofstream::failure& e) {
+     success = false;
+   }
+   str.close();
+diff --git a/src/dtm/dtmnd/dtm_main.cc b/src/dtm/dtmnd/dtm_main.cc
+index 3260a81..a55afac 100644
+--- a/src/dtm/dtmnd/dtm_main.cc
++++ b/src/dtm/dtmnd/dtm_main.cc
+@@ -359,7 +359,7 @@ void UpdateNodeIdFile(DTM_INTERNODE_CB *cb) {
+       try {
+         str.open(PKGLOCALSTATEDIR "/node_id", std::ofstream::out);
+         str << std::hex << node_id << std::endl;
+-      } catch (std::ofstream::failure) {
++      } catch (std::ofstream::failure& e) {
+       }
+       str.close();
+     }
+diff --git a/src/dtm/dtmnd/multicast.cc b/src/dtm/dtmnd/multicast.cc
+index bf67b9c..7232066 100644
+--- a/src/dtm/dtmnd/multicast.cc
++++ b/src/dtm/dtmnd/multicast.cc
+@@ -198,7 +198,7 @@ bool Multicast::GetPeersFromFile(const std::string &path_name) {
+         }
+       }
+     }
+-  } catch (std::ifstream::failure) {
++  } catch (std::ifstream::failure& e) {
+     LOG_ER("Caught std::ifstream::failure when reading file '%s', peers=%zu",
+            path_name.c_str(), static_cast<size_t>(peers_.size()));
+     peers_.clear();
+-- 
+2.17.0
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch
new file mode 100644
index 000000000..428e46228
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch
@@ -0,0 +1,75 @@
+From 8cf323a2d8e02ca0bd36deb38e613c6edac546ad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Apr 2018 18:29:17 -0700
+Subject: [PATCH] Fix string overflow in snprintf
+
+Fixes errors like
+error: '%s' dir
+ective output may be truncated writing up to 255 bytes into a region of size 32 [-Werror=forma
+t-truncation=]
+   snprintf(reinterpret_cast<char *>(Healthy.key), sizeof(Healthy.key), "%s",
+                                                                        ^~~~
+            hlth_str);
+            ~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/log/logd/lgs_util.cc           | 4 ++--
+ src/rde/rded/rde_amf.cc            | 2 +-
+ src/smf/smfd/SmfUpgradeCampaign.cc | 4 ++--
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/log/logd/lgs_util.cc b/src/log/logd/lgs_util.cc
+index ac93d5a..cce80f3 100644
+--- a/src/log/logd/lgs_util.cc
++++ b/src/log/logd/lgs_util.cc
+@@ -200,12 +200,12 @@ char *lgs_get_time(time_t *time_in) {
+ 
+   stringSize = 5 * sizeof(char);
+   snprintf(srcString, (size_t)stringSize, "%d",
+-           (timeStampData->tm_year + START_YEAR));
++           (timeStampData->tm_year + START_YEAR) & 0x4dU);
+ 
+   strncpy(timeStampString, srcString, stringSize);
+ 
+   stringSize = 3 * sizeof(char);
+-  snprintf(srcString, (size_t)stringSize, "%02d", (timeStampData->tm_mon + 1));
++  snprintf(srcString, (size_t)stringSize, "%02d", (timeStampData->tm_mon + 1) & 0x2dU);
+ 
+   strncat(timeStampString, srcString, stringSize);
+ 
+diff --git a/src/rde/rded/rde_amf.cc b/src/rde/rded/rde_amf.cc
+index 81e521e..d53cc48 100644
+--- a/src/rde/rded/rde_amf.cc
++++ b/src/rde/rded/rde_amf.cc
+@@ -102,7 +102,7 @@ static uint32_t rde_amf_healthcheck_start(RDE_AMF_CB *rde_amf_cb) {
+   SaAmfHealthcheckKeyT Healthy;
+   SaNameT SaCompName;
+   char *phlth_ptr;
+-  char hlth_str[256];
++  char hlth_str[32];
+ 
+   TRACE_ENTER();
+ 
+diff --git a/src/smf/smfd/SmfUpgradeCampaign.cc b/src/smf/smfd/SmfUpgradeCampaign.cc
+index 45cdce8..6761bcf 100644
+--- a/src/smf/smfd/SmfUpgradeCampaign.cc
++++ b/src/smf/smfd/SmfUpgradeCampaign.cc
+@@ -447,7 +447,7 @@ SaAisErrorT SmfUpgradeCampaign::tooManyRestarts(bool *o_result) {
+   TRACE_ENTER();
+   SaAisErrorT rc = SA_AIS_OK;
+   SaImmAttrValuesT_2 **attributes;
+-  int curCnt = 0;
++  short int curCnt = 0;
+ 
+   /* Read the SmfCampRestartInfo object smfCampRestartCnt attr */
+   std::string obj = "smfRestartInfo=info," +
+@@ -473,7 +473,7 @@ SaAisErrorT SmfUpgradeCampaign::tooManyRestarts(bool *o_result) {
+     attrsmfCampRestartCnt.setName("smfCampRestartCnt");
+     attrsmfCampRestartCnt.setType("SA_IMM_ATTR_SAUINT32T");
+     char buf[5];
+-    snprintf(buf, 4, "%d", curCnt);
++    snprintf(buf, 4, "%hd", curCnt);
+     attrsmfCampRestartCnt.addValue(buf);
+     imoCampRestartInfo.addValue(attrsmfCampRestartCnt);
+ 
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-format-truncation-errors.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-format-truncation-errors.patch
new file mode 100644
index 000000000..9865a5e1b
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-format-truncation-errors.patch
@@ -0,0 +1,102 @@
+From 4d58d26cbd3622183afc2e8f85c9c81edaf135df Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Apr 2018 14:56:47 -0700
+Subject: [PATCH 2/2] Fix format-truncation errors
+
+Fixes errors with gcc8 eg.
+error: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 254 [-Werror=format-truncation=]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/base/daemon.c  | 4 ++--
+ src/mds/mds_c_db.c | 8 ++++----
+ src/mds/mds_core.h | 4 ++--
+ src/mds/mds_dt2c.h | 2 +-
+ 4 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/base/daemon.c b/src/base/daemon.c
+index 27170d7..da97700 100644
+--- a/src/base/daemon.c
++++ b/src/base/daemon.c
+@@ -92,11 +92,11 @@ static int __create_pidfile(const char *pidfile)
+ {
+ 	FILE *file = NULL;
+ 	int fd, rc = 0;
+-	char pidfiletmp[NAME_MAX] = {0};
++	char pidfiletmp[NAME_MAX+12] = {0};
+ 	pid_t pid;
+ 
+ 	pid = getpid();
+-	snprintf(pidfiletmp, NAME_MAX, "%s.%u.tmp", pidfile, pid);
++	snprintf(pidfiletmp, NAME_MAX+12, "%s.%u.tmp", pidfile, pid);
+ 
+ 	/* open the file and associate a stream with it */
+ 	if (((fd = open(pidfiletmp, O_RDWR | O_CREAT, 0644)) == -1) ||
+diff --git a/src/mds/mds_c_db.c b/src/mds/mds_c_db.c
+index e6b95cd..3d4a222 100644
+--- a/src/mds/mds_c_db.c
++++ b/src/mds/mds_c_db.c
+@@ -124,10 +124,10 @@ void get_adest_details(MDS_DEST adest, char *adest_details)
+ 	}
+ 
+ 	if (remote == true)
+-		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN,
++		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN+24,
+ 			 "<rem_nodeid[0x%" PRIx32 "]:%s>", ncs_node_id, process_name);
+ 	else
+-		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN,
++		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN+24,
+ 			 "<nodeid[0x%" PRIx32 "]:%s>", ncs_node_id, process_name);
+ 
+ 	m_MDS_LOG_DBG("MDS:DB: adest_details: %s ", adest_details);
+@@ -207,10 +207,10 @@ void get_subtn_adest_details(MDS_PWE_HDL pwe_hdl, MDS_SVC_ID svc_id,
+ 	}
+ 
+ 	if (remote == true)
+-		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN,
++		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN+24,
+ 			 "<rem_node[0x%" PRIx32 "]:%s>", ncs_node_id, process_name);
+ 	else
+-		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN,
++		snprintf(adest_details, MDS_MAX_PROCESS_NAME_LEN+24,
+ 			 "<node[0x%" PRIx32 "]:%s>", ncs_node_id, process_name);
+ done:
+ 	m_MDS_LOG_DBG("MDS:DB: adest_details: %s ", adest_details);
+diff --git a/src/mds/mds_core.h b/src/mds/mds_core.h
+index 37696d4..7f5225d 100644
+--- a/src/mds/mds_core.h
++++ b/src/mds/mds_core.h
+@@ -163,7 +163,7 @@ typedef struct mds_subscription_results_info {
+   uint32_t msg_snd_cnt; /* Message send count to this destination */
+   uint32_t msg_rcv_cnt; /* Message rcv count from this destination */
+   char sub_adest_details
+-      [MDS_MAX_PROCESS_NAME_LEN]; /* <node[slotno]:processname[pid]> */
++      [MDS_MAX_PROCESS_NAME_LEN+24]; /* <node[slotno]:processname[pid]> */
+ 
+ } MDS_SUBSCRIPTION_RESULTS_INFO;
+ 
+@@ -194,7 +194,7 @@ typedef struct mds_subscription_info {
+     count is grater than ZERO bcast (multi-unicast) */
+   uint32_t prev_ver_sub_count;
+   char sub_adest_details
+-      [MDS_MAX_PROCESS_NAME_LEN]; /* <node[slotno]:processname[pid]> */
++      [MDS_MAX_PROCESS_NAME_LEN+24]; /* <node[slotno]:processname[pid]> */
+ 
+ } MDS_SUBSCRIPTION_INFO;
+ 
+diff --git a/src/mds/mds_dt2c.h b/src/mds/mds_dt2c.h
+index 012999c..006b722 100644
+--- a/src/mds/mds_dt2c.h
++++ b/src/mds/mds_dt2c.h
+@@ -143,7 +143,7 @@ typedef struct mdtm_send_req {
+                        */
+   MDS_DEST adest;      /* MDTM to do local/remote routing, destination adest */
+   char sub_adest_details
+-      [MDS_MAX_PROCESS_NAME_LEN]; /* <node[nodeid]:processname[pid]> */
++      [MDS_MAX_PROCESS_NAME_LEN+24]; /* <node[nodeid]:processname[pid]> */
+   MDS_SEND_PRIORITY_TYPE pri;
+   MDS_CLIENT_MSG_FORMAT_VER
+       msg_fmt_ver; /* message format version specification */
+-- 
+2.17.0
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb
index 4b556ce8c..1a7d00ee3 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb
@@ -24,7 +24,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-configure-Disable-format-overflow-if-supported-by-gc.patch \
            file://0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch \
            file://0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch \
-"
+           file://0001-Catch-std-ifstream-failure-by-reference.patch \
+           file://0002-Fix-format-truncation-errors.patch \
+           file://0001-Fix-string-overflow-in-snprintf.patch \
+           "
 SRC_URI[md5sum] = "42064f5ddbc7f560bfc5ff93ea9eecc7"
 SRC_URI[sha256sum] = "f9e24897f9cfd63bb3115f6275c706de1702d3d9bae2fc423227db72b23c37f0"
 
-- 
2.17.0


