Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 18BF277D2A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 14:22:35 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id j68so6294788pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 07:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fZg4O5S+RDvuHqVnjT8F81aMSnadXqzPAbXt7C0BVM8=;
	b=buhIkcUPeABjgsue9cLJwtS0zrBj3nJoJW3B+Fe+rIs2Qdpal8Rm9USyf178d8AtE7
	JgS6RLNEgtsAyI0iCv6y42HtU94xf33X7O2m0NEyXXtlRJym9XDrGqCfNC9dbW9aGZCZ
	FmJr7fPSXj2K9vHBS9RH3FLx7plZO0AP9nT84eZ7kqGMM4TNfOPtt6I2Fi1HskiyHPQi
	44da10wvoUL+iuoEwyIUbEZGC1HkRuSGJ+dcR+YRjGpSMmwDcil9rB34oSVprNFVyr3J
	rT+hVzZBYeLIyMkW46RNZNum24zkE4x2y8mzKNIhFB9N0P9TMKFS1Wz0fGKUY3kCmTZt
	o9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fZg4O5S+RDvuHqVnjT8F81aMSnadXqzPAbXt7C0BVM8=;
	b=rmDMJeYyIu3l89ri99sJ0UDa/5UKw/SrYWQM+SL4HY1DeGK6oIuFbyFZ14m3+0jXx/
	wji5NjbDKtrvH76/Hn3WqN3MsjYQYTlrIDUKNEgYXBCVLXbGk+j+a+Ts2kwklK+46If3
	JnIU1NfUiupT/FozoLumzr5hkUgV9I2twnW0jV2dkXjQLF55u4zXc4O77IwJ9teA0O6i
	DPB0vUnOdORIJER5uhv+VBVQ9T8W5M8/mOug51eiTFeF0bQF1YV/UZmsnRMNNfjUCITw
	jhEqJUFjhJqaiVHixuKos62zLxOuE1d7PqySsmZ/mZ6pXPSK5H+1wsNRsPhDRlpyXvBI
	P+jw==
X-Gm-Message-State: AHYfb5jAfTvb9m9gTd+E2YkGs8o98fvgKIHAUfDV3PObHrWWUwKQ/1Ek
	BSrp21hMHW/oCiuY
X-Received: by 10.84.232.129 with SMTP id i1mr9141073plk.28.1502288557049;
	Wed, 09 Aug 2017 07:22:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8e89])
	by smtp.gmail.com with ESMTPSA id
	s14sm6022829pgo.14.2017.08.09.07.22.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 07:22:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 07:22:24 -0700
Message-Id: <20170809142224.3306-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [PATCH] postfix: Upgrade to 3.2.2
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
X-List-Received-Date: Wed, 09 Aug 2017 14:22:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc                   | 2 +-
 .../recipes-daemons/postfix/{postfix_3.1.1.bb => postfix_3.2.2.bb}    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.1.1.bb => postfix_3.2.2.bb} (77%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 0ec182a05..cb9d59f93 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -66,7 +66,7 @@ export CCARGS-nonis = ""
 # SASL support -DUSE_LDAP_SASL -DUSE_SASL_AUTH
 # current openldap didn't enable SASL
 export CCARGS-sasl  = "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', '-DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I=/usr/include/sasl', '', d)}"
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', '-DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I${STAGING_INCDIR}/sasl', '', d)}"
 export AUXLIBS-sasl = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', '-lsasl2', '', d)}"
 export CCARGS-sasl_class-native = ""
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.1.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
similarity index 77%
rename from meta-networking/recipes-daemons/postfix/postfix_3.1.1.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
index 839317d31..1118b2ed4 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.1.1.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
@@ -11,5 +11,5 @@ SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV
            file://check_hostname.sh \
            file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch \
            "
-SRC_URI[md5sum] = "40d72ea143af7ab0038c2cee1f483707"
-SRC_URI[sha256sum] = "3deda4c34631970490b1b5fbb559905f93531bf1c7eb00e38b0d0deb1dba9982"
+SRC_URI[md5sum] = "aea073a9b0bea5bdb590460a270a4aa0"
+SRC_URI[sha256sum] = "d06849418d119d09366997b2b481bb23f737629769b4e4a52da42fb3ad8b0576"
-- 
2.14.0


