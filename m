Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 989FB71BFC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 00:34:49 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id g21so13142707wrb.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 16:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3i87hE/GPY0tG+WMEs4CiMj7KycMgUSjTfoW+9XsWR0=;
	b=dIzWW69TdcnrBZmmdYaUBDI6QPhc8A3Ts9GxNdhYwYNLXaAJcZ/+Np3zy+54Qtf24f
	2GnK08PC6Xawd+MmhAHzNJF2XWxvHWrKlfGAJ16/dgk/aphM/ZIIYZCIE733JYagWDWP
	vQS9B5goO4dbbyyMhA5MbhPSKA+G4vSBQDhnAimhperYIwIlNBbYT4BPQcwr4fDLU/WW
	RpOjFO53k0fRs+VzIkNBJNlq5fJV9o2l2ngFf/mja/sKvLYzjajO/BEI6SEoQhXlHA3C
	5wSqwre9RPUlSC8xaepdTZC19onb+CuhWsY4Lv+pnNrydMKiLLHNr0eZ4pnQF80AIKSf
	y2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3i87hE/GPY0tG+WMEs4CiMj7KycMgUSjTfoW+9XsWR0=;
	b=lVRnK2dN7EmctQfJff0ANx6KM2HFLt7/BP0cDFZYgKB9agbMwrfPnjIs2H9oHaWQbV
	32UVKhgum5nFHVaH9z2K2DoWmW8y4NXqbYvG+qp1Vzg4/aGcfR16L0WvMYbPAn2xf6Vk
	m+746x0giMwBXLZN2nL2ElGUWS6i3cRIVtYLi6Cnx0iixHxTCpRuTf9Ue9TXGsEk7xKF
	mkor3TTyKYZCurEgB52Sju+GUjf+Fwvx1OprJsn+gQ+RbmEEgVUNsdO9kDvuzzQ6xIZ9
	GuqY03NVdjj9KmQ22EejYdyazipJrnCKWPvVxfkmFzKBknRncFC028+bPQ8PIlcUxRM3
	2DDw==
X-Gm-Message-State: AKwxytfCvJXx/L7mfWNtOlsK1/mGmd2nRY5e363nARRNlg+IAwOHPOO/
	LMF2uA/9ede+QfOvy1AYM/fOrg==
X-Google-Smtp-Source: AH8x226MQULkIZI1tpAKOdq39xAotUXeiirXOossPvptiIH4ADwYQYXNUGv2CykCempHT6sOfMyvww==
X-Received: by 10.223.182.153 with SMTP id j25mr25838536wre.43.1517358890107; 
	Tue, 30 Jan 2018 16:34:50 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r5sm16989418wmg.30.2018.01.30.16.34.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Jan 2018 16:34:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Jan 2018 00:34:48 +0000
Message-Id: <20180131003448.5471-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH] zsh: fix base_bindir installation
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
X-List-Received-Date: Wed, 31 Jan 2018 00:34:50 -0000

* fixes:
  WARNING: zsh-5.3.1-r0 do_package: zsh: NOT adding alternative provide /bin/sh: /bin/zsh does not exist
* it was installing zsh into /usr/bin even when log.do_configure confirms correct path:
  installation basename     : zsh
  binary install path       : /bin
* no other files were moved:
$ find 5.3.1-r0.*/image
5.3.1-r0.new/image
5.3.1-r0.new/image/bin
5.3.1-r0.new/image/bin/zsh-5.3.1
5.3.1-r0.new/image/bin/zsh
5.3.1-r0.new/image/usr
5.3.1-r0.old/image
5.3.1-r0.old/image/usr
5.3.1-r0.old/image/usr/bin
5.3.1-r0.old/image/usr/bin/zsh-5.3.1
5.3.1-r0.old/image/usr/bin/zsh

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/zsh/zsh_5.3.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/zsh/zsh_5.3.1.bb b/meta-oe/recipes-extended/zsh/zsh_5.3.1.bb
index 1f5e390000..96d21a8b34 100644
--- a/meta-oe/recipes-extended/zsh/zsh_5.3.1.bb
+++ b/meta-oe/recipes-extended/zsh/zsh_5.3.1.bb
@@ -30,6 +30,9 @@ EXTRA_OECONF = " \
     zsh_cv_shared_environ=yes \
 "
 
+# Configure respects --bindir from EXTRA_OECONF, but then Src/Makefile will read bindir from environment
+export bindir="${base_bindir}"
+
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 ALTERNATIVE_${PN} = "sh"
-- 
2.15.1


