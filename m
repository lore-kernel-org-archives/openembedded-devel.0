Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 71615786B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 12:45:26 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id d15so12796140qte.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 04:45:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=e4FJOQLwuxtXJO/ohkCpAZrP/avo9jQcPuZQP41DIYE=;
	b=FAT8sOEKIjZD8r+XhPGRS2GkNZzfSO6+iEuabqiDUrZy4PGo/H69RKgemzZ3mvZhQI
	ilDYvM4a/TNpeI7leNltSuXfPiYeZgY3PMtC1BbSuKU3+SS8wbXRiqsnaeaoQiySu71q
	1CwaNY1pjsPEMAy4nHrKeamO/xoE5vsb1Tz8V3JxuP6EO5BQkJIohk7hpF1fPukngZ8n
	GPbB+uZtJvxWAZbpi6K5KjKu5F2VK+6n6OptCbVqrfiA4o0qw+2XVTyg5/zSkDXgCR/n
	pPO3UULA1eDTMmHurd41NFOoOWufg8nStoDmapMTpe5xHPBrm+tLS5LwV5SVnE6hiYdS
	PUdg==
X-Gm-Message-State: AKGB3mIXJkodWnRpj5xxL9DSmtlyCo17C/a2wE31Wog8cf9nUY7svTET
	Q2AZvFFIykdDLcJ4hK7Sjd8oKQ==
X-Google-Smtp-Source: AGs4zMaNxwOvRTwYkItO/5AH/dAtjshr8iyGBO5IgEjoWoFeAe5WN7lcGz/riNPsiSbjBPVTEcuoKQ==
X-Received: by 10.200.4.154 with SMTP id s26mr8772622qtg.156.1512132328102;
	Fri, 01 Dec 2017 04:45:28 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id y9sm4441046qti.63.2017.12.01.04.45.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Dec 2017 04:45:27 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 01 Dec 2017 10:45:21 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  1 Dec 2017 10:45:02 -0200
Message-Id: <20171201124502.18190-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171201124502.18190-1-otavio@ossystems.com.br>
References: <20171201124502.18190-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH v2 3/3] python3-pycrypto: Add recipe
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
X-List-Received-Date: Fri, 01 Dec 2017 12:45:27 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
new file mode 100644
index 000000000..0f0999955
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
@@ -0,0 +1,9 @@
+inherit distutils3
+require python-pycrypto.inc
+
+# We explicitly call distutils3_do_install, since we want it to run, but
+# *don't* want the autotools install to run, since this package doesn't
+# provide a "make install" target.
+do_install() {
+       distutils3_do_install
+}
-- 
2.15.0


