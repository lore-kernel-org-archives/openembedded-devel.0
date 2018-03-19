Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id C2C0A78948
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:34 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id d26so6647845pfn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0sCF/g76XVAx6w2WEAcRYEg9wWYeerb0e/BE8AsduH4=;
	b=apP4p2At7VkCVRviGSD6V+mtF0mgrIme+IahnjlQUF5GYqK1lFpz6q6d6IqbO2A0da
	mSVN6XXrrQrfUAPGP+6xu5iBvncNAPHVgJrou9zKwlEFA2aPHGQrK+QKHDCyvPN2kBdv
	yEPlrHNHKtZggaknh7WZtV78k4F639GByCZIRIxrsXjyzrKB1DkOk1ZcKAB5A2u4tXFP
	ARkMdaFpuIGtg7Og5hqAgUDNQCxLZb+ZCIbHiB5OapifYWlEDfk5Hl2zVv4VOi9bPgdl
	vQrFOYX0dLEiQjVr6RMkgfUthWspUpEhccGWPmFrld2uIL3XPNJWEADwFDXbDgxenGnd
	EhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0sCF/g76XVAx6w2WEAcRYEg9wWYeerb0e/BE8AsduH4=;
	b=Eu/joLri2QwXElsXayjbjvuko/wliZYhCi15mSEAy0Ghjb9fJFlncRx5/l+1skTUvh
	nyIgE/nfOlGA40VF6T1K7UFb0JaIg3cWTUqMT8bdaRegHPX7jINItziXCZA+PGpdGmZS
	4ninDHYjyqHHF2R8fzMnHVyNrLBlvRUZKYFfhaGESNlYWpTTLKGf4exkZmZcSY4OJe21
	7OggmjKgGjw0t94DR8Wz/qZB990NQMPRYKzNem3HN5ZWYf+kFirLWjtVZmyodPBe1plL
	RpizYjkfg+opqSCHDa2TnO05Kf3xLfOyvFqIclzmXRzGReq3y8Vz6PeGZ239jr7cbuKe
	zDmQ==
X-Gm-Message-State: AElRT7EgfnBI23MO5KY9FZz7C7b7LJUXq1LQGUQ4kuKSSnJx3oirs49M
	vDy7lt/7XYPHR+FTswVKkJ36Hw==
X-Google-Smtp-Source: AG47ELtOQ1of4wcUHQyS3kQzmjoim/5xnqo/zxB7PENCAkKtOj9Wi5UF/3zlQDBVYxUkvAJ5dp6rkg==
X-Received: by 10.98.38.133 with SMTP id m127mr9277701pfm.122.1521439416137;
	Sun, 18 Mar 2018 23:03:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:03:00 -0700
Message-Id: <20180319060300.5366-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 18/18] mpich: Use new config.guess and config.sub
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:35 -0000

This brings in new architecture support for risc-v

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/mpich/mpich_3.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.2.bb b/meta-oe/recipes-devtools/mpich/mpich_3.2.bb
index 4a2c37723..51b313cef 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.2.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.2.bb
@@ -31,6 +31,11 @@ EXTRA_OECONF = "--enable-debuginfo \
 inherit autotools-brokensep gettext
 
 do_configure_prepend() {
+    for d in confdb test/mpi/confdb src/openpa/confdb src/pm/hydra/confdb src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/confdb src/mpl/confdb src/mpi/romio/confdb;  do
+        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/$d
+        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/$d
+    done
+
     autoreconf --verbose --install --force -I . -I confdb/ -I maint/
     oe_runconf
     exit
-- 
2.16.2


