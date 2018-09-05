Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id E1F00793E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:02:36 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id d19-v6so4044882pgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=muKjt7AYmpPdhmepByEc2LWX7VJ7wXc6naC8xbI2LiU=;
	b=KTr7jqAO+R5bSYYmo2qzS7dJp4ehYqpWYs2KQnH052qEZVjXcPhlbmjSN537WNBR/7
	GsYS7fsieuj37gRVmpA7hNTTgP7yvBirRTZiRv9pTU62kdZrC+qkmHi6ygCpA5VXq643
	no1SAA2ZOY9aeyYzMN+Y/N1EvbbJR/Tdo8WK1L6sVzYRwxp5bqh3eJKKqRdXeT90Moyu
	ygYp+szBVw533BaEg2Z4dBKq8ZSgwK1Lk9hSFTUeKoa1Lh7Ivj1vy9autgdylm40uket
	9C6sGl7R86BeX+WrzhO+xuUMF5/BeR/L1pl7INIO4PIFDQ6B9KM5cIl5Pzpx9EZ7u6Ka
	pjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=muKjt7AYmpPdhmepByEc2LWX7VJ7wXc6naC8xbI2LiU=;
	b=PDPgFhGCsrNEYS287S7jBa55VttP/Dd9F8BGi4KwkOkI74uxGpmlrRirgCnhlL/bBh
	dkgFa8fGgsYZRgdcdzXzuVytTeWsuBDHl8vRMPasG3gzh1s4L0rX6JL6nFlXiHt3xpvu
	zVRljpQhe6Ea4WVK3PHtvbUGw8PM77NNWiUa/vpGgqiCQ/RFnwr6PQBjW7auizYWOFE4
	moGzKoSm/dZNshNuLhdUb4q4OMAkbUzxsb3x3nMqqaeupwVzthFk26x8X6MNtWuGDayd
	lMCg01h9l6P7OOTOI3LW3fw/yIG9XbtKYpTH4crMAfOH+TJl7lw2gFGRN3NMcs3fi6lP
	9UJg==
X-Gm-Message-State: APzg51A8Eaq4CCWeay6MM0qdn4b20hcqT5KBPiHFimMOG5HHeSUQ6AtE
	98PFwSAkvWx6jIlmANtZjNTju/Qf
X-Google-Smtp-Source: ANB0VdYKbgS/sBNWrpNYgRKjvlFq3d99deaihhYKnYM/0xpaw+bUZsrtZGp9W3/VInoiIV2JURa41g==
X-Received: by 2002:a65:450a:: with SMTP id
	n10-v6mr36732135pgq.392.1536181357527; 
	Wed, 05 Sep 2018 14:02:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	e26-v6sm3689411pfi.70.2018.09.05.14.02.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 14:02:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 14:02:18 -0700
Message-Id: <20180905210224.21225-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905210224.21225-1-raj.khem@gmail.com>
References: <20180905210224.21225-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/12] uw-imap: Fix build with openSSL 1.1
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
X-List-Received-Date: Wed, 05 Sep 2018 21:02:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uw-imap/0001-Support-OpenSSL-1.1.patch    | 71 +++++++++++++++++++
 .../recipes-devtools/uw-imap/uw-imap_2007f.bb |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch
new file mode 100644
index 0000000000..d5610bbcd5
--- /dev/null
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch
@@ -0,0 +1,71 @@
+From 4c684542816a08b95444b8e2515f24d084e6e3c3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 4 Sep 2018 22:05:17 -0700
+Subject: [PATCH] Support OpenSSL 1.1
+
+When building with OpenSSL 1.1 and newer, use the new built-in
+ hostname verification instead of code that doesn't compile due to
+ structs having been made opaque.
+Bug-Debian: https://bugs.debian.org/828589
+
+Upstream-Status: Unknown
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/osdep/unix/ssl_unix.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/src/osdep/unix/ssl_unix.c b/src/osdep/unix/ssl_unix.c
+index 3bfdff3..dec9467 100644
+--- a/src/osdep/unix/ssl_unix.c
++++ b/src/osdep/unix/ssl_unix.c
+@@ -227,8 +227,16 @@ static char *ssl_start_work (SSLSTREAM *stream,char *host,unsigned long flags)
+ 				/* disable certificate validation? */
+   if (flags & NET_NOVALIDATECERT)
+     SSL_CTX_set_verify (stream->context,SSL_VERIFY_NONE,NIL);
+-  else SSL_CTX_set_verify (stream->context,SSL_VERIFY_PEER,ssl_open_verify);
++  else {
++#if OPENSSL_VERSION_NUMBER >= 0x10100000      
++      X509_VERIFY_PARAM *param = SSL_CTX_get0_param(stream->context);
++      X509_VERIFY_PARAM_set_hostflags(param, X509_CHECK_FLAG_NO_PARTIAL_WILDCARDS);
++      X509_VERIFY_PARAM_set1_host(param, host, 0);
++#endif
++
++      SSL_CTX_set_verify (stream->context,SSL_VERIFY_PEER,ssl_open_verify);
+ 				/* set default paths to CAs... */
++  }
+   SSL_CTX_set_default_verify_paths (stream->context);
+ 				/* ...unless a non-standard path desired */
+   if (s = (char *) mail_parameters (NIL,GET_SSLCAPATH,NIL))
+@@ -266,6 +274,7 @@ static char *ssl_start_work (SSLSTREAM *stream,char *host,unsigned long flags)
+   if (SSL_write (stream->con,"",0) < 0)
+     return ssl_last_error ? ssl_last_error : "SSL negotiation failed";
+ 				/* need to validate host names? */
++#if OPENSSL_VERSION_NUMBER < 0x10100000
+   if (!(flags & NET_NOVALIDATECERT) &&
+       (err = ssl_validate_cert (cert = SSL_get_peer_certificate (stream->con),
+ 				host))) {
+@@ -275,6 +284,7 @@ static char *ssl_start_work (SSLSTREAM *stream,char *host,unsigned long flags)
+     sprintf (tmp,"*%.128s: %.255s",err,cert ? cert->name : "???");
+     return ssl_last_error = cpystr (tmp);
+   }
++#endif
+   return NIL;
+ }
+ 
+@@ -313,6 +323,7 @@ static int ssl_open_verify (int ok,X509_STORE_CTX *ctx)
+  * Returns: NIL if validated, else string of error message
+  */
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000
+ static char *ssl_validate_cert (X509 *cert,char *host)
+ {
+   int i,n;
+@@ -342,6 +353,7 @@ static char *ssl_validate_cert (X509 *cert,char *host)
+   else ret = "Unable to locate common name in certificate";
+   return ret;
+ }
++#endif
+ 
+ /* Case-independent wildcard pattern match
+  * Accepts: base string
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 4c055e54ca..0000f05ae4 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://quote_cctype.patch \
            file://imap-2007e-shared.patch \
            file://imap-2007f-format-security.patch \
+           file://0001-Support-OpenSSL-1.1.patch \
            "
 
 SRC_URI[md5sum] = "2126fd125ea26b73b20f01fcd5940369"
-- 
2.18.0


