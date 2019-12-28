Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 599C06025E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 08:07:49 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id p14so15818918pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 00:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZJpXXNOWhkpp95BqV+r2fl+EVIDcrQI+XmQ0cgZJA9o=;
	b=BS2VKazTewXE65xOHuX3H3M4I3AGAnzvjgegHaSV7OwwrvNSTNSwFdhin2LQK2EIsw
	TEce723a7pQNXm8fflA4mGZP+eTs4OtVTkk9pS81Q6W4lnxpKjAX7IXKlzc+ehY8b80C
	fygLxHnvi8lzT6kGov3xd2NuDv/xxtWCPxkUPJRCPWgpoxPYMim4+2HH/RmAJHzmGQFy
	qaVo+ggsLlQmbjxa1hCD1jowRFEy6SzQLgWeUBwKdhESQ3Gxow/zmW8O1R7Yqi73e9J6
	3AZ6peD4/JZHaWLP1hIA6ul7Z8KRbywScuRGh2J8tezTCBxkH4RQEaQF4Q3Dir5H9Gxz
	4PJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZJpXXNOWhkpp95BqV+r2fl+EVIDcrQI+XmQ0cgZJA9o=;
	b=TcLSQwm0obIhNMm2mBockZLW1B1Ckr77m8yH1Cmxn3uLCOFE1qIDw4fohMxYASdzp/
	V6uqed7Fk11OZ1a30F4IQaZIlanx7YDBVhp2trZG95LLLl8OgCcSQNRf7MOwhkfITN/b
	nbPAB80o2w+Mm/vpl7xn31fPcPosgKBMKL0eVKYi7V2HgzF2PfDtuwpTsY/DlKyZj0Sv
	u4fwCyxPulivbqpdzMz3EOuuW3wVfoyCIbY+1zufJYwt3R1c06QAyS61mFn5ZPfjoaxg
	ugPHdlOP9em94DBz2TKMubLjtAZB9ulAINZGBcuVIV5GkbXQ1d/8PSvIeQLXh98BPDg6
	FhXQ==
X-Gm-Message-State: APjAAAUk6Wm3h01PLg8HGpbjYl0i/iaoftjHsD34hxvEH3X8dXV9eCkf
	AoXoSvODb3VHhPOEpI78u4LkIBSp9zU=
X-Google-Smtp-Source: APXvYqxQ7ENBEkht4vAc2Ive7V2AbPZISy0CSbH6D8+aAqfWUNgQsNM9Ri0iOIOxF2Cf9dOcJMMZFw==
X-Received: by 2002:a62:f251:: with SMTP id y17mr60467851pfl.204.1577520470065;
	Sat, 28 Dec 2019 00:07:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	r66sm44135124pfc.74.2019.12.28.00.07.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Dec 2019 00:07:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Dec 2019 00:07:38 -0800
Message-Id: <20191228080740.63169-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191228080740.63169-1-raj.khem@gmail.com>
References: <20191228080740.63169-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/5] opensc: Fix misaligned indentation
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
X-List-Received-Date: Sat, 28 Dec 2019 08:07:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Fix-misleading-code-indentation.patch | 69 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.19.0.bb   |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/0001-Fix-misleading-code-indentation.patch

diff --git a/meta-oe/recipes-support/opensc/opensc/0001-Fix-misleading-code-indentation.patch b/meta-oe/recipes-support/opensc/opensc/0001-Fix-misleading-code-indentation.patch
new file mode 100644
index 0000000000..eb71b9d766
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/0001-Fix-misleading-code-indentation.patch
@@ -0,0 +1,69 @@
+From 283578519ec83a8792b026c10322789784d629de Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 27 Dec 2019 11:33:57 -0800
+Subject: [PATCH] Fix misleading code indentation
+
+Fixes
+error: misleading indentation; statement is not part of the previous 'if' [-Werror,-Wmisleading-indentation]
+         if(cipher)
+         ^
+../../../git/src/libopensc/card-entersafe.c:369:2: note: previous statement is here
+        if(sbuf)
+        ^
+Upstream-Status: Submitted [https://github.com/OpenSC/OpenSC/pull/1894]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libopensc/card-entersafe.c | 12 ++++++------
+ src/tools/pkcs15-init.c        |  4 ++--
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/libopensc/card-entersafe.c b/src/libopensc/card-entersafe.c
+index 3e42c11f..abb9fd81 100644
+--- a/src/libopensc/card-entersafe.c
++++ b/src/libopensc/card-entersafe.c
+@@ -352,10 +352,10 @@ static int entersafe_transmit_apdu(sc_card_t *card, sc_apdu_t *apdu,
+ 	 size_t cipher_data_size,mac_data_size;
+ 	 int blocks;
+ 	 int r=SC_SUCCESS;
+-	u8 *sbuf=NULL;
+-	size_t ssize=0;
++	 u8 *sbuf=NULL;
++	 size_t ssize=0;
+ 
+-	SC_FUNC_CALLED(card->ctx, SC_LOG_DEBUG_VERBOSE);
++	 SC_FUNC_CALLED(card->ctx, SC_LOG_DEBUG_VERBOSE);
+ 
+ 	 assert(card);
+ 	 assert(apdu);
+@@ -363,10 +363,10 @@ static int entersafe_transmit_apdu(sc_card_t *card, sc_apdu_t *apdu,
+ 	 if((cipher||mac) && (!key||(keylen!=8 && keylen!=16)))
+ 		  SC_FUNC_RETURN(card->ctx, SC_LOG_DEBUG_VERBOSE, SC_ERROR_INVALID_ARGUMENTS);
+ 
+-	r = sc_apdu_get_octets(card->ctx, apdu, &sbuf, &ssize, SC_PROTO_RAW);
+-	if (r == SC_SUCCESS)
++	 r = sc_apdu_get_octets(card->ctx, apdu, &sbuf, &ssize, SC_PROTO_RAW);
++	 if (r == SC_SUCCESS)
+ 		sc_apdu_log(card->ctx, SC_LOG_DEBUG_VERBOSE, sbuf, ssize, 1);
+-	if(sbuf)
++	 if(sbuf)
+ 		free(sbuf);
+ 
+ 	 if(cipher)
+diff --git a/src/tools/pkcs15-init.c b/src/tools/pkcs15-init.c
+index 1ce79f45..9a73121c 100644
+--- a/src/tools/pkcs15-init.c
++++ b/src/tools/pkcs15-init.c
+@@ -2311,8 +2311,8 @@ do_read_private_key(const char *filename, const char *format,
+ 			r = util_getpass(&passphrase, &len, stdin);
+ 			if (r < 0 || !passphrase)
+ 				return SC_ERROR_INTERNAL;
+- 			r = do_read_pkcs12_private_key(filename,
+- 					passphrase, pk, certs, max_certs);
++			r = do_read_pkcs12_private_key(filename,
++					passphrase, pk, certs, max_certs);
+ 		}
+ 	} else {
+ 		util_error("Error when reading private key. "
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
index 006a1b6b29..0d744e213b 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 SRCREV = "f1691fc91fc113191c3a8aaf5facd6983334ec47"
 SRC_URI = "git://github.com/OpenSC/OpenSC \
            file://0001-Remove-redundant-logging.patch \
+           file://0001-Fix-misleading-code-indentation.patch \
           "
 DEPENDS = "virtual/libiconv openssl"
 
-- 
2.24.1


