Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id CF53E6021A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 15:49:09 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id t14so5647701plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 07:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xPpDTzoQEpgW7+bjxKX3V+cnLAZWqwg841TcPY/bhLs=;
	b=Jj0o+etRU5yEgUaQunPiPWsQqeWQ8LSXr8D7B/VD25trDWjcbuxqQTZxtZZ2qvKjlx
	C8sIcG23EOsgbCXG7Om/FL87MAzKf7RWtV6eFK5Y5NXr3zsRMV2w2/dj/J1saj2W23Po
	fSUoYbprzWPoksOmdm/eTaVpcvOebfUaJXte1lhxlTo26NPof3SHQuVEQzFuClqirWHu
	fZdVtpE2v4iEJMj+TZqfoW0X2wj9AGAw9UL7M82LPnlGsqm3VCmXGTS5pOb1+4EFaBEr
	br51NRyedWdg3ykA/1GuON2iMZJj+o9PSQNj1094K9yRGDxaI1+AKdGPcZCELfgpTdUm
	3Nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xPpDTzoQEpgW7+bjxKX3V+cnLAZWqwg841TcPY/bhLs=;
	b=m5qNGLgrcxVPH1PoF/PHUICK54gyQXg+/3suWPlw1uYijxN7NvDFvKoAMM2cx0JdsP
	cNhP7E7GEFi5IetY3XHnllGMNl7I14TjInLXgmeBNOT5UGalCy43ZhcO1mGQvfCDdIdi
	uOqsvT8MwZR0D/vzrQBe+3Q1wwJv9NrHE0Gbe2YMAUVuwFBM3euoXnabfP2tkjk6V6MO
	XBghD2bdQ+khhe66yBOi6tmG/GVwlVOqRHH9r26AeyaJ+lh4PNyN/taat4WVyAbs42Tg
	OH+PLBd2g7lZ8keqzRfUZtnG269mVnH4wD7MAeRtX70OmbILXJ329BBOQb1s4fm5mf8h
	+SnQ==
X-Gm-Message-State: APjAAAUZ+oj+0RxIhDPLca/EhDrXVkkaPZgz4L1scmSH7oKsG+Fxw1Df
	CARR+Qqg+Mtx7j0cNquErqIBsIaAWQI=
X-Google-Smtp-Source: APXvYqzQRJEdBjL9LdTBosFr3InZ5FdVd2KhwqrZ2kDPtXc97LdrK1ULKEpAdMjkJ5NhBMUE9J2QiQ==
X-Received: by 2002:a17:90a:858c:: with SMTP id
	m12mr5567771pjn.127.1582645750311; 
	Tue, 25 Feb 2020 07:49:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	m18sm16847030pgd.39.2020.02.25.07.49.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 07:49:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2020 07:49:21 -0800
Message-Id: <20200225154921.3743732-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] cfengine-masterfiles: Make the expression dash friendly
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
X-List-Received-Date: Tue, 25 Feb 2020 15:49:09 -0000
Content-Transfer-Encoding: 8bit

dash does not understand {} expressions like this, therefore simplify

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/cfengine/cfengine-masterfiles_3.15.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.15.0.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.15.0.bb
index 79269d3147..35ac855989 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.15.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.15.0.bb
@@ -33,7 +33,7 @@ export EXPLICIT_VERSION="${PV}"
 EXTRA_OECONF = "--prefix=${datadir}/cfengine"
 
 do_install_append() {
-    rm -rf ${D}${datadir}/cfengine/modules/packages/{zypper,yum}
+    rm -rf ${D}${datadir}/cfengine/modules/packages/zypper ${D}${datadir}/cfengine/modules/packages/yum
 }
 
 FILES_${PN} = "${datadir}/cfengine"
-- 
2.25.1


