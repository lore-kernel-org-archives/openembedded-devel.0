Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.46392.1597679615252618842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 08:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dAZmk/N6;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id y6so7740868plt.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2020 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DdZNi10f6Jk8BWiMHHCnfORsPCcm0bA8g+gL6EJ+BTo=;
        b=dAZmk/N65y9XyZfFOGiE8X/dK4MRkrhJ+a56Bin2zOriP6oRa9BhGoRKP7qyb3h1PV
         mcEein8tVOtOVG7YoNyQg1FeExwekkkSr15PoYVKKhw42wOZ3XrJ1ddeJ8jCYwhCXFyB
         nYQvZxrkDWNoOvcd+MyULbRJLRBbOdNSDuAjMrfuQrhDgSixhcXTLLwI5uCJmqBEJj7j
         uWreMI7kpTCxmUJKN9oCfzstpqhniyC4Z7PNbFhZcY+Z7Nrv2Q5QvnI82UhM+Kw3FOpP
         ZDU3/spicnyTBoPGZW74CBeQ4ExtF3wCY3Uhs7V670OZlvDD+j/wclj/9zjsg5ahElDD
         TjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DdZNi10f6Jk8BWiMHHCnfORsPCcm0bA8g+gL6EJ+BTo=;
        b=HlTi3hyXlqWx3ovu2PG8+R+J4fSJczfgXtKbE5HUssq4CA6eRBTQ7hFhxeMxc1v9Rg
         M0ulV0gEkvVOqcUD8RvuX9gtbUuoTaLfKluzqj2aacKQWeo8hYLPs0InHm8acyJXFf7y
         JmMk+VEaA6WbkKC1jDfVC+paboNHTF5BtgROI/Iridp7qJnmybFV8C3ERhdhPPagAov/
         IPVsZHblc6s5UsHPcdyIcpxVXL7Z7LCNGAzYVGQUU7ZBzvEtyzN+hUNK9xRycp5fhHtQ
         X1UiRexFQQLGae5yrNSbvwWYTy/OPAPkiXns60M5YXeuw0w2jA7hXSzN5ePhEix7Cmpz
         bAdg==
X-Gm-Message-State: AOAM531zsYr9CoUYrg5TdiJY+X0gPrAVtNEUXnGvIJ4yMcAotZ9HDkan
	xKx63ryu4oBKrxRr8bWcPR6qfGra9TwuEQ==
X-Google-Smtp-Source: ABdhPJwD+q4QYSoOoad4Ys/yG/yp6yjSWtVf0gkKvO+I/28NXW+dccF3h4w5uJg+nr7xnaxyNFLYpQ==
X-Received: by 2002:a17:90a:df11:: with SMTP id gp17mr13322157pjb.140.1597679613994;
        Mon, 17 Aug 2020 08:53:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id z126sm20625879pfc.94.2020.08.17.08.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 08:53:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] opensaf: Fix build with -fno-common
Date: Mon, 17 Aug 2020 08:53:28 -0700
Message-Id: <20200817155329.1872891-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817155329.1872891-1-raj.khem@gmail.com>
References: <20200817155329.1872891-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-with-fno-common.patch      | 311 ++++++++++++++++++
 .../opensaf/opensaf_5.20.05.bb                |   1 +
 2 files changed, 312 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-build-with-fno-common.patch

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-build-with-fno-common.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-build-with-fno-common.patch
new file mode 100644
index 0000000000..b581c571bb
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-build-with-fno-common.patch
@@ -0,0 +1,311 @@
+From 9a46462f08535e946d97fd40c79229a7ee8b7336 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Aug 2020 00:00:00 -0700
+Subject: [PATCH] Fix build with -fno-common
+
+Mark the declarations with extern where needed in header files
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ckpt/agent/cpa_cb.h   |  2 +-
+ src/ckpt/ckptd/cpd_init.h |  2 +-
+ src/evt/agent/eda.h       |  2 +-
+ src/evt/evtd/eds.h        |  2 +-
+ src/evt/evtd/eds_amf.c    |  2 ++
+ src/evt/evtd/eds_amf.h    |  2 +-
+ src/evt/evtd/eds_cb.h     |  2 +-
+ src/imm/immd/immd.h       |  2 +-
+ src/lck/lckd/gld_dl_api.h |  4 ++--
+ src/lck/lcknd/glnd_cb.h   |  4 ++--
+ src/mds/mds_core.h        | 34 +++++++++++++++++++---------------
+ src/mds/mds_dt_tcp.c      |  2 ++
+ src/mds/mds_dt_tcp.h      |  2 +-
+ src/mds/mds_main.c        |  2 +-
+ src/msg/msgnd/mqnd_db.h   |  2 +-
+ 15 files changed, 37 insertions(+), 29 deletions(-)
+
+diff --git a/src/ckpt/agent/cpa_cb.h b/src/ckpt/agent/cpa_cb.h
+index ac48c6c..d633583 100644
+--- a/src/ckpt/agent/cpa_cb.h
++++ b/src/ckpt/agent/cpa_cb.h
+@@ -119,7 +119,7 @@ typedef struct cpa_cb {
+ 
+ } CPA_CB;
+ 
+-uint32_t gl_cpa_hdl;
++extern uint32_t gl_cpa_hdl;
+ 
+ typedef struct cpa_prcess_evt_sync {
+   NCS_QELEM qelem;
+diff --git a/src/ckpt/ckptd/cpd_init.h b/src/ckpt/ckptd/cpd_init.h
+index 0c02642..cf3466b 100644
+--- a/src/ckpt/ckptd/cpd_init.h
++++ b/src/ckpt/ckptd/cpd_init.h
+@@ -33,7 +33,7 @@
+ #include <saAmf.h>
+ #include "cpd_cb.h"
+ 
+-uint32_t gl_cpd_cb_hdl;
++extern uint32_t gl_cpd_cb_hdl;
+ 
+ /* Macro to get the component name for the component type */
+ #define m_CPD_TASKNAME "CPD"
+diff --git a/src/evt/agent/eda.h b/src/evt/agent/eda.h
+index 4d1991c..138c910 100644
+--- a/src/evt/agent/eda.h
++++ b/src/evt/agent/eda.h
+@@ -39,7 +39,7 @@
+ #include "base/logtrace.h"
+ 
+ /* EDA CB global handle declaration */
+-uint32_t gl_eda_hdl;
++extern uint32_t gl_eda_hdl;
+ 
+ /* EDA Default MDS timeout value */
+ #define EDA_MDS_DEF_TIMEOUT 100
+diff --git a/src/evt/evtd/eds.h b/src/evt/evtd/eds.h
+index bc9c429..3545d77 100644
+--- a/src/evt/evtd/eds.h
++++ b/src/evt/evtd/eds.h
+@@ -72,6 +72,6 @@
+ #include "base/daemon.h"
+ 
+ /* EDS CB global handle declaration */
+-uint32_t gl_eds_hdl;
++extern uint32_t gl_eds_hdl;
+ 
+ #endif  // EVT_EVTD_EDS_H_
+diff --git a/src/evt/evtd/eds_amf.c b/src/evt/evtd/eds_amf.c
+index 97b71a5..adebf0c 100644
+--- a/src/evt/evtd/eds_amf.c
++++ b/src/evt/evtd/eds_amf.c
+@@ -30,6 +30,8 @@ stuff.
+ #include "eds.h"
+ #include "eds_dl_api.h"
+ 
++struct next_HAState nextStateInfo;
++
+ /* HA AMF statemachine & State handler definitions */
+ 
+ /****************************************************************************
+diff --git a/src/evt/evtd/eds_amf.h b/src/evt/evtd/eds_amf.h
+index e9aeaa6..f9803b4 100644
+--- a/src/evt/evtd/eds_amf.h
++++ b/src/evt/evtd/eds_amf.h
+@@ -49,7 +49,7 @@ uint32_t eds_quiesced_state_handler(EDS_CB *cb, SaInvocationT invocation);
+ struct next_HAState {
+   uint8_t nextState1;
+   uint8_t nextState2;
+-} nextStateInfo; /* AMF HA state can transit to a maximum of the two defined
++}; /* AMF HA state can transit to a maximum of the two defined
+                     states */
+ 
+ #define VALIDATE_STATE(curr, next)                  \
+diff --git a/src/evt/evtd/eds_cb.h b/src/evt/evtd/eds_cb.h
+index c127ead..19c48cd 100644
+--- a/src/evt/evtd/eds_cb.h
++++ b/src/evt/evtd/eds_cb.h
+@@ -40,7 +40,7 @@
+ #include "base/ncssysf_tmr.h"
+ 
+ /* global variables */
+-uint32_t gl_eds_hdl;
++extern uint32_t gl_eds_hdl;
+ 
+ struct eda_reg_list_tag;
+ 
+diff --git a/src/imm/immd/immd.h b/src/imm/immd/immd.h
+index 7dc1da6..bab3945 100644
+--- a/src/imm/immd/immd.h
++++ b/src/imm/immd/immd.h
+@@ -42,7 +42,7 @@
+ #include "immd_sbedu.h"
+ #include "base/ncs_mda_pvt.h"
+ 
+-IMMD_CB *immd_cb;
++extern IMMD_CB *immd_cb;
+ 
+ extern uint32_t initialize_for_assignment(IMMD_CB *cb, SaAmfHAStateT ha_state);
+ 
+diff --git a/src/lck/lckd/gld_dl_api.h b/src/lck/lckd/gld_dl_api.h
+index 6476a71..3a67fd1 100644
+--- a/src/lck/lckd/gld_dl_api.h
++++ b/src/lck/lckd/gld_dl_api.h
+@@ -33,7 +33,7 @@
+ #include "base/ncsgl_defs.h"
+ #include "base/ncs_lib.h"
+ 
+-uint32_t gl_gld_hdl;
+-uint32_t gld_lib_req(NCS_LIB_REQ_INFO *req_info);
++extern uint32_t gl_gld_hdl;
++extern uint32_t gld_lib_req(NCS_LIB_REQ_INFO *req_info);
+ 
+ #endif  // LCK_LCKD_GLD_DL_API_H_
+diff --git a/src/lck/lcknd/glnd_cb.h b/src/lck/lcknd/glnd_cb.h
+index 3b82f60..77a1f88 100644
+--- a/src/lck/lcknd/glnd_cb.h
++++ b/src/lck/lcknd/glnd_cb.h
+@@ -28,8 +28,8 @@ extern "C" {
+ #endif
+ 
+ /* global variables */
+-uint32_t gl_glnd_hdl;
+-NCSCONTEXT gl_glnd_task_hdl;
++extern uint32_t gl_glnd_hdl;
++extern NCSCONTEXT gl_glnd_task_hdl;
+ 
+ /* macros for the global varibales */
+ #define m_GLND_RETRIEVE_GLND_CB_HDL gl_glnd_hdl
+diff --git a/src/mds/mds_core.h b/src/mds/mds_core.h
+index dad62cd..ed69d3a 100644
+--- a/src/mds/mds_core.h
++++ b/src/mds/mds_core.h
+@@ -26,6 +26,10 @@
+ #ifndef MDS_MDS_CORE_H_
+ #define MDS_MDS_CORE_H_
+ 
++#ifndef EXTERN
++#define EXTERN extern
++#endif
++
+ #include <pthread.h>
+ #include "base/ncsgl_defs.h"
+ #include "mds/mds_papi.h"
+@@ -600,65 +604,65 @@ extern "C" {
+ /* ******************************************** */
+ 
+ /* Initialization of MDTM Module */
+-uint32_t (*mds_mdtm_init)(NODE_ID node_id, uint32_t *mds_tipc_ref);
++EXTERN uint32_t (*mds_mdtm_init)(NODE_ID node_id, uint32_t *mds_tipc_ref);
+ 
+ /* Destroying the MDTM Module*/
+-uint32_t (*mds_mdtm_destroy)(void);
++EXTERN uint32_t (*mds_mdtm_destroy)(void);
+ 
+-uint32_t (*mds_mdtm_send)(MDTM_SEND_REQ *req);
++EXTERN uint32_t (*mds_mdtm_send)(MDTM_SEND_REQ *req);
+ 
+ /* SVC Install */
+-uint32_t (*mds_mdtm_svc_install)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
++EXTERN uint32_t (*mds_mdtm_svc_install)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
+                                  NCSMDS_SCOPE_TYPE install_scope,
+                                  V_DEST_RL role, MDS_VDEST_ID vdest_id,
+                                  NCS_VDEST_TYPE vdest_policy,
+                                  MDS_SVC_PVT_SUB_PART_VER mds_svc_pvt_ver);
+ 
+ /* SVC Uninstall */
+-uint32_t (*mds_mdtm_svc_uninstall)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
++EXTERN uint32_t (*mds_mdtm_svc_uninstall)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
+                                    NCSMDS_SCOPE_TYPE install_scope,
+                                    V_DEST_RL role, MDS_VDEST_ID vdest_id,
+                                    NCS_VDEST_TYPE vdest_policy,
+                                    MDS_SVC_PVT_SUB_PART_VER mds_svc_pvt_ver);
+ 
+ /* SVC Subscribe */
+-uint32_t (*mds_mdtm_svc_subscribe)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
++EXTERN uint32_t (*mds_mdtm_svc_subscribe)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
+                                    NCSMDS_SCOPE_TYPE subscribe_scope,
+                                    MDS_SVC_HDL local_svc_hdl,
+                                    MDS_SUBTN_REF_VAL *subtn_ref_val);
+ 
+ /*  added svc_hdl */
+ /* SVC Unsubscribe */
+-uint32_t (*mds_mdtm_svc_unsubscribe)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
++EXTERN uint32_t (*mds_mdtm_svc_unsubscribe)(PW_ENV_ID pwe_id, MDS_SVC_ID svc_id,
+                                      NCSMDS_SCOPE_TYPE subscribe_scope,
+                                      MDS_SUBTN_REF_VAL subtn_ref_val);
+ 
+ /* VDEST Install */
+-uint32_t (*mds_mdtm_vdest_install)(MDS_VDEST_ID vdest_id);
++EXTERN uint32_t (*mds_mdtm_vdest_install)(MDS_VDEST_ID vdest_id);
+ 
+ /* VDEST Uninstall */
+-uint32_t (*mds_mdtm_vdest_uninstall)(MDS_VDEST_ID vdest_id);
++EXTERN uint32_t (*mds_mdtm_vdest_uninstall)(MDS_VDEST_ID vdest_id);
+ 
+ /* VDEST Subscribe */
+-uint32_t (*mds_mdtm_vdest_subscribe)(MDS_VDEST_ID vdest_id,
++EXTERN uint32_t (*mds_mdtm_vdest_subscribe)(MDS_VDEST_ID vdest_id,
+                                      MDS_SUBTN_REF_VAL *subtn_ref_val);
+ 
+ /* VDEST Unsubscribe */
+-uint32_t (*mds_mdtm_vdest_unsubscribe)(MDS_VDEST_ID vdest_id,
++EXTERN uint32_t (*mds_mdtm_vdest_unsubscribe)(MDS_VDEST_ID vdest_id,
+                                        MDS_SUBTN_REF_VAL subtn_ref_val);
+ 
+ /* Tx Register (For incrementing the use count) */
+-uint32_t (*mds_mdtm_tx_hdl_register)(MDS_DEST adest);
++EXTERN uint32_t (*mds_mdtm_tx_hdl_register)(MDS_DEST adest);
+ 
+ /* Tx Unregister (For decrementing the use count) */
+-uint32_t (*mds_mdtm_tx_hdl_unregister)(MDS_DEST adest);
++EXTERN uint32_t (*mds_mdtm_tx_hdl_unregister)(MDS_DEST adest);
+ 
+ /* Node subscription */
+-uint32_t (*mds_mdtm_node_subscribe)(MDS_SVC_HDL svc_hdl,
++EXTERN uint32_t (*mds_mdtm_node_subscribe)(MDS_SVC_HDL svc_hdl,
+                                     MDS_SUBTN_REF_VAL *subtn_ref_val);
+ 
+ /* Node unsubscription */
+-uint32_t (*mds_mdtm_node_unsubscribe)(MDS_SUBTN_REF_VAL subtn_ref_val);
++EXTERN uint32_t (*mds_mdtm_node_unsubscribe)(MDS_SUBTN_REF_VAL subtn_ref_val);
+ 
+ #ifdef __cplusplus
+ }
+diff --git a/src/mds/mds_dt_tcp.c b/src/mds/mds_dt_tcp.c
+index 4a37246..e73cef4 100644
+--- a/src/mds/mds_dt_tcp.c
++++ b/src/mds/mds_dt_tcp.c
+@@ -70,6 +70,8 @@ NCS_PATRICIA_TREE mdtm_reassembly_list;
+ 
+ /* Get the pid of the process */
+ pid_t mdtm_pid;
++  
++MDTM_TCP_CB *tcp_cb;
+ 
+ static void mds_mdtm_enc_init(MDS_MDTM_DTM_MSG *init, uint8_t *buff);
+ static uint32_t mdtm_create_rcv_task(void);
+diff --git a/src/mds/mds_dt_tcp.h b/src/mds/mds_dt_tcp.h
+index 1065464..350d534 100644
+--- a/src/mds/mds_dt_tcp.h
++++ b/src/mds/mds_dt_tcp.h
+@@ -50,7 +50,7 @@ typedef struct mdtm_tcp_cb {
+ 
+ } MDTM_TCP_CB;
+ 
+-MDTM_TCP_CB *tcp_cb;
++extern MDTM_TCP_CB *tcp_cb;
+ 
+ typedef enum mds_mdtm_dtm_msg_types {
+   MDS_MDTM_DTM_PID_TYPE = 1,
+diff --git a/src/mds/mds_main.c b/src/mds/mds_main.c
+index 0bcb2f9..5671ed3 100644
+--- a/src/mds/mds_main.c
++++ b/src/mds/mds_main.c
+@@ -20,7 +20,7 @@
+ #endif
+ 
+ #include "osaf/configmake.h"
+-
++#define EXTERN
+ /*****************************************************************************
+ ..............................................................................
+ 
+diff --git a/src/msg/msgnd/mqnd_db.h b/src/msg/msgnd/mqnd_db.h
+index b78024e..fee43e5 100644
+--- a/src/msg/msgnd/mqnd_db.h
++++ b/src/msg/msgnd/mqnd_db.h
+@@ -33,7 +33,7 @@
+ #include <saClm.h>
+ #include <saImmOi.h>
+ /* Decleration for global variable */
+-uint32_t gl_mqnd_cb_hdl;
++extern uint32_t gl_mqnd_cb_hdl;
+ 
+ /* Macros for reading global database */
+ #define m_MQND_STORE_HDL(hdl) (gl_mqnd_cb_hdl = (hdl))
+-- 
+2.28.0
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.20.05.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.20.05.bb
index f11df49f86..bd972e3466 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.20.05.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.20.05.bb
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Add-configure-time-check-for-gettid-API.patch \
            file://0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch \
            file://0001-immom_python-convert-to-python3.patch \
+           file://0001-Fix-build-with-fno-common.patch \
            "
 SRC_URI[md5sum] = "d56bacf4c234c134e60e9b25f6f26671"
 SRC_URI[sha256sum] = "2478e298c0bce3b2cfdeb20875022cc11d7d3b53ecd3255422d22eb64c04953b"
-- 
2.28.0

