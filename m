Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 330B47D697
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 21:50:44 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id w37so20121437edw.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2019 14:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9E+su9dofb3H3JxW6V4hjzrsYYvvXatq8XBcvpWzGs4=;
	b=wH0wdjgbUx/3ooeZtllifdId65TS4QhwvWPCQheJiNLG8VKcl4XbCoWQy8DnzAqNdo
	IZN6/OI6fFA04ObSIxwx2PgzIfqKbLSqFMGFplxbRMp8lcth2wj3fD4VliJgSR6VjPya
	HN5Jw4Hai2VDRu9tzsSJW+fZiS1ofceWPqVHyUg0HB91hJOZQ6PhLE8xAuDsR+VR/zEb
	XMYrOvAIjTXuR7lm8G/mlzQeCPEPaPbMBTu1nRzN2c9pC9ZRSN6FhpsSFm5cvz2E6bv6
	4Ztc8FBRWNPsYHFJRZ2MQChEjGmpcRVWL7n1qX9MRR7N8+9hYIYucX8WwLvpS1VJRg57
	K7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9E+su9dofb3H3JxW6V4hjzrsYYvvXatq8XBcvpWzGs4=;
	b=AVOphhHUWTa2YpkpyazTHVbSFhthat2s+Mgvog40dpXg7Fp6hYBHKp7UWG5vZvxLn2
	l+Rw+PaJ1CI6U8uYy/vwWA1CNlgs3/p1qDOIPMrqUmTJy6kjGmEwGaN9M+3MQNBzrUeV
	mzwpYCiQCxEzJH5eFjAkhjLOQXn6F4vTAqDztmwKI+DQehBqB8Igw2JCNTULf0AUNcp0
	jaH5dvJX7VNjPnv/kBMfKSaIdmVGlLiJL6CDDeMt5TDOWZrr8nGE2dplJP/j0ANZk9DI
	tyfJI96eYCUE1qCNLA1wZDgTF8LNm0EP5/o/YtGgP+bhfflCnrh7sOMrcO7HOqbnVeVh
	CfGw==
X-Gm-Message-State: APjAAAW+YbtkAfdOmCbrCk3IUfr7eTCMqVAzGPHL6QPzOmCqsKB6o3ZV
	LrbSHypoboqls5zKkl25S1+hL8+0H4U=
X-Google-Smtp-Source: APXvYqzpN7DGk8+eDAtXmuZiavc0zztLqPc4cYaSmZvxPYJjMBCd3ZvqA3EkEbs/XCvS7yfSHPrN4g==
X-Received: by 2002:a17:906:1906:: with SMTP id
	a6mr27248047eje.236.1557265845137; 
	Tue, 07 May 2019 14:50:45 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z10sm2349566ejg.36.2019.05.07.14.50.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 14:50:44 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2019 23:50:42 +0200
Message-Id: <20190507215042.1760-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] libnetfilter-queue: fix update to 1.0.3
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
X-List-Received-Date: Tue, 07 May 2019 21:50:45 -0000

SRC_URI was mistakenly not updated in @57967659f4724a8b614f.

Removed patch was upstreamed. Another one was refreshed with devtool.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...the-location-of-internal.h-in-includ.patch | 26 ------
 ...define-visivility-attribute-together.patch | 88 +++++++++----------
 .../libnetfilter/libnetfilter-queue_1.0.3.bb  |  4 +-
 3 files changed, 44 insertions(+), 74 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/libnetfilter/files/0001-Correct-typo-in-the-location-of-internal.h-in-includ.patch

diff --git a/meta-networking/recipes-filter/libnetfilter/files/0001-Correct-typo-in-the-location-of-internal.h-in-includ.patch b/meta-networking/recipes-filter/libnetfilter/files/0001-Correct-typo-in-the-location-of-internal.h-in-includ.patch
deleted file mode 100644
index 76d2d5d28..000000000
--- a/meta-networking/recipes-filter/libnetfilter/files/0001-Correct-typo-in-the-location-of-internal.h-in-includ.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 32af64e1811c74292891dc4dc8455736f7d33ccf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 30 Mar 2017 13:26:56 -0700
-Subject: [PATCH] Correct typo in the location of internal.h in #include
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libnetfilter_queue.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libnetfilter_queue.c b/src/libnetfilter_queue.c
-index 211a8ba..065d618 100644
---- a/src/libnetfilter_queue.c
-+++ b/src/libnetfilter_queue.c
-@@ -32,7 +32,7 @@
- 
- #include <libnfnetlink/libnfnetlink.h>
- #include <libnetfilter_queue/libnetfilter_queue.h>
--#include "src/internal.h"
-+#include "internal.h"
- 
- /**
-  * \mainpage
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-queue-Declare-the-define-visivility-attribute-together.patch b/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-queue-Declare-the-define-visivility-attribute-together.patch
index 946f1b71d..aa9ff09a9 100644
--- a/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-queue-Declare-the-define-visivility-attribute-together.patch
+++ b/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-queue-Declare-the-define-visivility-attribute-together.patch
@@ -1,4 +1,4 @@
-From 06562244ac4a1a61e1a2c6b219a517658f7349bf Mon Sep 17 00:00:00 2001
+From db7eb5f0a4e78c6bd3c4f9cbd8332d909eb82ad6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 10 Apr 2017 12:09:41 -0700
 Subject: [PATCH] Declare the define visivility attribute together
@@ -9,16 +9,17 @@ symbols become hidden and consumers of this library
 fail to link due to these missing symbols
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  doxygen.cfg.in           |   2 +-
- src/extra/ipv4.c         |  15 +++----
+ src/extra/ipv4.c         |  15 ++----
  src/extra/ipv6.c         |   9 ++--
- src/extra/pktbuff.c      |  42 ++++++------------
- src/extra/tcp.c          |  21 +++------
- src/extra/udp.c          |  21 +++------
- src/internal.h           |   5 +--
- src/libnetfilter_queue.c | 108 ++++++++++++++++-------------------------------
- src/nlmsg.c              |  21 +++------
+ src/extra/pktbuff.c      |  42 +++++----------
+ src/extra/tcp.c          |  21 +++-----
+ src/extra/udp.c          |  21 +++-----
+ src/internal.h           |   5 +-
+ src/libnetfilter_queue.c | 108 +++++++++++++--------------------------
+ src/nlmsg.c              |  21 +++-----
  9 files changed, 82 insertions(+), 162 deletions(-)
 
 diff --git a/doxygen.cfg.in b/doxygen.cfg.in
@@ -592,7 +593,7 @@ index 558d267..79b0752 100644
  
  struct iphdr;
 diff --git a/src/libnetfilter_queue.c b/src/libnetfilter_queue.c
-index 065d618..ab0b66b 100644
+index 673e3b0..c12f068 100644
 --- a/src/libnetfilter_queue.c
 +++ b/src/libnetfilter_queue.c
 @@ -133,8 +133,7 @@ struct nfq_data {
@@ -772,7 +773,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_set_queue_flags - set flags (options) for the kernel queue
-@@ -690,7 +678,7 @@ EXPORT_SYMBOL(nfq_set_mode);
+@@ -708,7 +696,7 @@ EXPORT_SYMBOL(nfq_set_mode);
   *
   * \return -1 on error with errno set appropriately; =0 otherwise.
   */
@@ -781,7 +782,7 @@ index 065d618..ab0b66b 100644
  			uint32_t mask, uint32_t flags)
  {
  	union {
-@@ -711,7 +699,6 @@ int nfq_set_queue_flags(struct nfq_q_handle *qh,
+@@ -729,7 +717,6 @@ int nfq_set_queue_flags(struct nfq_q_handle *qh,
  
  	return nfnl_query(qh->h->nfnlh, &u.nmh);
  }
@@ -789,7 +790,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_set_queue_maxlen - Set kernel queue maximum length parameter
-@@ -724,7 +711,7 @@ EXPORT_SYMBOL(nfq_set_queue_flags);
+@@ -742,7 +729,7 @@ EXPORT_SYMBOL(nfq_set_queue_flags);
   *
   * \return -1 on error; >=0 otherwise.
   */
@@ -798,7 +799,7 @@ index 065d618..ab0b66b 100644
  				uint32_t queuelen)
  {
  	union {
-@@ -742,7 +729,6 @@ int nfq_set_queue_maxlen(struct nfq_q_handle *qh,
+@@ -760,7 +747,6 @@ int nfq_set_queue_maxlen(struct nfq_q_handle *qh,
  
  	return nfnl_query(qh->h->nfnlh, &u.nmh);
  }
@@ -806,7 +807,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * @}
-@@ -829,14 +815,13 @@ static int __set_verdict(struct nfq_q_handle *qh, uint32_t id,
+@@ -847,14 +833,13 @@ static int __set_verdict(struct nfq_q_handle *qh, uint32_t id,
   *
   * \return -1 on error; >= 0 otherwise.
   */
@@ -822,7 +823,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_set_verdict2 - like nfq_set_verdict, but you can set the mark.
-@@ -847,14 +832,13 @@ EXPORT_SYMBOL(nfq_set_verdict);
+@@ -865,14 +850,13 @@ EXPORT_SYMBOL(nfq_set_verdict);
   * \param data_len number of bytes of data pointed to by #buf
   * \param buf the buffer that contains the packet data
   */
@@ -838,7 +839,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_set_verdict_batch - issue verdicts on several packets at once
-@@ -868,13 +852,12 @@ EXPORT_SYMBOL(nfq_set_verdict2);
+@@ -886,13 +870,12 @@ EXPORT_SYMBOL(nfq_set_verdict2);
   * batch support was added in Linux 3.1.
   * These functions will fail silently on older kernels.
   */
@@ -853,7 +854,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_set_verdict_batch2 - like nfq_set_verdict_batch, but you can set a mark.
-@@ -883,13 +866,12 @@ EXPORT_SYMBOL(nfq_set_verdict_batch);
+@@ -901,13 +884,12 @@ EXPORT_SYMBOL(nfq_set_verdict_batch);
   * \param verdict verdict to return to netfilter (NF_ACCEPT, NF_DROP)
   * \param mark mark to put on packet
   */
@@ -868,7 +869,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_set_verdict_mark - like nfq_set_verdict, but you can set the mark.
-@@ -905,14 +887,13 @@ EXPORT_SYMBOL(nfq_set_verdict_batch2);
+@@ -923,14 +905,13 @@ EXPORT_SYMBOL(nfq_set_verdict_batch2);
   * This function is deprecated since it is broken, its use is highly
   * discouraged. Please, use nfq_set_verdict2 instead.
   */
@@ -884,7 +885,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * @}
-@@ -947,12 +928,11 @@ EXPORT_SYMBOL(nfq_set_verdict_mark);
+@@ -965,12 +946,11 @@ EXPORT_SYMBOL(nfq_set_verdict_mark);
  	} __attribute__ ((packed));
  \endverbatim
   */
@@ -898,7 +899,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_nfmark - get the packet mark
-@@ -960,11 +940,10 @@ EXPORT_SYMBOL(nfq_get_msg_packet_hdr);
+@@ -978,11 +958,10 @@ EXPORT_SYMBOL(nfq_get_msg_packet_hdr);
   *
   * \return the netfilter mark currently assigned to the given queued packet.
   */
@@ -911,7 +912,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_timestamp - get the packet timestamp
-@@ -975,7 +954,7 @@ EXPORT_SYMBOL(nfq_get_nfmark);
+@@ -993,7 +972,7 @@ EXPORT_SYMBOL(nfq_get_nfmark);
   *
   * \return 0 on success, non-zero on failure.
   */
@@ -920,7 +921,7 @@ index 065d618..ab0b66b 100644
  {
  	struct nfqnl_msg_packet_timestamp *qpt;
  	qpt = nfnl_get_pointer_to_data(nfad->data, NFQA_TIMESTAMP,
-@@ -988,7 +967,6 @@ int nfq_get_timestamp(struct nfq_data *nfad, struct timeval *tv)
+@@ -1006,7 +985,6 @@ int nfq_get_timestamp(struct nfq_data *nfad, struct timeval *tv)
  
  	return 0;
  }
@@ -928,7 +929,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_indev - get the interface that the packet was received through
-@@ -1001,11 +979,10 @@ EXPORT_SYMBOL(nfq_get_timestamp);
+@@ -1019,11 +997,10 @@ EXPORT_SYMBOL(nfq_get_timestamp);
   * \warning all nfq_get_dev() functions return 0 if not set, since linux
   * only allows ifindex >= 1, see net/core/dev.c:2600  (in 2.6.13.1)
   */
@@ -941,7 +942,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_physindev - get the physical interface that the packet was received
-@@ -1015,11 +992,10 @@ EXPORT_SYMBOL(nfq_get_indev);
+@@ -1033,11 +1010,10 @@ EXPORT_SYMBOL(nfq_get_indev);
   * If the returned index is 0, the packet was locally generated or the
   * physical input interface is no longer known (ie. POSTROUTING?).
   */
@@ -954,7 +955,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_outdev - gets the interface that the packet will be routed out
-@@ -1029,11 +1005,10 @@ EXPORT_SYMBOL(nfq_get_physindev);
+@@ -1047,11 +1023,10 @@ EXPORT_SYMBOL(nfq_get_physindev);
   * returned index is 0, the packet is destined for localhost or the output
   * interface is not yet known (ie. PREROUTING?).
   */
@@ -967,7 +968,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_physoutdev - get the physical interface that the packet output
-@@ -1045,11 +1020,10 @@ EXPORT_SYMBOL(nfq_get_outdev);
+@@ -1063,11 +1038,10 @@ EXPORT_SYMBOL(nfq_get_outdev);
   * 
   * \return The index of physical interface that the packet output will be routed out.
   */
@@ -980,7 +981,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_indev_name - get the name of the interface the packet
-@@ -1089,13 +1063,12 @@ EXPORT_SYMBOL(nfq_get_physoutdev);
+@@ -1107,13 +1081,12 @@ EXPORT_SYMBOL(nfq_get_physoutdev);
  \endverbatim
   *
   */
@@ -995,7 +996,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_physindev_name - get the name of the physical interface the
-@@ -1109,13 +1082,12 @@ EXPORT_SYMBOL(nfq_get_indev_name);
+@@ -1127,13 +1100,12 @@ EXPORT_SYMBOL(nfq_get_indev_name);
   *
   * \return  -1 in case of error, > 0 if it succeed. 
   */
@@ -1010,7 +1011,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_outdev_name - get the name of the physical interface the
-@@ -1129,13 +1101,12 @@ EXPORT_SYMBOL(nfq_get_physindev_name);
+@@ -1147,13 +1119,12 @@ EXPORT_SYMBOL(nfq_get_physindev_name);
   *
   * \return  -1 in case of error, > 0 if it succeed. 
   */
@@ -1025,7 +1026,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_physoutdev_name - get the name of the interface the
-@@ -1150,13 +1121,12 @@ EXPORT_SYMBOL(nfq_get_outdev_name);
+@@ -1168,13 +1139,12 @@ EXPORT_SYMBOL(nfq_get_outdev_name);
   * \return  -1 in case of error, > 0 if it succeed. 
   */
  
@@ -1040,7 +1041,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_packet_hw
-@@ -1180,12 +1150,11 @@ EXPORT_SYMBOL(nfq_get_physoutdev_name);
+@@ -1198,12 +1168,11 @@ EXPORT_SYMBOL(nfq_get_physoutdev_name);
  	} __attribute__ ((packed));
  \endverbatim
   */
@@ -1054,7 +1055,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_uid - get the UID of the user the packet belongs to
-@@ -1193,7 +1162,7 @@ EXPORT_SYMBOL(nfq_get_packet_hw);
+@@ -1215,7 +1184,7 @@ EXPORT_SYMBOL(nfq_get_packet_hw);
   *
   * \return 1 if there is a UID available, 0 otherwise.
   */
@@ -1063,7 +1064,7 @@ index 065d618..ab0b66b 100644
  {
  	if (!nfnl_attr_present(nfad->data, NFQA_UID))
  		return 0;
-@@ -1201,7 +1170,6 @@ int nfq_get_uid(struct nfq_data *nfad, uint32_t *uid)
+@@ -1223,7 +1192,6 @@ int nfq_get_uid(struct nfq_data *nfad, uint32_t *uid)
  	*uid = ntohl(nfnl_get_data(nfad->data, NFQA_UID, uint32_t));
  	return 1;
  }
@@ -1071,7 +1072,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_gid - get the GID of the user the packet belongs to
-@@ -1209,7 +1177,7 @@ EXPORT_SYMBOL(nfq_get_uid);
+@@ -1235,7 +1203,7 @@ EXPORT_SYMBOL(nfq_get_uid);
   *
   * \return 1 if there is a GID available, 0 otherwise.
   */
@@ -1080,15 +1081,15 @@ index 065d618..ab0b66b 100644
  {
  	if (!nfnl_attr_present(nfad->data, NFQA_GID))
  		return 0;
-@@ -1217,7 +1185,6 @@ int nfq_get_gid(struct nfq_data *nfad, uint32_t *gid)
+@@ -1243,7 +1211,6 @@ int nfq_get_gid(struct nfq_data *nfad, uint32_t *gid)
  	*gid = ntohl(nfnl_get_data(nfad->data, NFQA_GID, uint32_t));
  	return 1;
  }
 -EXPORT_SYMBOL(nfq_get_gid);
  
- 
  /**
-@@ -1227,7 +1194,7 @@ EXPORT_SYMBOL(nfq_get_gid);
+  * nfq_get_secctx - get the security context for this packet
+@@ -1256,7 +1223,7 @@ EXPORT_SYMBOL(nfq_get_gid);
   *
   * \return -1 on error, otherwise > 0
   */
@@ -1097,7 +1098,7 @@ index 065d618..ab0b66b 100644
  {
  	if (!nfnl_attr_present(nfad->data, NFQA_SECCTX))
  		return -1;
-@@ -1240,7 +1207,6 @@ int nfq_get_secctx(struct nfq_data *nfad, unsigned char **secdata)
+@@ -1269,7 +1236,6 @@ int nfq_get_secctx(struct nfq_data *nfad, unsigned char **secdata)
  
  	return 0;
  }
@@ -1105,7 +1106,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * nfq_get_payload - get payload 
-@@ -1253,7 +1219,7 @@ EXPORT_SYMBOL(nfq_get_secctx);
+@@ -1282,7 +1248,7 @@ EXPORT_SYMBOL(nfq_get_secctx);
   *
   * \return -1 on error, otherwise > 0.
   */
@@ -1114,7 +1115,7 @@ index 065d618..ab0b66b 100644
  {
  	*data = (unsigned char *)
  		nfnl_get_pointer_to_data(nfad->data, NFQA_PAYLOAD, char);
-@@ -1262,7 +1228,6 @@ int nfq_get_payload(struct nfq_data *nfad, unsigned char **data)
+@@ -1291,7 +1257,6 @@ int nfq_get_payload(struct nfq_data *nfad, unsigned char **data)
  
  	return -1;
  }
@@ -1122,7 +1123,7 @@ index 065d618..ab0b66b 100644
  
  /**
   * @}
-@@ -1307,7 +1272,7 @@ do {								\
+@@ -1336,7 +1301,7 @@ do {								\
   * would have been printed into the buffer (in case that there is enough
   * room in it). See snprintf() return value for more information.
   */
@@ -1131,7 +1132,7 @@ index 065d618..ab0b66b 100644
  {
  	struct nfqnl_msg_packet_hdr *ph;
  	struct nfqnl_msg_packet_hw *hwph;
-@@ -1460,7 +1425,6 @@ int nfq_snprintf_xml(char *buf, size_t rem, struct nfq_data *tb, int flags)
+@@ -1489,7 +1454,6 @@ int nfq_snprintf_xml(char *buf, size_t rem, struct nfq_data *tb, int flags)
  
  	return len;
  }
@@ -1224,6 +1225,3 @@ index ba28c77..5582407 100644
  
  /**
   * @}
--- 
-2.12.2
-
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.3.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.3.bb
index 754e11d99..896cfdfaa 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.3.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.3.bb
@@ -6,11 +6,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 
-PV .= "+git${SRCREV}"
-SRCREV = "981025e103d887fb6a9c9bb49c74ec323108d098"
+SRCREV = "601abd1c71ccdf90753cf294c120ad43fb25dc54"
 
 SRC_URI = "git://git.netfilter.org/libnetfilter_queue \
-           file://0001-Correct-typo-in-the-location-of-internal.h-in-includ.patch \
            file://0001-libnetfilter-queue-Declare-the-define-visivility-attribute-together.patch \
            "
 
-- 
2.17.1


