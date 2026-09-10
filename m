Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8421C88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:09:56 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27825.1789081787888692604
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c/m8+YEQ;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso265441a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081787; x=1789686587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKFVlwQVYD6zrfBakG8yUJYdGoCWSd6q6BW/yxHEEhs=;
        b=c/m8+YEQ6UkpV2S4pqBVnidWoxUgiEeJ1sFAbW2v6vIKmRE6aUPZXdDOQtm1qctPha
         BIti8GaoxRuIo+HMzHZ0CXQZRQe3h2bkOMU6jMHJitHo6UejdELF1VX+9nZc74vaE1kE
         Rqgqq81m37lWvuMvNuza50XuDEPN8zePdBh7nQHzJv2kvIMvSNbt1/vVFL64Fu4fFmWc
         B8EW1GkIiRHpazYib+uRqKRl7ccVMhBBZX6ULeUci5WxxwV7sVMsRxKQKhKD58uowr5g
         0mYoeCVSV01ldxJCFE05ARtzoHJCxkXLfj71Equ6SqYHjHDHJP5HpNuiKotRSzZL5OlS
         +Mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081787; x=1789686587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKFVlwQVYD6zrfBakG8yUJYdGoCWSd6q6BW/yxHEEhs=;
        b=abKub22cI0C1JoCMPHGiYrXRDOUM9ycahkCwYYcCP7fraapmH4TeCPAC2nan0ntYn5
         uRSwu80aqrtbXDADe83jtnlsRoqvB6wpCVoJioLy33Z0+kCvfmOlHkbPmuMVMK6AHmmq
         aQsqHm3FqzFOiE6SRHVjGmREHbTwz0Jh32fM6UNj+JzFabXNSNJzCZgRuYmkdYaiQP96
         8H439sSyj3yjjrKkLQsh+4hjOJnNJwFtToda+WAA/HAyqv0JBrXLq1Lxbhknb3TkjUMm
         7/M1X18NfeVWeDzajUyNch4xawnoodNI2OV7ohgXOOM5X8URg7vESYfZxxtFTqkYwr53
         NWMQ==
X-Gm-Message-State: AFuF++nxffE5rRNIyZ72RhQA4pBGh1qYI1YZeDF6muM3kqiRmPkUPdf4
	V4gWL9UVouxCPYENxLkRg9Wnb3hzNMPGTMe25qYSGGhLxXbLuiVtab4lbmkoGw==
X-Gm-Gg: AYBFou1t6RxsA4asINCVb1gn+Yp3fK1lsvWHb9qJb3WxD+FAqprRF98QWKrcsjED/dA
	xs/Xj8WxF0XHtF7PfKXA63K9WthOQvCPTq7JEL1ONIUJoMON/012xU6NJzkyFqLGsoovViCmMnq
	BoRFWk+n5lHv+9gARYumkLA8MZdnKguFaZp0K+aiTxRoeqcrLe8WuKGdGa8jSb/ssTUY/UnsVOw
	PZ8JhR4BaH6FhqqOMpgrolPu16wKVdD1vbSaFq+yA6Y5P2SwXk+BjuS4cYUvRqxvW/V6Vg4gAHn
	dHlHJVd/ptKfurztACdbR4jlIhN6eyKnUCtWLQQbTwC7hD7eMi696KIRYo12A/wT80gk4RXUt2k
	ifnJ7Blbw3S+zDk160x1IzH2ydbZ0Qb1Y3NJcmbZpJ/EPkNyAw/aXtdyiCd3bs5GdxgmxhGyp4D
	D4H3QyXMqKi3qb4pu8InmpRXARrwncic+b1yh7+Za/OTo/uCnxQ/YlhlyYjlH9/0EUz/S0/4mPQ
	1evhubfq5NHdhwjWwdxoBE=
X-Received: by 2002:a17:90a:d64e:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39d9c1db130mr1944870a91.13.1789081786997;
        Thu, 10 Sep 2026 16:09:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:09:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 2/32] unbound: patch CVE-2026-33278
Date: Fri, 11 Sep 2026 11:09:01 +1200
Message-ID: <20260910230932.173913-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129920

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-33278

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-33278.patch      | 296 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |   1 +
 2 files changed, 297 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-33278.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-33278.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-33278.patch
new file mode 100644
index 0000000000..b42b613546
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-33278.patch
@@ -0,0 +1,296 @@
+From f7633e132f79548d71c02ed66d55a82c23ea0a82 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 20 May 2026 10:13:08 +0200
+Subject: [PATCH] - Fix CVE-2026-33278, Possible remote code execution during
+ DNSSEC   validation. Thanks to Qifan Zhang, Palo Alto Networks, for the
+ report.
+
+(cherry picked from commit 6a31e470f80a6e5c559ebe7fd4cfc0582d3b6d0a)
+
+CVE: CVE-2026-33278
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/6a31e470f80a6e5c559ebe7fd4cfc0582d3b6d0a]
+
+Dropped changes to the Changelog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/cache/dns.c                |  8 +++-
+ testdata/val_nsec3_iter_high.rpl    | 18 ++++----
+ testdata/val_nx_nsec3_collision.rpl | 31 +++++--------
+ testdata/val_nx_nsec3_params.rpl    | 22 +++++----
+ validator/val_nsec3.c               | 71 +++++++++++++++++++++++++++++
+ 5 files changed, 111 insertions(+), 39 deletions(-)
+
+diff --git a/services/cache/dns.c b/services/cache/dns.c
+index 351b3568c..8dae2ffcc 100644
+--- a/services/cache/dns.c
++++ b/services/cache/dns.c
+@@ -675,10 +675,16 @@ struct dns_msg*
+ dns_msg_deepcopy_region(struct dns_msg* origin, struct regional* region)
+ {
+ 	size_t i;
++	struct ub_packed_rrset_key** saved_rrsets;
+ 	struct dns_msg* res = NULL;
++	size_t rep_alloc_size = sizeof(struct reply_info)
++		- sizeof(struct rrset_ref);  /* this is the size of res->rep
++						allocated in gen_dns_msg() */
+ 	res = gen_dns_msg(region, &origin->qinfo, origin->rep->rrset_count);
+ 	if(!res) return NULL;
+-	*res->rep = *origin->rep;
++	saved_rrsets = res->rep->rrsets; /* save rrsets alloc by gen_dns_msg */
++	memcpy(res->rep, origin->rep, rep_alloc_size);
++	res->rep->rrsets = saved_rrsets;
+ 	if(origin->rep->reason_bogus_str) {
+ 		res->rep->reason_bogus_str = regional_strdup(region,
+ 			origin->rep->reason_bogus_str);
+diff --git a/testdata/val_nsec3_iter_high.rpl b/testdata/val_nsec3_iter_high.rpl
+index 2b78f0b7f..703092d89 100644
+--- a/testdata/val_nsec3_iter_high.rpl
++++ b/testdata/val_nsec3_iter_high.rpl
+@@ -120,12 +120,12 @@ example.com.	IN SOA	ns.example.com. hostmaster.example.com. 2007090400 28800 720
+ example.com.    3600    IN      RRSIG   SOA 3 2 3600 20070926134150 20070829134150 2854 example.com. MC0CFCNGZ+/OfElYQMCZ77O9Lw9rhk7PAhUAmDcvTAst6Bq83qPq3r6c/Dm1nFc= ;{id = 2854}
+ 
+ ; closest encloser, H(example.com).
+-6md8numosa4q9ugkffdo1bmm82t5j39s.example.com. NSEC3 1 1 8 - 6md8numosa4q9ugkffdo1bmm82t5j49s SOA NS MX DNSKEY RRSIG
+-6md8numosa4q9ugkffdo1bmm82t5j39s.example.com.   3600    IN      RRSIG   NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. MC0CFQCz/LkFOFcaQzVnyySW9ZoVUnxh7gIUdxyS9vqVDzo8pGhFU+3YogN2ZRk= ;{id = 2854}
++b6fuorg741ufili49mg9j4328ig53sqg.example.com. NSEC3 1 1 123 aabb00123456bbccdd b6fuorg741ufili49mg9j4328ig53sqh SOA NS MX DNSKEY RRSIG
++b6fuorg741ufili49mg9j4328ig53sqg.example.com.	3600	IN	RRSIG	NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. AJlV5car66lq5f0ASx7W47A/OADkARAXzKt9ZLojXze+FWK9JjAX+eA=
+ 
+-; wildcard denial, H(*.example.com.) = 4f3cnt8cu22tngec382jj4gde4rb47ub
+-4f3cnt8cu22tngec382jj4gde4rb46ub.example.com. NSEC3 1 1 0 - 4f3cnt8cu22tngec382jj4gde4rb48ub A MX RRSIG
+-4f3cnt8cu22tngec382jj4gde4rb46ub.example.com.   3600    IN      RRSIG   NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. MCwCFHS+i/OB/V/gYmS1eQTXieXIXGjsAhQQ0Ql7TW/hsUklrb0DfoyhVPG95Q== ;{id = 2854}
++; wildcard denial, H(*.example.com.) = k1a2vr9c269jummpru5d68qllbfmtdcb.
++k1a2vr9c269jummpru5d68qllbfmtacb.example.com. NSEC3 1 1 123 aabb00123456bbccdd k1a2vr9c269jummpru5d68qllbfmtgcb A MX RRSIG
++k1a2vr9c269jummpru5d68qllbfmtacb.example.com.	3600	IN	RRSIG	NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. AARB9z4C1WZUI3WP3QAR7RJXFnN0qEBkEt8ocudxXzms4/7/2l6NNWc=
+ 
+ ; next closer name, H(www.example.com.) = s1unhcti19bkdr98fegs0v46mbu3t4m3.
+ s1unhcti19bkdr98fegs0v46mbu3t4m2.example.com. NSEC3 1 1 123 aabb00123456bbccdd s1unhcti19bkdr98fegs0v46mbu3t4m4 A MX RRSIG
+@@ -152,10 +152,10 @@ SECTION ANSWER
+ SECTION AUTHORITY
+ example.com.	IN SOA	ns.example.com. hostmaster.example.com. 2007090400 28800 7200 604800 18000
+ example.com.    3600    IN      RRSIG   SOA 3 2 3600 20070926134150 20070829134150 2854 example.com. MC0CFCNGZ+/OfElYQMCZ77O9Lw9rhk7PAhUAmDcvTAst6Bq83qPq3r6c/Dm1nFc= ;{id = 2854}
+-6md8numosa4q9ugkffdo1bmm82t5j39s.example.com. NSEC3 1 1 8 - 6md8numosa4q9ugkffdo1bmm82t5j49s SOA NS MX DNSKEY RRSIG
+-6md8numosa4q9ugkffdo1bmm82t5j39s.example.com.   3600    IN      RRSIG   NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. MC0CFQCz/LkFOFcaQzVnyySW9ZoVUnxh7gIUdxyS9vqVDzo8pGhFU+3YogN2ZRk= ;{id = 2854}
+-4f3cnt8cu22tngec382jj4gde4rb46ub.example.com. NSEC3 1 1 0 - 4f3cnt8cu22tngec382jj4gde4rb48ub A MX RRSIG
+-4f3cnt8cu22tngec382jj4gde4rb46ub.example.com.   3600    IN      RRSIG   NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. MCwCFHS+i/OB/V/gYmS1eQTXieXIXGjsAhQQ0Ql7TW/hsUklrb0DfoyhVPG95Q== ;{id = 2854}
++b6fuorg741ufili49mg9j4328ig53sqg.example.com. NSEC3 1 1 123 aabb00123456bbccdd b6fuorg741ufili49mg9j4328ig53sqh SOA NS MX DNSKEY RRSIG
++b6fuorg741ufili49mg9j4328ig53sqg.example.com.	3600	IN	RRSIG	NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. AJlV5car66lq5f0ASx7W47A/OADkARAXzKt9ZLojXze+FWK9JjAX+eA=
++k1a2vr9c269jummpru5d68qllbfmtacb.example.com. NSEC3 1 1 123 aabb00123456bbccdd k1a2vr9c269jummpru5d68qllbfmtgcb A MX RRSIG
++k1a2vr9c269jummpru5d68qllbfmtacb.example.com.	3600	IN	RRSIG	NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. AARB9z4C1WZUI3WP3QAR7RJXFnN0qEBkEt8ocudxXzms4/7/2l6NNWc=
+ s1unhcti19bkdr98fegs0v46mbu3t4m2.example.com. NSEC3 1 1 123 aabb00123456bbccdd s1unhcti19bkdr98fegs0v46mbu3t4m4 A MX RRSIG
+ s1unhcti19bkdr98fegs0v46mbu3t4m2.example.com.   3600    IN      RRSIG   NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. MC0CFFSH4klZKke48dYyddYDj17gjTS0AhUAltWicpFLWqW98/Af9Qlx70MH8o4= ;{id = 2854}
+ 
+diff --git a/testdata/val_nx_nsec3_collision.rpl b/testdata/val_nx_nsec3_collision.rpl
+index 87a55f565..1b1f49e80 100644
+--- a/testdata/val_nx_nsec3_collision.rpl
++++ b/testdata/val_nx_nsec3_collision.rpl
+@@ -89,6 +89,17 @@ ns.example.com.         IN      A       1.2.3.4
+ ns.example.com. 3600    IN      RRSIG   A 3 3 3600 20070926135752 20070829135752 2854 example.com. MC0CFQCMSWxVehgOQLoYclB9PIAbNP229AIUeH0vNNGJhjnZiqgIOKvs1EhzqAo= ;{id = 2854}
+ ENTRY_END
+ 
++ENTRY_BEGIN
++MATCH opcode qtype qname
++ADJUST copy_id
++REPLY QR AA NOERROR
++SECTION QUESTION
++ns.example.com. IN AAAA
++SECTION AUTHORITY
++example.com.	IN SOA	ns.example.com. hostmaster.example.com. 2007090400 28800 7200 604800 18000
++example.com.    3600    IN      RRSIG   SOA 3 2 3600 20070926134150 20070829134150 2854 example.com. MC0CFCNGZ+/OfElYQMCZ77O9Lw9rhk7PAhUAmDcvTAst6Bq83qPq3r6c/Dm1nFc= ;{id = 2854}
++ENTRY_END
++
+ ; response to DNSKEY priming query
+ ENTRY_BEGIN
+ MATCH opcode qtype qname
+@@ -163,29 +174,11 @@ STEP 2 TIME_PASSES ELAPSE 0.05
+ STEP 10 CHECK_ANSWER
+ ENTRY_BEGIN
+ MATCH all
+-REPLY QR RD RA DO NXDOMAIN
++REPLY QR RD RA DO SERVFAIL
+ SECTION QUESTION
+ www.example.com. IN A
+ SECTION ANSWER
+ SECTION AUTHORITY
+-example.com.	IN SOA	ns.example.com. hostmaster.example.com. 2007090400 28800 7200 604800 18000
+-example.com.    3600    IN      RRSIG   SOA 3 2 3600 20070926134150 20070829134150 2854 example.com. MC0CFCNGZ+/OfElYQMCZ77O9Lw9rhk7PAhUAmDcvTAst6Bq83qPq3r6c/Dm1nFc= ;{id = 2854}
+-6md8numosa4q9ugkffdo1bmm82t5j39s.example.com. NSEC3  1 1 123 aabb00123456bbccdd 6md8numosa4q9ugkffdo1bmm82t5j49s A RRSIG
+-6md8numosa4q9ugkffdo1bmm82t5j39s.example.com. NSEC3 1 1 8 - 6md8numosa4q9ugkffdo1bmm82t5j49s SOA NS MX DNSKEY RRSIG
+-6md8numosa4q9ugkffdo1bmm82t5j39s.example.com.   3600    IN      RRSIG   NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. MCwCFHndWrEEbuzezs/4lxeiMgEuUsUbAhR72gJgd/Zmhf80yoxCauw9k5OkCw== ;{id = 2854}
+-4f3cnt8cu22tngec382jj4gde4rb46ub.example.com. NSEC3 1 1 18 - 4f3cnt8cu22tngec382jj4gde4rb87ub A RRSIG
+-4f3cnt8cu22tngec382jj4gde4rb46ub.example.com. NSEC3 1 1 0 - 4f3cnt8cu22tngec382jj4gde4rb48ub A MX RRSIG
+-4f3cnt8cu22tngec382jj4gde4rb46ub.example.com. NSEC3 1 1 19 - 4f3cnt8cu22tngec382jj4gde4rb87ub A RRSIG
+-4f3cnt8cu22tngec382jj4gde4rb46ub.example.com.   3600    IN      RRSIG   NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. MCwCFDRwji51WCXJg7W/3+Jx586af5qgAhQPxHegtzu1I/QbvCNrOOON05N1rw== ;{id = 2854}
+-s1unhcti19bkdr98fegs0v46mbu3t4m2.example.com. NSEC3 1 1 18 -  s1unhcti19bkdr98fegs0v46mbu3t4m4 A RRSIG
+-s1unhcti19bkdr98fegs0v46mbu3t4m2.example.com. NSEC3 1 1 19 -  s1unhcti19bkdr98fegs0v46mbu3t4m4 A RRSIG
+-s1unhcti19bkdr98fegs0v46mbu3t4m2.example.com. NSEC3 1 1 20 00  s1unhcti19bkdr98fegs0v46mbu3t4m4 A RRSIG
+-s1unhcti19bkdr98fegs0v46mbu3t4m2.example.com. NSEC3 1 1 123 aabb00123456bbccdd s1unhcti19bkdr98fegs0v46mbu3t4m4 A MX RRSIG
+-s1unhcti19bkdr98fegs0v46mbu3t4m2.example.com. NSEC3 1 1 20 01  s1unhcti19bkdr98fegs0v46mbu3t4m4 A RRSIG
+-s1unhcti19bkdr98fegs0v46mbu3t4m2.example.com. NSEC3 1 1 20 02  s1unhcti19bkdr98fegs0v46mbu3t4m4 A RRSIG
+-s1unhcti19bkdr98fegs0v46mbu3t4m2.example.com. NSEC3 1 1 20 03  s1unhcti19bkdr98fegs0v46mbu3t4m4 A RRSIG
+-s1unhcti19bkdr98fegs0v46mbu3t4m2.example.com.   3600    IN      RRSIG   NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. MCwCFDLy4GbR8ZaKHATVJGnGxzpsuq60AhQ1/pRbXi1ZbcYohzHgWzNC50fC5A== ;{id = 2854}
+-
+ SECTION ADDITIONAL
+ ENTRY_END
+ 
+diff --git a/testdata/val_nx_nsec3_params.rpl b/testdata/val_nx_nsec3_params.rpl
+index dd3ab6b57..59bef2be3 100644
+--- a/testdata/val_nx_nsec3_params.rpl
++++ b/testdata/val_nx_nsec3_params.rpl
+@@ -88,6 +88,17 @@ ns.example.com.         IN      A       1.2.3.4
+ ns.example.com. 3600    IN      RRSIG   A 3 3 3600 20070926135752 20070829135752 2854 example.com. MC0CFQCMSWxVehgOQLoYclB9PIAbNP229AIUeH0vNNGJhjnZiqgIOKvs1EhzqAo= ;{id = 2854}
+ ENTRY_END
+ 
++ENTRY_BEGIN
++MATCH opcode qtype qname
++ADJUST copy_id
++REPLY QR AA NOERROR
++SECTION QUESTION
++ns.example.com. IN AAAA
++SECTION AUTHORITY
++example.com.	IN SOA	ns.example.com. hostmaster.example.com. 2007090400 28800 7200 604800 18000
++example.com.    3600    IN      RRSIG   SOA 3 2 3600 20070926134150 20070829134150 2854 example.com. MC0CFCNGZ+/OfElYQMCZ77O9Lw9rhk7PAhUAmDcvTAst6Bq83qPq3r6c/Dm1nFc= ;{id = 2854}
++ENTRY_END
++
+ ; response to DNSKEY priming query
+ ENTRY_BEGIN
+ MATCH opcode qtype qname
+@@ -144,20 +155,11 @@ ENTRY_END
+ STEP 10 CHECK_ANSWER
+ ENTRY_BEGIN
+ MATCH all
+-REPLY QR RD RA DO NXDOMAIN
++REPLY QR RD RA DO SERVFAIL
+ SECTION QUESTION
+ www.example.com. IN A
+ SECTION ANSWER
+ SECTION AUTHORITY
+-example.com.	IN SOA	ns.example.com. hostmaster.example.com. 2007090400 28800 7200 604800 18000
+-example.com.    3600    IN      RRSIG   SOA 3 2 3600 20070926134150 20070829134150 2854 example.com. MC0CFCNGZ+/OfElYQMCZ77O9Lw9rhk7PAhUAmDcvTAst6Bq83qPq3r6c/Dm1nFc= ;{id = 2854}
+-6md8numosa4q9ugkffdo1bmm82t5j39s.example.com. NSEC3 1 1 8 - 6md8numosa4q9ugkffdo1bmm82t5j49s SOA NS MX DNSKEY RRSIG
+-6md8numosa4q9ugkffdo1bmm82t5j39s.example.com.   3600    IN      RRSIG   NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. MC0CFQCz/LkFOFcaQzVnyySW9ZoVUnxh7gIUdxyS9vqVDzo8pGhFU+3YogN2ZRk= ;{id = 2854}
+-4f3cnt8cu22tngec382jj4gde4rb46ub.example.com. NSEC3 1 1 0 - 4f3cnt8cu22tngec382jj4gde4rb48ub A MX RRSIG
+-4f3cnt8cu22tngec382jj4gde4rb46ub.example.com.   3600    IN      RRSIG   NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. MCwCFHS+i/OB/V/gYmS1eQTXieXIXGjsAhQQ0Ql7TW/hsUklrb0DfoyhVPG95Q== ;{id = 2854}
+-s1unhcti19bkdr98fegs0v46mbu3t4m2.example.com. NSEC3 1 1 123 aabb00123456bbccdd s1unhcti19bkdr98fegs0v46mbu3t4m4 A MX RRSIG
+-s1unhcti19bkdr98fegs0v46mbu3t4m2.example.com.   3600    IN      RRSIG   NSEC3 3 3 3600 20070926135752 20070829135752 2854 example.com. MC0CFFSH4klZKke48dYyddYDj17gjTS0AhUAltWicpFLWqW98/Af9Qlx70MH8o4= ;{id = 2854}
+-
+ SECTION ADDITIONAL
+ ENTRY_END
+ 
+diff --git a/validator/val_nsec3.c b/validator/val_nsec3.c
+index 998fcc4e3..92d853825 100644
+--- a/validator/val_nsec3.c
++++ b/validator/val_nsec3.c
+@@ -456,6 +456,67 @@ filter_init(struct nsec3_filter* filter, struct ub_packed_rrset_key** list,
+ 	}
+ }
+ 
++/** Check if the NSEC3s have the same parameter set. */
++static int
++param_set_same(struct nsec3_filter* flt, char** reason)
++{
++	size_t rrsetnum;
++	int rrnum;
++	struct ub_packed_rrset_key* rrset;
++	int have_params = 0;
++	int first_algo = 0;
++	size_t first_iter = 0;
++	uint8_t* first_salt = NULL;
++	size_t first_saltlen = 0;
++
++	/* If the NSEC3 parameter sets have distinct values, then they are
++	 * from different NSEC3 chains, and we do not want that. */
++	for(rrset=filter_first(flt, &rrsetnum, &rrnum); rrset;
++		rrset=filter_next(flt, &rrsetnum, &rrnum)) {
++		if(!have_params) {
++			first_algo = nsec3_get_algo(rrset, rrnum);
++			first_iter = nsec3_get_iter(rrset, rrnum);
++			if(!nsec3_get_salt(rrset, rrnum, &first_salt,
++				&first_saltlen)) {
++				verbose(VERB_ALGO, "NSEC3 salt malformed");
++				if(reason)
++					*reason = "NSEC3 salt malformed";
++				return 0;
++			}
++			have_params = 1;
++		} else {
++			uint8_t* salt = NULL;
++			size_t saltlen = 0;
++			if(nsec3_get_algo(rrset, rrnum) != first_algo) {
++				verbose(VERB_ALGO, "NSEC3 algorithm mismatch");
++				if(reason)
++					*reason = "NSEC3 algorithm mismatch";
++				return 0;
++			}
++			if(nsec3_get_iter(rrset, rrnum) != first_iter) {
++				verbose(VERB_ALGO, "NSEC3 iterations mismatch");
++				if(reason)
++					*reason = "NSEC3 iterations mismatch";
++				return 0;
++			}
++			if(!nsec3_get_salt(rrset, rrnum, &salt, &saltlen)) {
++				verbose(VERB_ALGO, "NSEC3 salt malformed");
++				if(reason)
++					*reason = "NSEC3 salt malformed";
++				return 0;
++			}
++			if(saltlen != first_saltlen ||
++				memcmp(salt, first_salt, saltlen) != 0) {
++				verbose(VERB_ALGO, "NSEC3 salt mismatch");
++				if(reason)
++					*reason = "NSEC3 salt mismatch";
++				return 0;
++			}
++		}
++	}
++	return 1;
++}
++
+ /**
+  * Find max iteration count using config settings and key size
+  * @param ve: validator environment with iteration count config settings.
+@@ -1192,6 +1253,8 @@ nsec3_prove_nameerror(struct module_env* env, struct val_env* ve,
+ 	filter_init(&flt, list, num, qinfo); /* init RR iterator */
+ 	if(!flt.zone)
+ 		return sec_status_bogus; /* no RRs */
++	if(!param_set_same(&flt, NULL))
++		return sec_status_bogus; /* nsec3 params from distinct chains*/
+ 	if(nsec3_iteration_count_high(ve, &flt, kkey))
+ 		return sec_status_insecure; /* iteration count too high */
+ 	log_nametypeclass(VERB_ALGO, "start nsec3 nameerror proof, zone", 
+@@ -1378,6 +1441,8 @@ nsec3_prove_nodata(struct module_env* env, struct val_env* ve,
+ 	filter_init(&flt, list, num, qinfo); /* init RR iterator */
+ 	if(!flt.zone)
+ 		return sec_status_bogus; /* no RRs */
++	if(!param_set_same(&flt, NULL))
++		return sec_status_bogus; /* nsec3 params from distinct chains*/
+ 	if(nsec3_iteration_count_high(ve, &flt, kkey))
+ 		return sec_status_insecure; /* iteration count too high */
+ 	return nsec3_do_prove_nodata(env, &flt, ct, qinfo, calc);
+@@ -1401,6 +1466,8 @@ nsec3_prove_wildcard(struct module_env* env, struct val_env* ve,
+ 	filter_init(&flt, list, num, qinfo); /* init RR iterator */
+ 	if(!flt.zone)
+ 		return sec_status_bogus; /* no RRs */
++	if(!param_set_same(&flt, NULL))
++		return sec_status_bogus; /* nsec3 params from distinct chains*/
+ 	if(nsec3_iteration_count_high(ve, &flt, kkey))
+ 		return sec_status_insecure; /* iteration count too high */
+ 
+@@ -1503,6 +1570,8 @@ nsec3_prove_nods(struct module_env* env, struct val_env* ve,
+ 		*reason = "no NSEC3 records";
+ 		return sec_status_bogus; /* no RRs */
+ 	}
++	if(!param_set_same(&flt, reason))
++		return sec_status_bogus; /* nsec3 params from distinct chains*/
+ 	if(nsec3_iteration_count_high(ve, &flt, kkey))
+ 		return sec_status_insecure; /* iteration count too high */
+ 
+@@ -1596,6 +1665,8 @@ nsec3_prove_nxornodata(struct module_env* env, struct val_env* ve,
+ 	filter_init(&flt, list, num, qinfo); /* init RR iterator */
+ 	if(!flt.zone)
+ 		return sec_status_bogus; /* no RRs */
++	if(!param_set_same(&flt, NULL))
++		return sec_status_bogus; /* nsec3 params from distinct chains*/
+ 	if(nsec3_iteration_count_high(ve, &flt, kkey))
+ 		return sec_status_insecure; /* iteration count too high */
+ 
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index e41e2dc065..d703b27506 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;tag=release-${PV} \
            file://run-ptest \
+           file://CVE-2026-33278.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

