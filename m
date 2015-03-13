Return-Path: <joe@deserted.net>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8430E6013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 18:35:30 +0000 (UTC)
Received: by iecsl2 with SMTP id sl2so119007467iec.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 11:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=y7Tpb7eiP4faW1ZI/yheyP7Zal4eNGcwHZGmpUUhe4U=;
	b=DwWi/udc3JMCLkQubtJHwbHkSEEGkBM6ySPpsUhCyovs1eSPnt5+ZGCwTjWTsre5+e
	z1GTVeViIgWDPS/sWrW5bkCWAYKzBNhmnzeptPEsqfJkL5cRmTkGO4ic9g53eup6Zotb
	FGmLrYVkEw/jQHcwy4eqBz22BR4ESCLr23glp7lM7yD2b6wWm5vEmdkue27dijV8Uste
	/kWgroNaFYWLTcshRVu6k8FIK9AjSoUp7or1nULUYUkQqRa961j3bVWcsq0WwV0g6X+w
	v5VqzhT7kP+NHHy8pPUby0AX7rprpQOlAR9RE3KMkCDCErAZjieL1+70C1uTRbUKiJvF
	xCBg==
X-Gm-Message-State: ALoCoQl4lLQdhrZRqQaUaHObpewgCcqZHR5v+73HjEInzX3R4OGRQFULYgUz/iCjynJlzSRcIbME
X-Received: by 10.42.194.77 with SMTP id dx13mr59510767icb.34.1426271731415;
	Fri, 13 Mar 2015 11:35:31 -0700 (PDT)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id ik7sm1763126igb.1.2015.03.13.11.35.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 11:35:30 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Mar 2015 14:36:40 -0400
Message-Id: <1426271800-2656-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1426269408-2363-1-git-send-email-joe_macdonald@mentor.com>
References: <1426269408-2363-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH v2] openflow: add libcrypto to static openflow library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2015 18:35:33 -0000

An update in OpenSSL removed the -lcrypto from libssl's pkg-config
options.  The old behaviour always linked it with -lssl, so revert to that
for now.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

Oops, v1 included one lingering bit of damage where I was also trying to correct
the B != S failures, that shouldn't be there.  Openflow is still broken if you
attempt to build outside of the source tree.

 meta-networking/recipes-protocols/openflow/openflow.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 1a226f8..75d8ab8 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -15,11 +15,14 @@ SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git"
 
 DEPENDS = "virtual/libc"
 
-EXTRA_OECONF += "KARCH=${TARGET_ARCH}"
-
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl, openssl, libssl"
 
+EXTRA_OECONF += " \
+                 KARCH=${TARGET_ARCH} \
+                 ${@base_contains('PACKAGECONFIG', 'openssl', 'SSL_LIBS="-lssl -lcrypto"', '', d)} \
+                "
+
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
-- 
1.9.1


