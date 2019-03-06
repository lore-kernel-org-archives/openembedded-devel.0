Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 80FD17C793
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:45:58 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id q17so7613505pfh.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dCvhblyl/K77KUyUHRknfO3et0P93hGJEJEJuhiItsU=;
	b=VT9Z+Ny+duLHwhYPgC2V6H5Lk/LjrO+JciNGYF5hyuAIX6oTbYdgoobY1mpDMqmQ/m
	TRvISlrTcVgB9w6MB2rkGYmVRNHZYAeF0fsVHsOBAa0Sisc4h5lW32fu1z+oGzRZHtw2
	jOOZaC8f/gEDxjtCqkOGMuismB8phXBi4RLKfpDAiotIM17RObkb+f5KBTeSC+L/jI9O
	qjeQVnzlixOLMc7czHURmW340Y+gLxlq5KvZgYd66asJE97eOAF1lLJJMqZzyoq1HlvO
	ue+fC4IAXTI99Vvkar5wkSpKNRlCoHeu4Dw67J3HYlSzlQoseR/rQ3bpb1bNCxbXNsOq
	DOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dCvhblyl/K77KUyUHRknfO3et0P93hGJEJEJuhiItsU=;
	b=WLz4hcVgePgtmQjxxYOT9R7ud/wfZ0K2eMwakYshqbTV7NsZnM+BEOrwD1jYOL0bBq
	Jt3eFALmeV+6dqT/7xfD0RuyfEAWAkgnfYRrHU3NbhEP7n7pRamHglO0nBpMhKxzYuVr
	UCdGwtEy6QKuNAVDoyB8tJd/JkjKAEAzvzMnyaqZn85Fp9q/7xBbngDuhtSftAcMs4mf
	S/2HAlHTSY6m8P9ddcRZL7ucuGT0pMDE2UGIpqvWzs0lriOJBXv4BaCb8FXmPy7KjFgW
	ypNsFKQwYggJ9FB3E85pEYx2djHf270PNddJH++22rEka2rIvzipDv5jgpQimQ5lp/As
	qbyA==
X-Gm-Message-State: APjAAAXTYuhPB9UHuaeIlt4fJZaxaVwvWVolX/s2Jvv5w/4nzj99ILdD
	IrFnukmUZZLsYkeI3GZKjJ49ekcO
X-Google-Smtp-Source: APXvYqxH4zqAZsbThHJYwTcXpaQRcFeJAAgZlsKMyP/wH8SBcxrzLH3+0HtY0KZBKDIDTLQf9BHDDg==
X-Received: by 2002:a17:902:7b85:: with SMTP id
	w5mr5258816pll.288.1551851159030; 
	Tue, 05 Mar 2019 21:45:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id m24sm1001144pgv.1.2019.03.05.21.45.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 21:45:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2019 21:45:42 -0800
Message-Id: <20190306054548.16430-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190306054548.16430-1-raj.khem@gmail.com>
References: <20190306054548.16430-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 06/12] inetutils: Fix build on RISC-V
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
X-List-Received-Date: Wed, 06 Mar 2019 05:45:58 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/inetutils/inetutils_1.9.4.bb           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index a27dbae2e6..453f485d1c 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -54,6 +54,8 @@ EXTRA_OECONF_append_libc-musl = " --disable-rsh --disable-rcp --disable-rlogin "
 do_configure_prepend () {
     export HELP2MAN='true'
     cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/config.rpath
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     rm -f ${S}/glob/configure*
 }
 
-- 
2.21.0


