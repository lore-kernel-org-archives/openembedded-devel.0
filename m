Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 576887E069
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:58 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id f97so7724269plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wuHykQuzBP7aQ03bAZLrhus5Y0d/hclhDU6OmSfkbI4=;
	b=mER7VChU54UCwYtkEcSFS6IxCH8hBVOMXffg5tkpxd/Ch4hAdDnF2EccJhId4lcyIb
	qqB59KNYfVXyYDu3PZAX8aPCeU/x8tSLoiUG9ccc0pHxGgKRanMcD/Aeiv9wFiNTqI0c
	UWHBdiYOWxtvHgv6sVceZPrcmf+4ODWZu7XxYdjy+sNsspO93C7tWRR6cbGhirKjVcSd
	vUWPMUajAxf+D0qX/7b9SV+ZxstfHSMs24D0dv93t1Ah4vaK+CwvpzEgrkmjYHykcFB3
	ezdnUw2VygQDmKc7ZQhnkByi+8fUP9xkjckCM/DnCcY+JILc8mZr+6Fb8cFxlI3WUdJC
	5L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wuHykQuzBP7aQ03bAZLrhus5Y0d/hclhDU6OmSfkbI4=;
	b=Kal+fF4WG+WzBXITXVIoAzbFBKlPHrfAYjzWkl8yRgGUn9ca3WLDgzBYuxL4Eq6P9E
	0LFs9szxtBmYYdRJGkDXqyjXVHAUNPP0tRIDUlm8ca7l0mfPpTKGuf9elelUzQ65xLvI
	WWfS2hvTjfkv0l3tDa+6kWqEMCyHPCQNd/eZmSQ8TRGQMnDzCmxLetCuaoqsu+9JeQZr
	0ZWxnut5gvdNHo/KyRw0M9DPDgNiQoIPQJpkm1OZXtkoCUuWNDcjOh4dDgWP/xkgIj7O
	U0KTwHlQRXsQwa79pDgKYUB1n5aSFP6uwOXUJx93QHRpo83AABRuyhXhp1v3TL6xT4AZ
	XgnA==
X-Gm-Message-State: APjAAAVL/1U6QCO+8V6jy4bqFf6qKAUv0IbOtnBtISgIFugS75dtEyr5
	CBPhJoRXcnYH9qOSkMjuF2MzIAZT
X-Google-Smtp-Source: APXvYqwb+rYmCtJ8xtSCrDYsgnN04BdUnGqytDAZiUtzLM7DGX9rhTzR2x4Se/6xbbacqufkIKK2Kw==
X-Received: by 2002:a17:902:2d03:: with SMTP id
	o3mr44457310plb.309.1558411019399; 
	Mon, 20 May 2019 20:56:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:26 -0700
Message-Id: <38cbad0c522029d08226f645e977a5652376547c.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 26/34] netkit-rsh: add tag to CVE patch
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
X-List-Received-Date: Tue, 21 May 2019 03:56:58 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
index 4381f5b..285667b 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
@@ -10,6 +10,8 @@ Origin: https://github.com/openssh/openssh-portable/commit/6010c0303a422a9c5fa88
 Upstream-Status: Backport [Debian]
 [https://sources.debian.org/src/netkit-rsh/0.17-20/debian/patches/fix-CVE-2018-20685-and-CVE-2019-6111.patch]
 
+CVE: CVE-2019-7282 CVE-2019-7283
+
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  rcp/rcp.c | 5 +++++
-- 
2.7.4


