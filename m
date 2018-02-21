Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 58DEF78733
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 19:21:37 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id d8so3356494qtm.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 11:21:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=7BJ8gk3zalQQAEBQWEy/vHlF9Hmc2J+rdFxRCj8Vg9Q=;
	b=mkLIXsQ36SEN0AEm8DNmlX6JA+vW6LzsenMZn4NmJIXedPxbpqUVdB7xwIDDDWId8j
	moHwtoXX9Se7caZTmHu3/sJ56LrqFT4zHT1PXtY7GTPkIVzJp83W263VHvRrPuqpKZGZ
	SgcOsS0wtmuPPegam4zLn4W7/LIKx/lVi13YwRhwZvTkn/VFGMz3ZH3WdwFeOBnalB6K
	7+h0s0L3HK3E80SDJjSx7KyqUiilsYRP7Yx7OP411GtpFfqGQ51gAJrY4EmVUH90Hhpn
	trEUr9kwBYwo1v++oSklXeZVw7ActrvHfktbQaXXcQYLMNjJeYJxsryTrdLJqASR+dla
	zx8g==
X-Gm-Message-State: APf1xPB2YIEHuJ068t7yB6vCKkjv7AgzQ8GK7rb0N+odV5VnXQIgc0di
	KBC93METNXLeIuRNfPC5Z4GTug==
X-Google-Smtp-Source: AH8x224QzBOFN3bPtXw8irEcDXeYjfkQNbk1NRPmNTjygyB2J9CO5Q71QceoihLyBKF9wc0drw0J/Q==
X-Received: by 10.200.64.137 with SMTP id p9mr7236185qtl.33.1519240897906;
	Wed, 21 Feb 2018 11:21:37 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	r51sm7759286qtr.93.2018.02.21.11.21.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Feb 2018 11:21:36 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 21 Feb 2018 16:21:30 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Feb 2018 16:21:28 -0300
Message-Id: <20180221192129.2759-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [RESEND meta-python PATCH 1/2] python3-jsonschema: Remove RDEPENDS on python3-misc
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
X-List-Received-Date: Wed, 21 Feb 2018 19:21:37 -0000

The misc package has been removed when the python3 was reworked.

Tested using updatehub's uhu utility.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb b/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
index 5aaee682b..926990747 100644
--- a/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
@@ -1,6 +1,2 @@
 inherit pypi setuptools3
 require python-jsonschema.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-misc \
-"
-- 
2.16.2


