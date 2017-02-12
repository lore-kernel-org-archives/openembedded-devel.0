Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED066067D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 21:02:37 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v77so15952148wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 13:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=YFrK8XPOgtah4bZUeTBo+aPVFV+XSdcxwk94alSp520=;
	b=RJvCiKVxvbO2NCzEZeoer8wU+IbndDbJ+hnQHUH1E1xYTbtzSI9/x7aL0gjQhYTmju
	nOQRJ9gTgW1ZJsymZhgQc6Kvz6C4Z+wEY2RzIcHd+VbgLZvq8t1GkSY8aKNbebAgXDGw
	V24EnbZukDK5efmaDNyV3G/L6DCuK3CoK0pacXz99glj5ICQAYyzVztfeQxOAq4G+4NA
	BPXqj7PLTBEmelsw1VELZ1Lv8VAoQHYAT/tfRHISqQUo8aeHFnAe/RK/Y88uZrJnNrZZ
	MgA/CBVQQA99Xpjo2oi62NO+UJUbdsTBcKBa+mNndo69ll7EHxmwy+vZfXs0QE/lxZJ9
	GDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YFrK8XPOgtah4bZUeTBo+aPVFV+XSdcxwk94alSp520=;
	b=cAE9CfyNfyQVkHhHZUz4/7QFde+6+N7m+9nwYWk1m/0nkTNZ5EEeQEG59NUOjf139n
	UyMxJ5QCtOoSjbA7wdu7G0bcGv1EhkFvifIYkj7a6XDZ24XLq7dlruWA6whDwCK54Ang
	N3s+VAg+E2u95PNVTmPeoJcertszGOXxBlsED5nDf1FWLtR1k/t+UF8YO/hBNkB7kDop
	K/EcaP5YJK8Em+yAx2yfPLD1cJRx4O2lL7fcY1aKvGPrY8oQpw7lCauc6+Bn21GbZLxe
	n6mkwCMU496d2dWg1kmXLrunFky+7Ug90ZFVVfM/g3SLZ9NcMVEnv9GCNkhMokHceQl+
	ZsIA==
X-Gm-Message-State: AMke39nkb0gZWdnDFffO4OeC4CYaG8+LmdzLPshZVD1oalQLCS8gFUdVwMc3fRz+Q8iDEw==
X-Received: by 10.28.191.79 with SMTP id p76mr34571326wmf.21.1486933357460;
	Sun, 12 Feb 2017 13:02:37 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91173851E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:7385:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	s18sm2688541wmb.18.2017.02.12.13.02.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 13:02:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Feb 2017 22:02:15 +0100
Message-Id: <20170212210216.867-11-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170212210216.867-1-schnitzeltony@googlemail.com>
References: <20170212210216.867-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 10/11] abiword: fix build
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
X-List-Received-Date: Sun, 12 Feb 2017 21:02:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index ec17c75..d13a273 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -47,6 +47,8 @@ EXTRA_OECONF = " --disable-static  \
                  --with-libwmf-config=${STAGING_DIR} \
 "
 
+LDFLAGS += "-lgmodule-2.0"
+
 do_compile() {
     cd goffice-bits2
     make goffice-paths.h
-- 
2.9.3


