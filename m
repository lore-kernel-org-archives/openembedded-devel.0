Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3BB7E553
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 09:25:06 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id d73so5033505wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 01:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Crc2ZmKrAap0tjBlMryeKuCaoaF85S+2VZz5RRrVcEk=;
	b=CLcOXcP+sCN4rQ+fhY7Xv0aGFxRks7E5pYA3I05iQyxFQbggBcx2kmVgrHBu3jfCJt
	JepXO8bG2GNl+UMQzEkcyiHwhW/F6l1WJo7qsVDwRD4/VG0pPKE7vVFI/RiPtTW6kc1V
	5BCB4C5gSBCx80HkrmDH9eCkw1yPqv8dJpMYh8Qo+rXG77M5WjEUnM4jpdQyMuDu1KJw
	mSeYEh7eGyEIL9fukxtgYFjQzmvNNrEcaxeBFRKYfzh0e5kPiODkLtgAQwdjoQ1qNm9/
	kxfYfW85Dss94gxzZCKx4zkVChpJvE6lorUU6dXnsnRolFYvtZWuOIz9IXrppIRxxG+D
	lYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Crc2ZmKrAap0tjBlMryeKuCaoaF85S+2VZz5RRrVcEk=;
	b=a6kFtbKPg3YsAq9Hjm3bxaQ67aEGnSBSnwg1rzpeEctg22jcLFqXctMHp+7rphExvM
	JhkxXCagoD1VruzvHrPYBS229ErZVOr59nFnr6cHzyB0QCq8gHwkhhMkzSTVS7+ubBzE
	Avc8nMjJ3zrGcsCvcQDpuUufVXI9yj/6LhZdSpFG8A+PJelHmLTRrob8/XY9KgIXMJQN
	Pvkc6B5N2kEfzPY0Ds7zYw06sX2cJ7+dc6Wv5ouoTaCVWEJIXyDmMLGAJRBa0uVfxVIG
	3blkDw/Hvcn0rSETZoOjwJgYUc00oyUy408GF8SZ7xUljBfHs3SuxKJ9lRZdtMnj7qq+
	HBVA==
X-Gm-Message-State: APjAAAXzKcPi9JbYo3FxnHgJgKb+VwshkdPWvYYKZhCaELOyieqaPPD5
	xCw9nGdJxDXNT36STBqH31D7LfX0uMU=
X-Google-Smtp-Source: APXvYqy1c1trwjVx+/f12LeTBDuJRh5HZQTNL/qSRqcsDx/zmYxxcZwJf0+TnvsW+EQQjJXnDVqnyA==
X-Received: by 2002:a7b:c216:: with SMTP id x22mr12932035wmi.51.1577957107415; 
	Thu, 02 Jan 2020 01:25:07 -0800 (PST)
Received: from beaker.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112]) by smtp.gmail.com with ESMTPSA id
	z11sm55689307wrt.82.2020.01.02.01.25.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 01:25:06 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 10:25:02 +0100
Message-Id: <20200102092502.7494-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-oe][PATCH] libstatgrab: add logging/tracing options
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
X-List-Received-Date: Thu, 02 Jan 2020 09:25:07 -0000

Introduce opportunity to enable/disable logging with and without log4cplus
dependency.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
index 4ede3c8c6..c61d7c99d 100644
--- a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
+++ b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
@@ -17,6 +17,11 @@ SRC_URI[sha256sum] = "5bf1906aff9ffc3eeacf32567270f4d819055d8386d98b9c8c05519012
 # Perl5 is for tests only
 EXTRA_OECONF = "--without-perl5 --with-mnttab=/proc/mounts"
 
+# use with caution - default properties are configured to trace
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[log4cplus] = "--with-log4cplus,--without-log4cplus,log4cplus"
+PACKAGECONFIG[logging] = "--enable-logging,--disable-logging,"
+
 inherit autotools pkgconfig
 
 FILES_statgrab = "${bindir}/statgrab"
-- 
2.17.1


