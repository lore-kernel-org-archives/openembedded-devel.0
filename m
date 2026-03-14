Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA7E107BCF7
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 05:41:55 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4871.1773466910635183297
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 22:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RJLW2h62;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=hmPfr5JT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E4BrE1721944
	for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 05:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VcqTIZm/xUp2P13c0DskXJHkk06LTRdl6mh
	M0BUOa1I=; b=RJLW2h62L+9FTiz7+oP1Ga5feG/yAHipNdf/AZWs+P1jPj+SJNi
	TUwqcAZ/2vlaud4bpju8kfk2zn3fvofIxOSRban37DiCRUs08pRvtkAVQNauDu/+
	FPWkX68u1C7/6Dq07c388BLIIslLBz/eI55bORgG/v0q67IqkjvsW8nogdAFawD4
	HiPF3YeptgE/ViVARCXgjDKC5XCa/BsNqm2KemTBaZ1GxnGmDgpLSDpVeDMgs6Rf
	gGZS242bh55TGBRSwHHwRV5Za8WWKlc/0wqwL7N8xVJNDGvO54mv/QGTQajrPi4M
	CKq+WaqNjiE6t3dMN45U2gBRUvuufQz3Byw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0ec849b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 05:41:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aec809f910so124328175ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 22:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773466909; x=1774071709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcqTIZm/xUp2P13c0DskXJHkk06LTRdl6mhM0BUOa1I=;
        b=hmPfr5JTDB1Zuo0Z1SPo+GjYhsDTU257lyQvtyG7gJFXOPH6k+Y/SgMRe9VzCFrcZK
         mSZl7aWYVMCzaHOLZQdEJFy5bUF7N9vMx4K48FMsW+SLuul8ASXHO7wBOypdR1i9UzKa
         9Ca3QFcdl8EYZZg2xfUZxlfzLDpDHuPvNk/wvFZzVhJvWuzIGOcsAorqipz/R+mpieH/
         INGqC5QBfVkij9H7qgYrrXndNjd+pxZ8flTVk1DRSHpBgKusSZminwM8n0dRMdKL3eL9
         J133TkIgY4YlQ+gQ2NBBC/F4jlefBfvkMbhp2z0fYWUpc2IOT540T9O1hC7ccq/EudIA
         wdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773466909; x=1774071709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcqTIZm/xUp2P13c0DskXJHkk06LTRdl6mhM0BUOa1I=;
        b=SqH7wy8KuhbRCKbBiM8N3MopOilkCi7bsIP8aIJY0yGiEtM8R5c7goyPPsocRfY2Bi
         2UrWQTsY1FMNCCYwqBFrhNW5GZbzRBXYO3GSpp3jy2dOWi9w4dcOakGz9AWdpD9g6FUT
         YGEqD3Y5szFIJ4aomkD0MjqUVXkzTbVxU2HQOYlAsti1RdZccVlYDJjmHYoebR2Ne00e
         qNvMly9QQRLhnmoln10cH4wzgEh1l/dBSGcX+H5DndbFnaeO+oHI3OxJtUgfRZPqf/aS
         erAI2sMQqpQJfo/GF97rLXzNaVofqcKP0XSGyjEfMgns9GRLq95aV482iWH/7sAJiOUp
         xJNQ==
X-Gm-Message-State: AOJu0Yz9MGHsK/68jn96LtPhmx+8HslEQmYHp6c1QWCpat8FyK2wviqF
	zmw7Xd+89DxND5LJeMJsXu23olU1BmYvuSRcCe8+061dRQLZN+q0PyB6QCNoSiFwcrcpFxSLPV8
	0SoDE8VDWU+cxKBqQ/qlpjeNWEAT1Xz1UsSpcJ/uJFF3zOw6qYHZTLhLenKKj1M8faoXih2bmo/
	UG+Flb+ifA3Flstzij
X-Gm-Gg: ATEYQzxUhXMpIWe/UjUHU5PyB28dFwdVOjA6jdvmxN8Ga+WoCmBVSZaGHbiwSbIet66
	IJmVk4KBxrnjV+FCAVG5e+SvCoAJQivY4YerHLeuH86aKnHvfduCZlx82pHWvoeLQcfITPG1zw+
	zdA02nXO3gMoDG3O0kFy/KVbmQgMNGLIIARJQeAlzB51F4TZ7XAJS5QhqjoqgzNf6xNszZQrxRy
	LyRXuTJKPj78CZW+/GagCvZyy6vDOpkeKq6+koF2viQGB6Oz2QY6HX04aU84y+OetzYaMSTAbEk
	vijqOBbGZW8RXY4xsiHcdYdTDQpeW+P3coYlKhe4OU7YW83ASM/GUES73pQY2Fb+aqzDhBZnrKf
	C/6x+TzhLKXAurcsoJoiQ1jvglJmVx4Nml7uURvgGQ5OOwY8ABffISJuDMq5vWIjUpSPVaUjZpC
	gQVSMOZddZTf/HGj4UsGA=
X-Received: by 2002:a17:903:230a:b0:2ae:45b3:b688 with SMTP id d9443c01a7336-2aecac5fa42mr62881825ad.45.1773466908999;
        Fri, 13 Mar 2026 22:41:48 -0700 (PDT)
X-Received: by 2002:a17:903:230a:b0:2ae:45b3:b688 with SMTP id d9443c01a7336-2aecac5fa42mr62881615ad.45.1773466908464;
        Fri, 13 Mar 2026 22:41:48 -0700 (PDT)
Received: from hyd-e160-a01-2-02.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56ca17sm43732105ad.13.2026.03.13.22.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 22:41:47 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [meta-oe][PATCH] krb5: backport additional fixes to build with glibc 2.43
Date: Sat, 14 Mar 2026 11:11:42 +0530
Message-Id: <20260314054142.1736077-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: M1ddoSU9P-ZDhi0eNiAQBNbbl85fzm_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA0MiBTYWx0ZWRfX8pTDICb7YY1I
 B852cV4ntxly8W2mn0pbu/2aSqOaYMIfAo4RKHT7tiObf38CCcV3pyKykKSWgTbZEYPnondPJN2
 GFXmWynM+C2xQAgNdJjsMnqj5RBds5RLFji40HJERnDAc3w7soDnH7NtNrK3GNIEdzGKnwqwPdt
 HrCm5DV+FCY95E49aiFqw+2w/3G06dKAqWv/Vit3Ns2HPO7/PAkLRjnr2bXZoyDnh/OsA/DRC3q
 71uP+DIiNFNcMCaKGaj6xyymDi1F6ViK8zWSgkMWMPdcKMFfwJSzXJzSkUyq8E4DK/27r3/SaP5
 CcWb7oa8LpWt5eQy1a9JehYzO7iYwR4U8xZ8R4d/zbVC8sEG6PlAusKxybImyzx2KCE1um2VL47
 7VZwoZh5N/q2+vrbCsPDIQTJOcdR4tyU2B7LOu8BuoN57dzHTZRzx2yPGOug2EmFgfM9LuIWnBE
 pXT8uFnOoPpxaS2swTw==
X-Proofpoint-ORIG-GUID: M1ddoSU9P-ZDhi0eNiAQBNbbl85fzm_7
X-Authority-Analysis: v=2.4 cv=BqqQAIX5 c=1 sm=1 tr=0 ts=69b4f51e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8
 a=Gz7s5_CCAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=wQafo45VHyY9P-XjVBYA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 05:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125197

Building krb5 with glibc 2.43 fails due to ISO C23 changes to strchr() and
related search functions. Backport the upstream fix that updates code to
use correct pointer types and adjusts function signatures accordingly.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 .../krb5/fix-strchr-conformance-to-C23.patch  | 191 ++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.22.2.bb  |   1 +
 2 files changed, 192 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/fix-strchr-conformance-to-C23.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/fix-strchr-conformance-to-C23.patch b/meta-oe/recipes-connectivity/krb5/krb5/fix-strchr-conformance-to-C23.patch
new file mode 100644
index 0000000000..0cc50d2fdb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/fix-strchr-conformance-to-C23.patch
@@ -0,0 +1,191 @@
+From cf3fcbb7ad5f3ffd78eb7dd4ecbc96c98ad15208 Mon Sep 17 00:00:00 2001
+From: Alexander Bokovoy <abokovoy@redhat.com>
+Date: Wed, 10 Dec 2025 10:42:02 +0200
+Subject: [PATCH] Fix strchr() conformance to C23
+
+C23 7.28.5.1 specifies search functions such as strchr() as generic,
+returning const char * if the first argument is of type const char *.
+Fix uses of strchr() to conform to this change.
+
+[jrische@redhat.com: altered changes to avoid casts; fixed an
+additional case]
+[ghudson@mit.edu: condensed some declarations; rewrote commit message]
+
+ticket: 9191 (new)
+
+Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/ad4dcf1856dadc4b352b5c8ff08e51c7290fb41f]
+---
+ src/lib/krb5/ccache/ccbase.c                      |  4 ++--
+ src/lib/krb5/os/expand_path.c                     |  3 ++-
+ src/lib/krb5/os/locate_kdc.c                      | 15 +++++++--------
+ src/plugins/preauth/pkinit/pkinit_crypto.h        |  2 +-
+ src/preauth/pkinit/pkinit_crypto_openssl.c        |  6 +++---
+ src/plugins/preauth/pkinit/pkinit_identity.c      |  2 +-
+ src/plugins/preauth/pkinit/pkinit_matching.c      |  2 +-
+ src/tests/responder.c                             |  3 +--
+ 8 files changed, 18 insertions(+), 19 deletions(-)
+
+diff --git a/src/lib/krb5/ccache/ccbase.c b/src/lib/krb5/ccache/ccbase.c
+index 696b681..30a0a41 100644
+--- a/src/lib/krb5/ccache/ccbase.c
++++ b/src/lib/krb5/ccache/ccbase.c
+@@ -201,8 +201,8 @@ krb5_cc_register(krb5_context context, const krb5_cc_ops *ops,
+ krb5_error_code KRB5_CALLCONV
+ krb5_cc_resolve (krb5_context context, const char *name, krb5_ccache *cache)
+ {
+-    char *pfx, *cp;
+-    const char *resid;
++    char *pfx;
++    const char *cp, *resid;
+     unsigned int pfxlen;
+     krb5_error_code err;
+     const krb5_cc_ops *ops;
+diff --git a/src/lib/krb5/os/expand_path.c b/src/lib/krb5/os/expand_path.c
+index 5cbccf0..6569b88 100644
+--- a/src/lib/krb5/os/expand_path.c
++++ b/src/lib/krb5/os/expand_path.c
+@@ -454,7 +454,8 @@ k5_expand_path_tokens_extra(krb5_context context, const char *path_in,
+ {
+     krb5_error_code ret;
+     struct k5buf buf;
+-    char *tok_begin, *tok_end, *tok_val, **extra_tokens = NULL, *path;
++    const char *tok_begin, *tok_end;
++    char *tok_val, **extra_tokens = NULL, *path;
+     const char *path_left;
+     size_t nargs = 0, i;
+     va_list ap;
+diff --git a/src/lib/krb5/os/locate_kdc.c b/src/lib/krb5/os/locate_kdc.c
+index d1df04a..6559465 100644
+--- a/src/lib/krb5/os/locate_kdc.c
++++ b/src/lib/krb5/os/locate_kdc.c
+@@ -214,8 +214,8 @@ oom:
+ }
+ 
+ static void
+-parse_uri_if_https(const char *host_or_uri, k5_transport *transport,
+-                   const char **host, const char **uri_path)
++parse_uri_if_https(char *host_or_uri, k5_transport *transport,
++                   char **host, const char **uri_path)
+ {
+     char *cp;
+ 
+@@ -257,8 +257,7 @@ locate_srv_conf_1(krb5_context context, const krb5_data *realm,
+                   k5_transport transport, int udpport)
+ {
+     const char *realm_srv_names[4];
+-    char **hostlist = NULL, *realmstr = NULL, *host = NULL;
+-    const char *hostspec;
++    char **hostlist = NULL, *realmstr = NULL, *host = NULL, *hostspec;
+     krb5_error_code code;
+     size_t i;
+     int default_port;
+@@ -587,8 +586,8 @@ prof_locate_server(krb5_context context, const krb5_data *realm,
+  * Return a NULL *host_out if there are any problems parsing the URI.
+  */
+ static void
+-parse_uri_fields(const char *uri, k5_transport *transport_out,
+-                 const char **host_out, int *primary_out)
++parse_uri_fields(char *uri, k5_transport *transport_out,
++                 char **host_out, int *primary_out)
+ 
+ {
+     k5_transport transport;
+@@ -656,8 +655,8 @@ locate_uri(krb5_context context, const krb5_data *realm,
+     krb5_error_code ret;
+     k5_transport transport, host_trans;
+     struct srv_dns_entry *answers, *entry;
+-    char *host, *sitename;
+-    const char *host_field, *path;
++    char *host, *sitename, *host_field;
++    const char *path;
+     int port, def_port, primary;
+ 
+     ret = get_sitename(context, realm, &sitename);
+diff --git a/src/plugins/preauth/pkinit/pkinit_crypto.h b/src/plugins/preauth/pkinit/pkinit_crypto.h
+index 57bb3cb..be2d02c 100644
+--- a/src/plugins/preauth/pkinit/pkinit_crypto.h
++++ b/src/plugins/preauth/pkinit/pkinit_crypto.h
+@@ -440,7 +440,7 @@ krb5_error_code crypto_load_cas_and_crls
+ 		    defines the storage type (file, directory, etc) */
+ 	int catype,					/* IN
+ 		    defines the ca type (anchor, intermediate, crls) */
+-	char *id);					/* IN
++	const char *id);				/* IN
+ 		    defines the location (filename, directory name, etc) */
+ 
+ /*
+diff --git a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
+index f222dbd..0a731a8 100644
+--- a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
++++ b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
+@@ -4999,7 +4999,7 @@ load_cas_and_crls(krb5_context context,
+                   pkinit_req_crypto_context req_cryptoctx,
+                   pkinit_identity_crypto_context id_cryptoctx,
+                   int catype,
+-                  char *filename)
++                  const char *filename)
+ {
+     STACK_OF(X509_INFO) *sk = NULL;
+     STACK_OF(X509) *ca_certs = NULL;
+@@ -5157,7 +5157,7 @@ load_cas_and_crls_dir(krb5_context context,
+                       pkinit_req_crypto_context req_cryptoctx,
+                       pkinit_identity_crypto_context id_cryptoctx,
+                       int catype,
+-                      char *dirname)
++                      const char *dirname)
+ {
+     krb5_error_code retval = EINVAL;
+     char **fnames = NULL, *filename;
+@@ -5201,7 +5201,7 @@ crypto_load_cas_and_crls(krb5_context context,
+                          pkinit_identity_crypto_context id_cryptoctx,
+                          int idtype,
+                          int catype,
+-                         char *id)
++                         const char *id)
+ {
+     switch (idtype) {
+     case IDTYPE_FILE:
+diff --git a/src/plugins/preauth/pkinit/pkinit_identity.c b/src/plugins/preauth/pkinit/pkinit_identity.c
+index 0dcfcfc..ad65f23 100644
+--- a/src/plugins/preauth/pkinit/pkinit_identity.c
++++ b/src/plugins/preauth/pkinit/pkinit_identity.c
+@@ -473,7 +473,7 @@ process_option_ca_crl(krb5_context context,
+                       const char *value,
+                       int catype)
+ {
+-    char *residual;
++    const char *residual;
+     unsigned int typelen;
+     int idtype;
+ 
+diff --git a/src/plugins/preauth/pkinit/pkinit_matching.c b/src/plugins/preauth/pkinit/pkinit_matching.c
+index 0ea072c..b3c8df1 100644
+--- a/src/plugins/preauth/pkinit/pkinit_matching.c
++++ b/src/plugins/preauth/pkinit/pkinit_matching.c
+@@ -262,7 +262,7 @@ parse_rule_component(krb5_context context,
+     char err_buf[128];
+     int ret;
+     struct keyword_desc *kw, *nextkw;
+-    char *nk;
++    const char *nk;
+     int found_next_kw = 0;
+     char *value = NULL;
+     size_t len;
+diff --git a/src/tests/responder.c b/src/tests/responder.c
+index 82f870e..4221a20 100644
+--- a/src/tests/responder.c
++++ b/src/tests/responder.c
+@@ -282,8 +282,7 @@ responder(krb5_context ctx, void *rawdata, krb5_responder_context rctx)
+     /* Provide a particular response for an OTP challenge. */
+     if (data->otp_answer != NULL) {
+         if (krb5_responder_otp_get_challenge(ctx, rctx, &ochl) == 0) {
+-            key = strchr(data->otp_answer, '=');
+-            if (key != NULL) {
++            if (strchr(data->otp_answer, '=') != NULL) {
+                 /* Make a copy of the answer that we can chop up. */
+                 key = strdup(data->otp_answer);
+                 if (key == NULL)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb
index 507a1b2381..5d8ab2dc01 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb
@@ -21,6 +21,7 @@ inherit autotools-brokensep binconfig perlnative systemd update-rc.d pkgconfig
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
+           file://fix-strchr-conformance-to-C23.patch;striplevel=2 \
            file://crosscompile_nm.patch \
            file://etc/init.d/krb5-kdc \
            file://etc/init.d/krb5-admin-server \

