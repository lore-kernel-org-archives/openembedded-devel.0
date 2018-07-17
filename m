Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD457887F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 01:51:04 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id l9-v6so15556774pff.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 18:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uSW2WsGLzq0csiQHXskypkKv35zwnwLRQ9QfGJMAAts=;
	b=XhzHB3QcRisfoYgVec/Ye1EkYt/1l33WvEZRqpPBHhYyZsISOvkmZPLViUbEMxxTin
	QjfxEIkM6+jPR2mc60lJIvQrmEpkACgX0+/vbS5zJW8b3hJVCkG46VJMyMYYP3jstXmt
	JsnFik0opcgau20rADVymOHdbvIGA5pbwDNr1QdXLqz4aIEztIJcRGotMmdvZ4kcDa1t
	aBIX9mg8QmztKl/pIgci1ybcACAvhYIfiihia/VVf/Rs784O61kwy8/vBEum36HbVsvL
	IkjMXdSoLtdYTOic0z+K5fvPAqD/BWEk4BzHJJlsK7KAz5lyYchvyDZuB6LT5TR5wGI0
	nnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uSW2WsGLzq0csiQHXskypkKv35zwnwLRQ9QfGJMAAts=;
	b=aHDG2VHR2EdgmGun5RsS6f7B237qcGII0XTJHdVWUzNr283LCiANIoGQK1r3UmPa0x
	9BAI0OghqnTTUBuAijte2bvC0kYWpj2Gs1iaJtJXG+0PwTPz/INA2qAsVa3wTcSRy7fK
	NN6YoBmmgTmX5T8mXaWxabROHKrM5lBZ2xI+i1X38IACpOftV/v9EKfyWS2xtk02E2NT
	61mcoZZe84pOtv3IhSKFwmJ0Cgc1nIH8otv2PxB8MQGG7Hpa6rJ75SePkioAzrxhKGN2
	Pxy0Y3tC/ELaN7llztxNZhPQZjJkrYAFoHkf2E+2Hu77AF1IWL1MaB6fbKaJQCXy3Nd2
	ZvVw==
X-Gm-Message-State: AOUpUlFe4mOAevJ3oEoXt/F0i6DpdTcYOjXJnGlVYnVcAfvAyrYGUNYf
	UjraRkAQ7UQ4gveaIkoUsK5M5g==
X-Google-Smtp-Source: AAOMgpfDdwXvFg7LSKV/RcWqPzmstK7SEOpY5Mcy4G2Is9w6iwl6Jmj4edR3tQqBduPbZGhhd+qwfg==
X-Received: by 2002:a65:5086:: with SMTP id
	r6-v6mr17318653pgp.375.1531792265081; 
	Mon, 16 Jul 2018 18:51:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1736])
	by smtp.gmail.com with ESMTPSA id
	66-v6sm27878586pfd.71.2018.07.16.18.51.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 18:51:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2018 18:50:52 -0700
Message-Id: <20180717015053.8191-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180717015053.8191-1-raj.khem@gmail.com>
References: <20180717015053.8191-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] blueman: Package orphan'ed files when systemd is enabled
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
X-List-Received-Date: Tue, 17 Jul 2018 01:51:04 -0000

Fixes

ERROR: blueman-2.0.5+gitAUTOINC+c4a03417e8-r0 do_package: QA Issue: blueman: Files/directories were installed but not shipped in any package:
  /usr/lib/systemd/system
  /usr/lib/systemd/system/blueman-mechanism.service

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/blueman/blueman_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/blueman/blueman_git.bb b/meta-oe/recipes-connectivity/blueman/blueman_git.bb
index 884e9859a1..f479386c14 100644
--- a/meta-oe/recipes-connectivity/blueman/blueman_git.bb
+++ b/meta-oe/recipes-connectivity/blueman/blueman_git.bb
@@ -34,6 +34,7 @@ FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/Thunar \
     ${systemd_user_unitdir} \
+    ${exec_prefix}${systemd_system_unitdir} \
     ${PYTHON_SITEPACKAGES_DIR} \
 "
 
-- 
2.18.0


