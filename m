Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE71C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 07:32:20 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1781.1783485960834048844
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 21:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hh9EbgYg;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9677; q=dns/txt;
  s=iport01; t=1783485960; x=1784695560;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fH2lCzbsXWPob9xT3DAcFkEFae1fh6pgoagcOaxpaVA=;
  b=hh9EbgYgJ0lqxb9/PiQp45w5TX45N+ITCYiTbOuG/sK/chaJF9swZQcQ
   zHOfpH6DxFeoep39lWtLoJhonOGelgs1W6HdZqxOT8NIE54qzkT4PDUiO
   eW2iodyFfzJtJ4JcnPh1EfN4PR8HhB+ju3q9JdCN8xtWBPKtFXunC1ZAr
   TjSzUmjku5L/cUWmJbJd8X3DZATF1xU9OQ/TOUJou09Hs1uvx2Ur16AFi
   /AOxJIrQYSijsghZh9AKy3tnYtqNh8ldVIBXTCpBexTMGLklzi7g/k3l8
   eG0+netK/zi/5a7jgeaQL+JMwAoJxlVBUNAn2zpHNzUEOma/6j2TqR5lJ
   A==;
X-CSE-ConnectionGUID: 8Cuk0zdxQdiQ99kLNf/0TQ==
X-CSE-MsgGUID: ifTpLq3kQQShqwIW/i6Tcw==
X-IPAS-Result: =?us-ascii?q?A0BGAgCi1E1q/4z/Ja1aH4I6gld0X0JJA5ZHkU2MUYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo1NAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgE1ARgBLSwDAQJaIyGDAgGCcwIBEQa3cIIsgQGDKAExA?=
 =?us-ascii?q?wsCQ1DbLAELFAEFgTOFP4gfWxgBhHwnGxuBcoEVgTuCLoEFgVwDARiBLoZdB?=
 =?us-ascii?q?IIigQyBWh6DFYxESIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFg?=
 =?us-ascii?q?R2BYIEChHkjHwM5f4EwdUp5LYECARIeCoFSghwDCxgNSBEsNxQbBD5uB40oF?=
 =?us-ascii?q?w+CESYFAgEsYQEpAQGBEXIRGBE9kmAbLo9egiGBNZ9aCiiDdYwhlToaM6psm?=
 =?us-ascii?q?QiOCpU0PyY3hGiBaDyBWXAVgyIJShkPVo1XCwuDYIUTyUckNQIBAQcDLwEBB?=
 =?us-ascii?q?wIHDgMLgWiRHWABAQ?=
IronPort-Data: A9a23:Pwl4/q6Ppzhu9AhaAeCYhgxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 mQYWmiEbq7Yamb2L95zYNi+oRwEuJPdyNZiQQtq/HhjZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1MtPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ebaYF+b5lDXF3+
 f0heWEOSjaNwLqK+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcuFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEXUrsUIMpWcOOAj2LneiddoUi9rqss6G+Vxwt0uFToGIeNJ43aG5QLxS50o
 ErH8VjhJghBN+Wm8jqc7VOTwe6RoSjkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:knBMrq8BJ9IT2teXBm1uk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3ADXpJzWplUr8Xfkxc9+ugyT3mUZAOb36F3nvAGkO?=
 =?us-ascii?q?5MDc4S5mzRxjIxJoxxg=3D=3D?=
X-Talos-MUID: 9a23:CeNtzwWmQp6yOM/q/D7iuClGLZxr2p2VCFkSsKpBupe4PjMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,153,1779148800"; 
   d="scan'208";a="505986963"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 08 Jul 2026 04:45:59 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id AA824180001F7;
	Wed,  8 Jul 2026 04:45:59 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 52F06CC124B; Tue,  7 Jul 2026 21:45:59 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [meta-oe][scarthgap][PATCH 1/2] samba: Fix CVE-2026-3012
Date: Tue,  7 Jul 2026 21:45:46 -0700
Message-Id: <20260708044547.3646723-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 07:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128070

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream Samba security backport for
CVE-2026-3012. The upstream security bundle is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the embedded patch headers.

[1] https://www.samba.org/samba/ftp/patches/security/samba-4.22.9-security-2026-05-25.patch
[2] https://www.samba.org/samba/security/CVE-2026-3012.html

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../samba/samba/CVE-2026-3012_p1.patch        | 131 ++++++++++++++++++
 .../samba/samba/CVE-2026-3012_p2.patch        |  51 +++++++
 .../samba/samba_4.19.9.bb                     |   2 +
 3 files changed, 184 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p1.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p2.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p1.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p1.patch
new file mode 100644
index 0000000000..ce54b2916f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p1.patch
@@ -0,0 +1,131 @@
+From f21f87e0f64dc4aea8c9537f182282077ae6a37b Mon Sep 17 00:00:00 2001
+From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Date: Mon, 23 Feb 2026 11:01:57 +1300
+Subject: [PATCH] CVE-2026-3012: do not fetch certificate over http
+
+In the case where a certificate was found via HTTP, it was trusted
+without verification and put in the global CA store.
+
+There is no means to check the certificate other than by comparing it
+to certificates we may have gathered via LDAP, but in that case there
+is no advantage over just using the LDAP-derived certificates.
+
+Using the LDAP certificates was already the fallback case if HTTP
+failed, so we just make it the default.
+
+The HTTP fetch depends on the NDES service, which is a variant of
+Simple Certificate Enrolment Protocol (SCEP, RFC8894), but in fact
+Samba implements none of that protocol other than the HTTP fetch. SCEP
+is for clients that are not true domain members. Domain members can
+access to certificates over LDAP. This patch is not reducing SCEP
+client support because Samba never had it.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16003
+
+Reported-by: Arad Inbar, DREAM Security Research Team
+Reported-by: Nir Somech, DREAM Security Research Team
+Reported-by: Ben Grinberg, DREAM Security Research Team
+
+CVE: CVE-2026-3012
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/f21f87e0f64dc4aea8c9537f182282077ae6a37b]
+
+Backport Changes:
+- Adapted python/samba/gp/gp_cert_auto_enroll_ext.py hunks to
+  Samba 4.19.9 context.
+- Omitted selftest/knownfail.d/gpo-auto-enrol because the Yocto
+  recipe does not run upstream Samba selftest.
+
+Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Reviewed-by: Jennifer Sutton <jennifersutton@catalyst.net.nz>
+(cherry picked from commit f21f87e0f64dc4aea8c9537f182282077ae6a37b)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+diff --git a/python/samba/gp/gp_cert_auto_enroll_ext.py b/python/samba/gp/gp_cert_auto_enroll_ext.py
+index df3b472..31de4b1 100644
+--- a/python/samba/gp/gp_cert_auto_enroll_ext.py
++++ b/python/samba/gp/gp_cert_auto_enroll_ext.py
+@@ -16,7 +16,6 @@
+
+ import os
+ import operator
+-import requests
+ from samba.gp.gpclass import gp_pol_ext, gp_applier, GPOSTATE
+ from samba import Ldb
+ from ldb import SCOPE_SUBTREE, SCOPE_BASE
+@@ -200,56 +199,24 @@ def get_supported_templates(server):
+     return out.strip().split()
+
+
+-def getca(ca, url, trust_dir):
+-    """Fetch Certificate Chain from the CA."""
++def getca(ca, trust_dir):
++    """Fetch a certificate from LDAP."""
+     root_cert = os.path.join(trust_dir, '%s.crt' % ca['name'])
+     root_certs = []
+
+-    try:
+-        r = requests.get(url=url, params={'operation': 'GetCACert',
+-                                          'message': 'CAIdentifier'})
+-    except requests.exceptions.ConnectionError:
+-        log.warn('Failed to establish a new connection')
+-        r = None
+-    if r is None or r.content == b'' or r.headers['Content-Type'] == 'text/html':
+-        log.warn('Failed to fetch the root certificate chain.')
+-        log.warn('The Network Device Enrollment Service is either not' +
+-                 ' installed or not configured.')
+-        if 'cACertificate' in ca:
+-            log.warn('Installing the server certificate only.')
+-            der_certificate = base64.b64decode(ca['cACertificate'])
+-            try:
+-                cert = load_der_x509_certificate(der_certificate)
+-            except TypeError:
+-                cert = load_der_x509_certificate(der_certificate,
+-                                                 default_backend())
+-            cert_data = cert.public_bytes(Encoding.PEM)
+-            with open(root_cert, 'wb') as w:
+-                w.write(cert_data)
+-            root_certs.append(root_cert)
+-        return root_certs
+-
+-    if r.headers['Content-Type'] == 'application/x-x509-ca-cert':
++    if 'cACertificate' in ca:
++        log.warn('Installing the server certificate only.')
++        der_certificate = base64.b64decode(ca['cACertificate'])
+         # Older versions of load_der_x509_certificate require a backend param
+         try:
+-            cert = load_der_x509_certificate(r.content)
++            cert = load_der_x509_certificate(der_certificate)
+         except TypeError:
+-            cert = load_der_x509_certificate(r.content, default_backend())
++            cert = load_der_x509_certificate(der_certificate,
++                                             default_backend())
+         cert_data = cert.public_bytes(Encoding.PEM)
+         with open(root_cert, 'wb') as w:
+             w.write(cert_data)
+         root_certs.append(root_cert)
+-    elif r.headers['Content-Type'] == 'application/x-x509-ca-ra-cert':
+-        certs = load_der_pkcs7_certificates(r.content)
+-        for i in range(0, len(certs)):
+-            cert = certs[i].public_bytes(Encoding.PEM)
+-            filename, extension = root_cert.rsplit('.', 1)
+-            dest = '%s.%d.%s' % (filename, i, extension)
+-            with open(dest, 'wb') as w:
+-                w.write(cert)
+-            root_certs.append(dest)
+-    else:
+-        log.warn('getca: Wrong (or missing) MIME content type')
+
+     return root_certs
+
+@@ -273,8 +240,7 @@ def changed(new_data, old_data):
+ def cert_enroll(ca, ldb, trust_dir, private_dir, auth='Kerberos'):
+     """Install the root certificate chain."""
+     data = dict({'files': [], 'templates': []}, **ca)
+-    url = 'http://%s/CertSrv/mscep/mscep.dll/pkiclient.exe?' % ca['hostname']
+-    root_certs = getca(ca, url, trust_dir)
++    root_certs = getca(ca, trust_dir)
+     data['files'].extend(root_certs)
+     global_trust_dir = find_global_trust_dir()
+     for src in root_certs:
+--
+2.43.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p2.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p2.patch
new file mode 100644
index 0000000000..e2989dc075
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p2.patch
@@ -0,0 +1,51 @@
+From 7337d99ed55c01cd5837029485cd971a48f761c2 Mon Sep 17 00:00:00 2001
+From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Date: Thu, 26 Feb 2026 14:21:01 +1300
+Subject: [PATCH] CVE-2026-3012: gp_auto_enrol: skip CAs not found in
+ LDAP
+
+If a certificate is mentioned in a GPO but is not present as a
+cACertificate attribute on a pKIEnrollmentService object, we have no way
+of obtaining it, so we might as well forget it.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16003
+
+CVE: CVE-2026-3012
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/7337d99ed55c01cd5837029485cd971a48f761c2]
+
+Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Reviewed-by: Jennifer Sutton <jennifersutton@catalyst.net.nz>
+(cherry picked from commit 7337d99ed55c01cd5837029485cd971a48f761c2)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ python/samba/gp/gp_cert_auto_enroll_ext.py | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/python/samba/gp/gp_cert_auto_enroll_ext.py b/python/samba/gp/gp_cert_auto_enroll_ext.py
+index 815436e11e9c..de8b310afd95 100644
+--- a/python/samba/gp/gp_cert_auto_enroll_ext.py
++++ b/python/samba/gp/gp_cert_auto_enroll_ext.py
+@@ -452,11 +452,21 @@ class gp_cert_auto_enroll_ext(gp_pol_ext, gp_applier):
+                     # This is a basic configuration.
+                     cas = fetch_certification_authorities(ldb)
+                     for _ca in cas:
++                        if 'cACertificate' not in _ca:
++                            log.warning(f"ignoring CA '{_ca['name']}' with no "
++                                        "cACertificate in LDAP.")
++                            continue
++
+                         self.apply(guid, _ca, cert_enroll, _ca, ldb, trust_dir,
+                                    private_dir)
+                         ca_names.append(_ca['name'])
+                 # If EndPoint.URI starts with "HTTPS//":
+                 elif ca['URL'].lower().startswith('https://'):
++                    if 'cACertificate' not in ca:
++                        log.warning(f"ignoring CA '{ca['name']}' "
++                                    f"({ca['URL']}) with no "
++                                    "cACertificate in LDAP.")
++                        continue
+                     self.apply(guid, ca, cert_enroll, ca, ldb, trust_dir,
+                                private_dir, auth=ca['auth'])
+                     ca_names.append(ca['name'])
+--
+2.43.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
index d50d9f5155..055e404bb9 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
@@ -24,6 +24,8 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0005-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://0006-smbtorture-skip-test-case-tfork_cmd_send.patch \
            file://0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch \
+           file://CVE-2026-3012_p1.patch \
+           file://CVE-2026-3012_p2.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.35.6


