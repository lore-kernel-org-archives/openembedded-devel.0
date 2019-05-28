Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 48E407DE8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 19:27:48 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id a10so12916ljf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 12:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YUAi9rk9JOuh0C8eZnumAU0AOjRK7/r+FCHdZg7ta0M=;
	b=nfrKCUWbmB5rH8bXPfNmaP1J42hcj3ELHqaTpl7gYNLsWwJe+oAlkPQn9cGU3dJWXv
	MIk5Nem7ZQUXW1hzuXrUPDyBuuKj6oFv3nvuIZft08HlirtqOb/vCPMtnoHhiscrSI2L
	BcbCyxJP4JDwwvtBkNG2PzY5SRbBkES2OYfmkepeSj2dW2tO4FIgpvGQklkala+/WZ//
	dgrCbAJ7F9YE1s/ArU72l/6FmLEBFIztDuBc9QIzDrBLMpJpfF/RRZPvKMeYq2qgXZab
	TGkgyGZTwhRoTm4kFSwpPh83mJqwSY60a34n3t9rZRiI32GUVeCmZb/9HF/9Qd+yzZsN
	UuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YUAi9rk9JOuh0C8eZnumAU0AOjRK7/r+FCHdZg7ta0M=;
	b=MAW0E4H9Ta1kNa4w2dJnVnt9f5FvrsGP6JRrf1kKTjJ/S1k/5U4pUuKoDi8eXKiwN/
	0vr0RE8VEUZdyMnzrhjEhSKth/LctHhMJ7Ss4tYGo1NqVKWWNtzXJsoakauB6GiuNoVb
	J3D6emCXkYyTxUnFXVW3UUhT9Y63s8NJN9wcY1j1RFNk6MP57VwyIlP5qbW/0oYm+PxI
	Dvz7pOttMgxqi5bQJzgcdUniMU2MQjdoHMS4T/sCoXZ7p3wrHc0ZfkY866bIRb/QY1sh
	AN1wVMAVzFbTyBNpBsXltLy3M28b+Xz60pJOtg96ZD+yNsuBPoI/7TVicujO5jyfpbU5
	Q4pw==
X-Gm-Message-State: APjAAAUAM1APVvRWbJR2rQuVcddOpmWstB9Uh30jvGOS6EK21uk/jMuk
	kUyido6aOPPKaOU4ETg69oJ7rm1QjMU=
X-Google-Smtp-Source: APXvYqwOG6TQ8h7F70ryrSK4Wf69kTIqC/oLmzzoElaRNRQm5gmz3KXUCPfFt41yNnkuOT/ZSLZCpw==
X-Received: by 2002:a2e:809a:: with SMTP id i26mr13553453ljg.182.1559071668563;
	Tue, 28 May 2019 12:27:48 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z24sm3014873lfh.63.2019.05.28.12.27.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 12:27:47 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2019 21:27:45 +0200
Message-Id: <20190528192745.15597-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][meta-oe] nginx: fix kill path in nginx systemd unit file
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
X-List-Received-Date: Tue, 28 May 2019 19:27:48 -0000

From: nick83ola <nick83ola@gmail.com>

the kill utility is located in /bin/kill -> use base_bindir instead of bindir

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/files/nginx.service | 2 +-
 meta-webserver/recipes-httpd/nginx/nginx.inc           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
index c6fc0495f..9a6ca9651 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
@@ -8,7 +8,7 @@ PIDFile=/run/nginx/nginx.pid
 ExecStartPre=@SBINDIR@/nginx -t
 ExecStart=@SBINDIR@/nginx
 ExecReload=@SBINDIR@/nginx -s reload
-ExecStop=@BINDIR@/kill -s QUIT $MAINPID
+ExecStop=@BASE_BINDIR@/kill -s QUIT $MAINPID
 PrivateTmp=true
 
 [Install]
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index d4c6e81fa..e202e8563 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -135,7 +135,7 @@ do_install () {
         sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
             -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
             -e 's,@SBINDIR@,${sbindir},g' \
-            -e 's,@BINDIR@,${bindir},g' \
+            -e 's,@BASE_BINDIR@,${base_bindir},g' \
             ${D}${systemd_unitdir}/system/nginx.service
     fi
 }
-- 
2.17.1


