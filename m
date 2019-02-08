Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 71CDB7C4F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Feb 2019 06:18:03 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p8so1214697plo.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 22:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4HU0/0Lqmz2gOFi3gX4Zij4BUZkB6059KpAh2xvOaW4=;
	b=fX4y4xou2vz9gdV3zknRVlgdluJfkI0jTIGTJOXG8QFBaHkB1fG1a5wFX/HLF8ymtt
	kZ3cTLpfDYXg0VzRW4rStjr8GTDNki6iZJF3wrROBmwH2qJtLcALDuzDIuVj/opCWjnG
	BTsXO/ByD0uN6pMBv58/s4c7vgZHR/xwFyoLIcNjX+NM3MBezonmnOshdqP0YAg4WTXe
	p+w71DuIHNZckxy9I3u8NxBLS5nwXa36bX86v2luMtfiDjftc1+DWtNbH5xmdOSdPo0E
	VnfEQsu5PW3uaswd0IcO4vD3zafSZTYmWJ0BYOfQ39PUgvaw489mvGmXX9XKJSWZF0pu
	C0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4HU0/0Lqmz2gOFi3gX4Zij4BUZkB6059KpAh2xvOaW4=;
	b=ItTYTq6fzfBrwzNfup0G1qFdrhVzWfnSVqYA4kBYesrS+NqsJY04NtBhRZqe7j+oyx
	pGXX/sWwY1keL4iFCMm5xjEPftyZbMBmpdTJ4hHQiUctSln5YUqUSHHelE7ZN4kMEjdR
	FVVplICxVP5rgouuZkiIABCpRB/w3tuwZe/MnarHum79D+9hlNufJfIUSvxq2NF1juiE
	zApG/VK8QQHeD8L65oR6FZ2YNZM+VHvqdkETHTVXA0fHvFsKjNYs+TuZKrM1DX6BGc9f
	aU+NejNBCvYNvqnWNQ5Bbgp1UpYOKhNh+XmG7ATu9nPlcBA4zNee7uDcMTFqnNP3C0eP
	dN7A==
X-Gm-Message-State: AHQUAuZJoLxIKwzjzP07+OQdObxEpEryuWwOV/gcxMlCbVrtn0DhTH6M
	kl4Bi/Z2ID2VEgWdgq5d7l98IfWR
X-Google-Smtp-Source: AHgI3IY54SkY7qlzfCVXsb11JQtTFxxbRUDz7KXavnvXo8lPdtq7/ZE/vwdrCzbdFah4TSXq1za0Tw==
X-Received: by 2002:a17:902:296a:: with SMTP id
	g97mr21120829plb.317.1549606684073; 
	Thu, 07 Feb 2019 22:18:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id b2sm1139905pgg.87.2019.02.07.22.18.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 22:18:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2019 22:17:47 -0800
Message-Id: <20190208061748.21556-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190208061748.21556-1-raj.khem@gmail.com>
References: <20190208061748.21556-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 3/4] libupnp: Upgrade to 1.8.4
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
X-List-Received-Date: Fri, 08 Feb 2019 06:18:03 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/libupnp/libupnp_git.bb            | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
index 7a524f2d50..84fa41c290 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
@@ -9,12 +9,13 @@ LICENSE = "BSD"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
 
-PV = "1.8.2+git${SRCPV}"
-SRCREV = "56d6042abae861e8838a4e6b6b5b575b99e38f34"
+PV = "1.8.4+git${SRCPV}"
+# release-1.8.4
+SRCREV = "d5a01fc9895daae98a0c5a8c7d3afce46add529d"
 SRC_URI = "git://github.com/mrjimenez/pupnp.git;protocol=https"
 
 S="${WORKDIR}/git"
 
 inherit autotools
 
-EXTRA_OECONF += "--enable-reuseaddr"
\ No newline at end of file
+EXTRA_OECONF += "--enable-reuseaddr"
-- 
2.20.1


