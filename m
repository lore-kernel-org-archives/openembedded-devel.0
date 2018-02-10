Return-Path: <bkylerussell@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8156C783C6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 15:39:44 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id k8so2839623pli.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 07:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=V3wjDN1/dht8zPSAkb23zSQi1urhzG4i8KF3rMr5B5U=;
	b=cmzuE/ZFCMr8DRpS++SmlAas2xEwEU0ROm24ioeIP098NuWWacr7EZ/mIqSNKeqqH8
	UFLmE9ArZ2fQMCMbbIVMn7dMz3Ew9u0uhZD/nNB8D9zJTSlR+9qIL1yw2/bxPac0axXr
	ZCjNbiG4aDGmvzYrS186KVXneBpGq8wk48WSPPkJw5X/RZMUyFXV3E4LxPVeQf166zVJ
	kALhk8qsIHfjVoAiBlQrp+0v2tm4CN84SSlftRfKXj8yPIqenqprcIRmQ9lyl+IQBsgj
	Gdst7E0a1XO9P/6Ur8pdkQrXdDpSbGADZ0t6HcDRe4aq/UnucDTkmNOvpXwq1CUAUh9X
	rTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=V3wjDN1/dht8zPSAkb23zSQi1urhzG4i8KF3rMr5B5U=;
	b=XCqB/t/5BmaC7fFALW9FuMiZYHqjvkZIpQwk4FpOEAvXipEZy6qVkM+HIxfkszX4hQ
	rQUsleD3cR+rd2wkK+S2isAMYu5vB0ITDvAvNIUFl3wE4UFbIXEhZq2GvgAJXeSW/Azs
	0kzLsbOzV5nPJyttKhxEu4mD/5UXHHTimj4KTfXFBGITeY2uWXoD+qfgUm9XY3U0Q612
	lmMg2Zgj8z4yyyyPpIUqcPdzOOFzlIrxclIEo6kjNnPdq063BoTm9tBhV7b5wFQBjqDj
	mctCWd1U4a3vBBDWeYZdeELgcb3JdBut0RAEMCrJdDeAgs1/YAmTd9vw51yBR9Qplk9e
	2e7g==
X-Gm-Message-State: APf1xPBLUnDGo1023M3DvEVOz1eAlWZGfAQLdSQ+CIegXjiYmX3wqisH
	qCwqMgOuLV+9iHnaqZff98D3VA==
X-Google-Smtp-Source: AH8x227u2qzpUbspE8Od2MUF/jFz2iM4YdzCliNv+KyxdOQcRhsaddromcWJ1FFDoZIexaqfbpEGZg==
X-Received: by 2002:a17:902:44c:: with SMTP id
	70-v6mr5754662ple.221.1518277185471; 
	Sat, 10 Feb 2018 07:39:45 -0800 (PST)
Received: from brrussell-Latitude-E6530.lexmark.com
	([2605:a000:1707:83:1c32:53d8:cdda:b72a])
	by smtp.gmail.com with ESMTPSA id
	u84sm12476173pfg.10.2018.02.10.07.39.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 10 Feb 2018 07:39:45 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Feb 2018 10:39:33 -0500
Message-Id: <1518277173-32712-1-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] waf-samba: skip waf_preconfigure() prefunc from waf.bbclass
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
X-List-Received-Date: Sat, 10 Feb 2018 15:39:44 -0000

waf_preconfigure() fails in samba packages because wafbin is packaged
differently, and we already pass bindir and libdir through
CONFIGUREOPTS.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta-networking/classes/waf-samba.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index e490176..94ecf4a 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -42,6 +42,7 @@ CONFIGUREOPTS = " --prefix=${prefix} \
 # to help generate the cross answer when adding new board support.
 CROSS_METHOD ?= "answer"
 
+do_configure[prefuncs] = ""
 do_configure() {
 
     # Prepare the cross-answers file
-- 
2.7.4


