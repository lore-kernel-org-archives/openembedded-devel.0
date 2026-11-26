Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8985.1795674969456694824
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 22:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=O5H+TQN5;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=117299; q=dns/txt;
  s=iport01; t=1795674969; x=1796884569;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B3UBobyZ5OGqT6XJ2BFvpytBG3L8/a0ZazPoNvVHjK8=;
  b=O5H+TQN5hAK3OFblGuCuwpEcGM6a9Mu5naOgxwWw6XY3qQA9QQWugQ/C
   TmKO/IbjBHB+p/2jgabrqFA1ekj6gP57KvczoUi/TfW5SEf8RQs5f9tok
   1VyM+uybTWmRdUl3Fvjqt3mUEwSCI/kZGuOK5PbjAcUzjiBsV4RSead+Y
   FJVZkF/5EXKPXIJ+qCJMhhe4sCgytSKQLpxlWHidF9+tSjEJ9qFsfR6gD
   GHecL8or+BS1LOwKBWNWcDR1XQDI8YyFaJ1o3EUc6Mw3Yf++FNflhU7yG
   4Gzj7ccgga0PLFhFZd0LnegK7aDEjJ2skJAL0JHkVZNLMtYWIFeSXJTqu
   w==;
X-CSE-ConnectionGUID: wKtT8djoRfKW7CqVrbXg+w==
X-CSE-MsgGUID: AXOJ8zDvT6Sln/1/8CWzVw==
X-IPAS-Result: =?us-ascii?q?A0ACAAC90gdr/85K/pBRBgECFgMBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQESAQEBAQEBAQEBAQEBgXwEAQEBAQELAYIXP3VhQkkDhFSIG4c4giGBF?=
 =?us-ascii?q?pA9i3VkFIFqDwEBAQ9ECQQEAQGCEoJzAo4jAiY0CQ4BAgQDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEKAQEFAQEBAgEHBYEOE4YVBjQNkBIBBBwBCAQkAVkDAQIDAhEBAQEMB?=
 =?us-ascii?q?gItGgMBBRgJCYIhWAGCdAIBEQZAt1d6fzOBAYJOF0QBMQIMAkNQ2zMBCxQBg?=
 =?us-ascii?q?QouAYVBgyABhQRdGAGDXyR7BwEPEBsbgXKBFAGBO29KBXGBBYEmGBMLAQEBA?=
 =?us-ascii?q?oEWCggBCAQGAQcCAgcbFQUZCAECBgaDBoJqBIINFYEMgTgcHjEzCYIXiGxrG?=
 =?us-ascii?q?gKBSYFkI4ZVSIECHANZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxcvWBsGBYEcg?=
 =?us-ascii?q?R6BEoEDXYErKF4hgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZDgIpBhYhC0MYD?=
 =?us-ascii?q?UgRLDcVGQQ9AW4HlAMZgiEJOwsNDQwGAQEpAwICBAgWBwYHDgYTAQoJFgEBB?=
 =?us-ascii?q?BADNwIDBCICBAYYAgEPBCQDERIFAQEBASEFBQEBBAMBAgcEAQURknIHCwgMH?=
 =?us-ascii?q?49qgiGBNZ4egT4KKIN5jCSODSeBDoV4GjOEBE2BCos9hSeTTWcLmH2OCoQTg?=
 =?us-ascii?q?0uNWAIxDwsCA0orhD+BaDxGI3BwFTuCZwkJQRkPYTiNEgIBAQoLgVEngRRUa?=
 =?us-ascii?q?oJAgS47gT3ICyM1AggBAwkiBAEBBwIHDgMLgWiQAQEkAnZgAQE?=
IronPort-Data: A9a23:yuuhI67ZLyCHRCx14rfUOAxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mFJUTvUbK2OZWHwLtkga9i38UxVsZGEy4MwQAU//H9mZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eIq4ExrZ7A2Z0+
 98ndxsUUAqJt+313+fuIgVsrpxLwMjDNY4F/3UlxjbDALN+HNbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaO0Mn1lQ/UPrSmM+hnWH2aThRsnqepLE85C7YywkZPL3FboKFIYzTHZo9ckCwj
 1Lh3TTrLg8mauebz33ctSKHuf3xgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPBWy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:lbc39ai5BqrfPtpDTfANAQ/Gb3BQXuwji2hC6mlwRA09TyX+rb
 HKoB17726XtN9/Yh8dcLy7VZVoIkmslqKdn7NxAV7KZmCP0wGVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gcSVbSO09QYKcemsAJsQiDtENg==
X-Talos-CUID: 9a23:6eRjmG5FOUQz3jr8+9ss620IJpApcHrnwlTvfGShN3xjeLLWVgrF
X-Talos-MUID: 9a23:AKGPcghCr4pKmr+3FC78nMMpHfdPwfS8JF4xz64CvY7dcnxbBCWjk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,234,1787011200"; 
   d="scan'208";a="60838107"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Nov 2026 06:36:05 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id CCEDA1800023A
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 06:36:04 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 7ED64CC1634; Wed, 25 Nov 2026 22:36:03 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] cyrus-sasl: fix CVE-2026-129483
Date: Wed, 25 Nov 2026 22:36:00 -0800
Message-Id: <20261126063600.3975483-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 06:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133087

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream SRP-removal backport for
CVE-2026-129483 [1]. The SRP server allows authentication bypass
when the mechanism is enabled [2].

Remove the plugin and its configure, build and static-registration
support, preventing --enable-srp from restoring the affected mechanism.

[1] https://github.com/cyrusimap/cyrus-sasl/commit/fb3724f43dc50247ff2bf021=
35457d6d77031654
[2] https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/129xxx/CVE-=
2026-129483.json

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../cyrus-sasl/CVE-2026-129483.patch          | 3721 +++++++++++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.28.bb           |    1 +
 2 files changed, 3722 insertions(+)
 create mode 100644 meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-20=
26-129483.patch

diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2026-1294=
83.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2026-129483=
.patch
new file mode 100644
index 0000000000..a564f8e72b
--- /dev/null
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2026-129483.patch
@@ -0,0 +1,3721 @@
+From bc0816f0f9a6ebbda83f0b1561e735ec82486ad7 Mon Sep 17 00:00:00 2001
+From: Ken Murchison <murch@fastmail.com>
+Date: Thu, 12 Nov 2026 12:37:33 -0500
+Subject: [PATCH] Remove the SRP plugin
+
+The SRP SASL mechanism was never standardized: it exists only as the
+expired Internet-Draft draft-burdis-cat-srp-sasl and was never published
+as an RFC.  (The underlying SRP protocol is documented in RFC 2945 and
+RFC 5054, but those do not define a SASL mechanism.)
+
+Remove plugins/srp.c along with its autoconf options (--enable-srp,
+--enable-srp-setpass), Automake/NTMakefile build rules, static plugin
+hooks, init-file generation, and current documentation.
+
+Historical references (ChangeLog, release notes, doc/legacy) are left inta=
ct.
+
+CVE: CVE-2026-129483
+Upstream-Status: Backport [https://github.com/cyrusimap/cyrus-sasl/commit/=
fb3724f43dc50247ff2bf02135457d6d77031654]
+
+Backport Changes:
+- Remove the SRP-only OpenSSL guard and Windows OpenSSL condition term
+  retained in 2.1.28. Upstream had removed these in df44e6ae82ff before
+  this fix. Preserve the other mechanisms and optional OpenSSL support.
+- Adapt the build lists and documentation to retain 2.1.28's other
+  mechanisms and remove its older SRP documentation stub. Delete the
+  target version's SRP source in full; retain all 21 upstream file changes.
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+Signed-off-by: Ken Murchison <murch@fastmail.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ configure.ac                              |   40 -
+ docsrc/index.rst                          |    2 +-
+ docsrc/sasl/authentication_mechanisms.rst |   11 -
+ docsrc/sasl/components.rst                |    6 +-
+ docsrc/sasl/developer/plugprog.rst        |    2 +-
+ docsrc/sasl/faqs/rfcs.rst                 |    1 -
+ docsrc/sasl/options.rst                   |   11 +-
+ docsrc/sasl/quickstart.rst                |    1 -
+ docsrc/sasl/resources.rst                 |    1 -
+ docsrc/sasl/sysadmin.rst                  |   10 +-
+ docsrc/sasl/upgrading.rst                 |    2 +-
+ docsrc/sasl/windows.rst                   |    7 +-
+ lib/staticopen.h                          |    8 -
+ plugins/Makefile.am                       |    8 +-
+ plugins/NTMakefile                        |   25 +-
+ plugins/makeinit.sh                       |    2 +-
+ plugins/srp.c                             | 3197 ---------------------
+ utils/Makefile.am                         |    2 +-
+ utils/saslpasswd2.8                       |    2 +-
+ win32/include/config.h                    |    1 -
+ win32/makeinit.ps1                        |    2 +-
+ 21 files changed, 25 insertions(+), 3316 deletions(-)
+ delete mode 100644 plugins/srp.c
+
+diff --git a/configure.ac b/configure.ac
+index a6c994f5..bd268739 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -453,46 +453,6 @@ else
+   AC_MSG_RESULT(disabled)
+ fi
+=20
+-dnl SRP
+-AC_ARG_ENABLE(srp, [  --enable-srp            enable SRP authentication [=
[no]] ],
+-  srp=3D$enableval,
+-  srp=3Dno)
+-
+-if test "$with_openssl" =3D no; then
+-  AC_MSG_WARN(OpenSSL not found -- SRP will be disabled)
+-  srp=3Dno
+-fi
+-
+-AC_MSG_CHECKING(SRP)
+-if test "$srp" !=3D no; then
+-  AC_MSG_RESULT(enabled)
+-  SRP_LIBS=3D"-lcrypto $LIB_RSAREF"
+-
+-  SASL_MECHS=3D"$SASL_MECHS libsrp.la"
+-  if test "$enable_static" =3D yes; then
+-    SASL_STATIC_SRCS=3D"$SASL_STATIC_SRCS \$(top_srcdir)/plugins/srp.c"
+-    SASL_STATIC_OBJS=3D"$SASL_STATIC_OBJS srp.o"
+-    AC_DEFINE(STATIC_SRP, [], [Link SRP Statically])
+-  fi
+-
+-dnl srp_setpass support
+-  AC_ARG_ENABLE(srp_setpass, [  --enable-srp-setpass    enable setting SR=
P secrets with saslpasswd [[no]]],
+-      srp_setpass=3D$enableval,
+-      srp_setpass=3Dno)
+-
+-  AC_MSG_CHECKING(if we should enable setting SRP secrets with saslpasswd)
+-  if test "$srp_setpass" !=3D no; then
+-    AC_MSG_RESULT(enabled)
+-    AC_DEFINE(DO_SRP_SETPASS, [], [should we support setpass() for SRP?])
+-  else
+-    AC_MSG_RESULT(disabled)
+-  fi
+-
+-  AC_SUBST(SRP_LIBS)
+-else
+-  AC_MSG_RESULT(disabled)
+-fi
+-
+ dnl Kerberos based Mechanisms
+ SASL_KERBEROS_V4_CHK
+ SASL_GSSAPI_CHK
+diff --git a/docsrc/index.rst b/docsrc/index.rst
+index 87d5f26e..03b0470e 100644
+--- a/docsrc/index.rst
++++ b/docsrc/index.rst
+@@ -18,7 +18,7 @@ Features
+ --------
+ Cyrus SASL provides a number of authentication plugins out of the box.
+=20
+-    Berkeley DB, GDBM, or NDBM (sasldb), PAM, MySQL, PostgreSQL, SQLite, =
LDAP, Active Directory (LDAP), DCE, Kerberos 4 and 5, proxied IMAP auth, ge=
tpwent, shadow, SIA, Courier Authdaemon, httpform, APOP and SASL mechanisms=
: ANONYMOUS, CRAM-MD5, DIGEST-MD5, EXTERNAL, GSSAPI, LOGIN, NTLM, OTP, PASS=
DSS, PLAIN, SCRAM, SRP
++    Berkeley DB, GDBM, or NDBM (sasldb), PAM, MySQL, PostgreSQL, SQLite, =
LDAP, Active Directory (LDAP), DCE, Kerberos 4 and 5, proxied IMAP auth, ge=
tpwent, shadow, SIA, Courier Authdaemon, httpform, APOP and SASL mechanisms=
: ANONYMOUS, CRAM-MD5, DIGEST-MD5, EXTERNAL, GSSAPI, LOGIN, NTLM, OTP, PASS=
DSS, PLAIN, SCRAM
+=20
+ .. _SASL: https://en.wikipedia.org/wiki/Simple_Authentication_and_Securit=
y_Layer
+=20
+diff --git a/docsrc/sasl/authentication_mechanisms.rst b/docsrc/sasl/authe=
ntication_mechanisms.rst
+index 2544ffd9..e3f31068 100644
+--- a/docsrc/sasl/authentication_mechanisms.rst
++++ b/docsrc/sasl/authentication_mechanisms.rst
+@@ -109,15 +109,6 @@ SCRAM
+ .. todo::
+    Content needed here
+=20
+-SRP
+----
+-
+-  * mda=3Dsha1,rmd160,md5
+-  * confidentiality=3Ddes-ofb,des-ede-ofb,aes-128-ofb,bf-ofb,cast5-ofb,id=
ea-ofb
+-
+-.. todo::
+-   Content needed here
+-
+ Non-SASL Authentication
+ -----------------------
+=20
+@@ -165,8 +156,6 @@ of the mechanisms provided by the Cyrus SASL Library.
+ +-------------+---------+---------+----------+--------+---------+--------=
+------+--------+-----------+--------------+----------+-------+------+-----=
-+
+ | SCRAM       | 0       | X       | X        |        |         | X      =
|      | X      | X         |              | X        | X     | X    | X   =
 |
+ +-------------+---------+---------+----------+--------+---------+--------=
+------+--------+-----------+--------------+----------+-------+------+-----=
-+
+-| SRP         | 128     | X       | X        | X      | X       | X      =
|      | X      | X         |              | X        | X     |      |     =
 |
+-+-------------+---------+---------+----------+--------+---------+--------=
+------+--------+-----------+--------------+----------+-------+------+-----=
-+
+=20
+ ..  Helpfully generated  from http://www.tablesgenerator.com/text_tables#
+=20
+diff --git a/docsrc/sasl/components.rst b/docsrc/sasl/components.rst
+index 72d563fe..bcf2e165 100644
+--- a/docsrc/sasl/components.rst
++++ b/docsrc/sasl/components.rst
+@@ -99,7 +99,7 @@ Plugins: SASL Mechanisms
+ ------------------------=0D
+ =0D
+ The simplest types of plugins to understand are those which provide=0D
+-SASL mechanisms, such as CRAM-MD5, DIGEST-MD5, GSSAPI, PLAIN, SCRAM, SRP,=
 and so on.=0D
++SASL mechanisms, such as CRAM-MD5, DIGEST-MD5, GSSAPI, PLAIN, SCRAM, and =
so on.=0D
+ These mechanisms take care of both server-side and client-side parts=0D
+ of the SASL negotiation.  If the given mechanism supports a security laye=
r=0D
+ (that is, makes guarantees about privacy or integrity of data after the=0D
+@@ -125,13 +125,13 @@ Password Verification Mechanisms
+     of the password.=0D
+ Shared Secret Mechanisms=0D
+     For these mechanisms,=0D
+-    such as CRAM-MD5, DIGEST-MD5, OTP, SCRAM, and SRP,=0D
++    such as CRAM-MD5, DIGEST-MD5, OTP, and SCRAM,=0D
+     there is a shared secret between the server and client (e.g. a passwo=
rd).=0D
+     However, in this case the password itself does not travel on the wire=
.=0D
+     Instead, the client passes a server a token that proves that it knows=
=0D
+     the secret (without actually sending the secret across the wire).=0D
+     For these mechanisms, the server generally needs a plaintext equivale=
nt of=0D
+-    the secret to be in local storage (not true for SRP).=0D
++    the secret to be in local storage.=0D
+ Kerberos Mechanisms=0D
+     Kerberos mechanisms use a trusted=0D
+     third party to authenticate the client.  These mechanisms don't requi=
re=0D
+diff --git a/docsrc/sasl/developer/plugprog.rst b/docsrc/sasl/developer/pl=
ugprog.rst
+index 81b9952b..e9e0fad7 100644
+--- a/docsrc/sasl/developer/plugprog.rst
++++ b/docsrc/sasl/developer/plugprog.rst
+@@ -157,7 +157,7 @@ setting \*serverout when the step function returns SAS=
L_OK.
+   mechanisms which always send last (e.g. DIGEST-MD5), \*serverout must
+   point to the success data.
+ * For mechanisms in which the server may or
+-  may not send last (e.g. SRP), \*serverout must be set accordingly.
++  may not send last (e.g. SCRAM), \*serverout must be set accordingly.
+=20
+ .. _plugprog-client:
+=20
+diff --git a/docsrc/sasl/faqs/rfcs.rst b/docsrc/sasl/faqs/rfcs.rst
+index 65a820c4..b27398b6 100644
+--- a/docsrc/sasl/faqs/rfcs.rst
++++ b/docsrc/sasl/faqs/rfcs.rst
+@@ -21,7 +21,6 @@ RFCs and drafts
+ * :rfc:`7613` - Preparation, Enforcement, and Comparison of International=
ized Strings Representing Usernames and Passwords
+ * :rfc:`7677` - SCRAM-SHA-256 and SCRAM-SHA-256-PLUS: Simple Authenticati=
on and Security Layer (SASL) Mechanisms
+ * :rfc:`7804` - Salted Challenge Response HTTP Authentication Mechanism
+-* `draft-burdis-cat-srp-sasl <https://tools.ietf.org/html/draft-burdis-ca=
t-srp-sasl-08>`_ - Secure Remote Password SASL Mechanism (SRP)
+ * `draft-ietf-sasl-crammd5 <https://tools.ietf.org/html/draft-ietf-sasl-c=
rammd5>`_ - The CRAM-MD5 SASL Mechanism (CRAM-MD5)
+ * `draft-murchison-sasl-login <https://tools.ietf.org/html/draft-murchiso=
n-sasl-login>`_ - The LOGIN SASL Mechanism
+ * `draft-newman-sasl-c-api <https://tools.ietf.org/html/draft-newman-sasl=
-c-api>`_ - The SASL C API
+diff --git a/docsrc/sasl/options.rst b/docsrc/sasl/options.rst
+index ecea908f..a86ab1df 100644
+--- a/docsrc/sasl/options.rst
++++ b/docsrc/sasl/options.rst
+@@ -33,7 +33,7 @@ SASL Library
+    authentication.  When set to 'noplain', only non-plaintext secrets=0D
+    will be written.  *Note that the only mechanisms (as currently=0D
+    implemented) which don't use plaintext secrets are=0D
+-   OTP, SCRAM and SRP.*=0D
++   OTP and SCRAM.*=0D
+ =0D
+    Default: no=0D
+ =0D
+@@ -403,15 +403,6 @@ is a valid value for sql_select.
+ =0D
+ =0D
+ =0D
+-SRP=0D
+-=3D=3D=3D=0D
+-=0D
+-.. option:: srp_mda [md5 | sha1 | rmd160]=0D
+-=0D
+-   Message digest algorithm for SRP calculations=0D
+-=0D
+-   Default: sha1=0D
+-=0D
+ Kerberos V4=0D
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
+ =0D
+diff --git a/docsrc/sasl/quickstart.rst b/docsrc/sasl/quickstart.rst
+index fab36b87..eb8337be 100644
+--- a/docsrc/sasl/quickstart.rst
++++ b/docsrc/sasl/quickstart.rst
+@@ -28,7 +28,6 @@ this distribution:
+ *  PASSDSS (requires OpenSSL libcrypto)=0D
+ *  PLAIN=0D
+ *  SCRAM (requires OpenSSL libcrypto)=0D
+-*  SRP (requires OpenSSL libcrypto)=0D
+ =0D
+ =0D
+ The library also supports storing user secrets in either a hash=0D
+diff --git a/docsrc/sasl/resources.rst b/docsrc/sasl/resources.rst
+index 663dc473..eed7a37e 100644
+--- a/docsrc/sasl/resources.rst
++++ b/docsrc/sasl/resources.rst
+@@ -9,7 +9,6 @@ Other Documentation & Resources
+ * `Using SASL: CMU's Cyrus SASL Library <http://www.oreillynet.com/pub/a/=
network/2002/04/30/sasl2.html>`_=0D
+ * `Information on SASL mechanisms, profiles, servers and clients implemen=
ting SASL <http://www.melnikov.ca/mel/devel/SASL_info.html>`_=0D
+ * `FAQ from Sendmail <http://www.sendmail.org/~ca/email/auth.html>`_=0D
+-* `The Secure Remote Password Protocol <http://www-cs-students.stanford.e=
du/~tjw/srp/ndss.html>`_ paper by Thomas Wu=0D
+ * `TCL extensions for SASL <http://beepcore-tcl.sourceforge.net/tclsasl.h=
tml>`_=0D
+ *  `The NTLM Authentication Protocol <http://davenport.sourceforge.net/nt=
lm.html>`_ (NTLM)=0D
+ * `Common Internet File System (CIFS) Technical Reference <http://www.sni=
a.org/tech_activities/CIFS/CIFS-TR-1p00_FINAL.pdf>`_ (SMB/NTLM)=0D
+diff --git a/docsrc/sasl/sysadmin.rst b/docsrc/sasl/sysadmin.rst
+index 3fc80c72..e422898b 100644
+--- a/docsrc/sasl/sysadmin.rst
++++ b/docsrc/sasl/sysadmin.rst
+@@ -301,8 +301,8 @@ The OTP mechanism
+ -----------------=0D
+ =0D
+ The Cyrus SASL library also supports the One-Time-Password (OTP)=0D
+-mechanism.  This mechanism is similar to CRAM-MD5, DIGEST-MD5, SCRAM=0D
+-and SRP in that is uses a shared secret and a challenge/response exchange=
.=0D
++mechanism.  This mechanism is similar to CRAM-MD5, DIGEST-MD5, and SCRAM=
=0D
++in that it uses a shared secret and a challenge/response exchange.=0D
+ However, OTP is more secure than the other shared secret mechanisms in=0D
+ that the secret is used to generate a sequence of one-time (single=0D
+ use) passwords which prevents reply attacks, and that secret need=0D
+@@ -402,9 +402,9 @@ I'm having performance problems on each authentication=
, there is a noticeable sl
+     To improve performance, you can change DEV_RANDOM in=0D
+     ``config.h`` to be ``/dev/urandom`` and recompile=0D
+     libsasl. ``/dev/urandom`` offers less secure random numbers but=0D
+-    should return immediately. The included mechanisms, besides OTP and=0D
+-    SRP, use random numbers only to generate nonces, so using=0D
+-    ``/dev/urandom`` is safe if you aren't using OTP or SRP.=0D
++    should return immediately. The included mechanisms, besides OTP,=0D
++    use random numbers only to generate nonces, so using=0D
++    ``/dev/urandom`` is safe if you aren't using OTP.=0D
+ =0D
+ =0D
+ I've converted the sasldb database to the new format. Why can't anybody a=
uthenticate?=0D
+diff --git a/docsrc/sasl/upgrading.rst b/docsrc/sasl/upgrading.rst
+index 77025bd8..cb3b2b8a 100644
+--- a/docsrc/sasl/upgrading.rst
++++ b/docsrc/sasl/upgrading.rst
+@@ -62,7 +62,7 @@ sasldb will compromise all services with the same passwo=
rds.  (This
+ situation isn't significantly worse, cryptographically speaking, than=0D
+ the old method and allows the database to be easy to transition to=0D
+ another format, when the need arises.)  Mechanisms requiring a more=0D
+-secure password database backend (e.g. SRP) should implement their own=0D
++secure password database backend should implement their own=0D
+ or use alternate property names within sasldb.=0D
+ =0D
+ .. _coexist:=0D
+diff --git a/docsrc/sasl/windows.rst b/docsrc/sasl/windows.rst
+index c498a501..d0ae26a1 100644
+--- a/docsrc/sasl/windows.rst
++++ b/docsrc/sasl/windows.rst
+@@ -124,18 +124,15 @@ You can either specify them on the command line or e=
dit the defaults in win32\co
+ Specify "NTLM=3D1" parameter if you want to enable NTLM plugin.=0D
+ I.e. ``nmake /f NTMakefile NTLM=3D1``=0D
+ =0D
+-Specify "SRP=3D1" parameter if you want to enable SRP plugin.=0D
+-You can also specify "DO_SRP_SETPASS=3D1" if you want to enable SRP setpa=
ss functionality.=0D
+-=0D
+ Specify "OTP=3D1" parameter if you want to enable OTP plugin.=0D
+ =0D
+-NTLM, SRP and OTP plugins depend on OpenSSL. You can either specify=0D
++NTLM and OTP plugins depend on OpenSSL. You can either specify=0D
+ ``OPENSSL_INCLUDE`` and ``OPENSSL_LIBPATH`` parameters on the command=0D
+ line or edit the defaults in win32\common.mak=0D
+ Note, that unless you are building one of those plugins, OpenSSL is not r=
equired!=0D
+ =0D
+ If you want to build multiple additional plugins at once, you can specify=
=0D
+-multiple parameters described above, for example ``nmake /f NTMakefile NT=
LM=3D1 SRP=3D1 OPT=3D1``=0D
++multiple parameters described above, for example ``nmake /f NTMakefile SQ=
L=3DSQLITE OTP=3D1``=0D
+ =0D
+ Limitations=0D
+ -----------=0D
+diff --git a/lib/staticopen.h b/lib/staticopen.h
+index d1983163..6c27a557 100644
+--- a/lib/staticopen.h
++++ b/lib/staticopen.h
+@@ -116,10 +116,6 @@ extern SPECIFIC_CLIENT_PLUG_INIT_PROTO( otp );
+ extern SPECIFIC_SERVER_PLUG_INIT_PROTO( plain );
+ extern SPECIFIC_CLIENT_PLUG_INIT_PROTO( plain );
+ #endif
+-#ifdef STATIC_SRP
+-extern SPECIFIC_SERVER_PLUG_INIT_PROTO( srp );
+-extern SPECIFIC_CLIENT_PLUG_INIT_PROTO( srp );
+-#endif
+ #ifdef STATIC_SASLDB
+ extern SPECIFIC_AUXPROP_PLUG_INIT_PROTO( sasldb );
+ #endif
+@@ -171,10 +167,6 @@ _sasl_plug_rec _sasl_static_plugins[] =3D {
+         SPECIFIC_SERVER_PLUG_INIT( scram, "SCRAM" ),
+         SPECIFIC_CLIENT_PLUG_INIT( scram, "SCRAM" ),
+ #endif
+-#ifdef STATIC_SRP
+-	SPECIFIC_SERVER_PLUG_INIT( srp, "SRP" ),
+-	SPECIFIC_CLIENT_PLUG_INIT( srp, "SRP" ),
+-#endif
+ #ifdef STATIC_SASLDB
+ 	SPECIFIC_AUXPROP_PLUG_INIT( sasldb, "SASLDB" ),
+ #endif
+diff --git a/plugins/Makefile.am b/plugins/Makefile.am
+index 11d0e70e..c7170c21 100644
+--- a/plugins/Makefile.am
++++ b/plugins/Makefile.am
+@@ -67,7 +67,7 @@ plugindir =3D @plugindir@
+ plugin_LTLIBRARIES =3D @SASL_MECHS@
+=20
+ EXTRA_LTLIBRARIES =3D libplain.la libanonymous.la libkerberos4.la libcram=
md5.la \
+-	libgs2.la libgssapiv2.la libdigestmd5.la liblogin.la libsrp.la libotp.la=
 \
++	libgs2.la libgssapiv2.la libdigestmd5.la liblogin.la libotp.la \
+ 	libscram.la libntlm.la libpassdss.la libsasldb.la libsql.la libldapdb.la
+=20
+ libplain_la_SOURCES =3D plain.c plain_init.c
+@@ -106,10 +106,6 @@ liblogin_la_SOURCES =3D login.c login_init.c
+ liblogin_la_DEPENDENCIES =3D $(COMPAT_OBJS) $(PLUGIN_COMMON_OBJS)
+ liblogin_la_LIBADD =3D $(PLAIN_LIBS) $(LIB_SOCKET) $(COMPAT_OBJS) $(PLUGI=
N_COMMON_OBJS)
+=20
+-libsrp_la_SOURCES =3D srp.c srp_init.c
+-libsrp_la_DEPENDENCIES =3D $(COMPAT_OBJS) $(PLUGIN_COMMON_OBJS) $(CRYPTO_=
COMPAT_OBJS)
+-libsrp_la_LIBADD =3D $(SRP_LIBS) $(LIB_SOCKET) $(COMPAT_OBJS) $(PLUGIN_CO=
MMON_OBJS) $(CRYPTO_COMPAT_OBJS)
+-
+ libotp_la_SOURCES =3D otp.c otp_init.c otp.h
+ libotp_la_DEPENDENCIES =3D $(COMPAT_OBJS) $(PLUGIN_COMMON_OBJS)
+ libotp_la_LIBADD =3D $(OTP_LIBS) $(LIB_SOCKET) $(COMPAT_OBJS) $(PLUGIN_CO=
MMON_OBJS)
+@@ -141,7 +137,7 @@ libsql_la_LIBADD =3D $(COMPAT_OBJS) $(PLUGIN_COMMON_OB=
JS)
+ # Instructions for making the _init files
+=20
+ init_src=3Danonymous_init.c crammd5_init.c digestmd5_init.c scram_init.c =
gs2_init.c gssapiv2_init.c \
+-kerberos4_init.c login_init.c plain_init.c srp_init.c otp_init.c ntlm_ini=
t.c \
++kerberos4_init.c login_init.c plain_init.c otp_init.c ntlm_init.c \
+ passdss_init.c sasldb_init.c sql_init.c ldapdb_init.c
+=20
+=20
+diff --git a/plugins/NTMakefile b/plugins/NTMakefile
+index 554e9363..a84e8bf5 100755
+--- a/plugins/NTMakefile
++++ b/plugins/NTMakefile
+@@ -12,13 +12,6 @@ PLUGINS_EXT=3D
+ PLUGINS_EXT=3D$(PLUGINS_EXT) saslGSSAPI.dll
+ !ENDIF=20
+=20
+-!IF "$(SRP)" =3D=3D "1"
+-PLUGINS_EXT=3D$(PLUGINS_EXT) saslSRP.dll
+-!IF "$(DO_SRP_SETPASS)" =3D=3D "1"
+-SRP_FLAGS=3D/DDO_SRP_SETPASS=3D1
+-!ENDIF=20
+-!ENDIF=20
+-
+ !IF "$(OTP)" =3D=3D "1"
+ PLUGINS_EXT=3D$(PLUGINS_EXT) saslOTP.dll
+ !ENDIF
+@@ -51,7 +44,7 @@ PLUGINS=3DsaslANONYMOUS.dll \
+ 	$(PLUGINS_EXT) \
+ 	saslSASLDB.dll
+=20
+-generated_rc=3DsaslANONYMOUS.rc saslPLAIN.rc saslCRAMMD5.rc saslDIGESTMD5=
.rc saslLOGIN.rc saslNTLM.rc saslSCRAM.rc saslGSSAPI.rc saslSRP.rc saslOTP.=
rc saslSASLDB.rc saslSQLITE.rc saslLDAPDB.rc
++generated_rc=3DsaslANONYMOUS.rc saslPLAIN.rc saslCRAMMD5.rc saslDIGESTMD5=
.rc saslLOGIN.rc saslNTLM.rc saslSCRAM.rc saslGSSAPI.rc saslOTP.rc saslSASL=
DB.rc saslSQLITE.rc saslLDAPDB.rc
+=20
+ # WS2tcpip.h included in Visual Studio 7 provides getaddrinfo, ...
+ # emulation on Windows, so there is no need to build getaddrinfo.c
+@@ -86,9 +79,6 @@ saslNTLM_out =3D saslNTLM.dll saslNTLM.exp saslNTLM.lib
+ saslGSSAPI_objs =3D gssapi.obj gssapiv2_init.obj $(common_objs)
+ saslGSSAPI_out =3D saslGSSAPI.dll saslGSSAPI.exp saslGSSAPI.lib
+=20
+-saslSRP_objs =3D srp.obj srp_init.obj $(common_objs)
+-saslSRP_out =3D saslSRP.dll saslSRP.exp saslSRP.lib
+-
+ saslOTP_objs =3D otp.obj otp_init.obj $(common_objs)
+ saslOTP_out =3D saslOTP.dll saslOTP.exp saslOTP.lib
+=20
+@@ -99,7 +89,7 @@ saslSQL_out =3D saslSQLITE.dll saslSQLITE.exp saslSQLITE=
.lib
+ saslLDAPDB_objs =3D ldapdb.obj $(common_objs)
+ saslLDAPDB_out =3D saslLDAPDB.dll saslLDAPDB.exp saslLDAPDB.lib
+=20
+-!IF "$(NTLM)" =3D=3D "1" || "$(SRP)" =3D=3D "1" || "$(OTP)" =3D=3D "1" ||=
 "$(SCRAM)" =3D=3D "1"
++!IF "$(NTLM)" =3D=3D "1" || "$(OTP)" =3D=3D "1" || "$(SCRAM)" =3D=3D "1"
+ OPENSSL_FLAGS=3D /I "$(OPENSSL_INCLUDE)"
+ !ELSE=20
+ OPENSSL_FLAGS=3D
+@@ -145,8 +135,8 @@ SCRAM_FLAGS=3D/DHAVE_SHA512=3D1
+ saslSASLDB_objs =3D sasldb.obj sasldb_init.obj $(libsasldb_objs) $(common=
_objs)
+ saslSASLDB_out =3D saslSASLDB.dll saslSASLDB.exp saslSASLDB.lib
+=20
+-all_objs =3D $(saslANONYMOUS_objs) $(saslPLAIN_objs) $(saslCRAMMD5_objs) =
$(saslDIGESTMD5_objs) $(saslLOGIN_objs) $(saslSCRAM_objs) $(saslNTLM_objs) =
$(saslGSSAPI_objs) $(saslSRP_objs) $(saslOTP_objs) $(saslSASLDB_objs) $(sas=
lSQL_objs) $(saslLDAPDB_objs)
+-all_out =3D $(saslANONYMOUS_out) $(saslPLAIN_out) $(saslCRAMMD5_out) $(sa=
slDIGESTMD5_out) $(saslLOGIN_out) $(saslSCRAM_out) $(saslNTLM_out) $(saslGS=
SAPI_out) $(saslSRP_out) $(saslOTP_out) $(saslSASLDB_out) $(saslSQL_out) $(=
saslLDAPDB_out)
++all_objs =3D $(saslANONYMOUS_objs) $(saslPLAIN_objs) $(saslCRAMMD5_objs) =
$(saslDIGESTMD5_objs) $(saslLOGIN_objs) $(saslSCRAM_objs) $(saslNTLM_objs) =
$(saslGSSAPI_objs) $(saslOTP_objs) $(saslSASLDB_objs) $(saslSQL_objs) $(sas=
lLDAPDB_objs)
++all_out =3D $(saslANONYMOUS_out) $(saslPLAIN_out) $(saslCRAMMD5_out) $(sa=
slDIGESTMD5_out) $(saslLOGIN_out) $(saslSCRAM_out) $(saslNTLM_out) $(saslGS=
SAPI_out) $(saslOTP_out) $(saslSASLDB_out) $(saslSQL_out) $(saslLDAPDB_out)
+=20
+ # LIBSASL_EXPORTS is required to export additional DB routines from sasldb
+ DB_FLAGS =3D /I "$(DB_INCLUDE)" /I "..\sasldb" /D "LIBSASL_EXPORTS" /D "K=
EEP_DB_OPEN"
+@@ -155,7 +145,7 @@ DB_FLAGS =3D /I "$(DB_INCLUDE)" /I "..\sasldb" /D "LIB=
SASL_EXPORTS" /D "KEEP_DB_OP
+ EXTRA_FLAGS =3D /D TARGET_WIN_SYSTEM=3D$(TARGET_WIN_SYSTEM) $(EXTRA_FLAGS)
+ !ENDIF
+=20
+-EXTRA_FLAGS=3D$(EXTRA_FLAGS) $(DB_FLAGS) $(OPENSSL_FLAGS) $(GSS_FLAGS) $(=
SRP_FLAGS) $(SQL_FLAGS) $(DIGEST_FLAGS) $(CRAM_FLAGS) $(SCRAM_FLAGS) $(LDAP=
_FLAGS)
++EXTRA_FLAGS=3D$(EXTRA_FLAGS) $(DB_FLAGS) $(OPENSSL_FLAGS) $(GSS_FLAGS) $(=
SQL_FLAGS) $(DIGEST_FLAGS) $(CRAM_FLAGS) $(SCRAM_FLAGS) $(LDAP_FLAGS)
+ CPPFLAGS =3D /I "..\win32\include" /I "." /I "..\include" /I "..\common" =
$(EXTRA_FLAGS) /D "_WIN32" $(COMMON_CPPFLAGS)
+=20
+ OPENSSL_LIBS=3D"/libpath:$(OPENSSL_LIBPATH)"
+@@ -234,11 +224,6 @@ saslGSSAPI.dll: $(saslGSSAPI_objs) saslGSSAPI.res
+ <<
+ 	IF EXIST $@.manifest mt -manifest $@.manifest -outputresource:$@;2
+=20
+-saslSRP.dll: $(saslSRP_objs) saslSRP.res
+-	$(LINK32DLL) @<< $(OPENSSL_LIBS) $(LINK32DLL_FLAGS) /out:"saslSRP.dll" /=
implib:"saslSRP.lib" $(saslSRP_objs) saslSRP.res
+-<<
+-	IF EXIST $@.manifest mt -manifest $@.manifest -outputresource:$@;2
+-
+ saslOTP.dll: $(saslOTP_objs) saslOTP.res
+ 	$(LINK32DLL) @<< $(OPENSSL_LIBS) $(LINK32DLL_FLAGS) /out:"saslOTP.dll" /=
implib:"saslOTP.lib" $(saslOTP_objs) saslOTP.res
+ <<
+diff --git a/plugins/makeinit.sh b/plugins/makeinit.sh
+index 3131877a..79659848 100644
+--- a/plugins/makeinit.sh
++++ b/plugins/makeinit.sh
+@@ -1,6 +1,6 @@
+ plugin_init=3D"$1"
+ # mechanism plugins
+-for mech in anonymous crammd5 digestmd5 scram gssapiv2 kerberos4 login nt=
lm otp passdss plain srp gs2; do
++for mech in anonymous crammd5 digestmd5 scram gssapiv2 kerberos4 login nt=
lm otp passdss plain gs2; do
+     if [ ${plugin_init} =3D "${mech}_init.c" ];then
+=20
+         echo "
+diff --git a/plugins/srp.c b/plugins/srp.c
+deleted file mode 100644
+index 7cf36c27..00000000
+--- a/plugins/srp.c
++++ /dev/null
+@@ -1,3197 +0,0 @@
+-/* SRP SASL plugin
+- * Ken Murchison
+- * Tim Martin  3/17/00
+- */
+-/*=20
+- * Copyright (c) 1998-2016 Carnegie Mellon University.  All rights reserv=
ed.
+- *
+- * Redistribution and use in source and binary forms, with or without
+- * modification, are permitted provided that the following conditions
+- * are met:
+- *
+- * 1. Redistributions of source code must retain the above copyright
+- *    notice, this list of conditions and the following disclaimer.=20
+- *
+- * 2. Redistributions in binary form must reproduce the above copyright
+- *    notice, this list of conditions and the following disclaimer in
+- *    the documentation and/or other materials provided with the
+- *    distribution.
+- *
+- * 3. The name "Carnegie Mellon University" must not be used to
+- *    endorse or promote products derived from this software without
+- *    prior written permission. For permission or any other legal
+- *    details, please contact=20=20
+- *      Carnegie Mellon University
+- *      Center for Technology Transfer and Enterprise Creation
+- *      4615 Forbes Avenue
+- *      Suite 302
+- *      Pittsburgh, PA  15213
+- *      (412) 268-7393, fax: (412) 268-7395
+- *      innovation@andrew.cmu.edu
+- *
+- * 4. Redistributions of any form whatsoever must retain the following
+- *    acknowledgment:
+- *    "This product includes software developed by Computing Services
+- *     at Carnegie Mellon University (http://www.cmu.edu/computing/)."
+- *
+- * CARNEGIE MELLON UNIVERSITY DISCLAIMS ALL WARRANTIES WITH REGARD TO
+- * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
+- * AND FITNESS, IN NO EVENT SHALL CARNEGIE MELLON UNIVERSITY BE LIABLE
+- * FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
+- * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
+- * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+- */
+-
+-/*
+- * Notes:
+- *
+- * - The authentication exchanges *should* be correct (per draft -08)
+- *   but we won't know until we do some interop testing.
+- *
+- * - The security layers don't conform to draft -08:
+- *    o  We don't use eos() and os() elements in an SRP buffer, we send
+- *      just the bare octets.
+- *    o  We don't yet use the PRNG() and KDF() primatives described in
+- *       section 5.1.
+- *
+- * - Are we using cIV and sIV correctly for encrypt/decrypt?
+- *
+- * - We don't implement fast reauth.
+- */
+-
+-#include <config.h>
+-#include <assert.h>
+-#include <ctype.h>
+-#include <stdio.h>
+-#include <limits.h>
+-#include <stdarg.h>
+-
+-#ifndef UINT32_MAX
+-#define UINT32_MAX 4294967295U
+-#endif
+-
+-#if UINT_MAX =3D=3D UINT32_MAX
+-typedef unsigned int uint32;
+-#elif ULONG_MAX =3D=3D UINT32_MAX
+-typedef unsigned long uint32;
+-#elif USHRT_MAX =3D=3D UINT32_MAX
+-typedef unsigned short uint32;
+-#else
+-#error dont know what to use for uint32
+-#endif
+-
+-/* for big number support */
+-#include <openssl/bn.h>
+-
+-/* for digest and cipher support */
+-#include <openssl/evp.h>
+-#include <openssl/hmac.h>
+-#include <openssl/md5.h>
+-
+-/* for legacy libcrypto support */
+-#include "crypto-compat.h"
+-
+-#include <sasl.h>
+-#define MD5_H  /* suppress internal MD5 */
+-#include <saslplug.h>
+-
+-#include "plugin_common.h"
+-
+-#ifdef macintosh
+-#include <sasl_srp_plugin_decl.h>
+-#endif=20
+-
+-/*****************************  Common Section  *************************=
****/
+-
+-/* Size limit of cipher block size */
+-#define SRP_MAXBLOCKSIZE 16
+-/* Size limit of SRP buffer */
+-#define SRP_MAXBUFFERSIZE 2147483643UL
+-
+-#define DEFAULT_MDA		"SHA-1"
+-
+-#define OPTION_MDA		"mda=3D"
+-#define OPTION_REPLAY_DETECTION	"replay_detection"
+-#define OPTION_INTEGRITY	"integrity=3D"
+-#define OPTION_CONFIDENTIALITY	"confidentiality=3D"
+-#define OPTION_MANDATORY	"mandatory=3D"
+-#define OPTION_MAXBUFFERSIZE	"maxbuffersize=3D"
+-
+-/* Table of recommended Modulus (base 16) and Generator pairs */
+-struct Ng {
+-    char *N;
+-    unsigned long g;
+-} Ng_tab[] =3D {
+-    /* [264 bits] */
+-    { "115B8B692E0E045692CF280B436735C77A5A9E8A9E7ED56C965F87DB5B2A2ECE3",
+-      2
+-    },
+-    /* [384 bits] */
+-    { "8025363296FB943FCE54BE717E0E2958A02A9672EF561953B2BAA3BAACC3ED5754=
EB764C7AB7184578C57D5949CCB41B",
+-      2
+-    },
+-    /* [512 bits] */
+-    { "D4C7F8A2B32C11B8FBA9581EC4BA4F1B04215642EF7355E37C0FC0443EF756EA2C=
6B8EEB755A1C723027663CAA265EF785B8FF6A9B35227A52D86633DBDFCA43",
+-      2
+-    },
+-    /* [640 bits] */
+-    { "C94D67EB5B1A2346E8AB422FC6A0EDAEDA8C7F894C9EEEC42F9ED250FD7F0046E5=
AF2CF73D6B2FA26BB08033DA4DE322E144E7A8E9B12A0E4637F6371F34A2071C4B3836CBEEA=
B15034460FAA7ADF483",
+-      2
+-    },
+-    /* [768 bits] */
+-    { "B344C7C4F8C495031BB4E04FF8F84EE95008163940B9558276744D91F7CC9F4026=
53BE7147F00F576B93754BCDDF71B636F2099E6FFF90E79575F3D0DE694AFF737D9BE9713CE=
F8D837ADA6380B1093E94B6A529A8C6C2BE33E0867C60C3262B",
+-      2
+-    },
+-    /* [1024 bits] */
+-    { "EEAF0AB9ADB38DD69C33F80AFA8FC5E86072618775FF3C0B9EA2314C9C256576D6=
74DF7496EA81D3383B4813D692C6E0E0D5D8E250B98BE48E495C1D6089DAD15DC7D7B46154D=
6B6CE8EF4AD69B15D4982559B297BCF1885C529F566660E57EC68EDBC3C05726CC02FD4CBF4=
976EAA9AFD5138FE8376435B9FC61D2FC0EB06E3",
+-      2
+-    },
+-    /* [1280 bits] */
+-    { "D77946826E811914B39401D56A0A7843A8E7575D738C672A090AB1187D690DC438=
72FC06A7B6A43F3B95BEAEC7DF04B9D242EBDC481111283216CE816E004B786C5FCE856780D=
41837D95AD787A50BBE90BD3A9C98AC0F5FC0DE744B1CDE1891690894BC1F65E00DE15B4B2A=
A6D87100C9ECC2527E45EB849DEB14BB2049B163EA04187FD27C1BD9C7958CD40CE7067A9C0=
24F9B7C5A0B4F5003686161F0605B",
+-      2
+-    },
+-    /* [1536 bits] */
+-    { "9DEF3CAFB939277AB1F12A8617A47BBBDBA51DF499AC4C80BEEEA9614B19CC4D5F=
4F5F556E27CBDE51C6A94BE4607A291558903BA0D0F84380B655BB9A22E8DCDF028A7CEC67F=
0D08134B1C8B97989149B609E0BE3BAB63D47548381DBC5B1FC764E3F4B53DD9DA1158BFD3E=
2B9C8CF56EDF019539349627DB2FD53D24B7C48665772E437D6C7F8CE442734AF7CCB7AE837=
C264AE3A9BEB87F8A2FE9B8B5292E5A021FFF5E91479E8CE7A28C2442C6F315180F93499A23=
4DCF76E3FED135F9BB",
+-      2
+-    },
+-    /* [2048 bits] */
+-    { "AC6BDB41324A9A9BF166DE5E1389582FAF72B6651987EE07FC3192943DB56050A3=
7329CBB4A099ED8193E0757767A13DD52312AB4B03310DCD7F48A9DA04FD50E8083969EDB76=
7B0CF6095179A163AB3661A05FBD5FAAAE82918A9962F0B93B855F97993EC975EEAA80D740A=
DBF4FF747359D041D5C33EA71D281E446B14773BCA97B43A23FB801676BD207A436C6481F1D=
2B9078717461A5B9D32E688F87748544523B524B0D57D5EA77A2775D2ECFA032CFBDBF52FB3=
786160279004E57AE6AF874E7303CE53299CCC041C7BC308D82A5698F3A8D0C38271AE35F8E=
9DBFBB694B5C803D89F7AE435DE236D525F54759B65E372FCD68EF20FA7111F9E4AFF73",
+-      2
+-    }
+-};
+-
+-#define NUM_Ng (sizeof(Ng_tab) / sizeof(struct Ng))
+-
+-
+-typedef struct layer_option_s {
+-    const char *name;		/* name used in option strings */
+-    unsigned enabled;		/* enabled?  determined at run-time */
+-    unsigned bit;		/* unique bit in bitmask */
+-    sasl_ssf_t ssf;		/* ssf of layer */
+-    const char *evp_name;	/* name used for lookup in EVP table */
+-} layer_option_t;
+-
+-static layer_option_t digest_options[] =3D {
+-    { "SHA-1",		0, (1<<0), 1,	"sha1" },
+-    { "RIPEMD-160",	0, (1<<1), 1,	"rmd160" },
+-    { "MD5",		0, (1<<2), 1,	"md5" },
+-    { NULL,		0,      0, 0,	NULL }
+-};
+-static layer_option_t *default_digest =3D &digest_options[0];
+-static layer_option_t *server_mda =3D NULL;
+-
+-static layer_option_t cipher_options[] =3D {
+-    { "DES",		0, (1<<0), 56,	"des-ofb" },
+-    { "3DES",		0, (1<<1), 112,	"des-ede-ofb" },
+-    { "AES",		0, (1<<2), 128,	"aes-128-ofb" },
+-    { "Blowfish",	0, (1<<3), 128,	"bf-ofb" },
+-    { "CAST-128",	0, (1<<4), 128,	"cast5-ofb" },
+-    { "IDEA",		0, (1<<5), 128,	"idea-ofb" },
+-    { NULL,		0,      0, 0,	NULL}
+-};
+-/* XXX Hack until OpenSSL 0.9.7 */
+-#if OPENSSL_VERSION_NUMBER < 0x00907000L
+-static layer_option_t *default_cipher =3D &cipher_options[0];
+-#else
+-static layer_option_t *default_cipher =3D &cipher_options[2];
+-#endif
+-
+-
+-enum {
+-    BIT_REPLAY_DETECTION=3D	(1<<0),
+-    BIT_INTEGRITY=3D		(1<<1),
+-    BIT_CONFIDENTIALITY=3D	(1<<2)
+-};
+-
+-typedef struct srp_options_s {
+-    unsigned mda;		/* bitmask of MDAs */
+-    unsigned replay_detection;	/* replay detection on/off flag */
+-    unsigned integrity;		/* bitmask of integrity layers */
+-    unsigned confidentiality;	/* bitmask of confidentiality layers */
+-    unsigned mandatory;		/* bitmask of mandatory layers */
+-    unsigned long maxbufsize;	/* max # bytes processed by security layer =
*/
+-} srp_options_t;
+-
+-/* The main SRP context */
+-typedef struct context {
+-    int state;
+-=20=20=20=20
+-    BIGNUM *N;			/* safe prime modulus */
+-    BIGNUM *g;			/* generator */
+-=20=20=20=20
+-    BIGNUM *v;			/* password verifier */
+-=20=20=20=20
+-    BIGNUM *b;			/* server private key */
+-    BIGNUM *B;			/* server public key */
+-=20=20=20=20
+-    BIGNUM *a;			/* client private key */
+-    BIGNUM *A;			/* client public key */
+-=20=20=20=20
+-    unsigned char K[EVP_MAX_MD_SIZE];	/* shared context key */
+-    unsigned int Klen;
+-=20=20=20=20
+-    unsigned char M1[EVP_MAX_MD_SIZE];	/* client evidence */
+-    unsigned int M1len;
+-=20=20=20=20
+-    char *authid;		/* authentication id (server) */
+-    char *userid;		/* authorization id (server) */
+-    sasl_secret_t *password;	/* user secret (client) */
+-    unsigned int free_password; /* set if we need to free password */
+-=20=20=20=20
+-    char *client_options;
+-    char *server_options;
+-=20=20=20=20
+-    srp_options_t client_opts;	/* cache between client steps */
+-    unsigned char cIV[SRP_MAXBLOCKSIZE];	/* cache between client steps */
+-=20=20=20=20
+-    char *salt;			/* password salt */
+-    int saltlen;
+-=20=20=20=20
+-    const EVP_MD *md;		/* underlying MDA */
+-=20=20=20=20
+-    /* copy of utils from the params structures */
+-    const sasl_utils_t *utils;
+-=20=20=20=20
+-    /* per-step mem management */
+-    char *out_buf;
+-    unsigned out_buf_len;
+-=20=20=20=20
+-    /* Layer foo */
+-    unsigned layer;		/* bitmask of enabled layers */
+-    const EVP_MD *hmac_md;	/* HMAC for integrity */
+-    HMAC_CTX *hmac_send_ctx;
+-    HMAC_CTX *hmac_recv_ctx;
+-
+-    const EVP_CIPHER *cipher;	/* cipher for confidentiality */
+-    EVP_CIPHER_CTX *cipher_enc_ctx;
+-    EVP_CIPHER_CTX *cipher_dec_ctx;
+-=20=20=20=20
+-    /* replay detection sequence numbers */
+-    int seqnum_out;
+-    int seqnum_in;
+-=20=20=20=20
+-    /* for encoding/decoding mem management */
+-    char           *encode_buf, *decode_buf, *decode_pkt_buf;
+-    unsigned       encode_buf_len, decode_buf_len, decode_pkt_buf_len;
+-=20=20=20=20
+-    /* layers buffering */
+-    decode_context_t decode_context;
+-=20=20=20=20
+-} context_t;
+-
+-static int srp_encode(void *context,
+-		      const struct iovec *invec,
+-		      unsigned numiov,
+-		      const char **output,
+-		      unsigned *outputlen)
+-{
+-    context_t *text =3D (context_t *) context;
+-    unsigned i;
+-    char *input;
+-    unsigned long inputlen, tmpnum;
+-    int ret;
+-=20=20=20=20
+-    if (!context || !invec || !numiov || !output || !outputlen) {
+-	PARAMERROR( text->utils );
+-	return SASL_BADPARAM;
+-    }
+-
+-    /* calculate total size of input */
+-    for (i =3D 0, inputlen =3D 0; i < numiov; i++)
+-	inputlen +=3D invec[i].iov_len;
+-
+-    /* allocate a buffer for the output */
+-    ret =3D _plug_buf_alloc(text->utils, &text->encode_buf,
+-			  &text->encode_buf_len,
+-			  4 +			/* for length */
+-			  inputlen +		/* for content */
+-			  SRP_MAXBLOCKSIZE +	/* for PKCS padding */
+-			  EVP_MAX_MD_SIZE);	/* for HMAC */
+-    if (ret !=3D SASL_OK) return ret;
+-
+-    *outputlen =3D 4; /* length */
+-
+-    /* operate on each iovec */
+-    for (i =3D 0; i < numiov; i++) {
+-	input =3D invec[i].iov_base;
+-	inputlen =3D invec[i].iov_len;
+-=20=20=20=20
+-	if (text->layer & BIT_CONFIDENTIALITY) {
+-	    int enclen;
+-
+-	    /* encrypt the data into the output buffer */
+-	    EVP_EncryptUpdate(text->cipher_enc_ctx,
+-			      (unsigned char *) text->encode_buf + *outputlen,
+-                              &enclen, (unsigned char *) input, inputlen);
+-	    *outputlen +=3D enclen;
+-
+-	    /* switch the input to the encrypted data */
+-	    input =3D text->encode_buf + 4;
+-	    inputlen =3D *outputlen - 4;
+-	}
+-	else {
+-	    /* copy the raw input to the output */
+-	    memcpy(text->encode_buf + *outputlen, input, inputlen);
+-	    *outputlen +=3D inputlen;
+-	}
+-    }
+-=20=20=20=20
+-    if (text->layer & BIT_CONFIDENTIALITY) {
+-	int enclen;
+-
+-	/* encrypt the last block of data into the output buffer */
+-	EVP_EncryptFinal(text->cipher_enc_ctx,
+-			 (unsigned char *) text->encode_buf + *outputlen,
+-                         &enclen);
+-	*outputlen +=3D enclen;
+-    }
+-
+-    if (text->layer & BIT_INTEGRITY) {
+-	unsigned hashlen;
+-
+-	/* hash the content */
+-	HMAC_Update(text->hmac_send_ctx,
+-                    (unsigned char *) text->encode_buf+4, *outputlen-4);
+-=09
+-	if (text->layer & BIT_REPLAY_DETECTION) {
+-	    /* hash the sequence number */
+-	    tmpnum =3D htonl(text->seqnum_out);
+-	    HMAC_Update(text->hmac_send_ctx, (unsigned char *) &tmpnum, 4);
+-=09=20=20=20=20
+-	    text->seqnum_out++;
+-	}
+-
+-	/* append the HMAC into the output buffer */
+-	HMAC_Final(text->hmac_send_ctx,
+-                   (unsigned char *) text->encode_buf + *outputlen,
+-		   &hashlen);
+-	*outputlen +=3D hashlen;
+-    }
+-
+-    /* prepend the length of the output */
+-    tmpnum =3D *outputlen - 4;
+-    tmpnum =3D htonl(tmpnum);
+-    memcpy(text->encode_buf, &tmpnum, 4);
+-
+-    *output =3D text->encode_buf;
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-/* decode a single SRP packet */
+-static int srp_decode_packet(void *context,
+-			     const char *input,
+-			     unsigned inputlen,
+-			     char **output,
+-			     unsigned *outputlen)
+-{
+-    context_t *text =3D (context_t *) context;
+-    int ret;
+-
+-    if (text->layer & BIT_INTEGRITY) {
+-	const char *hash;
+-	unsigned char myhash[EVP_MAX_MD_SIZE];
+-	unsigned hashlen;
+-	unsigned long tmpnum;
+-
+-	hashlen =3D EVP_MD_size(text->hmac_md);
+-
+-	if (inputlen < hashlen) {
+-	    text->utils->seterror(text->utils->conn, 0,
+-				  "SRP input is smaller "
+-				  "than hash length: %d vs %d\n",
+-				  inputlen, hashlen);
+-	    return SASL_BADPROT;
+-	}
+-
+-	inputlen -=3D hashlen;
+-	hash =3D input + inputlen;
+-
+-	/* create our own hash from the input */
+-	HMAC_Update(text->hmac_recv_ctx, (unsigned char *) input, inputlen);
+-=09=20=20=20=20
+-	if (text->layer & BIT_REPLAY_DETECTION) {
+-	    /* hash the sequence number */
+-	    tmpnum =3D htonl(text->seqnum_in);
+-	    HMAC_Update(text->hmac_recv_ctx, (unsigned char *) &tmpnum, 4);
+-=09=09
+-	    text->seqnum_in++;
+-	}
+-=09=20=20=20=20
+-	HMAC_Final(text->hmac_recv_ctx, myhash, &hashlen);
+-
+-	/* compare hashes */
+-        if (memcmp(hash, myhash, hashlen)) {
+-            SETERROR(text->utils, "Hash is incorrect\n");
+-            return SASL_BADMAC;
+-        }
+-    }
+-=09
+-    ret =3D _plug_buf_alloc(text->utils, &(text->decode_pkt_buf),
+-			  &(text->decode_pkt_buf_len),
+-			  inputlen);
+-    if (ret !=3D SASL_OK) return ret;
+-=09
+-    if (text->layer & BIT_CONFIDENTIALITY) {
+-	int declen;
+-
+-	/* decrypt the data into the output buffer */
+-	EVP_DecryptUpdate(text->cipher_dec_ctx,
+-			  (unsigned char *) text->decode_pkt_buf, &declen,
+-			  (unsigned char *) input, inputlen);
+-	*outputlen =3D declen;
+-=09=20=20=20=20
+-	EVP_DecryptFinal(text->cipher_dec_ctx,
+-			 (unsigned char *) text->decode_pkt_buf + declen,
+-                         &declen);
+-	*outputlen +=3D declen;
+-    } else {
+-	/* copy the raw input to the output */
+-	memcpy(text->decode_pkt_buf, input, inputlen);
+-	*outputlen =3D inputlen;
+-    }
+-
+-    *output =3D text->decode_pkt_buf;
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-/* decode and concatenate multiple SRP packets */
+-static int srp_decode(void *context,
+-		      const char *input, unsigned inputlen,
+-		      const char **output, unsigned *outputlen)
+-{
+-    context_t *text =3D (context_t *) context;
+-    int ret;
+-=20=20=20=20
+-    ret =3D _plug_decode(&text->decode_context, input, inputlen,
+-		       &text->decode_buf, &text->decode_buf_len, outputlen,
+-		       srp_decode_packet, text);
+-=20=20=20=20
+-    *output =3D text->decode_buf;
+-=20=20=20=20
+-    return ret;
+-}
+-
+-/*
+- * Convert a big integer to it's byte representation
+- */
+-static int BigIntToBytes(BIGNUM *num, unsigned char *out, int maxoutlen,
+-                         unsigned int *outlen)
+-{
+-    int len;
+-=20=20=20=20
+-    len =3D BN_num_bytes(num);
+-=20=20=20=20
+-    if (len > maxoutlen) return SASL_FAIL;
+-=20=20=20=20
+-    *outlen =3D BN_bn2bin(num, out);
+-=20=20=20=20
+-    return SASL_OK;=20=20=20=20
+-}
+-
+-/*
+- * Compare a big integer against a word.
+- */
+-static int BigIntCmpWord(BIGNUM *a, BN_ULONG w)
+-{
+-    BIGNUM *b =3D BN_new();
+-    int r;
+-=20=20=20=20
+-    BN_set_word(b, w);
+-    r =3D BN_cmp(a, b);
+-    BN_free(b);
+-    return r;
+-}
+-
+-/*
+- * Generate a random big integer.
+- */
+-static void GetRandBigInt(BIGNUM **out)
+-{
+-    *out =3D BN_new();
+-=20=20=20=20
+-    /* xxx likely should use sasl random funcs */
+-    BN_rand(*out, SRP_MAXBLOCKSIZE*8, 0, 0);
+-}
+-
+-#define MAX_BUFFER_LEN 2147483643
+-#define MAX_MPI_LEN 65535
+-#define MAX_UTF8_LEN 65535
+-#define MAX_OS_LEN 255
+-
+-/*
+- * Make an SRP buffer from the data specified by the fmt string.
+- */
+-static int MakeBuffer(const sasl_utils_t *utils, char **buf, unsigned *bu=
flen,
+-		      unsigned *outlen, const char *fmt, ...)
+-{
+-    va_list ap;
+-    char *p, *out =3D NULL;
+-    int r, alloclen, len;
+-    BIGNUM *mpi;
+-    char *os, *str, c;
+-    uint32 u;
+-    short ns;
+-    long totlen;
+-
+-    /* first pass to calculate size of buffer */
+-    va_start(ap, fmt);
+-    for (p =3D (char *) fmt, alloclen =3D 0; *p; p++) {
+-	if (*p !=3D '%') {
+-	    alloclen++;
+-	    continue;
+-	}
+-
+-	switch (*++p) {
+-	case 'm':
+-	    /* MPI */
+-	    mpi =3D va_arg(ap, BIGNUM *);
+-	    len =3D BN_num_bytes(mpi);
+-	    if (len > MAX_MPI_LEN) {
+-		utils->log(NULL, SASL_LOG_ERR,
+-			   "String too long to create mpi string\n");
+-		r =3D SASL_FAIL;
+-		goto done;
+-	    }
+-	    alloclen +=3D len + 2;
+-	    break;
+-
+-	case 'o':
+-	    /* octet sequence (len followed by data) */
+-	    len =3D va_arg(ap, int);
+-	    if (len > MAX_OS_LEN) {
+-		utils->log(NULL, SASL_LOG_ERR,
+-			   "String too long to create os string\n");
+-		r =3D SASL_FAIL;
+-		goto done;
+-	    }
+-	    alloclen +=3D len + 1;
+-	    os =3D va_arg(ap, char *);
+-	    break;
+-
+-	case 's':
+-	    /* string */
+-	    str =3D va_arg(ap, char *);
+-	    len =3D strlen(str);
+-	    if (len > MAX_UTF8_LEN) {
+-		utils->log(NULL, SASL_LOG_ERR,
+-			   "String too long to create utf8 string\n");
+-		r =3D SASL_FAIL;
+-		goto done;
+-	    }
+-	    alloclen +=3D len + 2;
+-	    break;
+-
+-	case 'u':
+-	    /* unsigned int */
+-	    u =3D va_arg(ap, uint32);
+-	    alloclen +=3D sizeof(uint32);
+-	    break;
+-
+-	case 'c':
+-	    /* char */
+-	    c =3D va_arg(ap, int) & 0xFF;
+-	    alloclen +=3D 1;
+-	    break;
+-
+-	default:
+-	    alloclen +=3D 1;
+-	    break;
+-	}
+-    }
+-    va_end(ap);
+-
+-    if (alloclen > MAX_BUFFER_LEN) {
+-	utils->log(NULL, SASL_LOG_ERR,
+-		   "String too long to create SRP buffer string\n");
+-	return SASL_FAIL;
+-    }
+-
+-    alloclen +=3D 4;
+-    r =3D _plug_buf_alloc(utils, buf, buflen, alloclen);
+-    if (r !=3D SASL_OK) return r;
+-
+-    out =3D *buf + 4; /* skip size for now */
+-
+-    /* second pass to fill buffer */
+-    va_start(ap, fmt);
+-    for (p =3D (char *) fmt; *p; p++) {
+-	if (*p !=3D '%') {
+-	    *out =3D *p;
+-	    out++;
+-	    continue;
+-	}
+-
+-	switch (*++p) {
+-	case 'm':
+-	    /* MPI */
+-	    mpi =3D va_arg(ap, BIGNUM *);
+-	    r =3D BigIntToBytes(mpi, (unsigned char *) out+2,
+-                              BN_num_bytes(mpi), (unsigned *) &len);
+-	    if (r) goto done;
+-	    ns =3D htons(len);
+-	    memcpy(out, &ns, 2);	/* add 2 byte len (network order) */
+-	    out +=3D len + 2;
+-	    break;
+-
+-	case 'o':
+-	    /* octet sequence (len followed by data) */
+-	    len =3D va_arg(ap, int);
+-	    os =3D va_arg(ap, char *);
+-	    *out =3D len & 0xFF;		/* add 1 byte len */
+-	    memcpy(out+1, os, len);	/* add data */
+-	    out +=3D len+1;
+-	    break;
+-
+-	case 's':
+-	    /* string */
+-	    str =3D va_arg(ap, char *);
+-	    /* xxx do actual utf8 conversion */
+-	    len =3D strlen(str);
+-	    ns =3D htons(len);
+-	    memcpy(out, &ns, 2);	/* add 2 byte len (network order) */
+-	    memcpy(out+2, str, len);	/* add string */
+-	    out +=3D len + 2;
+-	    break;
+-
+-	case 'u':
+-	    /* unsigned int */
+-	    u =3D va_arg(ap, uint32);
+-	    u =3D htonl(u);
+-	    memcpy(out, &u, sizeof(uint32));
+-	    out +=3D sizeof(uint32);
+-	    break;
+-
+-	case 'c':
+-	    /* char */
+-	    c =3D va_arg(ap, int) & 0xFF;
+-	    *out =3D c;
+-	    out++;
+-	    break;
+-
+-	default:
+-	    *out =3D *p;
+-	    out++;
+-	    break;
+-	}
+-    }
+-  done:
+-    va_end(ap);
+-
+-    *outlen =3D out - *buf;
+-
+-    /* add 4 byte len (network order) */
+-    totlen =3D htonl(*outlen - 4);
+-    memcpy(*buf, &totlen, 4);
+-
+-    return r;
+-}
+-
+-/*=20
+- * Extract an SRP buffer into the data specified by the fmt string.
+- *
+- * A '-' flag means don't allocate memory for the data ('o' only).
+- */
+-static int UnBuffer(const sasl_utils_t *utils, const char *buf,
+-		    unsigned buflen, const char *fmt, ...)
+-{
+-    va_list ap;
+-    char *p;
+-    int r =3D SASL_OK, noalloc;
+-    BIGNUM **mpi;
+-    char **os, **str;
+-    uint32 *u;
+-    unsigned short ns;
+-    unsigned len;
+-
+-    if (!buf || buflen < 4) {
+-	utils->seterror(utils->conn, 0,
+-			"Buffer is not big enough to be SRP buffer: %d\n",
+-			buflen);
+-	return SASL_BADPROT;
+-    }
+-=20=20=20=20
+-    /* get the length */
+-    memcpy(&len, buf, 4);
+-    len =3D ntohl(len);
+-    buf +=3D 4;
+-    buflen -=3D 4;
+-
+-    /* make sure it's right */
+-    if (len !=3D buflen) {
+-	SETERROR(utils, "SRP Buffer isn't of the right length\n");
+-	return SASL_BADPROT;
+-    }
+-=20=20=20=20
+-    va_start(ap, fmt);
+-    for (p =3D (char *) fmt; *p; p++) {
+-	if (*p !=3D '%') {
+-	    if (*buf !=3D *p) {
+-		r =3D SASL_BADPROT;
+-		goto done;
+-	    }
+-	    buf++;
+-	    buflen--;
+-	    continue;
+-	}
+-
+-	/* check for noalloc flag */
+-	if ((noalloc =3D (*++p =3D=3D '-'))) ++p;
+-
+-	switch (*p) {
+-	case 'm':
+-	    /* MPI */
+-	    if (buflen < 2) {
+-		SETERROR(utils, "Buffer is not big enough to be SRP MPI\n");
+-		r =3D SASL_BADPROT;
+-		goto done;
+-	    }
+-=20=20=20=20
+-	    /* get the length */
+-	    memcpy(&ns, buf, 2);
+-	    len =3D ntohs(ns);
+-	    buf +=3D 2;
+-	    buflen -=3D 2;
+-=20=20=20=20
+-	    /* make sure it's right */
+-	    if (len > buflen) {
+-		SETERROR(utils, "Not enough data for this SRP MPI\n");
+-		r =3D SASL_BADPROT;
+-		goto done;
+-	    }
+-=09=20=20=20=20
+-	    mpi =3D va_arg(ap, BIGNUM **);
+-            if (mpi) {
+-                if (!*mpi) *mpi =3D BN_new();
+-                else BN_clear(*mpi);
+-                BN_bin2bn((unsigned char *) buf, len, *mpi);
+-            }
+-	    break;
+-
+-	case 'o':
+-	    /* octet sequence (len followed by data) */
+-	    if (buflen < 1) {
+-		SETERROR(utils, "Buffer is not big enough to be SRP os\n");
+-		r =3D SASL_BADPROT;
+-		goto done;
+-	    }
+-
+-	    /* get the length */
+-	    len =3D (unsigned char) *buf;
+-	    buf++;
+-	    buflen--;
+-
+-	    /* make sure it's right */
+-	    if (len > buflen) {
+-		SETERROR(utils, "Not enough data for this SRP os\n");
+-		r =3D SASL_BADPROT;
+-		goto done;
+-	    }
+-=09=20=20=20=20
+-	    *(va_arg(ap, int *)) =3D len;
+-	    os =3D va_arg(ap, char **);
+-
+-	    if (noalloc)
+-		*os =3D (char *) buf;
+-	    else {
+-		*os =3D (char *) utils->malloc(len);
+-		if (!*os) {
+-		    r =3D SASL_NOMEM;
+-		    goto done;
+-		}
+-=20=20=20=20
+-		memcpy(*os, buf, len);
+-	    }
+-	    break;
+-
+-	case 's':
+-	    /* string */
+-	    if (buflen < 2) {
+-		SETERROR(utils, "Buffer is not big enough to be SRP UTF8\n");
+-		r =3D SASL_BADPROT;
+-		goto done;
+-	    }
+-=20=20=20=20
+-	    /* get the length */
+-	    memcpy(&ns, buf, 2);
+-	    len =3D ntohs(ns);
+-	    buf +=3D 2;
+-	    buflen -=3D 2;
+-=20=20=20=20
+-	    /* make sure it's right */
+-	    if (len > buflen) {
+-		SETERROR(utils, "Not enough data for this SRP UTF8\n");
+-		r =3D SASL_BADPROT;
+-		goto done;
+-	    }
+-=09=20=20=20=20
+-	    str =3D va_arg(ap, char **);
+-	    *str =3D (char *) utils->malloc(len+1); /* +1 for NUL */
+-	    if (!*str) {
+-		r =3D SASL_NOMEM;
+-		goto done;
+-	    }
+-=20=20=20=20
+-	    memcpy(*str, buf, len);
+-	    (*str)[len] =3D '\0';
+-	    break;
+-
+-	case 'u':
+-	    /* unsigned int */
+-	    if (buflen < sizeof(uint32)) {
+-		SETERROR(utils, "Buffer is not big enough to be SRP uint\n");
+-		r =3D SASL_BADPROT;
+-		goto done;
+-	    }
+-
+-	    len =3D sizeof(uint32);
+-	    u =3D va_arg(ap, uint32*);
+-	    memcpy(u, buf, len);
+-	    *u =3D ntohs(*u);
+-	    break;
+-
+-	case 'c':
+-	    /* char */
+-	    if (buflen < 1) {
+-		SETERROR(utils, "Buffer is not big enough to be SRP char\n");
+-		r =3D SASL_BADPROT;
+-		goto done;
+-	    }
+-
+-	    len =3D 1;
+-	    *(va_arg(ap, char *)) =3D *buf;
+-	    break;
+-
+-	default:
+-	    len =3D 1;
+-	    if (*buf !=3D *p) {
+-		r =3D SASL_BADPROT;
+-		goto done;
+-	    }
+-	    break;
+-	}
+-
+-	buf +=3D len;
+-	buflen -=3D len;
+-    }
+-
+-  done:
+-    va_end(ap);
+-
+-    if (buflen !=3D 0) {
+-	SETERROR(utils, "Extra data in SRP buffer\n");
+-	r =3D SASL_BADPROT;
+-    }
+-
+-    return r;
+-}
+-
+-/*
+- * Apply the hash function to the data specifed by the fmt string.
+- */
+-static int MakeHash(const EVP_MD *md,
+-                    unsigned char hash[], unsigned int *hashlen,
+-		    const char *fmt, ...)
+-{
+-    va_list ap;
+-    char *p, buf[4096], *in;
+-    unsigned int inlen;
+-    EVP_MD_CTX *mdctx =3D EVP_MD_CTX_new();
+-    int r =3D 0, hflag;
+-
+-    EVP_DigestInit(mdctx, md);
+-
+-    va_start(ap, fmt);
+-    for (p =3D (char *) fmt; *p; p++) {
+-	if (*p !=3D '%') {
+-	    in =3D p;
+-	    inlen =3D 1;
+-	    hflag =3D 0;
+-	}
+-	else {
+-	    if ((hflag =3D (*++p =3D=3D 'h'))) ++p;
+-
+-	    switch (*p) {
+-	    case 'm': {
+-		/* MPI */
+-		BIGNUM *mval =3D va_arg(ap, BIGNUM *);
+-
+-		in =3D buf;
+-		r =3D BigIntToBytes(mval, (unsigned char *) buf, sizeof(buf)-1, &inlen);
+-		if (r) goto done;
+-		break;
+-	    }
+-
+-	    case 'o': {
+-		/* octet sequence (len followed by data) */
+-		inlen =3D va_arg(ap, int);
+-		in =3D va_arg(ap, char *);
+-		break;
+-	    }
+-
+-	    case 's':
+-		/* string */
+-		in =3D va_arg(ap, char *);
+-		inlen =3D strlen(in);
+-		break;
+-
+-	    case 'u': {
+-		/* unsigned int */
+-		uint32 uval =3D va_arg(ap, uint32);
+-
+-		in =3D buf;
+-		inlen =3D sizeof(uint32);
+-		*((uint32 *) buf) =3D htonl(uval);
+-		break;
+-	    }
+-
+-	    default:
+-		in =3D p;
+-		inlen =3D 1;
+-		break;
+-	    }
+-	}
+-
+-	if (hflag) {
+-	    /* hash data separately before adding to current hash */
+-	    EVP_MD_CTX *tmpctx =3D EVP_MD_CTX_new();
+-
+-	    EVP_DigestInit(tmpctx, md);
+-	    EVP_DigestUpdate(tmpctx, in, inlen);
+-	    EVP_DigestFinal(tmpctx, (unsigned char *) buf, &inlen);
+-            EVP_MD_CTX_free(tmpctx);
+-	    in =3D buf;
+-	}
+-
+-	EVP_DigestUpdate(mdctx, in, inlen);
+-    }
+-  done:
+-    va_end(ap);
+-
+-    EVP_DigestFinal(mdctx, hash, hashlen);
+-    EVP_MD_CTX_free(mdctx);
+-
+-    return r;
+-}
+-
+-static int CalculateX(context_t *text, const char *salt, int saltlen,=20
+-		      const char *user, const unsigned char *pass, int passlen,=20
+-		      BIGNUM **x)
+-{
+-    unsigned char hash[EVP_MAX_MD_SIZE];
+-    unsigned int hashlen;
+-=20=20=20=20
+-    /* x =3D H(salt | H(user | ':' | pass)) */
+-    MakeHash(text->md, hash, &hashlen, "%s:%o", user, passlen, pass);
+-    MakeHash(text->md, hash, &hashlen, "%o%o", saltlen, salt, hashlen, ha=
sh);
+-=20=20=20=20
+-    *x =3D BN_new();
+-    BN_bin2bn(hash, hashlen, *x);
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-static int CalculateM1(context_t *text, BIGNUM *N, BIGNUM *g,
+-		       char *U, char *salt, int saltlen,
+-		       BIGNUM *A, BIGNUM *B,
+-                       unsigned char *K, unsigned int Klen,
+-		       char *I, char *L,
+-                       unsigned char *M1, unsigned int *M1len)
+-{
+-    int r;
+-    unsigned int i, len;
+-    unsigned char Nhash[EVP_MAX_MD_SIZE];
+-    unsigned char ghash[EVP_MAX_MD_SIZE];
+-    unsigned char Ng[EVP_MAX_MD_SIZE];
+-
+-    /* bytes(H( bytes(N) )) ^ bytes( H( bytes(g) ))
+-       ^ is the bitwise XOR operator. */
+-    r =3D MakeHash(text->md, Nhash, &len, "%m", N);
+-    if (r) return r;
+-    r =3D MakeHash(text->md, ghash, &len, "%m", g);
+-    if (r) return r;
+-=20=20=20=20
+-    for (i =3D 0; i < len; i++) {
+-	Ng[i] =3D (Nhash[i] ^ ghash[i]);
+-    }
+-
+-    r =3D MakeHash(text->md, M1, M1len, "%o%hs%o%m%m%o%hs%hs",
+-		 len, Ng, U, saltlen, salt, A, B, Klen, K, I, L);
+-=20=20=20=20
+-    return r;
+-}
+-
+-static int CalculateM2(context_t *text, BIGNUM *A,
+-		       unsigned char *M1, unsigned int M1len,
+-                       unsigned char *K, unsigned int Klen,
+-		       char *I, char *o, char *sid, uint32 ttl,
+-		       unsigned char *M2, unsigned int *M2len)
+-{
+-    int r;
+-=20=20=20=20
+-    r =3D MakeHash(text->md, M2, M2len, "%m%o%o%hs%hs%s%u",
+-		 A, M1len, M1, Klen, K, I, o, sid, ttl);
+-
+-    return r;
+-}
+-
+-/* Parse an option out of an option string
+- * Place found option in 'option'
+- * 'nextptr' points to rest of string or NULL if at end
+- */
+-static int ParseOption(const sasl_utils_t *utils,
+-		       char *in, char **option, char **nextptr)
+-{
+-    char *comma;
+-    int len;
+-    int i;
+-=20=20=20=20
+-    if (strlen(in) =3D=3D 0) {
+-	*option =3D NULL;
+-	return SASL_OK;
+-    }
+-=20=20=20=20
+-    comma =3D strchr(in,',');=20=20=20=20
+-    if (comma =3D=3D NULL) comma =3D in + strlen(in);
+-=20=20=20=20
+-    len =3D comma - in;
+-=20=20=20=20
+-    *option =3D utils->malloc(len + 1);
+-    if (!*option) return SASL_NOMEM;
+-=20=20=20=20
+-    /* lowercase string */
+-    for (i =3D 0; i < len; i++) {
+-	(*option)[i] =3D tolower((int)in[i]);
+-    }
+-    (*option)[len] =3D '\0';
+-=20=20=20=20
+-    if (*comma) {
+-	*nextptr =3D comma+1;
+-    } else {
+-	*nextptr =3D NULL;
+-    }
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-static int FindBit(char *name, layer_option_t *opts)
+-{
+-    while (opts->name) {
+-	if (!strcasecmp(name, opts->name)) {
+-	    return opts->bit;
+-	}
+-=09
+-	opts++;
+-    }
+-=20=20=20=20
+-    return 0;
+-}
+-
+-static layer_option_t *FindOptionFromBit(unsigned bit, layer_option_t *op=
ts)
+-{
+-    while (opts->name) {
+-	if (opts->bit =3D=3D bit) {
+-	    return opts;
+-	}
+-=09
+-	opts++;
+-    }
+-=20=20=20=20
+-    return NULL;
+-}
+-
+-static int ParseOptionString(const sasl_utils_t *utils,
+-			     char *str, srp_options_t *opts, int isserver)
+-{
+-    if (!strncasecmp(str, OPTION_MDA, strlen(OPTION_MDA))) {
+-=09
+-	int bit =3D FindBit(str+strlen(OPTION_MDA), digest_options);
+-=09
+-	if (isserver && (!bit || opts->mda)) {
+-	    opts->mda =3D -1;
+-	    if (!bit)
+-		utils->seterror(utils->conn, 0,
+-				"SRP MDA %s not supported\n",
+-				str+strlen(OPTION_MDA));
+-	    else
+-		SETERROR(utils, "Multiple SRP MDAs given\n");
+-	    return SASL_BADPROT;
+-	}
+-=09
+-	opts->mda |=3D bit;
+-=09
+-    } else if (!strcasecmp(str, OPTION_REPLAY_DETECTION)) {
+-	if (opts->replay_detection) {
+-	    SETERROR(utils, "SRP Replay Detection option appears twice\n");
+-	    return SASL_BADPROT;
+-	}
+-	opts->replay_detection =3D 1;
+-=09
+-    } else if (!strncasecmp(str, OPTION_INTEGRITY, strlen(OPTION_INTEGRIT=
Y)) &&
+-	       !strncasecmp(str+strlen(OPTION_INTEGRITY), "HMAC-", 5)) {
+-=09
+-	int bit =3D FindBit(str+strlen(OPTION_INTEGRITY)+5, digest_options);
+-=09
+-	if (isserver && (!bit || opts->integrity)) {
+-	    opts->integrity =3D -1;
+-	    if (!bit)
+-		utils->seterror(utils->conn, 0,
+-				"SRP Integrity option %s not supported\n",
+-				str+strlen(OPTION_INTEGRITY));
+-	    else
+-		SETERROR(utils, "Multiple SRP Integrity options given\n");
+-	    return SASL_BADPROT;
+-	}
+-=09
+-	opts->integrity |=3D bit;
+-=09
+-    } else if (!strncasecmp(str, OPTION_CONFIDENTIALITY,
+-			    strlen(OPTION_CONFIDENTIALITY))) {
+-=09
+-	int bit =3D FindBit(str+strlen(OPTION_CONFIDENTIALITY),
+-			  cipher_options);
+-=09
+-	if (isserver && (!bit || opts->confidentiality)) {
+-	    opts->confidentiality =3D -1;
+-	    if (!bit)
+-		utils->seterror(utils->conn, 0,
+-				"SRP Confidentiality option %s not supported\n",
+-				str+strlen(OPTION_CONFIDENTIALITY));
+-	    else
+-		SETERROR(utils,
+-			 "Multiple SRP Confidentiality options given\n");
+-	    return SASL_FAIL;
+-	}
+-=09
+-	opts->confidentiality |=3D bit;
+-=09
+-    } else if (!isserver && !strncasecmp(str, OPTION_MANDATORY,
+-					 strlen(OPTION_MANDATORY))) {
+-=09
+-	char *layer =3D str+strlen(OPTION_MANDATORY);
+-=09
+-	if (!strcasecmp(layer, OPTION_REPLAY_DETECTION))
+-	    opts->mandatory |=3D BIT_REPLAY_DETECTION;
+-	else if (!strncasecmp(layer, OPTION_INTEGRITY,
+-			      strlen(OPTION_INTEGRITY)-1))
+-	    opts->mandatory |=3D BIT_INTEGRITY;
+-	else if (!strncasecmp(layer, OPTION_CONFIDENTIALITY,
+-			      strlen(OPTION_CONFIDENTIALITY)-1))
+-	    opts->mandatory |=3D BIT_CONFIDENTIALITY;
+-	else {
+-	    utils->seterror(utils->conn, 0,
+-			    "Mandatory SRP option %s not supported\n", layer);
+-	    return SASL_BADPROT;
+-	}
+-=09
+-    } else if (!strncasecmp(str, OPTION_MAXBUFFERSIZE,
+-			    strlen(OPTION_MAXBUFFERSIZE))) {
+-=09
+-	opts->maxbufsize =3D strtoul(str+strlen(OPTION_MAXBUFFERSIZE), NULL, 10);
+-=09
+-	if (opts->maxbufsize > SRP_MAXBUFFERSIZE) {
+-	    utils->seterror(utils->conn, 0,
+-			    "SRP Maxbuffersize %lu too big (> %lu)\n",
+-			    opts->maxbufsize, SRP_MAXBUFFERSIZE);
+-	    return SASL_BADPROT;
+-	}
+-=09
+-    } else {
+-	/* Ignore unknown options */
+-    }
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-static int ParseOptions(const sasl_utils_t *utils,
+-			char *in, srp_options_t *out, int isserver)
+-{
+-    int r;
+-=20=20=20=20
+-    memset(out, 0, sizeof(srp_options_t));
+-    out->maxbufsize =3D SRP_MAXBUFFERSIZE;
+-=20=20=20=20
+-    while (in) {
+-	char *opt;
+-=09
+-	r =3D ParseOption(utils, in, &opt, &in);
+-	if (r) return r;
+-=09
+-	if (opt =3D=3D NULL) return SASL_OK;
+-=09
+-	utils->log(NULL, SASL_LOG_DEBUG, "Got option: [%s]\n",opt);
+-=09
+-	r =3D ParseOptionString(utils, opt, out, isserver);
+-	utils->free(opt);
+-=09
+-	if (r) return r;
+-    }
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-static layer_option_t *FindBest(int available, sasl_ssf_t min_ssf,
+-				sasl_ssf_t max_ssf, layer_option_t *opts)
+-{
+-    layer_option_t *best =3D NULL;
+-=20=20=20=20
+-    if (!available) return NULL;
+-=20=20=20=20
+-    while (opts->name) {
+-	if (opts->enabled && (available & opts->bit) &&
+-	    (opts->ssf >=3D min_ssf) && (opts->ssf <=3D max_ssf) &&
+-	    (!best || (opts->ssf > best->ssf))) {
+-	    best =3D opts;
+-	}
+-=09
+-	opts++;
+-    }
+-=20=20=20=20
+-    return best;
+-}
+-
+-static int OptionsToString(const sasl_utils_t *utils,
+-			   srp_options_t *opts, char **out)
+-{
+-    char *ret =3D NULL;
+-    int alloced =3D 0;
+-    int first =3D 1;
+-    layer_option_t *optlist;
+-=20=20=20=20
+-    ret =3D utils->malloc(1);
+-    if (!ret) return SASL_NOMEM;
+-    alloced =3D 1;
+-    ret[0] =3D '\0';
+-=20=20=20=20
+-    optlist =3D digest_options;
+-    while(optlist->name) {
+-	if (opts->mda & optlist->bit) {
+-	    alloced +=3D strlen(OPTION_MDA)+strlen(optlist->name)+1;
+-	    ret =3D utils->realloc(ret, alloced);
+-	    if (!ret) return SASL_NOMEM;
+-=09=20=20=20=20
+-	    if (!first) strcat(ret, ",");
+-	    strcat(ret, OPTION_MDA);
+-	    strcat(ret, optlist->name);
+-	    first =3D 0;
+-	}
+-=09
+-	optlist++;
+-    }
+-=20=20=20=20
+-    if (opts->replay_detection) {
+-	alloced +=3D strlen(OPTION_REPLAY_DETECTION)+1;
+-	ret =3D utils->realloc(ret, alloced);
+-	if (!ret) return SASL_NOMEM;
+-=09
+-	if (!first) strcat(ret, ",");
+-	strcat(ret, OPTION_REPLAY_DETECTION);
+-	first =3D 0;
+-    }
+-=20=20=20=20
+-    optlist =3D digest_options;
+-    while(optlist->name) {
+-	if (opts->integrity & optlist->bit) {
+-	    alloced +=3D strlen(OPTION_INTEGRITY)+5+strlen(optlist->name)+1;
+-	    ret =3D utils->realloc(ret, alloced);
+-	    if (!ret) return SASL_NOMEM;
+-=09=20=20=20=20
+-	    if (!first) strcat(ret, ",");
+-	    strcat(ret, OPTION_INTEGRITY);
+-	    strcat(ret, "HMAC-");
+-	    strcat(ret, optlist->name);
+-	    first =3D 0;
+-	}
+-=09
+-	optlist++;
+-    }
+-=20=20=20=20
+-    optlist =3D cipher_options;
+-    while(optlist->name) {
+-	if (opts->confidentiality & optlist->bit) {
+-	    alloced +=3D strlen(OPTION_CONFIDENTIALITY)+strlen(optlist->name)+1;
+-	    ret =3D utils->realloc(ret, alloced);
+-	    if (!ret) return SASL_NOMEM;
+-=09=20=20=20=20
+-	    if (!first) strcat(ret, ",");
+-	    strcat(ret, OPTION_CONFIDENTIALITY);
+-	    strcat(ret, optlist->name);
+-	    first =3D 0;
+-	}
+-=09
+-	optlist++;
+-    }
+-=20=20=20=20
+-    if ((opts->integrity || opts->confidentiality) &&
+-	opts->maxbufsize < SRP_MAXBUFFERSIZE) {
+-	alloced +=3D strlen(OPTION_MAXBUFFERSIZE)+10+1;
+-	ret =3D utils->realloc(ret, alloced);
+-	if (!ret) return SASL_NOMEM;
+-=09
+-	if (!first) strcat(ret, ",");
+-	strcat(ret, OPTION_MAXBUFFERSIZE);
+-	sprintf(ret+strlen(ret), "%lu", opts->maxbufsize);
+-	first =3D 0;
+-    }
+-=20=20=20=20
+-    if (opts->mandatory & BIT_REPLAY_DETECTION) {
+-	alloced +=3D strlen(OPTION_MANDATORY)+strlen(OPTION_REPLAY_DETECTION)+1;
+-	ret =3D utils->realloc(ret, alloced);
+-	if (!ret) return SASL_NOMEM;
+-=09
+-	if (!first) strcat(ret, ",");
+-	strcat(ret, OPTION_MANDATORY);
+-	strcat(ret, OPTION_REPLAY_DETECTION);
+-	first =3D 0;
+-    }
+-=20=20=20=20
+-    if (opts->mandatory & BIT_INTEGRITY) {
+-	alloced +=3D strlen(OPTION_MANDATORY)+strlen(OPTION_INTEGRITY)-1+1;
+-	ret =3D utils->realloc(ret, alloced);
+-	if (!ret) return SASL_NOMEM;
+-=09
+-	if (!first) strcat(ret, ",");
+-	strcat(ret, OPTION_MANDATORY);
+-	strncat(ret, OPTION_INTEGRITY, strlen(OPTION_INTEGRITY)-1);
+-	/* terminate string */
+-	ret[alloced-1] =3D '\0';
+-	first =3D 0;
+-    }
+-=20=20=20=20
+-    if (opts->mandatory & BIT_CONFIDENTIALITY) {
+-	alloced +=3D strlen(OPTION_MANDATORY)+strlen(OPTION_CONFIDENTIALITY)-1+1;
+-	ret =3D utils->realloc(ret, alloced);
+-	if (!ret) return SASL_NOMEM;
+-=09
+-	if (!first) strcat(ret, ",");
+-	strcat(ret, OPTION_MANDATORY);
+-	strncat(ret, OPTION_CONFIDENTIALITY, strlen(OPTION_CONFIDENTIALITY)-1);
+-	/* terminate string */
+-	ret[alloced-1] =3D '\0';
+-	first =3D 0;
+-    }
+-=20=20=20=20
+-    *out =3D ret;
+-    return SASL_OK;
+-}
+-
+-
+-/*
+- * Set the selected MDA.
+- */
+-static int SetMDA(srp_options_t *opts, context_t *text)
+-{
+-    layer_option_t *opt;
+-=20=20=20=20
+-    opt =3D FindOptionFromBit(opts->mda, digest_options);
+-    if (!opt) {
+-	text->utils->log(NULL, SASL_LOG_ERR,
+-			 "Unable to find SRP MDA option now\n");
+-	return SASL_FAIL;
+-    }
+-=20=20=20=20
+-    text->md =3D EVP_get_digestbyname(opt->evp_name);
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-/*
+- * Setup the selected security layer.
+- */
+-static int LayerInit(srp_options_t *opts, context_t *text,
+-		     sasl_out_params_t *oparams,
+-                     unsigned char *enc_IV, unsigned char *dec_IV,
+-		     unsigned maxbufsize)
+-{
+-    layer_option_t *opt;
+-=20=20=20=20
+-    if ((opts->integrity =3D=3D 0) && (opts->confidentiality =3D=3D 0)) {
+-	oparams->encode =3D NULL;
+-	oparams->decode =3D NULL;
+-	oparams->mech_ssf =3D 0;
+-	text->utils->log(NULL, SASL_LOG_DEBUG, "Using no protection\n");
+-	return SASL_OK;
+-    }
+-=20=20=20=20
+-    oparams->encode =3D &srp_encode;
+-    oparams->decode =3D &srp_decode;
+-    oparams->maxoutbuf =3D opts->maxbufsize - 4; /* account for 4-byte le=
ngth */
+-
+-    _plug_decode_init(&text->decode_context, text->utils, maxbufsize);
+-=20=20=20=20
+-    if (opts->replay_detection) {
+-	text->utils->log(NULL, SASL_LOG_DEBUG, "Using replay detection\n");
+-
+-	text->layer |=3D BIT_REPLAY_DETECTION;
+-=09
+-	/* If no integrity layer specified, use default */
+-	if (!opts->integrity)
+-	    opts->integrity =3D default_digest->bit;
+-    }
+-=20=20=20=20
+-    if (opts->integrity) {
+-	text->utils->log(NULL, SASL_LOG_DEBUG, "Using integrity protection\n");
+-=09
+-	text->layer |=3D BIT_INTEGRITY;
+-=09
+-	opt =3D FindOptionFromBit(opts->integrity, digest_options);
+-	if (!opt) {
+-	    text->utils->log(NULL, SASL_LOG_ERR,
+-			     "Unable to find SRP integrity layer option\n");
+-	    return SASL_FAIL;
+-	}
+-=09
+-	oparams->mech_ssf =3D opt->ssf;
+-
+-	/* Initialize the HMACs */
+-	text->hmac_md =3D EVP_get_digestbyname(opt->evp_name);
+-        text->hmac_send_ctx =3D HMAC_CTX_new();
+-	HMAC_Init_ex(text->hmac_send_ctx, text->K, text->Klen, text->hmac_md, NU=
LL);
+-        text->hmac_recv_ctx =3D HMAC_CTX_new();
+-	HMAC_Init_ex(text->hmac_recv_ctx, text->K, text->Klen, text->hmac_md, NU=
LL);
+-=09
+-	/* account for HMAC */
+-	oparams->maxoutbuf -=3D EVP_MD_size(text->hmac_md);
+-    }
+-=20=20=20=20
+-    if (opts->confidentiality) {
+-	text->utils->log(NULL, SASL_LOG_DEBUG,
+-			 "Using confidentiality protection\n");
+-=09
+-	text->layer |=3D BIT_CONFIDENTIALITY;
+-=09
+-	opt =3D FindOptionFromBit(opts->confidentiality, cipher_options);
+-	if (!opt) {
+-	    text->utils->log(NULL, SASL_LOG_ERR,
+-			     "Unable to find SRP confidentiality layer option\n");
+-	    return SASL_FAIL;
+-	}
+-=09
+-	oparams->mech_ssf =3D opt->ssf;
+-
+-	/* Initialize the ciphers */
+-	text->cipher =3D EVP_get_cipherbyname(opt->evp_name);
+-
+-        text->cipher_enc_ctx =3D EVP_CIPHER_CTX_new();
+-	EVP_CIPHER_CTX_init(text->cipher_enc_ctx);
+-	EVP_EncryptInit(text->cipher_enc_ctx, text->cipher, text->K, enc_IV);
+-
+-        text->cipher_dec_ctx =3D EVP_CIPHER_CTX_new();
+-	EVP_CIPHER_CTX_init(text->cipher_dec_ctx);
+-	EVP_DecryptInit(text->cipher_dec_ctx, text->cipher, text->K, dec_IV);
+-    }
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-static void LayerCleanup(context_t *text)
+-{
+-    if (text->layer & BIT_INTEGRITY) {
+-	HMAC_CTX_free(text->hmac_send_ctx);
+-	HMAC_CTX_free(text->hmac_recv_ctx);
+-    }
+-
+-    if (text->layer & BIT_CONFIDENTIALITY) {
+-	EVP_CIPHER_CTX_free(text->cipher_enc_ctx);
+-	EVP_CIPHER_CTX_free(text->cipher_dec_ctx);
+-    }
+-}
+-=20=20=20=20
+-
+-/*
+- * Dispose of a SRP context (could be server or client)
+- */=20
+-static void srp_common_mech_dispose(void *conn_context,
+-				    const sasl_utils_t *utils)
+-{
+-    context_t *text =3D (context_t *) conn_context;
+-=20=20=20=20
+-    if (!text) return;
+-=20=20=20=20
+-    BN_clear_free(text->N);
+-    BN_clear_free(text->g);
+-    BN_clear_free(text->v);
+-    BN_clear_free(text->b);
+-    BN_clear_free(text->B);
+-    BN_clear_free(text->a);
+-    BN_clear_free(text->A);
+-=20=20=20=20
+-    if (text->authid)		utils->free(text->authid);
+-    if (text->userid)		utils->free(text->userid);
+-    if (text->free_password)	_plug_free_secret(utils, &(text->password));
+-    if (text->salt)		utils->free(text->salt);
+-=20=20=20=20
+-    if (text->client_options)	utils->free(text->client_options);
+-    if (text->server_options)	utils->free(text->server_options);
+-=20
+-    LayerCleanup(text);
+-    _plug_decode_free(&text->decode_context);
+-
+-    if (text->encode_buf)	utils->free(text->encode_buf);
+-    if (text->decode_buf)	utils->free(text->decode_buf);
+-    if (text->decode_pkt_buf)	utils->free(text->decode_pkt_buf);
+-    if (text->out_buf)		utils->free(text->out_buf);
+-=20=20=20=20
+-    utils->free(text);
+-}
+-
+-static void
+-srp_common_mech_free(void *global_context __attribute__((unused)),
+-		     const sasl_utils_t *utils __attribute__((unused)))
+-{
+-    /* Don't call EVP_cleanup(); here, as this might confuse the calling
+-       application if it also uses OpenSSL */
+-}
+-
+-
+-/*****************************  Server Section  *************************=
****/
+-
+-/* A large safe prime (N =3D 2q+1, where q is prime)
+- *
+- * Use N with the most bits from our table.
+- *
+- * All arithmetic is done modulo N
+- */
+-static int generate_N_and_g(BIGNUM **N, BIGNUM **g)
+-{
+-    int result;
+-
+-    *N =3D BN_new();
+-    result =3D BN_hex2bn(N, Ng_tab[NUM_Ng-1].N);
+-    if (!result) return SASL_FAIL;
+-=20=20=20=20
+-    *g =3D BN_new();
+-    BN_set_word(*g, Ng_tab[NUM_Ng-1].g);
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-static int CalculateV(context_t *text,
+-		      BIGNUM *N, BIGNUM *g,
+-		      const char *user,
+-		      const unsigned char *pass, unsigned passlen,
+-		      BIGNUM **v, char **salt, int *saltlen)
+-{
+-    BIGNUM *x =3D NULL;
+-    BN_CTX *ctx =3D BN_CTX_new();
+-    int r;
+-=20=20=20=20
+-    /* generate <salt> */=20=20=20=20
+-    *saltlen =3D SRP_MAXBLOCKSIZE;
+-    *salt =3D (char *)text->utils->malloc(*saltlen);
+-    if (!*salt) return SASL_NOMEM;
+-    text->utils->rand(text->utils->rpool, *salt, *saltlen);
+-=20=20=20=20
+-    r =3D CalculateX(text, *salt, *saltlen, user, pass, passlen, &x);
+-    if (r) {
+-	text->utils->seterror(text->utils->conn, 0,=20
+-			      "Error calculating 'x'");
+-	return r;
+-    }
+-=20=20=20=20
+-    /* v =3D g^x % N */
+-    *v =3D BN_new();
+-    BN_mod_exp(*v, g, x, N, ctx);
+-=20=20=20=20
+-    BN_CTX_free(ctx);
+-    BN_clear_free(x);
+-=20=20=20=20
+-    return r;=20=20=20
+-}
+-
+-static int CalculateB(context_t *text  __attribute__((unused)),
+-		      BIGNUM *v, BIGNUM *N, BIGNUM *g, BIGNUM **b, BIGNUM **B)
+-{
+-    BIGNUM *v3 =3D BN_new();
+-    BN_CTX *ctx =3D BN_CTX_new();
+-=20=20=20=20
+-    /* Generate b */
+-    GetRandBigInt(b);
+-=09
+-    /* Per [SRP]: make sure b > log[g](N) -- g is always 2 */
+-    BN_add_word(*b, BN_num_bits(N));
+-=09
+-    /* B =3D (3v + g^b) % N */
+-    BN_set_word(v3, 3);
+-    BN_mod_mul(v3, v3, v, N, ctx);
+-
+-    *B =3D BN_new();
+-    BN_mod_exp(*B, g, *b, N, ctx);
+-#if OPENSSL_VERSION_NUMBER >=3D 0x00907000L
+-    BN_mod_add(*B, *B, v3, N, ctx);
+-#else
+-    BN_add(*B, *B, v3);
+-    BN_mod(*B, *B, N, ctx);
+-#endif
+-
+-    BN_clear_free(v3);
+-    BN_CTX_free(ctx);
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-=09
+-static int ServerCalculateK(context_t *text, BIGNUM *v,
+-			    BIGNUM *N, BIGNUM *A, BIGNUM *b, BIGNUM *B,
+-			    unsigned char *K, unsigned int *Klen)
+-{
+-    unsigned char hash[EVP_MAX_MD_SIZE];
+-    unsigned int hashlen;
+-    BIGNUM *u =3D BN_new();
+-    BIGNUM *base =3D BN_new();
+-    BIGNUM *S =3D BN_new();
+-    BN_CTX *ctx =3D BN_CTX_new();
+-    int r;
+-=20=20=20=20
+-    /* u =3D H(A | B) */
+-    r =3D MakeHash(text->md, hash, &hashlen, "%m%m", A, B);
+-    if (r) return r;
+-=09
+-    BN_bin2bn(hash, hashlen, u);
+-=09
+-    /* S =3D (Av^u) ^ b % N */
+-    BN_mod_exp(base, v, u, N, ctx);
+-    BN_mod_mul(base, base, A, N, ctx);
+-=20=20=20=20
+-    BN_mod_exp(S, base, b, N, ctx);
+-=20=20=20=20
+-    /* per Tom Wu: make sure Av^u !=3D 1 (mod N) */
+-    if (BN_is_one(base)) {
+-	SETERROR(text->utils, "Unsafe SRP value for 'Av^u'\n");
+-	r =3D SASL_BADPROT;
+-	goto err;
+-    }
+-=20=20=20=20
+-    /* per Tom Wu: make sure Av^u !=3D -1 (mod N) */
+-    BN_add_word(base, 1);
+-    if (BN_cmp(S, N) =3D=3D 0) {
+-	SETERROR(text->utils, "Unsafe SRP value for 'Av^u'\n");
+-	r =3D SASL_BADPROT;
+-	goto err;
+-    }
+-=20=20=20=20
+-    /* K =3D H(S) */
+-    r =3D MakeHash(text->md, K, Klen, "%m", S);
+-    if (r) goto err;
+-=20=20=20=20
+-    r =3D SASL_OK;
+-=20=20=20=20
+-  err:
+-    BN_CTX_free(ctx);
+-    BN_clear_free(u);
+-    BN_clear_free(base);
+-    BN_clear_free(S);
+-=20=20=20=20
+-    return r;
+-}
+-
+-static int ParseUserSecret(const sasl_utils_t *utils,
+-			   char *secret, size_t seclen,
+-			   char **mda, BIGNUM **v, char **salt, int *saltlen)
+-{
+-    int r;
+-=20=20=20=20
+-    /* The secret data is stored as suggested in RFC 2945:
+-     *
+-     *  { utf8(mda) mpi(v) os(salt) }  (base64 encoded)
+-     */
+-    r =3D utils->decode64(secret, seclen, secret, seclen, (unsigned *) &s=
eclen);
+-
+-    if (!r)
+-	r =3D UnBuffer(utils, secret, seclen, "%s%m%o", mda, v, saltlen, salt);
+-    if (r) {
+-	utils->seterror(utils->conn, 0,=20
+-			"Error UnBuffering user secret");
+-    }
+-
+-    return r;
+-}
+-
+-static int CreateServerOptions(sasl_server_params_t *sparams, char **out)
+-{
+-    srp_options_t opts;
+-    sasl_ssf_t limitssf, requiressf;
+-    layer_option_t *optlist;
+-=20=20=20=20
+-    /* zero out options */
+-    memset(&opts,0,sizeof(srp_options_t));
+-=20=20=20=20
+-    /* Add mda */
+-    opts.mda =3D server_mda->bit;
+-
+-    if(sparams->props.maxbufsize =3D=3D 0) {
+-	limitssf =3D 0;
+-	requiressf =3D 0;
+-    } else {
+-	if (sparams->props.max_ssf < sparams->external_ssf) {
+-	    limitssf =3D 0;
+-	} else {
+-	    limitssf =3D sparams->props.max_ssf - sparams->external_ssf;
+-	}
+-	if (sparams->props.min_ssf < sparams->external_ssf) {
+-	    requiressf =3D 0;
+-	} else {
+-	    requiressf =3D sparams->props.min_ssf - sparams->external_ssf;
+-	}
+-    }
+-=20=20=20=20
+-    /*
+-     * Add integrity options
+-     * Can't advertise integrity w/o support for default HMAC
+-     */
+-    if (default_digest->enabled) {
+-	optlist =3D digest_options;
+-	while(optlist->name) {
+-	    if (optlist->enabled &&
+-		/*(requiressf <=3D 1) &&*/ (limitssf >=3D 1)) {
+-		opts.integrity |=3D optlist->bit;
+-	    }
+-	    optlist++;
+-	}
+-    }
+-=20=20=20=20
+-    /* if we set any integrity options we can advertise replay detection =
*/
+-    if (opts.integrity) {
+-	opts.replay_detection =3D 1;
+-    }
+-=20=20=20=20
+-    /*
+-     * Add confidentiality options
+-     * Can't advertise confidentiality w/o support for default cipher
+-     */
+-    if (default_cipher->enabled) {
+-	optlist =3D cipher_options;
+-	while(optlist->name) {
+-	    if (optlist->enabled &&
+-		(requiressf <=3D optlist->ssf) &&
+-		(limitssf >=3D optlist->ssf)) {
+-		opts.confidentiality |=3D optlist->bit;
+-	    }
+-	    optlist++;
+-	}
+-    }
+-=20=20=20=20
+-    /* Add mandatory options */
+-    if (requiressf >=3D 1)
+-	opts.mandatory =3D BIT_REPLAY_DETECTION | BIT_INTEGRITY;
+-    if (requiressf > 1)
+-	opts.mandatory |=3D BIT_CONFIDENTIALITY;
+-=20=20=20=20
+-    /* Add maxbuffersize */
+-    opts.maxbufsize =3D SRP_MAXBUFFERSIZE;
+-    if (sparams->props.maxbufsize &&
+-	sparams->props.maxbufsize < opts.maxbufsize)
+-	opts.maxbufsize =3D sparams->props.maxbufsize;
+-=20=20=20=20
+-    return OptionsToString(sparams->utils, &opts, out);
+-}
+-
+-static int
+-srp_server_mech_new(void *glob_context __attribute__((unused)),
+-		    sasl_server_params_t *params,
+-		    const char *challenge __attribute__((unused)),
+-		    unsigned challen __attribute__((unused)),
+-		    void **conn_context)
+-{
+-    context_t *text;
+-=20=20=20=20
+-    /* holds state are in */
+-    text =3D params->utils->malloc(sizeof(context_t));
+-    if (text =3D=3D NULL) {
+-	MEMERROR(params->utils);
+-	return SASL_NOMEM;
+-    }
+-=20=20=20=20
+-    memset(text, 0, sizeof(context_t));
+-=20=20=20=20
+-    text->state =3D 1;
+-    text->utils =3D params->utils;
+-    text->md =3D EVP_get_digestbyname(server_mda->evp_name);
+-=20=20=20=20
+-    *conn_context =3D text;
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-static int srp_server_mech_step1(context_t *text,
+-				 sasl_server_params_t *params,
+-				 const char *clientin,
+-				 unsigned clientinlen,
+-				 const char **serverout,
+-				 unsigned *serveroutlen,
+-				 sasl_out_params_t *oparams)
+-{
+-    int result;
+-    char *sid =3D NULL;
+-    char *cn =3D NULL;
+-    int cnlen;
+-    char *realm =3D NULL;
+-    char *user =3D NULL;
+-    const char *password_request[] =3D { "*cmusaslsecretSRP",
+-				       SASL_AUX_PASSWORD,
+-				       NULL };
+-    struct propval auxprop_values[3];
+-=20=20=20=20
+-    /* Expect:
+-     *
+-     * U - authentication identity
+-     * I - authorization identity
+-     * sid - session id
+-     * cn - client nonce
+-     *
+-     * { utf8(U) utf8(I) utf8(sid) os(cn) }
+-     *
+-     */
+-    result =3D UnBuffer(params->utils, clientin, clientinlen,
+-		      "%s%s%s%o", &text->authid, &text->userid, &sid,
+-		      &cnlen, &cn);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error UnBuffering input in step 1");
+-	return result;
+-    }
+-    /* Get the realm */
+-    result =3D _plug_parseuser(params->utils, &user, &realm, params->user=
_realm,
+-			     params->serverFQDN, text->authid);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error getting realm");
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-    /* Generate N and g */
+-    result =3D generate_N_and_g(&text->N, &text->g);
+-    if (result) {
+-	params->utils->seterror(text->utils->conn, 0,=20
+-				"Error calculating N and g");
+-	return result;
+-    }
+-=20=20=20=20
+-    /* Get user secret */
+-    result =3D params->utils->prop_request(params->propctx, password_requ=
est);
+-    if (result !=3D SASL_OK) goto cleanup;
+-=20=20=20=20
+-    /* this will trigger the getting of the aux properties */
+-    result =3D params->canon_user(params->utils->conn,
+-				text->authid, 0, SASL_CU_AUTHID, oparams);
+-    if (result !=3D SASL_OK) goto cleanup;
+-=20=20=20=20
+-    result =3D params->canon_user(params->utils->conn,
+-				text->userid, 0, SASL_CU_AUTHZID, oparams);
+-    if (result !=3D SASL_OK) goto cleanup;
+-=20=20=20=20
+-    result =3D params->utils->prop_getnames(params->propctx, password_req=
uest,
+-					  auxprop_values);
+-    if (result < 0 ||
+-	((!auxprop_values[0].name || !auxprop_values[0].values) &&
+-	 (!auxprop_values[1].name || !auxprop_values[1].values))) {
+-	/* We didn't find this username */
+-	params->utils->seterror(params->utils->conn,0,
+-				"no secret in database");
+-	result =3D params->transition ? SASL_TRANS : SASL_NOUSER;
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-    if (auxprop_values[0].name && auxprop_values[0].values) {
+-	char *mda =3D NULL;
+-=09
+-	/* We have a precomputed verifier */
+-	result =3D ParseUserSecret(params->utils,
+-				 (char*) auxprop_values[0].values[0],
+-				 auxprop_values[0].valsize,
+-				 &mda, &text->v, &text->salt, &text->saltlen);
+-=09
+-	if (result) {
+-	    /* ParseUserSecret sets error, if any */
+-	    if (mda) params->utils->free(mda);
+-	    goto cleanup;
+-	}
+-=09
+-	/* find mda */
+-	server_mda =3D digest_options;
+-	while (server_mda->name) {
+-	    if (!strcasecmp(server_mda->name, mda))
+-		break;
+-=09=20=20=20=20
+-	    server_mda++;
+-	}
+-=09
+-	if (!server_mda->name) {
+-	    params->utils->seterror(params->utils->conn, 0,
+-				    "unknown SRP mda '%s'", mda);
+-	    params->utils->free(mda);
+-	    result =3D SASL_FAIL;
+-	    goto cleanup;
+-	}
+-	params->utils->free(mda);
+-=09
+-    } else if (auxprop_values[1].name && auxprop_values[1].values) {
+-	/* We only have the password -- calculate the verifier */
+-	int len =3D strlen(auxprop_values[1].values[0]);
+-
+-	if (len =3D=3D 0) {
+-	    params->utils->seterror(params->utils->conn,0,
+-				    "empty secret");
+-	    result =3D SASL_FAIL;
+-	    goto cleanup;
+-	}
+-=09
+-	result =3D CalculateV(text, text->N, text->g, text->authid,
+-			    (unsigned char *) auxprop_values[1].values[0], len,
+-			    &text->v, &text->salt, &text->saltlen);
+-	if (result) {
+-	    params->utils->seterror(params->utils->conn, 0,=20
+-				    "Error calculating v");
+-	    goto cleanup;
+-	}
+-    } else {
+-	params->utils->seterror(params->utils->conn, 0,
+-				"Have neither type of secret");
+-	result =3D SASL_FAIL;
+-	goto cleanup;
+-    }=20=20=20=20
+-=20=20=20=20
+-    /* erase the plaintext password */
+-    params->utils->prop_erase(params->propctx, password_request[1]);
+-=20=20=20=20
+-    /* Calculate B */
+-    result =3D CalculateB(text, text->v, text->N, text->g, &text->b, &tex=
t->B);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error calculating B");
+-	return result;
+-    }
+-
+-    /* Create L */
+-    result =3D CreateServerOptions(params, &text->server_options);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error creating server options");
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-    /* Send out:
+-     *
+-     * N - safe prime modulus
+-     * g - generator
+-     * s - salt
+-     * B - server's public key
+-     * L - server options (available layers etc)
+-     *
+-     * { 0x00 mpi(N) mpi(g) os(s) mpi(B) utf8(L) }
+-     *
+-     */
+-    result =3D MakeBuffer(text->utils, &text->out_buf, &text->out_buf_len,
+-			serveroutlen, "%c%m%m%o%m%s",
+-			0x00, text->N, text->g, text->saltlen, text->salt,
+-			text->B, text->server_options);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error creating SRP buffer from data in step 1");
+-	goto cleanup;
+-    }
+-    *serverout =3D text->out_buf;
+-=20=20=20=20
+-    text->state =3D 2;
+-    result =3D SASL_CONTINUE;
+-=20=20=20=20
+-  cleanup:
+-    if (sid) params->utils->free(sid);
+-    if (cn) params->utils->free(cn);
+-    if (user) params->utils->free(user);
+-    if (realm) params->utils->free(realm);
+-=20=20=20=20
+-    return result;
+-}
+-
+-static int srp_server_mech_step2(context_t *text,
+-			sasl_server_params_t *params,
+-			const char *clientin,
+-			unsigned clientinlen,
+-			const char **serverout,
+-			unsigned *serveroutlen,
+-			sasl_out_params_t *oparams)
+-{
+-    int result;=20=20=20=20
+-    unsigned char *M1 =3D NULL, *cIV =3D NULL; /* don't free */
+-    unsigned int M1len, cIVlen;
+-    srp_options_t client_opts;
+-    unsigned char myM1[EVP_MAX_MD_SIZE];
+-    unsigned int myM1len;
+-    unsigned int i;
+-    unsigned char M2[EVP_MAX_MD_SIZE];
+-    unsigned int M2len;
+-    unsigned char sIV[SRP_MAXBLOCKSIZE];
+-=20=20=20=20
+-    /* Expect:
+-     *
+-     * A - client's public key
+-     * M1 - client evidence
+-     * o - client option list
+-     * cIV - client's initial vector
+-     *
+-     * { mpi(A) os(M1) utf8(o) os(cIV) }
+-     *
+-     */
+-    result =3D UnBuffer(params->utils, clientin, clientinlen,
+-		      "%m%-o%s%-o", &text->A, &M1len, &M1,
+-		      &text->client_options, &cIVlen, &cIV);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error UnBuffering input in step 2");
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-    /* Per [SRP]: reject A <=3D 0 */
+-    if (BigIntCmpWord(text->A, 0) <=3D 0) {
+-	SETERROR(params->utils, "Illegal value for 'A'\n");
+-	result =3D SASL_BADPROT;
+-	goto cleanup;
+-    }
+-
+-    /* parse client options */
+-    result =3D ParseOptions(params->utils, text->client_options, &client_=
opts, 1);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error parsing user's options");
+-=09
+-	if (client_opts.confidentiality) {
+-	    /* Mark that we attempted confidentiality layer negotiation */
+-	    oparams->mech_ssf =3D 2;
+-	}
+-	else if (client_opts.integrity || client_opts.replay_detection) {
+-	    /* Mark that we attempted integrity layer negotiation */
+-	    oparams->mech_ssf =3D 1;
+-	}
+-	return result;
+-    }
+-
+-    result =3D SetMDA(&client_opts, text);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error setting options");
+-	return result;=20=20=20
+-    }
+-
+-    /* Calculate K */
+-    result =3D ServerCalculateK(text, text->v, text->N, text->A,
+-			      text->b, text->B, text->K, &text->Klen);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error calculating K");
+-	return result;
+-    }
+-=20=20=20=20
+-    /* See if M1 is correct */
+-    result =3D CalculateM1(text, text->N, text->g, text->authid,
+-			 text->salt, text->saltlen, text->A, text->B,
+-			 text->K, text->Klen, text->userid,
+-			 text->server_options, myM1, &myM1len);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error calculating M1");
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-    if (myM1len !=3D M1len) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"SRP M1 lengths do not match");
+-	result =3D SASL_BADAUTH;
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-    for (i =3D 0; i < myM1len; i++) {
+-	if (myM1[i] !=3D M1[i]) {
+-	    params->utils->seterror(params->utils->conn, 0,=20
+-				    "client evidence does not match what we "
+-				    "calculated. Probably a password error");
+-	    result =3D SASL_BADAUTH;
+-	    goto cleanup;
+-	}
+-    }
+-=20=20=20=20
+-    /* calculate M2 to send */
+-    result =3D CalculateM2(text, text->A, M1, M1len, text->K, text->Klen,
+-			 text->userid, text->client_options, "", 0,
+-			 M2, &M2len);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error calculating M2 (server evidence)");
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-    /* Create sIV (server initial vector) */
+-    text->utils->rand(text->utils->rpool, (char *) sIV, sizeof(sIV));
+-=20=20=20=20
+-    /*
+-     * Send out:
+-     * M2 - server evidence
+-     * sIV - server's initial vector
+-     * sid - session id
+-     * ttl - time to live
+-     *
+-     * { os(M2) os(sIV) utf8(sid) uint(ttl) }
+-     */
+-    result =3D MakeBuffer(text->utils, &text->out_buf, &text->out_buf_len,
+-			serveroutlen, "%o%o%s%u", M2len, M2,
+-			sizeof(sIV), sIV, "", 0);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error making output buffer in SRP step 3");
+-	goto cleanup;
+-    }
+-    *serverout =3D text->out_buf;
+-
+-    /* configure security layer */
+-    result =3D LayerInit(&client_opts, text, oparams, cIV, sIV,
+-		       params->props.maxbufsize);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error initializing security layer");
+-	return result;=20=20=20
+-    }
+-
+-    /* set oparams */
+-    oparams->doneflag =3D 1;
+-    oparams->param_version =3D 0;
+-=20=20=20=20
+-    result =3D SASL_OK;
+-=20=20=20=20
+-  cleanup:
+-=20=20=20=20
+-    return result;
+-}
+-
+-static int srp_server_mech_step(void *conn_context,
+-				sasl_server_params_t *sparams,
+-				const char *clientin,
+-				unsigned clientinlen,
+-				const char **serverout,
+-				unsigned *serveroutlen,
+-				sasl_out_params_t *oparams)
+-{
+-    context_t *text =3D (context_t *) conn_context;
+-=20=20=20=20
+-    if (!sparams
+-	|| !serverout
+-	|| !serveroutlen
+-	|| !oparams)
+-	return SASL_BADPARAM;
+-=20=20=20=20
+-    *serverout =3D NULL;
+-    *serveroutlen =3D 0;
+-
+-    if (text =3D=3D NULL) {
+-	return SASL_BADPROT;
+-    }
+-
+-    sparams->utils->log(NULL, SASL_LOG_DEBUG,
+-			"SRP server step %d\n", text->state);
+-
+-    switch (text->state) {
+-
+-    case 1:
+-	return srp_server_mech_step1(text, sparams, clientin, clientinlen,
+-				     serverout, serveroutlen, oparams);
+-
+-    case 2:
+-	return srp_server_mech_step2(text, sparams, clientin, clientinlen,
+-				     serverout, serveroutlen, oparams);
+-
+-    default:
+-	sparams->utils->seterror(sparams->utils->conn, 0,
+-				 "Invalid SRP server step %d", text->state);
+-	return SASL_FAIL;
+-    }
+-=20=20=20=20
+-    return SASL_FAIL; /* should never get here */
+-}
+-
+-#ifdef DO_SRP_SETPASS
+-static int srp_setpass(void *glob_context __attribute__((unused)),
+-		       sasl_server_params_t *sparams,
+-		       const char *userstr,
+-		       const char *pass,
+-		       unsigned passlen __attribute__((unused)),
+-		       const char *oldpass __attribute__((unused)),
+-		       unsigned oldpasslen __attribute__((unused)),
+-		       unsigned flags)
+-{
+-    int r;
+-    char *user =3D NULL;
+-    char *user_only =3D NULL;
+-    char *realm =3D NULL;
+-    sasl_secret_t *sec =3D NULL;
+-    struct propctx *propctx =3D NULL;
+-    const char *store_request[] =3D { "cmusaslsecretSRP",
+-				     NULL };
+-=20=20=20=20
+-    /* Do we have a backend that can store properties? */
+-    if (!sparams->utils->auxprop_store ||
+-	sparams->utils->auxprop_store(NULL, NULL, NULL) !=3D SASL_OK) {
+-	SETERROR(sparams->utils, "SRP: auxprop backend can't store properties");
+-	return SASL_NOMECH;
+-    }
+-=20=20=20=20
+-    /* NB: Ideally we need to canonicalize userstr here */
+-    r =3D _plug_parseuser(sparams->utils, &user_only, &realm, sparams->us=
er_realm,
+-			sparams->serverFQDN, userstr);
+-
+-    if (r) {
+-	sparams->utils->seterror(sparams->utils->conn, 0,=20
+-				 "Error parsing user");
+-	return r;
+-    }
+-
+-    r =3D _plug_make_fulluser(sparams->utils, &user, user_only, realm);
+-
+-    if (r) {
+-	goto cleanup;
+-    }
+-
+-    if ((flags & SASL_SET_DISABLE) || pass =3D=3D NULL) {
+-	sec =3D NULL;
+-    } else {
+-	context_t *text =3D NULL;
+-	BIGNUM *N =3D NULL;
+-	BIGNUM *g =3D NULL;
+-	BIGNUM *v =3D NULL;
+-	char *salt;
+-	int saltlen;
+-	char *buffer =3D NULL;
+-	unsigned int bufferlen, alloclen, encodelen;
+-=09
+-	text =3D sparams->utils->malloc(sizeof(context_t));
+-	if (text =3D=3D NULL) {
+-	    MEMERROR(sparams->utils);
+-	    return SASL_NOMEM;
+-	}
+-=09
+-	memset(text, 0, sizeof(context_t));
+-=09
+-	text->utils =3D sparams->utils;
+-	text->md =3D EVP_get_digestbyname(server_mda->evp_name);
+-=09
+-	r =3D generate_N_and_g(&N, &g);
+-	if (r) {
+-	    sparams->utils->seterror(sparams->utils->conn, 0,=20
+-				     "Error calculating N and g");
+-	    goto end;
+-	}
+-
+-	/* user is a full username here */
+-	r =3D CalculateV(text, N, g, user,
+-                       (unsigned char *) pass, passlen, &v, &salt, &saltl=
en);
+-	if (r) {
+-	    sparams->utils->seterror(sparams->utils->conn, 0,=20
+-				     "Error calculating v");
+-	    goto end;
+-	}
+-=09
+-	/* The secret data is stored as suggested in RFC 2945:
+-	 *
+-	 *  { utf8(mda) mpi(v) os(salt) }  (base64 encoded)
+-	 */
+-=09
+-	r =3D MakeBuffer(text->utils, &text->out_buf, &text->out_buf_len,
+-		       &bufferlen, "%s%m%o",
+-		       server_mda->name, &v, saltlen, salt);
+-=09
+-	if (r) {
+-	    sparams->utils->seterror(sparams->utils->conn, 0,=20
+-				     "Error making buffer for secret");
+-	    goto end;
+-	}
+-	buffer =3D text->out_buf;
+-=09
+-	/* Put 'buffer' into sasl_secret_t.
+-	 * This will be base64 encoded, so make sure its big enough.
+-	 */
+-	alloclen =3D (bufferlen/3 + 1) * 4 + 1;
+-	sec =3D sparams->utils->malloc(sizeof(sasl_secret_t)+alloclen);
+-	if (!sec) {
+-	    r =3D SASL_NOMEM;
+-	    goto end;
+-	}
+-	sparams->utils->encode64(buffer, bufferlen, (char *) sec->data, alloclen,
+-				 &encodelen);
+-	sec->len =3D encodelen;
+-=09
+-	/* Clean everything up */
+-      end:
+-	if (buffer) sparams->utils->free((void *) buffer);
+-	BN_clear_free(N);
+-	BN_clear_free(g);
+-	BN_clear_free(v);
+-	sparams->utils->free(text);
+-=09
+-	if (r) return r;
+-    }
+-=20=20=20=20
+-    /* do the store */
+-    propctx =3D sparams->utils->prop_new(0);
+-    if (!propctx)
+-	r =3D SASL_FAIL;
+-    if (!r)
+-	r =3D sparams->utils->prop_request(propctx, store_request);
+-    if (!r)
+-	r =3D sparams->utils->prop_set(propctx, "cmusaslsecretSRP",
+-				     (char *) (sec ? sec->data : NULL),
+-				     (sec ? sec->len : 0));
+-    if (!r)
+-	r =3D sparams->utils->auxprop_store(sparams->utils->conn, propctx, user);
+-    if (propctx)
+-	sparams->utils->prop_dispose(&propctx);
+-=20=20=20=20
+-    if (r) {
+-	sparams->utils->seterror(sparams->utils->conn, 0,=20
+-				 "Error putting SRP secret");
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-    sparams->utils->log(NULL, SASL_LOG_DEBUG, "Setpass for SRP successful=
\n");
+-=20=20=20=20
+-  cleanup:
+-=20=20=20=20
+-    if (user) 	_plug_free_string(sparams->utils, &user);
+-    if (user_only) 	_plug_free_string(sparams->utils, &user_only);
+-    if (realm) 	_plug_free_string(sparams->utils, &realm);
+-    if (sec)    _plug_free_secret(sparams->utils, &sec);
+-=20=20=20=20
+-    return r;
+-}
+-#endif /* DO_SRP_SETPASS */
+-
+-static int srp_mech_avail(void *glob_context __attribute__((unused)),
+-			  sasl_server_params_t *sparams,
+-			  void **conn_context __attribute__((unused)))=20
+-{
+-    /* Do we have access to the selected MDA? */
+-    if (!server_mda || !server_mda->enabled) {
+-	SETERROR(sparams->utils,
+-		 "SRP unavailable due to selected MDA unavailable");
+-	return SASL_NOMECH;
+-    }
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-static sasl_server_plug_t srp_server_plugins[] =3D=20
+-{
+-    {
+-	"SRP",				/* mech_name */
+-	0,				/* max_ssf */
+-	SASL_SEC_NOPLAINTEXT
+-	| SASL_SEC_NOANONYMOUS
+-	| SASL_SEC_NOACTIVE
+-	| SASL_SEC_NODICTIONARY
+-	| SASL_SEC_FORWARD_SECRECY
+-	| SASL_SEC_MUTUAL_AUTH,		/* security_flags */
+-	SASL_FEAT_WANT_CLIENT_FIRST
+-	| SASL_FEAT_ALLOWS_PROXY,	/* features */
+-	NULL,				/* glob_context */
+-	&srp_server_mech_new,		/* mech_new */
+-	&srp_server_mech_step,		/* mech_step */
+-	&srp_common_mech_dispose,	/* mech_dispose */
+-	&srp_common_mech_free,		/* mech_free */
+-#ifdef DO_SRP_SETPASS
+-	&srp_setpass,			/* setpass */
+-#else
+-	NULL,
+-#endif
+-	NULL,				/* user_query */
+-	NULL,				/* idle */
+-	&srp_mech_avail,		/* mech avail */
+-	NULL				/* spare */
+-    }
+-};
+-
+-int srp_server_plug_init(const sasl_utils_t *utils,
+-			 int maxversion,
+-			 int *out_version,
+-			 const sasl_server_plug_t **pluglist,
+-			 int *plugcount,
+-			 const char *plugname __attribute__((unused)))
+-{
+-    const char *mda;
+-    unsigned int len;
+-    layer_option_t *opts;
+-=20=20=20=20
+-    if (maxversion < SASL_SERVER_PLUG_VERSION) {
+-	SETERROR(utils, "SRP version mismatch");
+-	return SASL_BADVERS;
+-    }
+-=20=20=20=20
+-    utils->getopt(utils->getopt_context, "SRP", "srp_mda", &mda, &len);
+-    if (!mda) mda =3D DEFAULT_MDA;
+-=20=20=20=20
+-    /* Add all digests and ciphers */
+-    OpenSSL_add_all_algorithms();
+-=20=20=20=20
+-    /* See which digests we have available and set max_ssf accordingly */
+-    opts =3D digest_options;
+-    while (opts->name) {
+-	if (EVP_get_digestbyname(opts->evp_name)) {
+-	    opts->enabled =3D 1;
+-=09=20=20=20=20
+-	    srp_server_plugins[0].max_ssf =3D opts->ssf;
+-	}
+-=09
+-	/* Locate the server MDA */
+-	if (!strcasecmp(opts->name, mda) || !strcasecmp(opts->evp_name, mda)) {
+-	    server_mda =3D opts;
+-	}
+-=09
+-	opts++;
+-    }
+-=20=20=20=20
+-    /* See which ciphers we have available and set max_ssf accordingly */
+-    opts =3D cipher_options;
+-    while (opts->name) {
+-	if (EVP_get_cipherbyname(opts->evp_name)) {
+-	    opts->enabled =3D 1;
+-=09=20=20=20=20
+-	    if (opts->ssf > srp_server_plugins[0].max_ssf) {
+-		srp_server_plugins[0].max_ssf =3D opts->ssf;
+-	    }
+-	}
+-=09
+-	opts++;
+-    }
+-=20=20=20=20
+-    *out_version =3D SASL_SERVER_PLUG_VERSION;
+-    *pluglist =3D srp_server_plugins;
+-    *plugcount =3D 1;
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-/*****************************  Client Section  *************************=
****/
+-
+-/* Check to see if N,g is in the recommended list */
+-static int check_N_and_g(const sasl_utils_t *utils, BIGNUM *N, BIGNUM *g)
+-{
+-    char *N_prime;
+-    unsigned long g_prime;
+-    unsigned i;
+-    int r =3D SASL_FAIL;
+-=20=20=20=20
+-    N_prime =3D BN_bn2hex(N);
+-    g_prime =3D BN_get_word(g);
+-=20=20=20=20
+-    for (i =3D 0; i < NUM_Ng; i++) {
+-	if (!strcasecmp(N_prime, Ng_tab[i].N) && (g_prime =3D=3D Ng_tab[i].g)) {
+-	    r =3D SASL_OK;
+-	    break;
+-	}
+-    }
+-=20=20=20=20
+-    if (N_prime) utils->free(N_prime);
+-=20=20=20=20
+-    return r;
+-}
+-
+-static int CalculateA(context_t *text  __attribute__((unused)),
+-		      BIGNUM *N, BIGNUM *g, BIGNUM **a, BIGNUM **A)
+-{
+-    BN_CTX *ctx =3D BN_CTX_new();
+-=20=20=20=20
+-    /* Generate a */
+-    GetRandBigInt(a);
+-=09
+-    /* Per [SRP]: make sure a > log[g](N) -- g is always 2 */
+-    BN_add_word(*a, BN_num_bits(N));
+-=09
+-    /* A =3D g^a % N */
+-    *A =3D BN_new();
+-    BN_mod_exp(*A, g, *a, N, ctx);
+-
+-    BN_CTX_free(ctx);
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-=09
+-static int ClientCalculateK(context_t *text, char *salt, int saltlen,
+-			    char *user, unsigned char *pass, int passlen,
+-			    BIGNUM *N, BIGNUM *g, BIGNUM *a, BIGNUM *A,
+-			    BIGNUM *B, unsigned char *K, unsigned int *Klen)
+-{
+-    int r;
+-    unsigned char hash[EVP_MAX_MD_SIZE];
+-    unsigned int hashlen;
+-    BIGNUM *x =3D NULL;
+-    BIGNUM *u =3D BN_new();
+-    BIGNUM *aux =3D BN_new();
+-    BIGNUM *gx =3D BN_new();
+-    BIGNUM *gx3 =3D BN_new();
+-    BIGNUM *base =3D BN_new();
+-    BIGNUM *S =3D BN_new();
+-    BN_CTX *ctx =3D BN_CTX_new();
+-=20=20=20=20
+-    /* u =3D H(A | B) */
+-    r =3D MakeHash(text->md, hash, &hashlen, "%m%m", A, B);
+-    if (r) goto err;
+-    u =3D BN_new();
+-    BN_bin2bn(hash, hashlen, u);
+-=20=20=20=20
+-    /* per Tom Wu: make sure u !=3D 0 */
+-    if (BN_is_zero(u)) {
+-	SETERROR(text->utils, "SRP: Illegal value for 'u'\n");
+-	r =3D SASL_BADPROT;
+-	goto err;
+-    }
+-=20=20=20=20
+-    /* S =3D (B - 3(g^x)) ^ (a + ux) % N */
+-
+-    r =3D CalculateX(text, salt, saltlen, user, pass, passlen, &x);
+-    if (r) return r;
+-=20=20=20=20
+-    /* a + ux */
+-    BN_mul(aux, u, x, ctx);
+-    BN_add(aux, aux, a);
+-=20=20=20=20
+-    /* gx3 =3D 3(g^x) % N */
+-    BN_mod_exp(gx, g, x, N, ctx);
+-    BN_set_word(gx3, 3);
+-    BN_mod_mul(gx3, gx3, gx, N, ctx);
+-=20=20=20=20
+-    /* base =3D (B - 3(g^x)) % N */
+-#if OPENSSL_VERSION_NUMBER >=3D 0x00907000L
+-    BN_mod_sub(base, B, gx3, N, ctx);
+-#else
+-    BN_sub(base, B, gx3);
+-    BN_mod(base, base, N, ctx);
+-    if (BigIntCmpWord(base, 0) < 0) {
+-	BN_add(base, base, N);
+-    }
+-#endif
+-=20=20=20=20
+-    /* S =3D base^aux % N */
+-    BN_mod_exp(S, base, aux, N, ctx);
+-=20=20=20=20
+-    /* K =3D H(S) */
+-    r =3D MakeHash(text->md, K, Klen, "%m", S);
+-    if (r) goto err;
+-=20=20=20=20
+-    r =3D SASL_OK;
+-=20=20=20=20
+-  err:
+-    BN_CTX_free(ctx);
+-    BN_clear_free(x);
+-    BN_clear_free(u);
+-    BN_clear_free(aux);
+-    BN_clear_free(gx);
+-    BN_clear_free(gx3);
+-    BN_clear_free(base);
+-    BN_clear_free(S);
+-=20=20=20=20
+-    return r;
+-}
+-
+-static int CreateClientOpts(sasl_client_params_t *params,=20
+-			    srp_options_t *available,=20
+-			    srp_options_t *out)
+-{
+-    layer_option_t *opt;
+-    sasl_ssf_t external;
+-    sasl_ssf_t limit;
+-    sasl_ssf_t musthave;
+-=20=20=20=20
+-    /* zero out output */
+-    memset(out, 0, sizeof(srp_options_t));
+-=20=20=20=20
+-    params->utils->log(NULL, SASL_LOG_DEBUG,
+-		       "Available MDA =3D %d\n", available->mda);
+-=20=20=20=20
+-    /* mda */
+-    opt =3D FindBest(available->mda, 0, 256, digest_options);
+-=20=20=20=20
+-    if (opt) {
+-	out->mda =3D opt->bit;
+-    }
+-    else {
+-	SETERROR(params->utils, "Can't find an acceptable SRP MDA\n");
+-	return SASL_BADAUTH;
+-    }
+-=20=20=20=20
+-    /* get requested ssf */
+-    external =3D params->external_ssf;
+-=20=20=20=20
+-    /* what do we _need_?  how much is too much? */
+-    if(params->props.maxbufsize =3D=3D 0) {
+-	musthave =3D 0;
+-	limit =3D 0;
+-    } else {
+-	if (params->props.max_ssf > external) {
+-	    limit =3D params->props.max_ssf - external;
+-	} else {
+-	    limit =3D 0;
+-	}
+-	if (params->props.min_ssf > external) {
+-	    musthave =3D params->props.min_ssf - external;
+-	} else {
+-	    musthave =3D 0;
+-	}
+-    }
+-=20=20=20=20=20=20=20=20
+-    /* we now go searching for an option that gives us at least "musthave"
+-       and at most "limit" bits of ssf. */
+-    params->utils->log(NULL, SASL_LOG_DEBUG,
+-		       "Available confidentiality =3D %d  "
+-		       "musthave =3D %d  limit =3D %d",
+-		       available->confidentiality, musthave, limit);
+-=20=20=20=20
+-    /* confidentiality */
+-    if (limit > 1) {
+-=09
+-	opt =3D FindBest(available->confidentiality, musthave, limit,
+-		       cipher_options);
+-=09
+-	if (opt) {
+-	    out->confidentiality =3D opt->bit;
+-	    /* we've already satisfied the SSF with the confidentiality
+-	     * layer, but we'll also use an integrity layer if we can
+-	     */
+-	    musthave =3D 0;
+-	}
+-	else if (musthave > 1) {
+-	    SETERROR(params->utils,
+-		     "Can't find an acceptable SRP confidentiality layer\n");
+-	    return SASL_TOOWEAK;
+-	}
+-    }
+-=20=20=20=20
+-    params->utils->log(NULL, SASL_LOG_DEBUG,
+-		       "Available integrity =3D %d "
+-		       "musthave =3D %d  limit =3D %d",
+-		       available->integrity, musthave, limit);
+-=20=20=20=20
+-    /* integrity */
+-    if ((limit >=3D 1) && (musthave <=3D 1)) {
+-=09
+-	opt =3D FindBest(available->integrity, musthave, limit,
+-		       digest_options);
+-=09
+-	if (opt) {
+-	    out->integrity =3D opt->bit;
+-=09=20=20=20=20
+-	    /* if we set an integrity option we can set replay detection */
+-	    out->replay_detection =3D available->replay_detection;
+-	}
+-	else if (musthave > 0) {
+-	    SETERROR(params->utils,
+-		     "Can't find an acceptable SRP integrity layer\n");
+-	    return SASL_TOOWEAK;
+-	}
+-    }
+-=20=20=20=20
+-    /* Check to see if we've satisfied all of the servers mandatory layer=
s */
+-    params->utils->log(NULL, SASL_LOG_DEBUG,
+-		       "Mandatory layers =3D %d\n",available->mandatory);
+-=20=20=20=20
+-    if ((!out->replay_detection &&
+-	 (available->mandatory & BIT_REPLAY_DETECTION)) ||
+-	(!out->integrity &&
+-	 (available->mandatory & BIT_INTEGRITY)) ||
+-	(!out->confidentiality &&
+-	 (available->mandatory & BIT_CONFIDENTIALITY))) {
+-	SETERROR(params->utils, "Mandatory SRP layer not supported\n");
+-	return SASL_BADAUTH;
+-    }
+-=20=20=20=20
+-    /* Add maxbuffersize */
+-    out->maxbufsize =3D SRP_MAXBUFFERSIZE;
+-    if (params->props.maxbufsize && params->props.maxbufsize < out->maxbu=
fsize)
+-	out->maxbufsize =3D params->props.maxbufsize;
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-static int srp_client_mech_new(void *glob_context __attribute__((unused)),
+-			       sasl_client_params_t *params,
+-			       void **conn_context)
+-{
+-    context_t *text;
+-=20=20=20=20
+-    /* holds state are in */
+-    text =3D params->utils->malloc(sizeof(context_t));
+-    if (text =3D=3D NULL) {
+-	MEMERROR( params->utils );
+-	return SASL_NOMEM;
+-    }
+-=20=20=20=20
+-    memset(text, 0, sizeof(context_t));
+-
+-    text->state =3D 1;
+-    text->utils =3D params->utils;
+-
+-    *conn_context =3D text;
+-=20=20=20=20
+-    return SASL_OK;
+-}
+-
+-static int
+-srp_client_mech_step1(context_t *text,
+-		      sasl_client_params_t *params,
+-		      const char *serverin __attribute__((unused)),
+-		      unsigned serverinlen,
+-		      sasl_interact_t **prompt_need,
+-		      const char **clientout,
+-		      unsigned *clientoutlen,
+-		      sasl_out_params_t *oparams)
+-{
+-    const char *authid =3D NULL, *userid =3D NULL;
+-    int auth_result =3D SASL_OK;
+-    int pass_result =3D SASL_OK;
+-    int user_result =3D SASL_OK;
+-    int result;
+-=20=20=20=20
+-    /* Expect:=20
+-     *   absolutely nothing
+-     *=20
+-     */
+-    if (serverinlen > 0) {
+-	SETERROR(params->utils, "Invalid input to first step of SRP\n");
+-	return SASL_BADPROT;
+-    }
+-=20=20=20=20
+-    /* try to get the authid */
+-    if (oparams->authid=3D=3DNULL) {
+-	auth_result =3D _plug_get_authid(params->utils, &authid, prompt_need);
+-=09
+-	if ((auth_result !=3D SASL_OK) && (auth_result !=3D SASL_INTERACT))
+-	    return auth_result;
+-    }
+-=20=20=20=20
+-    /* try to get the userid */
+-    if (oparams->user =3D=3D NULL) {
+-	user_result =3D _plug_get_userid(params->utils, &userid, prompt_need);
+-=09
+-	if ((user_result !=3D SASL_OK) && (user_result !=3D SASL_INTERACT))
+-	    return user_result;
+-    }
+-=20=20=20=20
+-    /* try to get the password */
+-    if (text->password =3D=3D NULL) {
+-	pass_result=3D_plug_get_password(params->utils, &text->password,
+-				       &text->free_password, prompt_need);
+-=09=20=20=20=20
+-	if ((pass_result !=3D SASL_OK) && (pass_result !=3D SASL_INTERACT))
+-	    return pass_result;
+-    }
+-=20=20=20=20
+-    /* free prompts we got */
+-    if (prompt_need && *prompt_need) {
+-	params->utils->free(*prompt_need);
+-	*prompt_need =3D NULL;
+-    }
+-=20=20=20=20
+-    /* if there are prompts not filled in */
+-    if ((auth_result =3D=3D SASL_INTERACT) || (user_result =3D=3D SASL_IN=
TERACT) ||
+-	(pass_result =3D=3D SASL_INTERACT)) {
+-	/* make the prompt list */
+-	result =3D
+-	    _plug_make_prompts(params->utils, prompt_need,
+-			       user_result =3D=3D SASL_INTERACT ?
+-			       "Please enter your authorization name" : NULL,
+-			       NULL,
+-			       auth_result =3D=3D SASL_INTERACT ?
+-			       "Please enter your authentication name" : NULL,
+-			       NULL,
+-			       pass_result =3D=3D SASL_INTERACT ?
+-			       "Please enter your password" : NULL, NULL,
+-			       NULL, NULL, NULL,
+-			       NULL, NULL, NULL);
+-	if (result !=3D SASL_OK) return result;
+-=09=20=20=20=20
+-	return SASL_INTERACT;
+-    }
+-=20=20=20=20
+-    if (!userid || !*userid) {
+-	result =3D params->canon_user(params->utils->conn, authid, 0,
+-				    SASL_CU_AUTHID | SASL_CU_AUTHZID, oparams);
+-    }
+-    else {
+-	result =3D params->canon_user(params->utils->conn, authid, 0,
+-				    SASL_CU_AUTHID, oparams);
+-	if (result !=3D SASL_OK) return result;
+-
+-	result =3D params->canon_user(params->utils->conn, userid, 0,
+-				    SASL_CU_AUTHZID, oparams);
+-    }
+-    if (result !=3D SASL_OK) return result;
+-=20=20=20=20
+-    /* Send out:
+-     *
+-     * U - authentication identity=20
+-     * I - authorization identity
+-     * sid - previous session id
+-     * cn - client nonce
+-     *
+-     * { utf8(U) utf8(I) utf8(sid) os(cn) }
+-     */
+-    result =3D MakeBuffer(text->utils, &text->out_buf, &text->out_buf_len,
+-			clientoutlen, "%s%s%s%o",
+-			(char *) oparams->authid, (char *) oparams->user,
+-			"", 0, "");
+-    if (result) {
+-	params->utils->log(NULL, SASL_LOG_ERR, "Error making output buffer\n");
+-	goto cleanup;
+-    }
+-    *clientout =3D text->out_buf;
+-=20=20=20=20
+-    text->state =3D 2;
+-
+-    result =3D SASL_CONTINUE;
+-=20=20=20=20
+-  cleanup:
+-=20=20=20=20
+-    return result;
+-}
+-
+-static int
+-srp_client_mech_step2(context_t *text,
+-		      sasl_client_params_t *params,
+-		      const char *serverin,
+-		      unsigned serverinlen,
+-		      sasl_interact_t **prompt_need __attribute__((unused)),
+-		      const char **clientout,
+-		      unsigned *clientoutlen,
+-		      sasl_out_params_t *oparams)
+-{
+-    int result;
+-    char reuse;
+-    srp_options_t server_opts;
+-=20=20=20=20
+-    /* Expect:
+-     *
+-     *  { 0x00 mpi(N) mpi(g) os(s) mpi(B) utf8(L) }
+-     */
+-    result =3D UnBuffer(params->utils, serverin, serverinlen,
+-		      "%c%m%m%o%m%s", &reuse, &text->N, &text->g,
+-		      &text->saltlen, &text->salt, &text->B,
+-		      &text->server_options);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error UnBuffering input in step 2");
+-	goto cleanup;
+-    }
+-
+-    /* Check N and g to see if they are one of the recommended pairs */
+-    result =3D check_N_and_g(params->utils, text->N, text->g);
+-    if (result) {
+-	params->utils->log(NULL, SASL_LOG_ERR,
+-			   "Values of 'N' and 'g' are not recommended\n");
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-    /* Per [SRP]: reject B <=3D 0, B >=3D N */
+-    if (BigIntCmpWord(text->B, 0) <=3D 0 || BN_cmp(text->B, text->N) >=3D=
 0) {
+-	SETERROR(params->utils, "Illegal value for 'B'\n");
+-	result =3D SASL_BADPROT;
+-	goto cleanup;
+-    }
+-
+-    /* parse server options */
+-    memset(&server_opts, 0, sizeof(srp_options_t));
+-    result =3D ParseOptions(params->utils, text->server_options, &server_=
opts, 0);
+-    if (result) {
+-	params->utils->log(NULL, SASL_LOG_ERR,
+-			   "Error parsing SRP server options\n");
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-    /* Create o */
+-    result =3D CreateClientOpts(params, &server_opts, &text->client_opts);
+-    if (result) {
+-	params->utils->log(NULL, SASL_LOG_ERR,
+-			   "Error creating client options\n");
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-    result =3D OptionsToString(params->utils, &text->client_opts,
+-			     &text->client_options);
+-    if (result) {
+-	params->utils->log(NULL, SASL_LOG_ERR,
+-			   "Error converting client options to an option string\n");
+-	goto cleanup;
+-    }
+-
+-    result =3D SetMDA(&text->client_opts, text);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error setting MDA");
+-	goto cleanup;
+-    }
+-
+-    /* Calculate A */
+-    result =3D CalculateA(text, text->N, text->g, &text->a, &text->A);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error calculating A");
+-	return result;
+-    }
+-=20=20=20=20
+-    /* Calculate shared context key K */
+-    result =3D ClientCalculateK(text, text->salt, text->saltlen,
+-			      (char *) oparams->authid,=20
+-			      text->password->data, text->password->len,
+-			      text->N, text->g, text->a, text->A, text->B,
+-			      text->K, &text->Klen);
+-    if (result) {
+-	params->utils->log(NULL, SASL_LOG_ERR,
+-			   "Error creating K\n");
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-    /* Calculate M1 (client evidence) */
+-    result =3D CalculateM1(text, text->N, text->g, (char *) oparams->auth=
id,
+-			 text->salt, text->saltlen, text->A, text->B,
+-			 text->K, text->Klen, (char *) oparams->user,
+-			 text->server_options, text->M1, &text->M1len);
+-    if (result) {
+-	params->utils->log(NULL, SASL_LOG_ERR,
+-			   "Error creating M1\n");
+-	goto cleanup;
+-    }
+-
+-    /* Create cIV (client initial vector) */
+-    text->utils->rand(text->utils->rpool, (char *) text->cIV, sizeof(text=
->cIV));
+-=20=20=20=20
+-    /* Send out:
+-     *
+-     * A - client's public key
+-     * M1 - client evidence
+-     * o - client option list
+-     * cIV - client initial vector
+-     *
+-     * { mpi(A) os(M1) utf8(o) os(cIV) }
+-     */
+-    result =3D MakeBuffer(text->utils, &text->out_buf, &text->out_buf_len,
+-			clientoutlen, "%m%o%s%o",
+-			text->A, text->M1len, text->M1, text->client_options,
+-			sizeof(text->cIV), text->cIV);
+-    if (result) {
+-	params->utils->log(NULL, SASL_LOG_ERR, "Error making output buffer\n");
+-	goto cleanup;
+-    }
+-    *clientout =3D text->out_buf;
+-=20=20=20=20
+-    text->state =3D 3;
+-
+-    result =3D SASL_CONTINUE;
+-=20=20=20=20
+-  cleanup:
+-=20=20=20=20
+-    return result;
+-}
+-
+-static int
+-srp_client_mech_step3(context_t *text,
+-		      sasl_client_params_t *params,
+-		      const char *serverin,
+-		      unsigned serverinlen,
+-		      sasl_interact_t **prompt_need __attribute__((unused)),
+-		      const char **clientout __attribute__((unused)),
+-		      unsigned *clientoutlen __attribute__((unused)),
+-		      sasl_out_params_t *oparams)
+-{
+-    int result;=20=20=20=20
+-    unsigned char *M2 =3D NULL, *sIV =3D NULL; /* don't free */
+-    char *sid =3D NULL;
+-    unsigned int M2len, sIVlen;
+-    uint32 ttl;
+-    unsigned int i;
+-    unsigned char myM2[EVP_MAX_MD_SIZE];
+-    unsigned int myM2len;
+-=20=20=20=20
+-    /* Expect:
+-     *
+-     * M2 - server evidence
+-     * sIV - server initial vector
+-     * sid - session id
+-     * ttl - time to live
+-     *
+-     *   { os(M2) os(sIV) utf8(sid) uint(ttl) }
+-     */
+-    result =3D UnBuffer(params->utils, serverin, serverinlen,
+-		      "%-o%-o%s%u", &M2len, &M2, &sIVlen, &sIV,
+-		      &sid, &ttl);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error UnBuffering input in step 3");
+-	goto cleanup;
+-    }
+-
+-    /* calculate our own M2 */
+-    result =3D CalculateM2(text, text->A, text->M1, text->M1len,
+-			 text->K, text->Klen, (char *) oparams->user,
+-			 text->client_options, "", 0,
+-			 myM2, &myM2len);
+-    if (result) {
+-	params->utils->log(NULL, SASL_LOG_ERR,
+-			   "Error calculating our own M2 (server evidence)\n");
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-    /* compare to see if is server spoof */
+-    if (myM2len !=3D M2len) {
+-	SETERROR(params->utils, "SRP Server M2 length wrong\n");
+-	result =3D SASL_BADSERV;
+-	goto cleanup;
+-    }
+-=20=20=20=20
+-=20=20=20=20
+-    for (i =3D 0; i < myM2len; i++) {
+-	if (M2[i] !=3D myM2[i]) {
+-	    SETERROR(params->utils,
+-		     "SRP Server spoof detected. M2 incorrect\n");
+-	    result =3D SASL_BADSERV;
+-	    goto cleanup;
+-	}
+-    }
+-=20=20=20=20
+-    /*
+-     * Send out: nothing
+-     */
+-
+-    /* configure security layer */
+-    result =3D LayerInit(&text->client_opts, text, oparams, sIV, text->cI=
V,
+-		       params->props.maxbufsize);
+-    if (result) {
+-	params->utils->seterror(params->utils->conn, 0,=20
+-				"Error initializing security layer");
+-	return result;=20=20=20
+-    }
+-
+-    /* set oparams */
+-    oparams->doneflag =3D 1;
+-    oparams->param_version =3D 0;
+-
+-    result =3D SASL_OK;
+-=20=20=20=20
+-  cleanup:
+-    if (sid) params->utils->free(sid);
+-=20=20=20=20
+-    return result;
+-}
+-
+-static int srp_client_mech_step(void *conn_context,
+-				sasl_client_params_t *params,
+-				const char *serverin,
+-				unsigned serverinlen,
+-				sasl_interact_t **prompt_need,
+-				const char **clientout,
+-				unsigned *clientoutlen,
+-				sasl_out_params_t *oparams)
+-{
+-    context_t *text =3D (context_t *) conn_context;
+-=20=20=20=20
+-    params->utils->log(NULL, SASL_LOG_DEBUG,
+-		       "SRP client step %d\n", text->state);
+-=20=20=20=20
+-    *clientout =3D NULL;
+-    *clientoutlen =3D 0;
+-=20=20=20=20
+-    switch (text->state) {
+-
+-    case 1:
+-	return srp_client_mech_step1(text, params, serverin, serverinlen,=20
+-				     prompt_need, clientout, clientoutlen,
+-				     oparams);
+-
+-    case 2:
+-	return srp_client_mech_step2(text, params, serverin, serverinlen,=20
+-				     prompt_need, clientout, clientoutlen,
+-				     oparams);
+-
+-    case 3:
+-	return srp_client_mech_step3(text, params, serverin, serverinlen,=20
+-				     prompt_need, clientout, clientoutlen,
+-				     oparams);
+-
+-    default:
+-	params->utils->log(NULL, SASL_LOG_ERR,
+-			   "Invalid SRP client step %d\n", text->state);
+-	return SASL_FAIL;
+-    }
+-=20=20=20=20
+-    return SASL_FAIL; /* should never get here */
+-}
+-
+-
+-static sasl_client_plug_t srp_client_plugins[] =3D=20
+-{
+-    {
+-	"SRP",				/* mech_name */
+-	0,				/* max_ssf */
+-	SASL_SEC_NOPLAINTEXT
+-	| SASL_SEC_NOANONYMOUS
+-	| SASL_SEC_NOACTIVE
+-	| SASL_SEC_NODICTIONARY
+-	| SASL_SEC_FORWARD_SECRECY
+-	| SASL_SEC_MUTUAL_AUTH,		/* security_flags */
+-	SASL_FEAT_WANT_CLIENT_FIRST
+-	| SASL_FEAT_ALLOWS_PROXY,	/* features */
+-	NULL,				/* required_prompts */
+-	NULL,				/* glob_context */
+-	&srp_client_mech_new,		/* mech_new */
+-	&srp_client_mech_step,		/* mech_step */
+-	&srp_common_mech_dispose,	/* mech_dispose */
+-	&srp_common_mech_free,		/* mech_free */
+-	NULL,				/* idle */
+-	NULL,				/* spare */
+-	NULL				/* spare */
+-    }
+-};
+-
+-int srp_client_plug_init(const sasl_utils_t *utils __attribute__((unused)=
),
+-			 int maxversion,
+-			 int *out_version,
+-			 const sasl_client_plug_t **pluglist,
+-			 int *plugcount,
+-			 const char *plugname __attribute__((unused)))
+-{
+-    layer_option_t *opts;
+-=20=20=20=20
+-    if (maxversion < SASL_CLIENT_PLUG_VERSION) {
+-	SETERROR(utils, "SRP version mismatch");
+-	return SASL_BADVERS;
+-    }
+-=20=20=20=20
+-    /* Add all digests and ciphers */
+-    OpenSSL_add_all_algorithms();
+-=20=20=20=20
+-    /* See which digests we have available and set max_ssf accordingly */
+-    opts =3D digest_options;
+-    while (opts->name) {
+-	if (EVP_get_digestbyname(opts->evp_name)) {
+-	    opts->enabled =3D 1;
+-=09=20=20=20=20
+-	    srp_client_plugins[0].max_ssf =3D opts->ssf;
+-	}
+-=09
+-	opts++;
+-    }
+-=20=20=20=20
+-    /* See which ciphers we have available and set max_ssf accordingly */
+-    opts =3D cipher_options;
+-    while (opts->name) {
+-	if (EVP_get_cipherbyname(opts->evp_name)) {
+-	    opts->enabled =3D 1;
+-=09=20=20=20=20
+-	    if (opts->ssf > srp_client_plugins[0].max_ssf) {
+-		srp_client_plugins[0].max_ssf =3D opts->ssf;
+-	    }
+-	}
+-=09
+-	opts++;
+-    }
+-=20=20=20=20
+-    *out_version =3D SASL_CLIENT_PLUG_VERSION;
+-    *pluglist =3D srp_client_plugins;
+-    *plugcount=3D1;
+-=20=20=20=20
+-    return SASL_OK;
+-}
+diff --git a/utils/Makefile.am b/utils/Makefile.am
+index 99c49e1d..599d6c0c 100644
+--- a/utils/Makefile.am
++++ b/utils/Makefile.am
+@@ -43,7 +43,7 @@
+ ################################################################
+=20
+ all_sasl_libs =3D ../lib/libsasl2.la $(SASL_DB_LIB) $(LIB_SOCKET)
+-all_sasl_static_libs =3D ../lib/.libs/libsasl2.a $(SASL_DB_LIB) $(LIB_SOC=
KET) $(GSSAPIBASE_LIBS) $(GSSAPI_LIBS) $(SASL_KRB_LIB) $(LIB_DES) $(PLAIN_L=
IBS) $(SRP_LIBS) $(LIB_MYSQL) $(LIB_PGSQL) $(LIB_SQLITE)
++all_sasl_static_libs =3D ../lib/.libs/libsasl2.a $(SASL_DB_LIB) $(LIB_SOC=
KET) $(GSSAPIBASE_LIBS) $(GSSAPI_LIBS) $(SASL_KRB_LIB) $(LIB_DES) $(PLAIN_L=
IBS) $(LIB_MYSQL) $(LIB_PGSQL) $(LIB_SQLITE)
+=20
+ sbin_PROGRAMS =3D @SASL_DB_UTILS@ @SMTPTEST_PROGRAM@ pluginviewer
+ EXTRA_PROGRAMS =3D saslpasswd2 sasldblistusers2 testsuite testsuitestatic=
 smtptest pluginviewer
+diff --git a/utils/saslpasswd2.8 b/utils/saslpasswd2.8
+index d9838402..34a3cc62 100644
+--- a/utils/saslpasswd2.8
++++ b/utils/saslpasswd2.8
+@@ -80,7 +80,7 @@ Deletes the entry for the user.  This is mutually exclus=
ive with the
+ .TP
+ .B -n
+ Don't set the plaintext \fIuserPassword\fR property for the user.  Only
+-mechanism-specific secrets will be set (e.g. OTP, SCRAM, SRP)
++mechanism-specific secrets will be set (e.g. OTP, SCRAM)
+ .TP
+ .B -u domain
+ use
+diff --git a/win32/include/config.h b/win32/include/config.h
+index 0935054d..f8672d29 100755
+--- a/win32/include/config.h
++++ b/win32/include/config.h
+@@ -107,7 +107,6 @@ typedef int		    intptr_t;
+ #define STATIC_PLAIN 1
+ /* #define STATIC_SASLDB 1 */
+ #define STATIC_SCRAM 1
+-/* #define STATIC_SRP 1 */
+ #endif
+=20
+ /* ------------------------------------------------------------ */
+diff --git a/win32/makeinit.ps1 b/win32/makeinit.ps1
+index 7300ba44..1242ea76 100644
+--- a/win32/makeinit.ps1
++++ b/win32/makeinit.ps1
+@@ -1,4 +1,4 @@
+-$mechanism =3D @("anonymous", "crammd5", "digestmd5", "scram", "gssapiv2"=
, "kerberos4", "login", "ntlm", "otp", "passdss", "plain", "srp", "gs2")
++$mechanism =3D @("anonymous", "crammd5", "digestmd5", "scram", "gssapiv2"=
, "kerberos4", "login", "ntlm", "otp", "passdss", "plain", "gs2")
+ $pluginsDir =3D "..\plugins\"
+=20
+ for ($i =3D 0; $i -le $mechanism.Count - 1; $i++)
diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b/m=
eta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
index 26ec8a71a1..2734f8379a 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -21,6 +21,7 @@ SRC_URI =3D " \
     file://0002-Fix-incompatible-pointer-types-error-with-gcc-15.patch \
     file://0003-Add-compatibility-for-gcc-15-869.patch \
     file://0001-style-convert-K-R-function-definitions-to-ANSI-C-sty.patch=
 \
+    file://CVE-2026-129483.patch \
 "
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/cyrusimap/cyrus-sasl/archives"
--=20
2.35.6

