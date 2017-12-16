Return-Path: <dariusz.pelowski@gmail.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 65E246093E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Dec 2017 10:46:08 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id g80so8560168lfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Dec 2017 02:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HTVrMssVO/r9tbgidKp1A4iL1lz0ZaxTxYYR1Q/l6P0=;
	b=jUJGnUZRvJDfbs/NPWF736PCzS8OgBw8aFNHEZDxZnIDJCPVl4felInW7NsgP5xgYi
	KKelMUeP74XgAXuXJE5MSevtRkIfQrSDHrZgTcvnqngkXBkO5cFUeZhvqiP9P9EYfQO9
	CJd4Xs13DeSE32kHIYp0meeteKwJ7vvzLH+iDbU5bJ+2W1AJHF8iaekhMlnSQ/6rbFfu
	XM+2K3CJ7Bp9cfijm7L5vFNyxbisQQpQKOeMyj4272jMw/DeN8JGlSJ6h9CZtgIXjGsW
	tml20htNCnTeyK6gOI6hLGqUEW/9xqyhpsLxcj499X6DSElxFDRS50eroPFaKnjYVRjE
	Qrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HTVrMssVO/r9tbgidKp1A4iL1lz0ZaxTxYYR1Q/l6P0=;
	b=KcZWGKKwt9quN/MdrIw8cmRb0i6T6mkH3X9otuN/MtU4A3Zj314GmmytkOGpJZvq7L
	Gmw4Lgr3pbSnIV8IieyToMGJADTu15R6RisA0aTRFLYGv+z8BXZCtJCHF1mLGmKcP14M
	K443gst94eZ+8ThN42gG7Ei50ZugJhfaoJPmJUxRuCDsP5l9cCO9iTaTHHMIUr87QroX
	Q7ZsTCGZJ1W8feJBqeD6E6dlzqPYqQ/prKDajziLqU5YWMvRhPq63j3FXo8LloZR/FAH
	jCcJ5bFf28/2GbFPBkP9i8Q4ZRQ+SVyVUJ0VDjoaUKPm6RD3fFZFGu3Ddb8b0KouA9z0
	suCw==
X-Gm-Message-State: AKGB3mJojFzUPNTYXJjdt91ar+/yICwzH+PiIb6mFx0YuTprZS4SBenE
	zbNe4I83sXyNR8bsssZStx46sjqd
X-Google-Smtp-Source: ACJfBotFWoMI7/op+KjsJvGbqr9joxbMTTRY5Fl2cuUWcAaJUAUOp/jO1JRR5/goJqKHB/EGdbXPAQ==
X-Received: by 10.25.229.68 with SMTP id c65mr43612lfh.114.1513421169577;
	Sat, 16 Dec 2017 02:46:09 -0800 (PST)
Received: from duzy.lan (user-188-33-218-82.play-internet.pl. [188.33.218.82])
	by smtp.gmail.com with ESMTPSA id
	f78sm1628942lje.20.2017.12.16.02.46.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Dec 2017 02:46:08 -0800 (PST)
From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Dec 2017 11:45:44 +0100
Message-Id: <20171216104544.23324-1-dariusz.pelowski@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [meta-networking][PATCH] meta-networking: virtual/db dependency corrected to db
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
X-List-Received-Date: Sat, 16 Dec 2017 10:46:09 -0000

db doesn't provides virtual/db anymore

Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 2 +-
 meta-networking/recipes-daemons/postfix/postfix.inc             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index eaa453d91..64d1a76d6 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Generic client/server library for SASL authentication"
 SECTION = "libs"
 HOMEPAGE = "http://asg.web.cmu.edu/sasl/"
-DEPENDS = "openssl virtual/db"
+DEPENDS = "openssl db"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
 
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index a588bd347..75cf13795 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -6,11 +6,11 @@ has a definite Sendmail-ish flavor, but the inside is completely different."
 
 HOMEPAGE= "http://www.postfix.org"
 SECTION = "mail"
-DEPENDS = "virtual/db icu libpcre openssl postfix-native \
+DEPENDS = "db icu libpcre openssl postfix-native \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
 "
-DEPENDS_class-native = "virtual/db-native icu-native openssl-native libpcre-native"
+DEPENDS_class-native = "db-native icu-native openssl-native libpcre-native"
 
 LICENSE = "IPL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64375f37431336ea1b1b3005fe3fa354"
-- 
2.15.0


