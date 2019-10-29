Return-Path: <yann.dirson@blade-group.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id AFDD67FAA7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:46:54 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id w9so1633158wmm.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tG2fK1nmDYsLG0pDnBYs784JLtmx2wG0I4COq0ueisg=;
	b=mQajuFk5MK1msDWjpMNwgePVa4jumWYGXs0itw5gzXfvus/Gi0BrYMnvZVapeI19++
	l0tnRp7dROe1+inHXmFg1NPu1saZEdqSuUJkWn+cN7TaAHXL0g4vkQAN4JKgQ6eTPKO2
	jyCiMLWksMRf3k9drpyajYJ3YaW14mIORQqcRAHvtj/+0/yftUDR9RWTCqay2YWlav1G
	jfN5oC6510j3NRspWJlon6iC8FI1BEF5EibYLZt2JRXySefLn8LLE5Bn4D506sfX3SEo
	Qfh5bWSX9s70IWKRLeFMJg7JCXAfqddMlYmHsfPqEMNAORf0EQVtiwYmn2yXe58VIhlP
	cxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tG2fK1nmDYsLG0pDnBYs784JLtmx2wG0I4COq0ueisg=;
	b=uC6RsYGmg/qq51Pwrg0hwXRU4UVDZzKnGCZFyVxhgPlxqmdrleHY3h8U7Rw6xBdDSn
	2hEUiEx8pOmdenlzBl8kHEX9QIOfwQ+cpHiBock7xplJ5x5Ihq+umQLMos2nsN7Mqc4V
	WoZNOhHwetDhNVnoa1ZQ6vqLk4M10UvhFlUpCXdlzymYBH1iEHiPPpj+bWO3voHAklOn
	z+wwhQ9nDhaCoUEZS+2voVQRdCiG4r+vfs60QOBNfaDUBd5xQe+2jQmE6am9XOb58jx0
	l6sHKoHTLcCIdlbqZjMBkyLlkoW+/tZ+NP09so6EHEpPfl7Qb1LqTTl05fejkcsit+cC
	0sdw==
X-Gm-Message-State: APjAAAU+R11qj5F1hGpWQkgcpHUCVpM8SLuV7VVJMDl7Bqh0XLnX+bqn
	m0vPNjCcJm6HZVfrBK63WzbSkRHE3fYd9Q==
X-Google-Smtp-Source: APXvYqxmtR1AtNJOXy3EsFF7Ksugx/fUwL73/lCq3Qpae6+2x5O9n8bNcp1iDzi0ix9zooDcEs1FiA==
X-Received: by 2002:a1c:1fca:: with SMTP id f193mr2933603wmf.173.1572342414806;
	Tue, 29 Oct 2019 02:46:54 -0700 (PDT)
Received: from yantop.local ([85.118.38.73])
	by smtp.gmail.com with ESMTPSA id 1sm13672910wrr.16.2019.10.29.02.46.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 02:46:53 -0700 (PDT)
From: yann.dirson@blade-group.com
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:45:26 +0100
Message-Id: <20191029094526.26093-1-yann@blade-group.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH] mesa: fix meson configure fix when 'dri' is excluded from PACKAGECONFIG
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
X-List-Received-Date: Tue, 29 Oct 2019 09:46:55 -0000
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 .../mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
index 3458c19199..346b217585 100644
--- a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
+++ b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
@@ -23,7 +23,7 @@ index 0e50bb26c0a..de065c290d6 100644
  with_dri_swrast = dri_drivers.contains('swrast')
  
 -with_dri = dri_drivers.length() != 0 and dri_drivers != ['']
-+with_dri = get_option('dri') or (_drivers.length() != 0 and _drivers != [''])
++with_dri = get_option('dri') or (dri_drivers.length() != 0 and dri_drivers != [''])
  
  gallium_drivers = get_option('gallium-drivers')
  if gallium_drivers.contains('auto')
-- 
2.23.0


