Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5FCCD6E79
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:25:48 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75310.1780997138879593564
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I3A5WWgj;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8422575d1e4so358394b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 02:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780997138; x=1781601938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKb3F8u6yu9zILsWpMAVzjxjiBLrRTje3kO2A+7q7jA=;
        b=I3A5WWgjmGtGSZkrj5Bsn2PopcHvkbE1QaeEbmgUQrwTE17MQaw4+EWiKVT08jwcyR
         EJK25w6WkxzEHKNZ1qKeHpnBf2mzki0ZQoQwzDrxvZWr4Np/iVdytBMefDogCjAAPXPu
         7ygQfhRDjcI9JUrSSQbzzGSfmtEpLpjar9ZiPLt8cIEdiU0VMGktwJEvlKoP5imQ9MQH
         tODx6OY41WK5dT2W7suponmuK2X+O7MIhHkgD9rYt3dZgkCX2oCajmcHGjAZpoKIGeBx
         LzIXyca6bCn/sobEYbo6ACeIxvjGxU3lDCAZDtzBmuTCHRJKgUtEU3JJry++KlLa2XsQ
         eXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997138; x=1781601938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OKb3F8u6yu9zILsWpMAVzjxjiBLrRTje3kO2A+7q7jA=;
        b=MzxrE8mhqmFEkboA8LdXjXa1m2AHu6OJCjTBBTTZH1XajzaF8dMkXHtxzZVsyCf8MU
         yUmx/vVLZHjMeS2MVuYta+2FOMqkd427nM950N9UB7admj6altY8qQFtL9Eazx7mbiJn
         EGmYptkkXGUUm/9wJbrIQ56FqL69K7mrXJ6H7iTTq+U3SkUqvnfxLypiTQz5L52/beR+
         +KnkMpM/AxaLnQTDciEzZxbF5ze8naZ6V3FUQvc8kRY8w+kfDNJO+kMg0SkkrQak+CnT
         B1ahrHorGcUfXZoBzvYaNpimxrvXs/G1nHrKXs9dC4RnXh4b6kKUNlhT8cRb7ZE7gUNx
         1l3g==
X-Gm-Message-State: AOJu0YyFVZsRrOJZsT9rze/0An1nAD8eBZZ07At+7tbBI3ROzHT4PEpG
	eQ8MTD9TRVb5DusjU+mdNEp9fDjgryr6veVS25vYyZvc3e7VNxk9fzg2oYPzAT3SyPBNng==
X-Gm-Gg: Acq92OG+Ov+QP9k+2XHch+jZFsboD2SF4iAkjaCpbl+913xqkY6sKbbgPk4quiDrTfg
	dti+r9SOD0a2T0QoO5o/2QYLM57e/2HW71lLT+90abqdmGsYvENsYpIWhxQFbGxzITy5mG+gUKI
	vQsaxxx0XLMSGsO/IcXpODA1e71gukfoagj9hUxbiEGRSCk/1M8lQ3lVP/PnqJlrN3Q6PYvWvzZ
	ujrWUs+uxB1+k6ShM/GJQjV4yqfnZTKyUooTGPGWg4Lg/MXn4/zPG+H9dGBibePIMM8IoTU8Q58
	Y1PyH0q04079q8F7Td7UANYeN4QV9YT5s+HoQR58hmPXatWO0rOWLgQNKoh1Dq2KhBGV1J4HD8o
	nMb0fWCC/ghpFhvcBvA2JOjUlp11uAQGbSzB3oATQ6vj/WItYU2iPUIrLVKq/zZLxh5KSNFiWto
	a5ldmCubCDIvBdBtWwwO4R4UYZLBv9EH9OCMXBYaFyD29B6ZR5dDG3S2CIk5B3/w==
X-Received: by 2002:a05:6a21:35c6:b0:39f:1dc2:70c with SMTP id adf61e73a8af0-3b4cd4de4a1mr7523997637.6.1780997138167;
        Tue, 09 Jun 2026 02:25:38 -0700 (PDT)
Received: from L-15597L.www.tendawifi.com ([36.255.86.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df043223sm16496633a12.8.2026.06.09.02.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:25:37 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nitin.Wankhade@kpit.com
Subject: [OE-core][scarthgap][PATCH V2 4/6] strongswan: Fix CVE-2026-35331
Date: Tue,  9 Jun 2026 14:54:05 +0530
Message-Id: <20260609092407.893299-4-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609092407.893299-1-nitin.wankhade333@gmail.com>
References: <20260609092407.893299-1-nitin.wankhade333@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 09:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127449

Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/64130ede5cd8f61edd35a1b488c874fa328a42b0]
                          [https://github.com/strongswan/strongswan/commit/c66143db48bab9eb82cc86190687938b809611eb]

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 ...-insensitive-matching-and-reject-exc.patch | 176 ++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |   1 +
 2 files changed, 177 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/constraints-Case-insensitive-matching-and-reject-exc.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/constraints-Case-insensitive-matching-and-reject-exc.patch b/meta-networking/recipes-support/strongswan/strongswan/constraints-Case-insensitive-matching-and-reject-exc.patch
new file mode 100644
index 0000000000..86e530d7e0
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/constraints-Case-insensitive-matching-and-reject-exc.patch
@@ -0,0 +1,176 @@
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 23 Mar 2026 17:45:11 +0100
+Subject: constraints: Case-insensitive matching and reject excluded DN name
+ constraints
+
+The case is generally ignored when matching identities.  So this is
+an issue with excluded name constraints where a malicious intermediate
+CA could evade the constraints by issuing certificates with names that
+just modify the case (e.g. strongSwan.org instead strongswan.org).
+
+Note that it's likely that permitted name constraints are preferred over
+excluded name constraints as it might be difficult to come up with a
+conclusive list of names to exclude.
+
+With directoryName (DN) name constraints the issue is a bit more comples.
+Some RDNs have to be matched in a case-insensitive manner, which we e.g.
+do in `identification.c::rdn_equals`.  By not doing it for name
+constraints, a malicious intermediate CA could evade an excluded name
+constraint just by modifying the case in such an RDN.
+
+While we could use the mentioned function in `dn_matches`, this doesn't
+properly fix the problem because the function is basically too strict.
+Especially in regards to RDNs of type UTF8String, which are only compared
+binary.  To match these properly, we'd have to implement the string
+preparation described in RFC 5280, section 7.1 and the referenced RFCs.
+Until that's the case, we reject excluded name constraints of type
+directoryName as we are unable to enforce them.
+
+Fixes: a2b340764fac ("Implemented NameConstraint matching in constraints plugin")
+Fixes: CVE-2026-35331
+
+CVE: CVE-2026-35331
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/64130ede5cd8f61edd35a1b488c874fa328a42b0]
+                          [https://github.com/strongswan/strongswan/commit/c66143db48bab9eb82cc86190687938b809611eb]
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/src/libstrongswan/plugins/constraints/constraints_validator.c b/src/libstrongswan/plugins/constraints/constraints_validator.c
+index 27bdb89..daa7bfa 100644
+--- a/src/libstrongswan/plugins/constraints/constraints_validator.c
++++ b/src/libstrongswan/plugins/constraints/constraints_validator.c
+@@ -55,6 +55,18 @@ static bool check_pathlen(x509_t *issuer, int pathlen)
+ 	return TRUE;
+ }
+ 
++/**
++ * Check if the constraint and ID strings match case-insensitively
++ */
++static bool string_matches(chunk_t constraint, chunk_t id)
++{
++       /* make sure the two strings have actually the same length */
++       return constraint.len == id.len &&
++                  memchr(constraint.ptr, 0, constraint.len) == NULL &&
++                  memchr(id.ptr, 0, id.len) == NULL &&
++                  strncasecmp(constraint.ptr, id.ptr, constraint.len) == 0;
++}
++
+ /**
+  * Check if a FQDN constraint matches
+  */
+@@ -70,7 +82,7 @@ static bool fqdn_matches(identification_t *constraint, identification_t *id)
+ 		return FALSE;
+ 	}
+ 	diff = chunk_create(i.ptr, i.len - c.len);
+-	if (!chunk_equals(c, chunk_skip(i, diff.len)))
++	if (!string_matches(c, chunk_skip(i, diff.len)))
+ 	{
+ 		return FALSE;
+ 	}
+@@ -101,10 +113,10 @@ static bool email_matches(identification_t *constraint, identification_t *id)
+ 	}
+ 	if (memchr(c.ptr, '@', c.len))
+ 	{	/* constraint is a full email address */
+-		return chunk_equals(c, i);
++		return string_matches(c, i);
+ 	}
+ 	diff = chunk_create(i.ptr, i.len - c.len);
+-	if (!chunk_equals(c, chunk_skip(i, diff.len)))
++	if (!string_matches(c, chunk_skip(i, diff.len)))
+ 	{
+ 		return FALSE;
+ 	}
+@@ -389,9 +401,17 @@ static bool collect_constraints(x509_t *x509, bool permitted, hashtable_t **out)
+ 		type = constraint->get_type(constraint);
+ 		switch (type)
+ 		{
++			case ID_DER_ASN1_DN:
++                               if (!permitted)
++                               {
++                                       DBG1(DBG_CFG, "excluded %N NameConstraint not supported",
++                                                id_type_names, type);
++                                       success = FALSE;
++                                       break;
++                               }
++                               /* fall-through */
+ 			case ID_FQDN:
+ 			case ID_RFC822_ADDR:
+-			case ID_DER_ASN1_DN:
+ 			case ID_IPV4_ADDR_SUBNET:
+ 			case ID_IPV6_ADDR_SUBNET:
+ 				break;
+diff --git a/src/libstrongswan/tests/suites/test_certnames.c b/src/libstrongswan/tests/suites/test_certnames.c
+index 2549fb6..14570ee 100644
+--- a/src/libstrongswan/tests/suites/test_certnames.c
++++ b/src/libstrongswan/tests/suites/test_certnames.c
+@@ -207,8 +207,10 @@ static struct {
+ 	bool good;
+ } permitted_san[] = {
+ 	{ ".strongswan.org", "test.strongswan.org", TRUE },
++	{ ".strongswan.org", "test.strongSwan.org", TRUE },
+ 	{ "strongswan.org", "test.strongswan.org", TRUE },
+ 	{ "a.b.c.strongswan.org", "d.a.b.c.strongswan.org", TRUE },
++	{ "a.b.c.strongswan.org", "d.A.b.C.strongswan.org", TRUE },
+ 	{ "a.b.c.strongswan.org", "a.b.c.d.strongswan.org", FALSE },
+ 	{ "strongswan.org", "strongswan.org.com", FALSE },
+ 	{ ".strongswan.org", "strongswan.org", FALSE },
+@@ -216,8 +218,11 @@ static struct {
+ 	{ "strongswan.org", "swan.org", FALSE },
+ 	{ "strongswan.org", "swan.org", FALSE },
+ 	{ "tester@strongswan.org", "tester@strongswan.org", TRUE },
++	{ "tester@strongswan.org", "tester@strongSwan.org", TRUE },
++	{ "tester@strongswan.org", "TESTER@strongswan.org", TRUE },
+ 	{ "tester@strongswan.org", "atester@strongswan.org", FALSE },
+ 	{ "email:strongswan.org", "tester@strongswan.org", TRUE },
++	{ "email:strongswan.org", "tester@strongSwan.org", TRUE },
+ 	{ "email:strongswan.org", "tester@test.strongswan.org", FALSE },
+ 	{ "email:.strongswan.org", "tester@test.strongswan.org", TRUE },
+ 	{ "email:.strongswan.org", "tester@strongswan.org", FALSE },
+@@ -248,11 +253,11 @@ static struct {
+ 	char *subject;
+ 	bool good;
+ } excluded_dn[] = {
+-	{ "C=CH, O=another", "C=CH, O=strongSwan, CN=tester", TRUE },
+-	{ "C=CH, O=another", "C=CH, O=anot", TRUE },
+-	{ "C=CH, O=another", "C=CH, O=anot, CN=tester", TRUE },
++	{ "C=CH, O=another", "C=CH, O=strongSwan, CN=tester", FALSE },
++	{ "C=CH, O=another", "C=CH, O=anot", FALSE },
++	{ "C=CH, O=another", "C=CH, O=anot, CN=tester", FALSE },
+ 	{ "C=CH, O=another", "C=CH, O=another, CN=tester", FALSE },
+-	{ "C=CH, O=another", "C=CH, CN=tester, O=another", TRUE },
++	{ "C=CH, O=another", "C=CH, CN=tester, O=another", FALSE },
+ };
+ 
+ START_TEST(test_excluded_dn)
+@@ -281,7 +286,9 @@ static struct {
+ } excluded_san[] = {
+ 	{ ".strongswan.org", "test.strongswan.org", FALSE },
+ 	{ "strongswan.org", "test.strongswan.org", FALSE },
++	{ "strongswan.org", "test.strongSwan.org", FALSE },
+ 	{ "a.b.c.strongswan.org", "d.a.b.c.strongswan.org", FALSE },
++	{ "a.b.c.strongswan.org", "d.a.b.C.strongswan.org", FALSE },
+ 	{ "a.b.c.strongswan.org", "a.b.c.d.strongswan.org", TRUE },
+ 	{ "strongswan.org", "strongswan.org.com", TRUE },
+ 	{ ".strongswan.org", "strongswan.org", TRUE },
+@@ -289,8 +296,10 @@ static struct {
+ 	{ "strongswan.org", "swan.org", TRUE },
+ 	{ "strongswan.org", "swan.org", TRUE },
+ 	{ "tester@strongswan.org", "tester@strongswan.org", FALSE },
++	{ "tester@strongswan.org", "TESTER@strongswan.org", FALSE },
+ 	{ "tester@strongswan.org", "atester@strongswan.org", TRUE },
+ 	{ "email:strongswan.org", "tester@strongswan.org", FALSE },
++	{ "email:strongswan.org", "tester@strongSwan.org", FALSE },
+ 	{ "email:strongswan.org", "tester@test.strongswan.org", TRUE },
+ 	{ "email:.strongswan.org", "tester@test.strongswan.org", FALSE },
+ 	{ "email:.strongswan.org", "tester@strongswan.org", TRUE },
+@@ -418,9 +427,9 @@ static struct {
+ 	char *subject;
+ 	bool good;
+ } excluded_dn_levels[] = {
+-	{ "C=CH, O=strongSwan", "C=CH", "C=DE", TRUE },
++	{ "C=CH, O=strongSwan", "C=CH", "C=DE", FALSE },
+ 	{ "C=CH, O=strongSwan", "C=CH", "C=CH", FALSE },
+-	{ "C=CH, O=strongSwan", "C=DE", "C=CH", TRUE },
++	{ "C=CH, O=strongSwan", "C=DE", "C=CH", FALSE },
+ 	{ "C=CH, O=strongSwan", "C=DE", "C=DE", FALSE },
+ 	{ "C=CH, O=strongSwan", "C=DE", "C=CH, O=strongSwan", FALSE },
+ 	{ NULL, "C=CH", "C=CH, O=strongSwan", FALSE },
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index 85fd95d6b8..41a4de845f 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://tls-server-Prevent-infinite-loop-if-supported-versio.patch \
            file://pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch \
            file://libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes.patch \
+           file://constraints-Case-insensitive-matching-and-reject-exc.patch \
            "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
-- 
2.34.1


