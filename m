Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF2977227
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:49:33 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id c4so3613105wrd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 13:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UrXvWc0votf4myiqfDZVRDratlakp0A3fkXZukNRFgA=;
	b=kQITnf2u3Q8r4vBY6FeSW4C5Z8Bz8jzUOozwmCUpbjx11M8mSmp9F8C/mwAjwaBiKu
	8h+irdatwrOgQ9mlaPeIZ9qS4xDVs8oCqOda47L+JlwImSQs7CB0VBNCb7yz9N0397qw
	aWHCoO7Ey4eqx2t6Br+/Tl8XuIaaXwG2bzovDLMY9MRn6Fc8gSG+4BpiXFYxnv5d1rHx
	j3cOZ2uXl19xN9EXan2XFJUyxq6XrsmLB+QTEETBBm3ibQgsHTMfp6yy0kwWcputHwyD
	mGN/K+jwYvRULeUbYbUOj2iqWU4pCpUJt+5VnLwrsQx9MGRgCpsmBfhV7/PI4oi2lh+J
	t3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UrXvWc0votf4myiqfDZVRDratlakp0A3fkXZukNRFgA=;
	b=lsVvntZjuDmOjj65hUp7DyYDuYx9nyJ1YgYbatA4aT1FDPHsNFOzqoAxSngTd/DSeQ
	nuOfmJ1k30v2s3agYeqWAzAgBF19KJzttd2PbosTc9RDu8LJyclTLJ8cDYiMuYzzM6o5
	sbP/HWqOgVNj2osdChE1YX1WKOZlCogpAJemFEUaGonsVWJwj3GG/muYyEEal72qpHYS
	0lL96IU/v9ddUq+H+pt4554Aies0jhb4oIHkzXH2IwZRWhwgLHKc9mhFEMoxRqRLx65O
	LGdY2z9RwFRQFmBUfSS7n+OBRERAQTDTTkJAbZLSG/xk3mzDJWZ7CL76iryZprLOYwQf
	GY/Q==
X-Gm-Message-State: AMke39kOvZLJLfxH3d5Xb3fvU46oyKW/jURS9kXGTjPidDjWK2y/u+uV1vy5f0X5AFZMbw==
X-Received: by 10.223.167.71 with SMTP id e7mr27334796wrd.154.1487108973987;
	Tue, 14 Feb 2017 13:49:33 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	u47sm2355480wrb.15.2017.02.14.13.49.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Feb 2017 13:49:33 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Feb 2017 22:49:01 +0100
Message-Id: <1487108941-20285-5-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1487108941-20285-1-git-send-email-max.krummenacher@toradex.com>
References: <1487108941-20285-1-git-send-email-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH v2][master-next 4/4] openlmi-tools: remove blacklist
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
X-List-Received-Date: Tue, 14 Feb 2017 21:49:34 -0000

Build is fixed for pywbem, pywbem-native.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
index cc8e829..b23869d 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -21,5 +21,3 @@ do_compile_prepend() {
 do_install_prepend() {
     cd cli
 }
-
-PNBLACKLIST[openlmi-tools] ?= "Depends on blacklisted pywbem"
-- 
2.6.6


