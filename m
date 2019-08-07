Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 15A507F456
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 08:32:17 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id p17so90429247wrf.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2019 01:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kEJ94NBOopzb/ze8WTx0+07n/sW0WO8G/Xlc5EZ2dJU=;
	b=X8X5HpxjHROhjoLKosh4KJQOA3GjH2mC7mrX+uf2VSN4FIY+KTlPiO8PAdcX53Nfaf
	0Rq3xkq7z2hptoWO3EUy0/PdkDdSyqC9tP97KJOrGTmNKNpT6oAaHaOHmz41Vwk1qeBV
	Vysy8gqMuauQfetiPulNgxl60Rnb2YF3C9FkJhjo9g4r1ao3o/e92Kw8lSEfy4Wa1YNq
	nNcNSBTU1UvUVDTonli8eZ1l25eBolbY26IExOjPS3ioQs3YAkSQFFkoH9tKtLxXl+Lr
	2/MUcT9vrvJZ2MYey+enGtiaUaHmiBXQH6RIslvsu77x1S4cMfG09ZZDywkidCn3m3rR
	m66w==
X-Gm-Message-State: APjAAAVE1Ghb3vHJFix7rNcIwKCTMwdvdTdsILQ6dGLz5ilccKXOk5sJ
	JtUygi5wFr2/2FQDJtfjzflgzA3d+6I=
X-Google-Smtp-Source: APXvYqzxdA7o3k3dB7OtHlzOGOZdp1QpGtaLF8gW1jpInpqGv/0I+F0s7KrjvEfwXjBLF62uSa296w==
X-Received: by 2002:a5d:4492:: with SMTP id j18mr6635579wrq.53.1565166738388; 
	Wed, 07 Aug 2019 01:32:18 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	f12sm99893502wrg.5.2019.08.07.01.32.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 01:32:17 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Aug 2019 09:32:17 +0100
Message-Id: <20190807083217.16515-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] layer.conf: ignore wireless-regdb->crda dep for siggen purposes
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
X-List-Received-Date: Wed, 07 Aug 2019 08:32:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

In commit bae481e9331f ("wireless-regdb: make wireless-regdb architecture independent")
wireless-regdb has been made allarch, but it depends
(via RSUGGESTS) on a TUNE_PKGARCH recipe (crda).
This causes needless rebuilds of wireless-regdb when crda
changes (due to changing sstate checksum).

Add this dependency to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS so
as to avoid that. Even though wireless-regdb has been
moved to OE-core since, we still add this dependeny here
(and not there), as crda is provided in this layer here.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-networking/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 67f58bcc2..6f0046cf3 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -23,4 +23,5 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   wireguard-tools->wireguard-module \
+  wireless-regdb->crda \
 "
-- 
2.23.0.rc1


