Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BA4C678D5
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:09 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.8791.1676550485246638688
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W4/MCe1z;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id w3so1835620qts.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mk/0bs8IRzKdVTpeG3s1Gi0mcGIURVmysKTqbalAhyk=;
        b=W4/MCe1zR+DojFoW2AYZuSsnsxLWm4KNCD2FMqWISXe+kuohHegFo6r8f7vcXnzpXU
         kWoEOsy4tpM2vtZXQ63A487yXRDgQ2ZY8HMOCpAaL9ZfZFN7pxnQbZfjNlN5GpFHuAVa
         X8Ohh/qBZ0GeuhGtCaDOrweAUEXEdEglA6gDwg/hJ6lGnyejsO68Y3qhtcXKaC2BwjwU
         fuxR2qru1EyZH3ZhM3VCbmVJ8osEA9ocI1PcLlPL7vFr8Iaw9KccUrTwfxlsIbC79kse
         3WbjiXt/MxO7NwyxcuJKr2wtv6G6zDfcLZM2MzUzqcR10lEh46Vj8E1YBGxieTwhwSFf
         XYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mk/0bs8IRzKdVTpeG3s1Gi0mcGIURVmysKTqbalAhyk=;
        b=wNxd3FZB6o61GdNcDcksAiZzJ5DBN880YlPwc1XGWWEtIDW4+tPNkW1spUZwhifp6R
         NeWY1SEpSzWe04lGGai93WuuE3bNUJGBRlBj8AoaTkVkRinb345hz1+6uojBJkfzoyVu
         +0Wx99MqAh3bqQJu9XG31Fe2oMuqJjHv7/2VPmFrN87qUT1QMRGUVFEEivP5OcW46dhw
         ZY65c5oAhWwEaChbM7F5/JutMMfGZV73hPQN+cTeYGl3w8OfdT4bXCxY29SleEGHObd8
         cK91HLVEQg95gKtHAS0GjXn00a+MJsy2XoZwQ7oTv9rJQ6afT2/GbwI1wOpF/Kp4ptkv
         VG+g==
X-Gm-Message-State: AO0yUKWqB9/Pkl0JgoIk+2N7QCbxylYMNZd7u8zoGNgdizGYHpUdugx+
	meiq1K92mbkNPG4flM0oOPSgSzkIBrg=
X-Google-Smtp-Source: AK7set8zoHpHD4SIdj3aFQf1KIDzn+TMM9Gnj2lQiCXvQ5qj6eDhL+Ri5yvBjYcM6hsp+g1XTTEyYw==
X-Received: by 2002:a05:622a:104b:b0:3b9:f076:26c7 with SMTP id f11-20020a05622a104b00b003b9f07626c7mr9093360qte.10.1676550483932;
        Thu, 16 Feb 2023 04:28:03 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.28.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:28:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 06/15] freeradius: Security fixes for CVE-2022-41860 CVE-2022-41861
Date: Thu, 16 Feb 2023 07:27:16 -0500
Message-Id: <cd15081a7c1b556bc97955d55689b25010cad965.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101108

From: Yi Zhao <yi.zhao@eng.windriver.com>

CVE-2022-41860:
In freeradius, when an EAP-SIM supplicant sends an unknown SIM option,
the server will try to look that option up in the internal dictionaries.
This lookup will fail, but the SIM code will not check for that failure.
Instead, it will dereference a NULL pointer, and cause the server to
crash.

CVE-2022-41861:
A flaw was found in freeradius. A malicious RADIUS client or home server
can send a malformed abinary attribute which can cause the server to
crash.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-41860
https://nvd.nist.gov/vuln/detail/CVE-2022-41861

Patches from:
CVE-2022-41860:
https://github.com/FreeRADIUS/freeradius-server/commit/f1cdbb33ec61c4a64a32e107d4d02f936051c708

CVE-2022-41861:
https://github.com/FreeRADIUS/freeradius-server/commit/0ec2b39d260e08e4c3464f6b95005821dc559c62

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../freeradius/files/CVE-2022-41860.patch     | 118 ++++++++++++++++++
 .../freeradius/files/CVE-2022-41861.patch     |  53 ++++++++
 .../freeradius/freeradius_3.0.21.bb           |   2 +
 3 files changed, 173 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch b/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
new file mode 100644
index 0000000000..4ea519c752
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
@@ -0,0 +1,118 @@
+From f1cdbb33ec61c4a64a32e107d4d02f936051c708 Mon Sep 17 00:00:00 2001
+From: "Alan T. DeKok" <aland@freeradius.org>
+Date: Mon, 7 Feb 2022 22:26:05 -0500
+Subject: [PATCH] it's probably wrong to be completely retarded.  Let's fix
+ that.
+
+CVE: CVE-2022-41860
+
+Upstream-Status: Backport
+[https://github.com/FreeRADIUS/freeradius-server/commit/f1cdbb33ec61c4a64a32e107d4d02f936051c708]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/modules/rlm_eap/libeap/eapsimlib.c | 69 +++++++++++++++++++-------
+ 1 file changed, 52 insertions(+), 17 deletions(-)
+
+diff --git a/src/modules/rlm_eap/libeap/eapsimlib.c b/src/modules/rlm_eap/libeap/eapsimlib.c
+index cf1e8a7dd9..e438a844ea 100644
+--- a/src/modules/rlm_eap/libeap/eapsimlib.c
++++ b/src/modules/rlm_eap/libeap/eapsimlib.c
+@@ -307,42 +307,77 @@ int unmap_eapsim_basictypes(RADIUS_PACKET *r,
+ 	newvp->vp_length = 1;
+ 	fr_pair_add(&(r->vps), newvp);
+ 
++	/*
++	 *	EAP-SIM has a 1 octet of subtype, and 2 octets
++	 *	reserved.
++	 */
+ 	attr     += 3;
+ 	attrlen  -= 3;
+ 
+-	/* now, loop processing each attribute that we find */
+-	while(attrlen > 0) {
++	/*
++	 *	Loop over each attribute.  The format is:
++	 *
++	 *	1 octet of type
++	 *	1 octet of length (value 1..255)
++	 *	((4 * length) - 2) octets of data.
++	 */
++	while (attrlen > 0) {
+ 		uint8_t *p;
+ 
+-		if(attrlen < 2) {
++		if (attrlen < 2) {
+ 			fr_strerror_printf("EAP-Sim attribute %d too short: %d < 2", es_attribute_count, attrlen);
+ 			return 0;
+ 		}
+ 
++		if (!attr[1]) {
++			fr_strerror_printf("EAP-Sim attribute %d (no.%d) has no data", eapsim_attribute,
++					   es_attribute_count);
++			return 0;
++		}
++
+ 		eapsim_attribute = attr[0];
+ 		eapsim_len = attr[1] * 4;
+ 
++		/*
++		 *	The length includes the 2-byte header.
++		 */
+ 		if (eapsim_len > attrlen) {
+ 			fr_strerror_printf("EAP-Sim attribute %d (no.%d) has length longer than data (%d > %d)",
+ 					   eapsim_attribute, es_attribute_count, eapsim_len, attrlen);
+ 			return 0;
+ 		}
+ 
+-		if(eapsim_len > MAX_STRING_LEN) {
+-			eapsim_len = MAX_STRING_LEN;
+-		}
+-		if (eapsim_len < 2) {
+-			fr_strerror_printf("EAP-Sim attribute %d (no.%d) has length too small", eapsim_attribute,
+-					   es_attribute_count);
+-			return 0;
+-		}
++		newvp = fr_pair_afrom_num(r, eapsim_attribute + PW_EAP_SIM_BASE, 0);
++		if (!newvp) {
++			/*
++			 *	RFC 4186 Section 8.1 says 0..127 are
++			 *	"non-skippable".  If one such
++			 *	attribute is found and we don't
++			 *	understand it, the server has to send:
++			 *
++			 *	EAP-Request/SIM/Notification packet with an
++			 *	(AT_NOTIFICATION code, which implies general failure ("General
++			 *	failure after authentication" (0), or "General failure" (16384),
++			 *	depending on the phase of the exchange), which terminates the
++			 *	authentication exchange.
++			 */
++			if (eapsim_attribute <= 127) {
++				fr_strerror_printf("Unknown mandatory attribute %d, failing",
++						   eapsim_attribute);
++				return 0;
++			}
+ 
+-		newvp = fr_pair_afrom_num(r, eapsim_attribute+PW_EAP_SIM_BASE, 0);
+-		newvp->vp_length = eapsim_len-2;
+-		newvp->vp_octets = p = talloc_array(newvp, uint8_t, newvp->vp_length);
+-		memcpy(p, &attr[2], eapsim_len-2);
+-		fr_pair_add(&(r->vps), newvp);
+-		newvp = NULL;
++		} else {
++			/*
++			 *	It's known, ccount for header, and
++			 *	copy the value over.
++			 */
++			newvp->vp_length = eapsim_len - 2;
++
++			newvp->vp_octets = p = talloc_array(newvp, uint8_t, newvp->vp_length);
++			memcpy(p, &attr[2], newvp->vp_length);
++			fr_pair_add(&(r->vps), newvp);
++		}
+ 
+ 		/* advance pointers, decrement length */
+ 		attr += eapsim_len;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch b/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch
new file mode 100644
index 0000000000..352c02137a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch
@@ -0,0 +1,53 @@
+From 0ec2b39d260e08e4c3464f6b95005821dc559c62 Mon Sep 17 00:00:00 2001
+From: "Alan T. DeKok" <aland@freeradius.org>
+Date: Mon, 28 Feb 2022 10:34:15 -0500
+Subject: [PATCH] manual port of commit 5906bfa1
+
+CVE: CVE-2022-41861
+
+Upstream-Status: Backport
+[https://github.com/FreeRADIUS/freeradius-server/commit/0ec2b39d260e08e4c3464f6b95005821dc559c62]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/lib/filters.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/filters.c b/src/lib/filters.c
+index 4868cd385d..3f3b63daee 100644
+--- a/src/lib/filters.c
++++ b/src/lib/filters.c
+@@ -1205,13 +1205,19 @@ void print_abinary(char *out, size_t outlen, uint8_t const *data, size_t len, in
+ 			}
+ 		}
+ 	} else if (filter->type == RAD_FILTER_GENERIC) {
+-		int count;
++		size_t count, masklen;
++
++		masklen = ntohs(filter->u.generic.len);
++		if (masklen >= sizeof(filter->u.generic.mask)) {
++			*p = '\0';
++			return;
++		}
+ 
+ 		i = snprintf(p, outlen, " %u ", (unsigned int) ntohs(filter->u.generic.offset));
+ 		p += i;
+ 
+ 		/* show the mask */
+-		for (count = 0; count < ntohs(filter->u.generic.len); count++) {
++		for (count = 0; count < masklen; count++) {
+ 			i = snprintf(p, outlen, "%02x", filter->u.generic.mask[count]);
+ 			p += i;
+ 			outlen -= i;
+@@ -1222,7 +1228,7 @@ void print_abinary(char *out, size_t outlen, uint8_t const *data, size_t len, in
+ 		outlen--;
+ 
+ 		/* show the value */
+-		for (count = 0; count < ntohs(filter->u.generic.len); count++) {
++		for (count = 0; count < masklen; count++) {
+ 			i = snprintf(p, outlen, "%02x", filter->u.generic.value[count]);
+ 			p += i;
+ 			outlen -= i;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
index b459412e04..d18c387798 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
@@ -33,6 +33,8 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0
     file://radiusd-volatiles.conf \
     file://check-openssl-cmds-in-script-bootstrap.patch \
     file://0001-version.c-don-t-print-build-flags.patch \
+    file://CVE-2022-41860.patch \
+    file://CVE-2022-41861.patch \
 "
 
 raddbdir="${sysconfdir}/${MLPREFIX}raddb"
-- 
2.25.1


