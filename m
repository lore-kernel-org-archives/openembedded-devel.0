Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqrt-0003cc-3B
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:23 +0200
Received: by mail-ee0-f48.google.com with SMTP id c4so86731eek.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=IKgLWUAMc0421VaTEQe8pmJA+RdadwGyRcs6etMkIeA=;
	b=zUnQTsXLhclo7q0Pdtavf0EWYU/muUUgM1LIsjuSKBROZpkU1iNVoaRR68B0OEhEOB
	aDc5EHxDwron4HLAcO11GhkQJKrku/mvFQ4JkU6LofuwWrbaFzfIAqK9tlKXSrlfNL9Z
	ZQ+9sGqxnp6qR3B/l+Kd292inUs4A/0AzGlFCIUxxsSWkqC6dQDeLU0u+VmRAIg8uCiH
	qq3zE6bsKtnNO2qdTu3WFpUaCgnhl8YJnx1/OsZXB2R4qQmugOqe8bLU3dVnbHGTLpfK
	YGuuMf842SjX3ttdYKa/XXUTlrf/4J6jk+Ms5fXFZSAblJ7exo9xPD26SOeABWjCHbrT
	eEBw==
X-Received: by 10.14.214.3 with SMTP id b3mr10136560eep.24.1367966539931;
	Tue, 07 May 2013 15:42:19 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:47 +0200
Message-Id: <1367966513-12566-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 09/15] poppler-data: update to 0.4.6 and stylize a bit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 23:00:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...poppler-data_0.4.5.bb => poppler-data_0.4.6.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.5.bb => poppler-data_0.4.6.bb} (78%)

diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.5.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb
similarity index 78%
rename from meta-oe/recipes-support/poppler/poppler-data_0.4.5.bb
rename to meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb
index 56a30e4..cb502d4 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.5.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb
@@ -5,7 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
                     file://COPYING.gpl2;md5=751419260aa954499f7abaabaa882bbe \
 "
 
+inherit allarch
+
 SRC_URI = "http://poppler.freedesktop.org/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "a8a7ca808827dd674faba6e4fc73b471"
+SRC_URI[sha256sum] = "f306901dfa5bda90cd6663d4eedb1c773c3c709de78018c79f1282b2c8f90afa"
 
 do_compile() {
 }
@@ -15,7 +19,3 @@ do_install() {
 }
 
 FILES_${PN} += "${datadir}"
-inherit allarch
-
-SRC_URI[md5sum] = "448dd7c5077570e340340706cef931aa"
-SRC_URI[sha256sum] = "3190bc457bafe4b158f79a08e8a3f1824031ec12acefc359e68e0f04da0f70fd"
-- 
1.7.4.4



