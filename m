Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 719767C86A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 23:01:10 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id r12so14678988pfh.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 16:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UeehMWrDjE6mfSYjYd9gElEaTGunrjqTnkgrKtBKMMU=;
	b=BDnvqBbYxiUp8qm8i8mAHX5o9kPMy7LgcgpdLMD0/5RH9J51L/gNhzbBQ2YL3LiY7C
	x38eQOkAVV5uLcRwFCVtUNvFEhS4+MnTZrJ56e/0frl019EQSKotZyaOPKp+na7J5JIB
	haCcV8p9SboGuA/1EKet+DfdpXgzFa++XcKM/JgD0xAa+Xspntmof2Nh5DMivlRVi1Nx
	KXojyOtFt/2xcemlw+ur4bajCYHycw/a/1bCG5pbVqQ+61SEWUtcHW5qIMa5pPICh2BK
	eGnWylw/ZMn3cRLJW0GmvWp1qpuz/lQRxLU79mYPSuUmddqGSC9XKtFh0xKhhrqZZfFV
	TSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UeehMWrDjE6mfSYjYd9gElEaTGunrjqTnkgrKtBKMMU=;
	b=GS8MtyU9OZMnlKIvFDuYQ90GIgmgQin8IJti5nSH0d0TYnjn+YnhzcNU+i/9zIgBoA
	Cg3V9l2BBuTGT7NFiTPfTW9vsSc4zDJmEqItqOUrypu3W3YtxZ/X2NzVDap7f9wXWtY1
	6WsqdDHJoFwD9sHVPdiDH/FpRV7vzUiVpa8RtSQo/woTwgZpcQm4gF8xWD55zKxlj7hh
	Jvrcnk7DVp5J9o/gc/bTekEMfTouMJqd725Svnw75irHylEoGqprYwW0gh5qeRxXVs2Q
	0AXXDxL7tZpjYqn3fhduiSzBiAZxDQrTyBHx8mF4cLUaUd93/pKmImNwoHHOd3cpY37P
	AyiQ==
X-Gm-Message-State: APjAAAXYc06OeYr3oasM+4T+wjJrq2Kx5ozWQQenkTDkaJzr98ILm6B0
	7pTsBHQMFJrKsLlLNmXsOQmIvE/6vNQ=
X-Google-Smtp-Source: APXvYqymqpQRM978vLYdbYVYl9KM014J0/gNvvJxJWzfHtWdaV6X62YteSHjOqc+fNmNPEIRmf8Jtg==
X-Received: by 2002:a17:90a:aa82:: with SMTP id
	l2mr8517514pjq.73.1568242870857; 
	Wed, 11 Sep 2019 16:01:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id g3sm3104552pjx.32.2019.09.11.16.01.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 16:01:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Sep 2019 16:01:01 -0700
Message-Id: <20190911230101.1628610-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911230101.1628610-1-raj.khem@gmail.com>
References: <20190911230101.1628610-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 2/2] gparted: add to deps instead of overwriting
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
X-List-Received-Date: Wed, 11 Sep 2019 23:01:10 -0000
Content-Transfer-Encoding: 8bit

Thsi recipe inherits gtk-icon-cache which adds hicolor-icon-theme to
dependencies conditionally, this however gets lost if the DEPENDS is
using = instead of +=

Fixes

ERROR: QA Issue: gparted rdepends on hicolor-icon-theme, but it isn't a build dependency, missing hicolor-icon-theme in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb
index a9f6993fbc..de143b9c87 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "2f481ad34decb7021ca04ca305e79e7d"
 SRC_URI[sha256sum] = "5023b8c983f88a22e65bf6f09a12ea09369defc008981b52ee8b96a3879f81d6"
 
-DEPENDS = "glib-2.0 glib-2.0-native gtkmm parted gnome-doc-utils intltool-native"
+DEPENDS += "glib-2.0 glib-2.0-native gtkmm parted gnome-doc-utils intltool-native"
 
 do_install_append() {
     # Add a script which checks if polkit is installed.
-- 
2.23.0


