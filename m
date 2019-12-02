Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 11D7C7EC47
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 19:32:23 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j42so579220wrj.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 11:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bTC0rxeppXhu/AiSF5tlHEQ/g6Skb10//93TabKCaWo=;
	b=CVj0tRxlg0FG0QUZ0hi09ExLhMOxIA3LVHN6QThJ0Rmw83xPOMtqUYf3OVTbCHPjJN
	D1hMVaSIsCN5ScfAcKh94PLEio9CQU/1uMyKpNnfR7bRPEBGW9io9PiUPegesV7KpQEP
	aAB7GxwaF5ghp6YAf9oR/meCwk4m3wsvzb4qSm/fhAvTzrW0PxmFy3Gsn3zuAygz6dFz
	QB1PeBD/o8pnwz6xtvUFhArmzhJHceEOfIpV16ldVFlNO3dR3aGCy1G3FekVDFfv9Wx+
	uCNQF2MT14HAJzY8VZfqPJjf/TX7KX8DDtOwyeIjm0R4IUTlBQkG2Fr/zs81yWM4CX6z
	xHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bTC0rxeppXhu/AiSF5tlHEQ/g6Skb10//93TabKCaWo=;
	b=m8zabOLnPv/e3SqTq5PR8Q53rQi9ESqOG6scj9luZ+9idkAYVw8YKnVcKrXeXNao7D
	EfvqMHSQ/TIv5AKCpu/L/RHN2ELP0colfw7A4RWCxjuZplx2aaqq+ijfYks5p5xbop4J
	0VK0aeJ9odWTpCsDP0SdOQCeBGm9Ss3LnncJ5zghfnw6+rANvIxmK8cZ4v1Jp99HO9l1
	8qAX/7tNPWjdYIzPu1CYDQKSKy06Jy4K2GR/7nVI75HgZCEksyIJ1GCYpujfFDhd0ByG
	xQa7o7uAyjfwAYabCSCdpYlyweN3GnqFaFhtytC0GANEt3ApdQIRL7Fxtc6PUBZw/QgV
	JvPw==
X-Gm-Message-State: APjAAAXzAIwqMIbOyguJdeEswGOhV1cNi6ngIVr93bBSPw81ttp8UiUu
	cJ3k5NdkVkekqY+cNAlDG0K74D9Z
X-Google-Smtp-Source: APXvYqzZ7DEyTCNf/ouaW3Zbro5sgabT5vM5rHEPZ5DxDWEHMuS42NUkmb4NSRG+TUM6AIKh1fdPuw==
X-Received: by 2002:adf:da4d:: with SMTP id r13mr635610wrl.307.1575315144516; 
	Mon, 02 Dec 2019 11:32:24 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id n3sm447007wmc.27.2019.12.02.11.32.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 11:32:23 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 19:32:16 +0000
Message-Id: <20191202193216.12156-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] nftables: Fix documentation generation
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
X-List-Received-Date: Mon, 02 Dec 2019 19:32:24 -0000

Switch PACKAGECONFIG from man to manpages so we are included when
api-documentation is set. Ensure correct tools are available to build
the documentation and avoid unsupported option failures by not passing
`--enable-man-doc`.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-networking/recipes-filter/nftables/nftables_0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.2.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.2.bb
index 98e8050b814c..0c57e7255eaf 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.2.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.2.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "5cb66180143e6bfc774f4eb316206d40ac1cb6df269a90882404cbf716
 inherit autotools manpages pkgconfig
 
 PACKAGECONFIG ?= "python"
-PACKAGECONFIG[man] = "--enable--man-doc, --disable-man-doc"
+PACKAGECONFIG[manpages] = ", --disable-man-doc, asciidoc-native"
 PACKAGECONFIG[python] = "--with-python-bin=${PYTHON}, --with-python-bin="", python3"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
-- 
2.17.1


