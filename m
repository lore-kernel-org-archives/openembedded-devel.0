Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D72FCD0A5
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 03:58:26 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6585.1773806304537134933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 20:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xvn8LPfW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773806304; x=1805342304;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bm4vBVHXXtpizrKq3U8rpkCrDtKhuAuGnznxibX5JH8=;
  b=Xvn8LPfWmOBEfeyaflH6VmlgtkO7jkl7DgYNXM96RQ/OcupRmEvUGrhl
   tIBUXaZp8XOHatdbCHZBOPdZaH0D5p/BEUtabuYiJPr1IZuLaSkaZtRm/
   uETF8sLbMwspz0KbjyMbCfD71mbjU0Li7dLrjI9+VnHevmWqcfu/xYV18
   nUERhk++Xf1wWTts+IpAhllVaTX2QYhPJimHar56T6mn/A4J30lDO4G3x
   c2fgRi4Y+JpR6+itsSq62LhLeypBJK+CmjFzYjSpakFzokB1nVWRbEBZM
   J/sx2E9gKA8ygMwgQXRh/yDnLwLhbU+qhDhte3gg2Ct0jQYgA9LzKb+GV
   g==;
X-CSE-ConnectionGUID: kPgZE9vmRZ2DKdZtd6+edQ==
X-CSE-MsgGUID: 8NUehEnqTDOY90LHLMtUhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="233675024"
X-IronPort-AV: E=Sophos;i="6.23,126,1770562800"; 
   d="scan'208";a="233675024"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 12:58:22 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B85675C02
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 03:58:22 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 675EA1C000D1
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 03:58:22 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id D7EF01800504
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 03:58:19 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] opensaf: upgrade 5.22.01 -> 5.26.02
Date: Wed, 18 Mar 2026 11:58:16 +0800
Message-ID: <20260318035816.12478-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 03:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125339

1.Add new patch 0001-To-fix-Werror-discarded-qualifiers-error.patch to fix build error

2.Remove following patches as merged upstream
  0001-Fix-build-with-fno-common.patch
  0001-include-missing-array-header.patch
  0001-include-cstdint-for-uintXX_t-types.patch
  0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../0001-Fix-build-with-fno-common.patch      | 311 ------------------
 ...ix-Werror-discarded-qualifiers-error.patch |  81 +++++
 ...1-include-cstdint-for-uintXX_t-types.patch |  43 ---
 .../0001-include-missing-array-header.patch   |  32 --
 ...-Werror-enum-int-mismatch-with-gcc13.patch |  61 ----
 ...{opensaf_5.22.01.bb => opensaf_5.26.02.bb} |   7 +-
 6 files changed, 83 insertions(+), 452 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-build-with-fno-common.patch
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-To-fix-Werror-discarded-qualifiers-error.patch
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-include-cstdint-for-uintXX_t-types.patch
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-include-missing-array-header.patch
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.22.01.bb => opensaf_5.26.02.bb} (92%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-build-with-fno-common.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-build-with-fno-common.patch
deleted file mode 100644
index b581c571bb..0000000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-build-with-fno-common.patch
+++ /dev/null
@@ -1,311 +0,0 @@
-From 9a46462f08535e946d97fd40c79229a7ee8b7336 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 Aug 2020 00:00:00 -0700
-Subject: [PATCH] Fix build with -fno-common
-
-Mark the declarations with extern where needed in header files
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/ckpt/agent/cpa_cb.h   |  2 +-
- src/ckpt/ckptd/cpd_init.h |  2 +-
- src/evt/agent/eda.h       |  2 +-
- src/evt/evtd/eds.h        |  2 +-
- src/evt/evtd/eds_amf.c    |  2 ++
- src/evt/evtd/eds_amf.h    |  2 +-
- src/evt/evtd/eds_cb.h     |  2 +-
- src/imm/immd/immd.h       |  2 +-
- src/lck/lckd/gld_dl_api.h |  4 ++--
- src/lck/lcknd/glnd_cb.h   |  4 ++--
- src/mds/mds_core.h        | 34 +++++++++++++++++++---------------
- src/mds/mds_dt_tcp.c      |  2 ++
- src/mds/mds_dt_tcp.h      |  2 +-
- src/mds/mds_main.c        |  2 +-
- src/msg/msgnd/mqnd_db.h   |  2 +-
- 15 files changed, 37 insertions(+), 29 deletions(-)
-
-diff --git a/src/ckpt/agent/cpa_cb.h b/src/ckpt/agent/cpa_cb.h
-index ac48c6c..d633583 100644
---- a/src/ckpt/agent/cpa_cb.h
-+++ b/src/ckpt/agent/cpa_cb.h
-@@ -119,7 +119,7 @@ typedef struct cpa_cb {
- 
- } CPA_CB;
- 
--uint32_t gl_cpa_hdl;
-+extern uint32_t gl_cpa_hdl;
- 
- typedef struct cpa_prcess_evt_sync {
-   NCS_QELEM qelem;
-diff --git a/src/ckpt/ckptd/cpd_init.h b/src/ckpt/ckptd/cpd_init.h
-index 0c02642..cf3466b 100644
---- a/src/ckpt/ckptd/cpd_init.h
-+++ b/src/ckpt/ckptd/cpd_init.h
-@@ -33,7 +33,7 @@
- #include <saAmf.h>
- #include "cpd_cb.h"
- 
--uint32_t gl_cpd_cb_hdl;
-+extern uint32_t gl_cpd_cb_hdl;
- 
- /* Macro to get the component name for the component type */
- #define m_CPD_TASKNAME "CPD"
-diff --git a/src/evt/agent/eda.h b/src/evt/agent/eda.h
-index 4d1991c..138c910 100644
---- a/src/evt/agent/eda.h
-+++ b/src/evt/agent/eda.h
-@@ -39,7 +39,7 @@
- #include "base/logtrace.h"
- 
- /* EDA CB global handle declaration */
--uint32_t gl_eda_hdl;
-+extern uint32_t gl_eda_hdl;
- 
- /* EDA Default MDS timeout value */
- #define EDA_MDS_DEF_TIMEOUT 100
-diff --git a/src/evt/evtd/eds.h b/src/evt/evtd/eds.h
-index bc9c429..3545d77 100644
---- a/src/evt/evtd/eds.h
-+++ b/src/evt/evtd/eds.h
-@@ -72,6 +72,6 @@
- #include "base/daemon.h"
- 
- /* EDS CB global handle declaration */
--uint32_t gl_eds_hdl;
-+extern uint32_t gl_eds_hdl;
- 
- #endif  // EVT_EVTD_EDS_H_
-diff --git a/src/evt/evtd/eds_amf.c b/src/evt/evtd/eds_amf.c
-index 97b71a5..adebf0c 100644
---- a/src/evt/evtd/eds_amf.c
-+++ b/src/evt/evtd/eds_amf.c
-@@ -30,6 +30,8 @@ stuff.
- #include "eds.h"
- #include "eds_dl_api.h"
- 
-+struct next_HAState nextStateInfo;
-+
- /* HA AMF statemachine & State handler definitions */
- 
- /****************************************************************************
-diff --git a/src/evt/evtd/eds_amf.h b/src/evt/evtd/eds_amf.h
-index e9aeaa6..f9803b4 100644
---- a/src/evt/evtd/eds_amf.h
-+++ b/src/evt/evtd/eds_amf.h
-@@ -49,7 +49,7 @@ uint32_t eds_quiesced_state_handler(EDS_CB *cb, SaInvocationT invocation);
- struct next_HAState {
-   uint8_t nextState1;
-   uint8_t nextState2;
--} nextStateInfo; /* AMF HA state can transit to a maximum of the two defined
-+}; /* AMF HA state can transit to a maximum of the two defined
-                     states */
- 
- #define VALIDATE_STATE(curr, next)                  \
-diff --git a/src/evt/evtd/eds_cb.h b/src/evt/evtd/eds_cb.h
-index c127ead..19c48cd 100644
---- a/src/evt/evtd/eds_cb.h
-+++ b/src/evt/evtd/eds_cb.h
-@@ -40,7 +40,7 @@
- #include "base/ncssysf_tmr.h"
- 
- /* global variables */
--uint32_t gl_eds_hdl;
-+extern uint32_t gl_eds_hdl;
- 
- struct eda_reg_list_tag;
- 
-diff --git a/src/imm/immd/immd.h b/src/imm/immd/immd.h
-index 7dc1da6..bab3945 100644
---- a/src/imm/immd/immd.h
-+++ b/src/imm/immd/immd.h
-@@ -42,7 +42,7 @@
- #include "immd_sbedu.h"
- #include "base/ncs_mda_pvt.h"
- 
--IMMD_CB *immd_cb;
-+extern IMMD_CB *immd_cb;
- 
- extern uint32_t initialize_for_assignment(IMMD_CB *cb, SaAmfHAStateT ha_state);
- 
-diff --git a/src/lck/lckd/gld_dl_api.h b/src/lck/lckd/gld_dl_api.h
-index 6476a71..3a67fd1 100644
---- a/src/lck/lckd/gld_dl_api.h
-+++ b/src/lck/lckd/gld_dl_api.h
-@@ -33,7 +33,7 @@
- #include "base/ncsgl_defs.h"
- #include "base/ncs_lib.h"
- 
--uint32_t gl_gld_hdl;
--uint32_t gld_lib_req(NCS_LIB_REQ_INFO *req_info);
-+extern uint32_t gl_gld_hdl;
-+extern uint32_t gld_lib_req(NCS_LIB_REQ_INFO *req_info);
- 
- #endif  // LCK_LCKD_GLD_DL_API_H_
-diff --git a/src/lck/lcknd/glnd_cb.h b/src/lck/lcknd/glnd_cb.h
-index 3b82f60..77a1f88 100644
---- a/src/lck/lcknd/glnd_cb.h
-+++ b/src/lck/lcknd/glnd_cb.h
-@@ -28,8 +28,8 @@ extern "C" {
- #endif
- 
- /* global variables */
--uint32_t gl_glnd_hdl;
--NCSCONTEXT gl_glnd_task_hdl;
-+extern uint32_t gl_glnd_hdl;
-+extern NCSCONTEXT gl_glnd_task_hdl;
- 
- /* macros for the global varibales */
- #define m_GLND_RETRIEVE_GLND_CB_HDL gl_glnd_hdl
-diff --git a/src/mds/mds_core.h b/src/mds/mds_core.h
-index dad62cd..ed69d3a 100644
---- a/src/mds/mds_core.h
-+++ b/src/mds/mds_core.h
-@@ -26,6 +26,10 @@
- #ifndef MDS_MDS_CORE_H_
- #define MDS_MDS_CORE_H_
- 
-+#ifndef EXTERN
-+#define EXTERN extern
-+#endif
-+
- #include <pthread.h>
- #include "base/ncsgl_defs.h"
- #include "mds/mds_papi.h"
-@@ -600,65 +604,65 @@ extern "C" {
- /* ******************************************** */
- 
- /* Initialization of MDTM Module */
--uint32_t (*mds_mdtm_init)(NODE_ID node_id, uint32_t *mds_tipc_ref);
-+EXTERN uint32_t (*mds_mdtm_init)(NODE_ID node_id, uint32_t *mds_tipc_ref);
- 
- /* Destroying the MDTM Module*/
--uint32_t (*mds_mdtm_destroy)(void);
-+EXTERN uint32_t (*mds_mdtm_destroy)(void);
- 
--uint32_t (*mds_mdtm_send)(MDTM_SEND_REQ *req);
-+EXTERN uint32_t (*mds_mdtm_send)(MDTM_SEND_REQ *req);
- 
- /* SVC Install */
--uint32_t (*mds_mdtm_svc_install)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
-+EXTERN uint32_t (*mds_mdtm_svc_install)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
-                                  NCSMDS_SCOPE_TYPE install_scope,
-                                  V_DEST_RL role, MDS_VDEST_ID vdest_id,
-                                  NCS_VDEST_TYPE vdest_policy,
-                                  MDS_SVC_PVT_SUB_PART_VER mds_svc_pvt_ver);
- 
- /* SVC Uninstall */
--uint32_t (*mds_mdtm_svc_uninstall)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
-+EXTERN uint32_t (*mds_mdtm_svc_uninstall)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
-                                    NCSMDS_SCOPE_TYPE install_scope,
-                                    V_DEST_RL role, MDS_VDEST_ID vdest_id,
-                                    NCS_VDEST_TYPE vdest_policy,
-                                    MDS_SVC_PVT_SUB_PART_VER mds_svc_pvt_ver);
- 
- /* SVC Subscribe */
--uint32_t (*mds_mdtm_svc_subscribe)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
-+EXTERN uint32_t (*mds_mdtm_svc_subscribe)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
-                                    NCSMDS_SCOPE_TYPE subscribe_scope,
-                                    MDS_SVC_HDL local_svc_hdl,
-                                    MDS_SUBTN_REF_VAL *subtn_ref_val);
- 
- /*  added svc_hdl */
- /* SVC Unsubscribe */
--uint32_t (*mds_mdtm_svc_unsubscribe)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
-+EXTERN uint32_t (*mds_mdtm_svc_unsubscribe)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
-                                      NCSMDS_SCOPE_TYPE subscribe_scope,
-                                      MDS_SUBTN_REF_VAL subtn_ref_val);
- 
- /* VDEST Install */
--uint32_t (*mds_mdtm_vdest_install)(MDS_VDEST_ID vdest_id);
-+EXTERN uint32_t (*mds_mdtm_vdest_install)(MDS_VDEST_ID vdest_id);
- 
- /* VDEST Uninstall */
--uint32_t (*mds_mdtm_vdest_uninstall)(MDS_VDEST_ID vdest_id);
-+EXTERN uint32_t (*mds_mdtm_vdest_uninstall)(MDS_VDEST_ID vdest_id);
- 
- /* VDEST Subscribe */
--uint32_t (*mds_mdtm_vdest_subscribe)(MDS_VDEST_ID vdest_id,
-+EXTERN uint32_t (*mds_mdtm_vdest_subscribe)(MDS_VDEST_ID vdest_id,
-                                      MDS_SUBTN_REF_VAL *subtn_ref_val);
- 
- /* VDEST Unsubscribe */
--uint32_t (*mds_mdtm_vdest_unsubscribe)(MDS_VDEST_ID vdest_id,
-+EXTERN uint32_t (*mds_mdtm_vdest_unsubscribe)(MDS_VDEST_ID vdest_id,
-                                        MDS_SUBTN_REF_VAL subtn_ref_val);
- 
- /* Tx Register (For incrementing the use count) */
--uint32_t (*mds_mdtm_tx_hdl_register)(MDS_DEST adest);
-+EXTERN uint32_t (*mds_mdtm_tx_hdl_register)(MDS_DEST adest);
- 
- /* Tx Unregister (For decrementing the use count) */
--uint32_t (*mds_mdtm_tx_hdl_unregister)(MDS_DEST adest);
-+EXTERN uint32_t (*mds_mdtm_tx_hdl_unregister)(MDS_DEST adest);
- 
- /* Node subscription */
--uint32_t (*mds_mdtm_node_subscribe)(MDS_SVC_HDL svc_hdl,
-+EXTERN uint32_t (*mds_mdtm_node_subscribe)(MDS_SVC_HDL svc_hdl,
-                                     MDS_SUBTN_REF_VAL *subtn_ref_val);
- 
- /* Node unsubscription */
--uint32_t (*mds_mdtm_node_unsubscribe)(MDS_SUBTN_REF_VAL subtn_ref_val);
-+EXTERN uint32_t (*mds_mdtm_node_unsubscribe)(MDS_SUBTN_REF_VAL subtn_ref_val);
- 
- #ifdef __cplusplus
- }
-diff --git a/src/mds/mds_dt_tcp.c b/src/mds/mds_dt_tcp.c
-index 4a37246..e73cef4 100644
---- a/src/mds/mds_dt_tcp.c
-+++ b/src/mds/mds_dt_tcp.c
-@@ -70,6 +70,8 @@ NCS_PATRICIA_TREE mdtm_reassembly_list;
- 
- /* Get the pid of the process */
- pid_t mdtm_pid;
-+  
-+MDTM_TCP_CB *tcp_cb;
- 
- static void mds_mdtm_enc_init(MDS_MDTM_DTM_MSG *init, uint8_t *buff);
- static uint32_t mdtm_create_rcv_task(void);
-diff --git a/src/mds/mds_dt_tcp.h b/src/mds/mds_dt_tcp.h
-index 1065464..350d534 100644
---- a/src/mds/mds_dt_tcp.h
-+++ b/src/mds/mds_dt_tcp.h
-@@ -50,7 +50,7 @@ typedef struct mdtm_tcp_cb {
- 
- } MDTM_TCP_CB;
- 
--MDTM_TCP_CB *tcp_cb;
-+extern MDTM_TCP_CB *tcp_cb;
- 
- typedef enum mds_mdtm_dtm_msg_types {
-   MDS_MDTM_DTM_PID_TYPE = 1,
-diff --git a/src/mds/mds_main.c b/src/mds/mds_main.c
-index 0bcb2f9..5671ed3 100644
---- a/src/mds/mds_main.c
-+++ b/src/mds/mds_main.c
-@@ -20,7 +20,7 @@
- #endif
- 
- #include "osaf/configmake.h"
--
-+#define EXTERN
- /*****************************************************************************
- ..............................................................................
- 
-diff --git a/src/msg/msgnd/mqnd_db.h b/src/msg/msgnd/mqnd_db.h
-index b78024e..fee43e5 100644
---- a/src/msg/msgnd/mqnd_db.h
-+++ b/src/msg/msgnd/mqnd_db.h
-@@ -33,7 +33,7 @@
- #include <saClm.h>
- #include <saImmOi.h>
- /* Decleration for global variable */
--uint32_t gl_mqnd_cb_hdl;
-+extern uint32_t gl_mqnd_cb_hdl;
- 
- /* Macros for reading global database */
- #define m_MQND_STORE_HDL(hdl) (gl_mqnd_cb_hdl = (hdl))
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-To-fix-Werror-discarded-qualifiers-error.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-To-fix-Werror-discarded-qualifiers-error.patch
new file mode 100644
index 0000000000..d27c783cde
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-To-fix-Werror-discarded-qualifiers-error.patch
@@ -0,0 +1,81 @@
+From ac79c1da91f51b10059a266bf4db068a01963b01 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Wed, 18 Mar 2026 03:35:16 +0000
+Subject: [PATCH] To fix [-Werror=discarded-qualifiers] error to build with glibc 2.43
+
+| ../sources/opensaf-5.22.01/src/osaf/immutil/immutil.c:339:12: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+|   339 |         cp = strstr(buffer, key);
+
+Upstream-Status: Pending
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ src/amf/common/util.c      | 8 ++++----
+ src/ckpt/ckptd/cpd_imm.c   | 4 ++--
+ src/osaf/immutil/immutil.c | 2 +-
+ 3 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/amf/common/util.c b/src/amf/common/util.c
+index d17b766..56c1a50 100644
+--- a/src/amf/common/util.c
++++ b/src/amf/common/util.c
+@@ -252,8 +252,8 @@ void avsv_sanamet_init_from_association_dn(const SaNameT *haystack, SaNameT *dn,
+ 					   const char *needle,
+ 					   const char *parent)
+ {
+-	char *p;
+-	char *pp;
++	const char *p;
++	const char *pp;
+ 	int i = 0;
+ 
+ 	osaf_extended_name_clear(dn);
+@@ -270,8 +270,8 @@ void avsv_sanamet_init_from_association_dn(const SaNameT *haystack, SaNameT *dn,
+ 
+ 	/* copy the value upto parent but skip escape chars */
+ 	int size = 0;
+-	char *p1 = p;
+-	char *pp1 = pp;
++	const char *p1 = p;
++	const char *pp1 = pp;
+ 	while (p != pp) {
+ 		if (*p != '\\')
+ 			size++;
+diff --git a/src/ckpt/ckptd/cpd_imm.c b/src/ckpt/ckptd/cpd_imm.c
+index e2dee0c..7c25d02 100644
+--- a/src/ckpt/ckptd/cpd_imm.c
++++ b/src/ckpt/ckptd/cpd_imm.c
+@@ -117,7 +117,7 @@ cpd_saImmOiRtAttrUpdateCallback(SaImmOiHandleT immOiHandle,
+ 	/* Extract ckpt_name and node_name */
+ 	if (strncmp(object_name, "safReplica=", 11) == 0) {
+ 		/* Extract ckpt_name */
+-		char *p_char = strchr(object_name, ',');
++		const char *p_char = strchr(object_name, ',');
+ 		if (p_char) {
+ 			p_char++; /* escaping first ',' of the associated class
+ 				     DN name */
+@@ -657,7 +657,7 @@ SaAisErrorT create_runtime_ckpt_object(CPD_CKPT_INFO_NODE *ckpt_node,
+ 	SaNameT parentName;
+ 	SaAisErrorT rc = SA_AIS_OK;
+ 	char *dndup = strdup(ckpt_node->ckpt_name);
+-	char *parent_name = strchr(ckpt_node->ckpt_name, ',');
++	const char *parent_name = strchr(ckpt_node->ckpt_name, ',');
+ 	char *rdnstr;
+ 	const SaImmAttrValuesT_2 *attrValues[7];
+ 	SaImmAttrValueT dn[1], create_time[1], creat_flags[1], max_sections[1],
+diff --git a/src/osaf/immutil/immutil.c b/src/osaf/immutil/immutil.c
+index 1ca1fbb..d3a5b63 100644
+--- a/src/osaf/immutil/immutil.c
++++ b/src/osaf/immutil/immutil.c
+@@ -336,7 +336,7 @@ char const *immutil_getStringValue(char const *key, SaNameT const *name)
+ 	klen = strlen(key);
+ 	assert(klen > 1 || key[klen - 1] == '=');
+ 
+-	cp = strstr(buffer, key);
++	cp = (char*)strstr(buffer, key);
+ 	while (cp != NULL) {
+ 		if (cp == buffer || cp[-1] == ',') {
+ 			char *value = cp + klen;
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-include-cstdint-for-uintXX_t-types.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-include-cstdint-for-uintXX_t-types.patch
deleted file mode 100644
index e36d4e0cdc..0000000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-include-cstdint-for-uintXX_t-types.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 225891675b80beaa9d74ce56809e52c4451df72c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 25 Jan 2023 21:46:22 -0800
-Subject: [PATCH 1/2] include cstdint for uintXX_t types
-
-GCC-13 needs it [1]
-
-[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/imm/immnd/ImmModel.h           | 1 +
- src/osaf/consensus/consensus_env.h | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/imm/immnd/ImmModel.h b/src/imm/immnd/ImmModel.h
-index 44da470..0660431 100644
---- a/src/imm/immnd/ImmModel.h
-+++ b/src/imm/immnd/ImmModel.h
-@@ -22,6 +22,7 @@
- #include <saImmOm.h>
- #include <cstdarg>
- #include <sys/types.h>
-+#include <cstdint>
- #include <string>
- #include <vector>
- #include <map>
-diff --git a/src/osaf/consensus/consensus_env.h b/src/osaf/consensus/consensus_env.h
-index df4f93a..89ccf46 100644
---- a/src/osaf/consensus/consensus_env.h
-+++ b/src/osaf/consensus/consensus_env.h
-@@ -15,6 +15,7 @@
- #ifndef OSAF_CONSENSUS_CONSENSUS_ENV_H_
- #define OSAF_CONSENSUS_CONSENSUS_ENV_H_
- 
-+#include <cstdint>
- #include <string>
- #include "base/mutex.h"
- 
--- 
-2.39.1
-
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-include-missing-array-header.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-include-missing-array-header.patch
deleted file mode 100644
index e735d432a7..0000000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-include-missing-array-header.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6168d43ddd353b92ad8bcd5c49dc68f18caa8a00 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 12 Apr 2022 17:07:49 -0700
-Subject: [PATCH 1/2] include missing <array> header
-
-Fixes
-src/osaf/consensus/key_value.cc:25:30: error: aggregate 'std::array<char, 128> buffer' has incomplete type and cannot be defined
-   25 |   std::array<char, buf_size> buffer;
-      |                              ^~~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/osaf/consensus/key_value.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/osaf/consensus/key_value.cc b/src/osaf/consensus/key_value.cc
-index 692dd3f..6e16cbf 100644
---- a/src/osaf/consensus/key_value.cc
-+++ b/src/osaf/consensus/key_value.cc
-@@ -18,7 +18,7 @@
- #include "base/getenv.h"
- #include "base/logtrace.h"
- #include "osaf/consensus/consensus.h"
--
-+#include <array>
- int KeyValue::Execute(const std::string& command, std::string& output) {
-   TRACE_ENTER();
-   constexpr size_t buf_size = 128;
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch
deleted file mode 100644
index a6aa2c3d07..0000000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 5e5686de677c884d5d785254412ced3c9d2d1b08 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 25 Jan 2023 21:47:45 -0800
-Subject: [PATCH 2/2] Fix -Werror=enum-int-mismatch with gcc13
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/evt/agent/eda_hdl.h | 5 +++--
- src/evt/evtd/eds_mds.h  | 3 +--
- src/smf/smfnd/smfnd.h   | 8 ++++----
- 3 files changed, 8 insertions(+), 8 deletions(-)
-
---- a/src/evt/agent/eda_hdl.h
-+++ b/src/evt/agent/eda_hdl.h
-@@ -31,6 +31,7 @@
- #define EVT_AGENT_EDA_HDL_H_
- 
- #include "evt/agent/eda.h"
-+#include "ais/include/saAis.h"
- 
- uint32_t eda_hdl_cbk_dispatch(EDA_CB *, EDA_CLIENT_HDL_REC *, SaDispatchFlagsT);
- 
-@@ -68,11 +69,11 @@ EDA_CHANNEL_HDL_REC *eda_find_chan_hdl_r
- 
- void eda_msg_destroy(EDSV_MSG *msg);
- 
--uint32_t eda_extract_pattern_from_event(
-+SaAisErrorT eda_extract_pattern_from_event(
-     SaEvtEventPatternArrayT *from_pattern_array,
-     SaEvtEventPatternArrayT **to_pattern_array);
- 
--uint32_t eda_allocate_and_extract_pattern_from_event(
-+SaAisErrorT eda_allocate_and_extract_pattern_from_event(
-     SaEvtEventPatternArrayT *from_pattern_array,
-     SaEvtEventPatternArrayT **to_pattern_array);
- 
---- a/src/evt/evtd/eds_mds.h
-+++ b/src/evt/evtd/eds_mds.h
-@@ -49,8 +49,7 @@ uint32_t eds_mds_msg_send(EDS_CB *cb, ED
-                           MDS_SEND_PRIORITY_TYPE prio);
- 
- uint32_t eds_mds_ack_send(EDS_CB *cb, EDSV_MSG *msg, MDS_DEST dest,
--                          SaTimeT timeout, MDS_SEND_PRIORITY_TYPE prio);
--
-+                          SaTimeT timeout, uint32_t prio);
- uint32_t eds_dec_subscribe_msg(NCS_UBAID *uba, long msg_hdl, uint8_t ckpt_flag);
- 
- uint32_t eds_dec_publish_msg(NCS_UBAID *uba, long msg_hdl, uint8_t ckpt_flag);
---- a/src/smf/smfnd/smfnd.h
-+++ b/src/smf/smfnd/smfnd.h
-@@ -76,7 +76,7 @@ extern "C" {
- #endif
- 
- /* smfnd_amf.c */
--extern uint32_t smfnd_amf_init(smfnd_cb_t *cb);
-+extern SaAisErrorT smfnd_amf_init(smfnd_cb_t *cb);
- 
- /* smfnd_mds.c */
- extern uint32_t smfnd_mds_init(smfnd_cb_t *cb);
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.26.02.bb
similarity index 92%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.26.02.bb
index 3dd950c720..eede11515b 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.26.02.bb
@@ -26,14 +26,11 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch \
            file://0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch \
            file://0001-immom_python-convert-to-python3.patch \
-           file://0001-Fix-build-with-fno-common.patch \
            file://0001-Use-correct-printf-format-for-__fsblkcnt_t.patch \
-           file://0001-include-missing-array-header.patch \
            file://0002-configure-Disable-selected-warnings.patch \
-           file://0001-include-cstdint-for-uintXX_t-types.patch \
-           file://0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch \
+           file://0001-To-fix-Werror-discarded-qualifiers-error.patch \
            "
-SRC_URI[sha256sum] = "f008d53c83087ce2014c6089bc4ef08e14c1b4091298b943f4ceade1aa6bf61e"
+SRC_URI[sha256sum] = "c51603bc486ce6db271a7023a75963bfc6f277f4d4486df2fe004a51c81cfdee"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/opensaf/files/releases"
 
-- 
2.43.0


