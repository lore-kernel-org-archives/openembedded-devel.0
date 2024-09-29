Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02604CF6499
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 12:59:32 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.31796.1727614767093564853
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Sep 2024 05:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=FrAyHDWX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202409291259251cc70517f2cc64ef9a-mz2nel@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202409291259251cc70517f2cc64ef9a
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 29 Sep 2024 14:59:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TpaPiKKNkY6iUBjUNJ14/TO0qbr7EtRgE+zHYzF08jk=;
 b=FrAyHDWX+OETK7THrxxFf7tdY+WXNXfey3YM3bJn0nUyOD3tVRVMVaOWlGgXIWzHjONdiT
 3mt/LVhGuqqEf4v8AQ23rH3819EFB3z7baXMIPvTkuPz5Rz812t60vgCLc/2kg6W1hUhmNpf
 CCo7i9OqgBH5jPItikhZLcQMdUFYbKauHslm5lhL5AY34u0UjhCoNq06U9rAzYfNwgu3Ylet
 Vqb6bcxC/6JWRHIbghfjiZIZE9PRHcoMU6Q7pnH2Ax+RlExbO444cLOE7NDQot88VDT/fupy
 3ZuUqXGjrS//ifo1OQA37BORNYnLt8Zyxb0YyqjUNDH81D50qeI6MDeQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][scarthgap][PATCH 1/2] hostapd: Patch CVE-2024-3596
Date: Sun, 29 Sep 2024 14:58:34 +0200
Message-Id: <20240929125835.1055031-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 12:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112553

From: Peter Marko <peter.marko@siemens.com>

Picked patches according to
http://w1.fi/security/2024-1/hostapd-and-radius-protocol-forgery-attacks.txt

First patch is style commit picked to have a clean cherry-pick of all
mentioned commits without any conflict.
Patch CVE-2024-3596_03.patch was removed as it only patched
wpa_supplicant. The patch names were not changed so it is comparable
with wpa_supplicant recipe.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../hostapd/hostapd/CVE-2024-3596_00.patch    |  82 +++++++++
 .../hostapd/hostapd/CVE-2024-3596_01.patch    | 165 ++++++++++++++++++
 .../hostapd/hostapd/CVE-2024-3596_02.patch    |  62 +++++++
 .../hostapd/hostapd/CVE-2024-3596_04.patch    |  52 ++++++
 .../hostapd/hostapd/CVE-2024-3596_05.patch    |  51 ++++++
 .../hostapd/hostapd/CVE-2024-3596_06.patch    |  46 +++++
 .../hostapd/hostapd/CVE-2024-3596_07.patch    | 105 +++++++++++
 .../hostapd/hostapd/CVE-2024-3596_08.patch    |  47 +++++
 .../hostapd/hostapd_2.10.bb                   |   8 +
 9 files changed, 618 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_01.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_02.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_04.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_05.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_06.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_07.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_08.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch
new file mode 100644
index 0000000000..7a8197d2b4
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch
@@ -0,0 +1,82 @@
+From 945acf3ef06a6c312927da4fa055693dbac432d1 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 2 Apr 2022 16:28:12 +0300
+Subject: [PATCH 1/9] ieee802_11_auth: Coding style cleanup - no string
+ constant splitting
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=945acf3ef06a6c312927da4fa055693dbac432d1]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ap/ieee802_11_auth.c | 27 +++++++++++++++------------
+ 1 file changed, 15 insertions(+), 12 deletions(-)
+
+diff --git a/src/ap/ieee802_11_auth.c b/src/ap/ieee802_11_auth.c
+index 783ee6dea..47cc625be 100644
+--- a/src/ap/ieee802_11_auth.c
++++ b/src/ap/ieee802_11_auth.c
+@@ -267,16 +267,16 @@ int hostapd_allowed_address(struct hostapd_data *hapd, const u8 *addr,
+ 		os_get_reltime(&query->timestamp);
+ 		os_memcpy(query->addr, addr, ETH_ALEN);
+ 		if (hostapd_radius_acl_query(hapd, addr, query)) {
+-			wpa_printf(MSG_DEBUG, "Failed to send Access-Request "
+-				   "for ACL query.");
++			wpa_printf(MSG_DEBUG,
++				   "Failed to send Access-Request for ACL query.");
+ 			hostapd_acl_query_free(query);
+ 			return HOSTAPD_ACL_REJECT;
+ 		}
+ 
+ 		query->auth_msg = os_memdup(msg, len);
+ 		if (query->auth_msg == NULL) {
+-			wpa_printf(MSG_ERROR, "Failed to allocate memory for "
+-				   "auth frame.");
++			wpa_printf(MSG_ERROR,
++				   "Failed to allocate memory for auth frame.");
+ 			hostapd_acl_query_free(query);
+ 			return HOSTAPD_ACL_REJECT;
+ 		}
+@@ -467,19 +467,21 @@ hostapd_acl_recv_radius(struct radius_msg *msg, struct radius_msg *req,
+ 	if (query == NULL)
+ 		return RADIUS_RX_UNKNOWN;
+ 
+-	wpa_printf(MSG_DEBUG, "Found matching Access-Request for RADIUS "
+-		   "message (id=%d)", query->radius_id);
++	wpa_printf(MSG_DEBUG,
++		   "Found matching Access-Request for RADIUS message (id=%d)",
++		   query->radius_id);
+ 
+ 	if (radius_msg_verify(msg, shared_secret, shared_secret_len, req, 0)) {
+-		wpa_printf(MSG_INFO, "Incoming RADIUS packet did not have "
+-			   "correct authenticator - dropped\n");
++		wpa_printf(MSG_INFO,
++			   "Incoming RADIUS packet did not have correct authenticator - dropped");
+ 		return RADIUS_RX_INVALID_AUTHENTICATOR;
+ 	}
+ 
+ 	if (hdr->code != RADIUS_CODE_ACCESS_ACCEPT &&
+ 	    hdr->code != RADIUS_CODE_ACCESS_REJECT) {
+-		wpa_printf(MSG_DEBUG, "Unknown RADIUS message code %d to ACL "
+-			   "query", hdr->code);
++		wpa_printf(MSG_DEBUG,
++			   "Unknown RADIUS message code %d to ACL query",
++			   hdr->code);
+ 		return RADIUS_RX_UNKNOWN;
+ 	}
+ 
+@@ -506,8 +508,9 @@ hostapd_acl_recv_radius(struct radius_msg *msg, struct radius_msg *req,
+ 			    msg, RADIUS_ATTR_ACCT_INTERIM_INTERVAL,
+ 			    &info->acct_interim_interval) == 0 &&
+ 		    info->acct_interim_interval < 60) {
+-			wpa_printf(MSG_DEBUG, "Ignored too small "
+-				   "Acct-Interim-Interval %d for STA " MACSTR,
++			wpa_printf(MSG_DEBUG,
++				   "Ignored too small Acct-Interim-Interval %d for STA "
++				   MACSTR,
+ 				   info->acct_interim_interval,
+ 				   MAC2STR(query->addr));
+ 			info->acct_interim_interval = 0;
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_01.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_01.patch
new file mode 100644
index 0000000000..dab2eedd6a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_01.patch
@@ -0,0 +1,165 @@
+From adac846bd0e258a0aa50750bbd2b411fa0085c46 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 16 Mar 2024 11:11:44 +0200
+Subject: [PATCH 2/9] RADIUS: Allow Message-Authenticator attribute as the
+ first attribute
+
+If a Message-Authenticator attribute was already added to a RADIUS
+message, use that attribute instead of adding a new one when finishing
+message building. This allows the Message-Authenticator attribute to be
+placed as the first attribute in the message.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=adac846bd0e258a0aa50750bbd2b411fa0085c46]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/radius/radius.c | 85 ++++++++++++++++++++++++++++-----------------
+ src/radius/radius.h |  1 +
+ 2 files changed, 54 insertions(+), 32 deletions(-)
+
+diff --git a/src/radius/radius.c b/src/radius/radius.c
+index be16e27b9..2d2e00b5c 100644
+--- a/src/radius/radius.c
++++ b/src/radius/radius.c
+@@ -364,25 +364,54 @@ void radius_msg_dump(struct radius_msg *msg)
+ }
+ 
+ 
++u8 * radius_msg_add_msg_auth(struct radius_msg *msg)
++{
++	u8 auth[MD5_MAC_LEN];
++	struct radius_attr_hdr *attr;
++
++	os_memset(auth, 0, MD5_MAC_LEN);
++	attr = radius_msg_add_attr(msg, RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
++				   auth, MD5_MAC_LEN);
++	if (!attr) {
++		wpa_printf(MSG_ERROR,
++			   "WARNING: Could not add Message-Authenticator");
++		return NULL;
++	}
++
++	return (u8 *) (attr + 1);
++}
++
++
++static u8 * radius_msg_auth_pos(struct radius_msg *msg)
++{
++	u8 *pos;
++	size_t alen;
++
++	if (radius_msg_get_attr_ptr(msg, RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
++				    &pos, &alen, NULL) == 0 &&
++	    alen == MD5_MAC_LEN) {
++		/* Use already added Message-Authenticator attribute */
++		return pos;
++	}
++
++	/* Add a Message-Authenticator attribute */
++	return radius_msg_add_msg_auth(msg);
++}
++
++
+ int radius_msg_finish(struct radius_msg *msg, const u8 *secret,
+ 		      size_t secret_len)
+ {
+ 	if (secret) {
+-		u8 auth[MD5_MAC_LEN];
+-		struct radius_attr_hdr *attr;
++		u8 *pos;
+ 
+-		os_memset(auth, 0, MD5_MAC_LEN);
+-		attr = radius_msg_add_attr(msg,
+-					   RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
+-					   auth, MD5_MAC_LEN);
+-		if (attr == NULL) {
+-			wpa_printf(MSG_WARNING, "RADIUS: Could not add "
+-				   "Message-Authenticator");
++		pos = radius_msg_auth_pos(msg);
++		if (!pos)
+ 			return -1;
+-		}
+ 		msg->hdr->length = host_to_be16(wpabuf_len(msg->buf));
+-		hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
+-			 wpabuf_len(msg->buf), (u8 *) (attr + 1));
++		if (hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
++			     wpabuf_len(msg->buf), pos) < 0)
++			return -1;
+ 	} else
+ 		msg->hdr->length = host_to_be16(wpabuf_len(msg->buf));
+ 
+@@ -398,23 +427,19 @@ int radius_msg_finish(struct radius_msg *msg, const u8 *secret,
+ int radius_msg_finish_srv(struct radius_msg *msg, const u8 *secret,
+ 			  size_t secret_len, const u8 *req_authenticator)
+ {
+-	u8 auth[MD5_MAC_LEN];
+-	struct radius_attr_hdr *attr;
+ 	const u8 *addr[4];
+ 	size_t len[4];
++	u8 *pos;
+ 
+-	os_memset(auth, 0, MD5_MAC_LEN);
+-	attr = radius_msg_add_attr(msg, RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
+-				   auth, MD5_MAC_LEN);
+-	if (attr == NULL) {
+-		wpa_printf(MSG_ERROR, "WARNING: Could not add Message-Authenticator");
++	pos = radius_msg_auth_pos(msg);
++	if (!pos)
+ 		return -1;
+-	}
+ 	msg->hdr->length = host_to_be16(wpabuf_len(msg->buf));
+ 	os_memcpy(msg->hdr->authenticator, req_authenticator,
+ 		  sizeof(msg->hdr->authenticator));
+-	hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
+-		 wpabuf_len(msg->buf), (u8 *) (attr + 1));
++	if (hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
++		     wpabuf_len(msg->buf), pos) < 0)
++		return -1;
+ 
+ 	/* ResponseAuth = MD5(Code+ID+Length+RequestAuth+Attributes+Secret) */
+ 	addr[0] = (u8 *) msg->hdr;
+@@ -442,21 +467,17 @@ int radius_msg_finish_das_resp(struct radius_msg *msg, const u8 *secret,
+ {
+ 	const u8 *addr[2];
+ 	size_t len[2];
+-	u8 auth[MD5_MAC_LEN];
+-	struct radius_attr_hdr *attr;
++	u8 *pos;
+ 
+-	os_memset(auth, 0, MD5_MAC_LEN);
+-	attr = radius_msg_add_attr(msg, RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
+-				   auth, MD5_MAC_LEN);
+-	if (attr == NULL) {
+-		wpa_printf(MSG_WARNING, "Could not add Message-Authenticator");
++	pos = radius_msg_auth_pos(msg);
++	if (!pos)
+ 		return -1;
+-	}
+ 
+ 	msg->hdr->length = host_to_be16(wpabuf_len(msg->buf));
+ 	os_memcpy(msg->hdr->authenticator, req_hdr->authenticator, 16);
+-	hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
+-		 wpabuf_len(msg->buf), (u8 *) (attr + 1));
++	if (hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
++		     wpabuf_len(msg->buf), pos) < 0)
++		return -1;
+ 
+ 	/* ResponseAuth = MD5(Code+ID+Length+RequestAuth+Attributes+Secret) */
+ 	addr[0] = wpabuf_head_u8(msg->buf);
+diff --git a/src/radius/radius.h b/src/radius/radius.h
+index fb8148180..6b9dfbca2 100644
+--- a/src/radius/radius.h
++++ b/src/radius/radius.h
+@@ -240,6 +240,7 @@ struct wpabuf * radius_msg_get_buf(struct radius_msg *msg);
+ struct radius_msg * radius_msg_new(u8 code, u8 identifier);
+ void radius_msg_free(struct radius_msg *msg);
+ void radius_msg_dump(struct radius_msg *msg);
++u8 * radius_msg_add_msg_auth(struct radius_msg *msg);
+ int radius_msg_finish(struct radius_msg *msg, const u8 *secret,
+ 		      size_t secret_len);
+ int radius_msg_finish_srv(struct radius_msg *msg, const u8 *secret,
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_02.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_02.patch
new file mode 100644
index 0000000000..02e35bd6de
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_02.patch
@@ -0,0 +1,62 @@
+From 54abb0d3cf35894e7d86e3f7555e95b106306803 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 16 Mar 2024 11:13:32 +0200
+Subject: [PATCH 3/9] RADIUS server: Place Message-Authenticator attribute as
+ the first one
+
+Move the Message-Authenticator attribute to be the first attribute in
+the RADIUS messages. This mitigates certain MD5 attacks against
+RADIUS/UDP.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=54abb0d3cf35894e7d86e3f7555e95b106306803]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/radius/radius_server.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/src/radius/radius_server.c b/src/radius/radius_server.c
+index e02c21540..fa3691548 100644
+--- a/src/radius/radius_server.c
++++ b/src/radius/radius_server.c
+@@ -920,6 +920,11 @@ radius_server_encapsulate_eap(struct radius_server_data *data,
+ 		return NULL;
+ 	}
+ 
++	if (!radius_msg_add_msg_auth(msg)) {
++		radius_msg_free(msg);
++		return NULL;
++	}
++
+ 	sess_id = htonl(sess->sess_id);
+ 	if (code == RADIUS_CODE_ACCESS_CHALLENGE &&
+ 	    !radius_msg_add_attr(msg, RADIUS_ATTR_STATE,
+@@ -1204,6 +1209,11 @@ radius_server_macacl(struct radius_server_data *data,
+ 		return NULL;
+ 	}
+ 
++	if (!radius_msg_add_msg_auth(msg)) {
++		radius_msg_free(msg);
++		return NULL;
++	}
++
+ 	if (radius_msg_copy_attr(msg, request, RADIUS_ATTR_PROXY_STATE) < 0) {
+ 		RADIUS_DEBUG("Failed to copy Proxy-State attribute(s)");
+ 		radius_msg_free(msg);
+@@ -1253,6 +1263,11 @@ static int radius_server_reject(struct radius_server_data *data,
+ 		return -1;
+ 	}
+ 
++	if (!radius_msg_add_msg_auth(msg)) {
++		radius_msg_free(msg);
++		return -1;
++	}
++
+ 	os_memset(&eapfail, 0, sizeof(eapfail));
+ 	eapfail.code = EAP_CODE_FAILURE;
+ 	eapfail.identifier = 0;
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_04.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_04.patch
new file mode 100644
index 0000000000..ce499ce8b6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_04.patch
@@ -0,0 +1,52 @@
+From 37fe8e48ab44d44fe3cf5dd8f52cb0a10be0cd17 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 16 Mar 2024 11:22:43 +0200
+Subject: [PATCH 5/9] hostapd: Move Message-Authenticator attribute to be the
+ first one in req
+
+Even if this is not strictly speaking necessary for mitigating certain
+RADIUS protocol attacks, be consistent with the RADIUS server behavior
+and move the Message-Authenticator attribute to be the first attribute
+in the message from RADIUS client in hostapd.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=37fe8e48ab44d44fe3cf5dd8f52cb0a10be0cd17]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ap/ieee802_11_auth.c | 3 +++
+ src/ap/ieee802_1x.c      | 3 +++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/ap/ieee802_11_auth.c b/src/ap/ieee802_11_auth.c
+index 47cc625be..2a950cf7f 100644
+--- a/src/ap/ieee802_11_auth.c
++++ b/src/ap/ieee802_11_auth.c
+@@ -119,6 +119,9 @@ static int hostapd_radius_acl_query(struct hostapd_data *hapd, const u8 *addr,
+ 		goto fail;
+ 	}
+ 
++	if (!radius_msg_add_msg_auth(msg))
++		goto fail;
++
+ 	os_snprintf(buf, sizeof(buf), RADIUS_ADDR_FORMAT, MAC2STR(addr));
+ 	if (!radius_msg_add_attr(msg, RADIUS_ATTR_USER_NAME, (u8 *) buf,
+ 				 os_strlen(buf))) {
+diff --git a/src/ap/ieee802_1x.c b/src/ap/ieee802_1x.c
+index 753c88335..89e3dd30e 100644
+--- a/src/ap/ieee802_1x.c
++++ b/src/ap/ieee802_1x.c
+@@ -702,6 +702,9 @@ void ieee802_1x_encapsulate_radius(struct hostapd_data *hapd,
+ 		goto fail;
+ 	}
+ 
++	if (!radius_msg_add_msg_auth(msg))
++		goto fail;
++
+ 	if (sm->identity &&
+ 	    !radius_msg_add_attr(msg, RADIUS_ATTR_USER_NAME,
+ 				 sm->identity, sm->identity_len)) {
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_05.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_05.patch
new file mode 100644
index 0000000000..44113afd4a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_05.patch
@@ -0,0 +1,51 @@
+From f54157077f799d84ce26bed6ad6b01c4a16e31cf Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 16 Mar 2024 11:26:58 +0200
+Subject: [PATCH 6/9] RADIUS DAS: Move Message-Authenticator attribute to be
+ the first one
+
+Even if this might not be strictly speaking necessary for mitigating
+certain RADIUS protocol attacks, be consistent with the RADIUS server
+behavior and move the Message-Authenticator attribute to be the first
+attribute in the RADIUS DAS responses from hostapd.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=f54157077f799d84ce26bed6ad6b01c4a16e31cf]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/radius/radius_das.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/radius/radius_das.c b/src/radius/radius_das.c
+index aaa3fc267..8d7c9b4c4 100644
+--- a/src/radius/radius_das.c
++++ b/src/radius/radius_das.c
+@@ -177,6 +177,11 @@ fail:
+ 	if (reply == NULL)
+ 		return NULL;
+ 
++	if (!radius_msg_add_msg_auth(reply)) {
++		radius_msg_free(reply);
++		return NULL;
++	}
++
+ 	if (error) {
+ 		if (!radius_msg_add_attr_int32(reply, RADIUS_ATTR_ERROR_CAUSE,
+ 					       error)) {
+@@ -368,6 +373,11 @@ fail:
+ 	if (!reply)
+ 		return NULL;
+ 
++	if (!radius_msg_add_msg_auth(reply)) {
++		radius_msg_free(reply);
++		return NULL;
++	}
++
+ 	if (error &&
+ 	    !radius_msg_add_attr_int32(reply, RADIUS_ATTR_ERROR_CAUSE, error)) {
+ 		radius_msg_free(reply);
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_06.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_06.patch
new file mode 100644
index 0000000000..9a284b5261
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_06.patch
@@ -0,0 +1,46 @@
+From 934b0c3a45ce0726560ccefbd992a9d385c36385 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 16 Mar 2024 11:31:37 +0200
+Subject: [PATCH 7/9] Require Message-Authenticator in Access-Reject even
+ without EAP-Message
+
+Do not allow the exception for missing Message-Authenticator in
+Access-Reject without EAP-Message. While such exception is allowed in
+RADIUS definition, there is no strong reason to maintain this since
+Access-Reject is supposed to include EAP-Message and even if it doesn't,
+discarding Access-Reject will result in the connection not completing.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=934b0c3a45ce0726560ccefbd992a9d385c36385]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ap/ieee802_1x.c | 11 +----------
+ 1 file changed, 1 insertion(+), 10 deletions(-)
+
+diff --git a/src/ap/ieee802_1x.c b/src/ap/ieee802_1x.c
+index 89e3dd30e..6e7b75128 100644
+--- a/src/ap/ieee802_1x.c
++++ b/src/ap/ieee802_1x.c
+@@ -1939,16 +1939,7 @@ ieee802_1x_receive_auth(struct radius_msg *msg, struct radius_msg *req,
+ 	}
+ 	sta = sm->sta;
+ 
+-	/* RFC 2869, Ch. 5.13: valid Message-Authenticator attribute MUST be
+-	 * present when packet contains an EAP-Message attribute */
+-	if (hdr->code == RADIUS_CODE_ACCESS_REJECT &&
+-	    radius_msg_get_attr(msg, RADIUS_ATTR_MESSAGE_AUTHENTICATOR, NULL,
+-				0) < 0 &&
+-	    radius_msg_get_attr(msg, RADIUS_ATTR_EAP_MESSAGE, NULL, 0) < 0) {
+-		wpa_printf(MSG_DEBUG,
+-			   "Allowing RADIUS Access-Reject without Message-Authenticator since it does not include EAP-Message");
+-	} else if (radius_msg_verify(msg, shared_secret, shared_secret_len,
+-				     req, 1)) {
++	if (radius_msg_verify(msg, shared_secret, shared_secret_len, req, 1)) {
+ 		wpa_printf(MSG_INFO,
+ 			   "Incoming RADIUS packet did not have correct Message-Authenticator - dropped");
+ 		return RADIUS_RX_INVALID_AUTHENTICATOR;
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_07.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_07.patch
new file mode 100644
index 0000000000..78d3f5d591
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_07.patch
@@ -0,0 +1,105 @@
+From 58097123ec5ea6f8276b38cb9b07669ec368a6c1 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sun, 17 Mar 2024 10:42:56 +0200
+Subject: [PATCH 8/9] RADIUS: Require Message-Authenticator attribute in MAC
+ ACL cases
+
+hostapd required Message-Authenticator attribute to be included in EAP
+authentication cases, but that requirement was not in place for MAC ACL
+cases. Start requiring Message-Authenticator attribute for MAC ACL by
+default. Unlike the EAP case, this can still be disabled with
+radius_require_message_authenticator=1 to maintain compatibility with
+some RADIUS servers when used in a network where the connection to such
+a server is secure.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=58097123ec5ea6f8276b38cb9b07669ec368a6c1]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ hostapd/config_file.c    |  3 +++
+ hostapd/hostapd.conf     | 11 +++++++++++
+ src/ap/ap_config.c       |  1 +
+ src/ap/ap_config.h       |  1 +
+ src/ap/ieee802_11_auth.c |  4 +++-
+ 5 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/hostapd/config_file.c b/hostapd/config_file.c
+index b14728d1b..af1e81d1d 100644
+--- a/hostapd/config_file.c
++++ b/hostapd/config_file.c
+@@ -2806,6 +2806,9 @@ static int hostapd_config_fill(struct hostapd_config *conf,
+ 		bss->radius->acct_server->shared_secret_len = len;
+ 	} else if (os_strcmp(buf, "radius_retry_primary_interval") == 0) {
+ 		bss->radius->retry_primary_interval = atoi(pos);
++	} else if (os_strcmp(buf,
++			     "radius_require_message_authenticator") == 0) {
++		bss->radius_require_message_authenticator = atoi(pos);
+ 	} else if (os_strcmp(buf, "radius_acct_interim_interval") == 0) {
+ 		bss->acct_interim_interval = atoi(pos);
+ 	} else if (os_strcmp(buf, "radius_request_cui") == 0) {
+diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
+index 3c2019f73..c055946a6 100644
+--- a/hostapd/hostapd.conf
++++ b/hostapd/hostapd.conf
+@@ -1447,6 +1447,17 @@ own_ip_addr=127.0.0.1
+ # currently used secondary server is still working.
+ #radius_retry_primary_interval=600
+ 
++# Message-Authenticator attribute requirement for non-EAP cases
++# hostapd requires Message-Authenticator attribute to be included in all cases
++# where RADIUS is used for EAP authentication. This is also required for cases
++# where RADIUS is used for MAC ACL (macaddr_acl=2) by default, but that case
++# can be configured to not require this for compatibility with RADIUS servers
++# that do not include the attribute. This is not recommended due to potential
++# security concerns, but can be used as a temporary workaround in networks where
++# the connection to the RADIUS server is secure.
++# 0 = Do not require Message-Authenticator in MAC ACL response
++# 1 = Require Message-Authenticator in all authentication cases (default)
++#radius_require_message_authenticator=1
+ 
+ # Interim accounting update interval
+ # If this is set (larger than 0) and acct_server is configured, hostapd will
+diff --git a/src/ap/ap_config.c b/src/ap/ap_config.c
+index 86b6e097c..cf497a180 100644
+--- a/src/ap/ap_config.c
++++ b/src/ap/ap_config.c
+@@ -120,6 +120,7 @@ void hostapd_config_defaults_bss(struct hostapd_bss_config *bss)
+ #endif /* CONFIG_IEEE80211R_AP */
+ 
+ 	bss->radius_das_time_window = 300;
++	bss->radius_require_message_authenticator = 1;
+ 
+ 	bss->anti_clogging_threshold = 5;
+ 	bss->sae_sync = 5;
+diff --git a/src/ap/ap_config.h b/src/ap/ap_config.h
+index 49cd3168a..22ad617f4 100644
+--- a/src/ap/ap_config.h
++++ b/src/ap/ap_config.h
+@@ -302,6 +302,7 @@ struct hostapd_bss_config {
+ 	struct hostapd_ip_addr own_ip_addr;
+ 	char *nas_identifier;
+ 	struct hostapd_radius_servers *radius;
++	int radius_require_message_authenticator;
+ 	int acct_interim_interval;
+ 	int radius_request_cui;
+ 	struct hostapd_radius_attr *radius_auth_req_attr;
+diff --git a/src/ap/ieee802_11_auth.c b/src/ap/ieee802_11_auth.c
+index 2a950cf7f..dab9bcde3 100644
+--- a/src/ap/ieee802_11_auth.c
++++ b/src/ap/ieee802_11_auth.c
+@@ -474,7 +474,9 @@ hostapd_acl_recv_radius(struct radius_msg *msg, struct radius_msg *req,
+ 		   "Found matching Access-Request for RADIUS message (id=%d)",
+ 		   query->radius_id);
+ 
+-	if (radius_msg_verify(msg, shared_secret, shared_secret_len, req, 0)) {
++	if (radius_msg_verify(
++		    msg, shared_secret, shared_secret_len, req,
++		    hapd->conf->radius_require_message_authenticator)) {
+ 		wpa_printf(MSG_INFO,
+ 			   "Incoming RADIUS packet did not have correct authenticator - dropped");
+ 		return RADIUS_RX_INVALID_AUTHENTICATOR;
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_08.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_08.patch
new file mode 100644
index 0000000000..e23d1e0047
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_08.patch
@@ -0,0 +1,47 @@
+From f302d9f9646704cce745734af21d540baa0da65f Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sun, 17 Mar 2024 10:47:58 +0200
+Subject: [PATCH 9/9] RADIUS: Check Message-Authenticator if it is present even
+ if not required
+
+Always check the Message-Authenticator attribute in a received RADIUS
+message if it is present. Previously, this would have been skipped if
+the attribute was not required to be present.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=f302d9f9646704cce745734af21d540baa0da65f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/radius/radius.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/src/radius/radius.c b/src/radius/radius.c
+index 2d2e00b5c..a0e3ce399 100644
+--- a/src/radius/radius.c
++++ b/src/radius/radius.c
+@@ -879,6 +879,20 @@ int radius_msg_verify(struct radius_msg *msg, const u8 *secret,
+ 		return 1;
+ 	}
+ 
++	if (!auth) {
++		u8 *pos;
++		size_t alen;
++
++		if (radius_msg_get_attr_ptr(msg,
++					    RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
++					    &pos, &alen, NULL) == 0) {
++			/* Check the Message-Authenticator attribute since it
++			 * was included even if we are configured to not
++			 * require it. */
++			auth = 1;
++		}
++	}
++
+ 	if (auth &&
+ 	    radius_msg_verify_msg_auth(msg, secret, secret_len,
+ 				       sent_msg->hdr->authenticator)) {
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
index 3c5f78f91a..70fac06d89 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
@@ -11,6 +11,14 @@ SRC_URI = " \
     file://defconfig \
     file://init \
     file://hostapd.service \
+    file://CVE-2024-3596_00.patch \
+    file://CVE-2024-3596_01.patch \
+    file://CVE-2024-3596_02.patch \
+    file://CVE-2024-3596_04.patch \
+    file://CVE-2024-3596_05.patch \
+    file://CVE-2024-3596_06.patch \
+    file://CVE-2024-3596_07.patch \
+    file://CVE-2024-3596_08.patch \
 "
 
 
-- 
2.30.2


