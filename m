Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f48.google.com (mail-yw1-f48.google.com
	[209.85.161.48])
	by mail.openembedded.org (Postfix) with ESMTP id 635676086F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 00:26:49 +0000 (UTC)
Received: by mail-yw1-f48.google.com with SMTP id e23-v6so2974064ywe.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2018 17:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SHkGVw5urdODyWwuzM4Kk6jORxC5XDUvPoixmQ5Z0uo=;
	b=BKAv8+NubZY814EAwt5CLv8B4798BtfYa/5/hEP+qY7WU4O8IICZS5jHinGDRxZS24
	sYG4vPZ+81cH9451sYMtPo7D9mx5203jV5rrZB9lrLO62N3uVTWk2wZBLMISsfK7JpF6
	1yUB/DyvgvE0QclKZwGeowOwy+8S2rbZw+wU52PxueL3St7z7xRfEnzufymYVVs414mi
	UGhYsxcfGT3h76uyo3sao0tecj+IxtRhjw+qtV3PSZT6wLaLInz+Gu2cI2EVQh68qTGj
	ms5ayKgPV3X7Z4Pwi0J8ncEROfVDX69u/7U8bWM7bztmC/SMM/Dgi0cCbadxRtUsonk1
	kAuQ==
X-Gm-Message-State: AOUpUlFTGOeQIjGOMw/P+9seCcH+TL/ry9/IVqHcFF8QcBiXfhNEiBU1
	1AESjFZMtlu9ZwurSvcLlkLrfuO3
X-Google-Smtp-Source: AA+uWPw1OX4djmr60+/TTgXacRYQrL0SScrjx8MsWbJ9yTL3jQGJOdY6VHTx0eFOjQqKjJInkDYOyQ==
X-Received: by 2002:a81:59c6:: with SMTP id
	n189-v6mr2697273ywb.30.1533774410329; 
	Wed, 08 Aug 2018 17:26:50 -0700 (PDT)
Received: from tfsielt31850.jci.com (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	u67-v6sm2132354ywa.56.2018.08.08.17.26.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 17:26:49 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Aug 2018 01:26:42 +0100
Message-Id: <20180809002644.18549-2-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180809002644.18549-1-git@andred.net>
References: <20180809002644.18549-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][master-next][PATCH 2/4] openjdk-8: speed-up do_install() (pack200)
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
X-List-Received-Date: Thu, 09 Aug 2018 00:26:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

We run pack200 sequentially on all found archives, but there
doesn't seem to be a reason to do so, the
java_get_parallel_make() apperas to be related to compiling
java itself, running multiple java applications (pack200)
at the same time on the same machine should be possible,
otherwise we have a big problem...

Just run up to BB_NUMBER_THREADS pack200 processes at the same
time to speed up the build.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 03cab11..d0b2ec8 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -77,13 +77,13 @@ do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'repack', 'true', 'false', d)} ; then
       if [ -d ${D}${JDK_HOME} ] ; then
         find ${D}${JDK_HOME} -name "*.jar" -print0 | \
-          xargs -0 -n1 -P ${@java_get_parallel_make(d)} sh -c ' \
+          xargs -0 -n1 -P ${BB_NUMBER_THREADS} sh -c ' \
               echo "Repacking" "$0" ; \
               pack200 --repack --effort=9 --segment-limit=-1 --modification-time=latest --strip-debug "$0"'
       fi
       if [ -d ${D}${JRE_HOME} ] ; then
         find ${D}${JRE_HOME} -name "*.jar" -print0 | \
-          xargs -0 -n1 -P ${@java_get_parallel_make(d)} sh -c ' \
+          xargs -0 -n1 -P ${BB_NUMBER_THREADS} sh -c ' \
               echo "Repacking" "$0" ; \
               pack200 --repack --effort=9 --segment-limit=-1 --modification-time=latest --strip-debug "$0"'
       fi
-- 
2.18.0


