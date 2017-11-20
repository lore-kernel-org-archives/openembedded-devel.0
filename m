Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 62250787B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 17:43:54 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id b85so8458685qkc.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 09:43:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=lVpACEDWbHhaPnI2X1/iu9LH/g9LwBqWJeioL2DNT1s=;
	b=hbOUR5mIG3H+gCKjvlonNQQVISTkdCns2BqqCeUbVrPHg1/UDbxk3Vh56rlkrGReHY
	cITOFuyYQwnm/1GtMmVb71znP0adExi5uRHYA3i4Ml1lTS1EtWHeJ5Gv/PXRNL+n1Pcl
	m9ofVcOCBw+6IUdHo+EOmCQKQdGx9KFfe5IaXd+cAjEb35/TE1m4LOGp1WMbks6ZaSag
	wpJRU0c0DDfoK98+An7c6O/wtPO1qHNZpWEHWZOnhqdffUh1KqLUC4vJ3/xidnPDNJgR
	xlvnI+L6lAzt6lKkruZEv3wWpqmYqQ92z/2IPm5dPEdr4gQ8Q/qmBxWNA7QwtRUf0gPk
	hJYw==
X-Gm-Message-State: AJaThX4jNhQyNAhdOjQkFPTAC0LPXJ3udH/a0NpB42vwlMRPfybM3zzS
	h4HrxJhBR2MbDq7XynMPOI2yZQ==
X-Google-Smtp-Source: AGs4zMZiW5OYB111rO0MLqRrdFyRvG3WYVp+L4BsvuqumOC0nkYjaSGkgTn9Z0S6ibxHwpU4YylNkA==
X-Received: by 10.55.144.130 with SMTP id s124mr4803869qkd.290.1511199836129; 
	Mon, 20 Nov 2017 09:43:56 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	e70sm7485483qka.83.2017.11.20.09.43.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Nov 2017 09:43:55 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 20 Nov 2017 15:43:50 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Nov 2017 15:43:31 -0200
Message-Id: <20171120174331.22399-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171120174331.22399-1-otavio@ossystems.com.br>
References: <20171120174331.22399-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH 3/3] python3-pycrypto: Add recipe
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
X-List-Received-Date: Mon, 20 Nov 2017 17:43:55 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


