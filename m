Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9A72461809
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Mar 2020 15:14:59 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id ay11so2962787plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Mar 2020 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ApPACrPDibXdVj8eypL3TJJNUy32QpHnQf+npJFgdqg=;
	b=iC7dxayvsEqSz0ijdzCV7agUbWIeGLLB2GKeL1wswd7ivyamRrx1uOLt3xm6NW3Uzw
	RESdTLFaCwEXFSWQ5oJsm7qhlRnoIYOF2QhaP3/N9TQVTPzUa58NRZjD3PBR88bhwNyY
	cvdUwfuU8cOVmbt9oVWFh0Yjhd8qIvpNsuD2+5CmAUnhbbEJzK8CxcXMwHZFgzGk5xWb
	/Ogx1y0cBhifLMXTCE9mT3Pe0XMgO9tgAmZX54bG1hZ7VcS5VRNxQY6GAzCUVWlaXGsu
	NhDyexTUdg6EeA18O+9/d+8dSIUjhZXaonOch/I6d/RTn0/RtLMP6G2HLRGIFgpMn66v
	+07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ApPACrPDibXdVj8eypL3TJJNUy32QpHnQf+npJFgdqg=;
	b=bDMaP4xVA1XGnPXne9MEDuHgxZ/pI6JM1q/kRMcL8SRbPRYLaI4pj/dzad8p9MuMF0
	WtkzH60XbG04IUicdmhTbSjEFiMocnfL9gzZe03LnrRtaNcL9oBg+eerdXPNcyQdH/Nl
	0pT/nJSZ6Nn6ZKWAnx8b9Wx9yjbDJ4HbLyFp/xgkgb16u0LEyoc7XjoTDOY8eYQdzDGL
	hXtXlfmDJSY0z6UgZnwq367Mk3fSObuC9Oj2ZPPHrDkDp/Zl09Ypax3+wn2/W6nk+EVx
	Y141RYpyirVCuj1y6l3Xa9wZwERP0oSKe76rV8bXSsT0qHjo8IPABn+baISF0KyJH11a
	WKfA==
X-Gm-Message-State: ANhLgQ1JBpSxJzHK913s7SCj3GHylu4zMexbjfGM2fd868SvJ29OpOnR
	ANJBR7IbParjvhd+vfjQot3r+wMxccU=
X-Google-Smtp-Source: ADFU+vv1PKmTlZ10lIXnZeLAZOTwqFpsFpPMGZ3MFSfT7jWNoYEbTc99rO2oEZNSDuWDZzyEvMUkuw==
X-Received: by 2002:a17:902:8609:: with SMTP id
	f9mr11616841plo.203.1583680500380; 
	Sun, 08 Mar 2020 08:15:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	d186sm23877392pfc.8.2020.03.08.08.14.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Mar 2020 08:15:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Mar 2020 08:15:08 -0700
Message-Id: <20200308151509.1573831-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200308151509.1573831-1-raj.khem@gmail.com>
References: <20200308151509.1573831-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/4] libqb: Build native version as well
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
X-List-Received-Date: Sun, 08 Mar 2020 15:15:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libqb/libqb_1.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb b/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
index 82503a168b..cd4019666d 100644
--- a/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
@@ -33,3 +33,5 @@ do_configure_prepend() {
     ( cd ${S}
     ${S}/autogen.sh )
 }
+
+BBCLASSEXTEND = "native"
-- 
2.25.1


