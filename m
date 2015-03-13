Return-Path: <iwamatsu@nigauri.org>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8CAB060034
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 01:49:36 +0000 (UTC)
Received: by pdjy10 with SMTP id y10so24650358pdj.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 18:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=ePHY4/k0H770cSp1hgUr1j1DJcXNvMWnxrXtaop+G0k=;
	b=XfqVvPnn+Jv9BjgRM4Mb/0xyyAVl4DKXFzv6jcjHx/Yv1Cqgi5b49TV7Y5tNfoSzge
	ogVGXErELOKVRDt09aS3U3WPwvNECop0tp9EtvytoI4OqoQxKlw6spd/Rs49rPOGnIw0
	pK6i56lNrMsowAWdz+Cq0HXUJ+gRyKuTKIdC050K/zwpt4xF2TSjpwbGwQMYyBvcAhwZ
	yNDNeRbjS2E9jcmnq1qTzJx+QnDNyhwF71AXr4NwsAKN2FmpFp8+oQ8XpfgqsAOx05bD
	I8c8nLKtacUI3GpF4gM6BIdP5X8AWYdsq3YI6wqf7oFxFGK+cDsqe2EyDRYrRGZEoE0b
	AIBw==
X-Gm-Message-State: ALoCoQnqAtxiLtOrZGsDF/bxeJAsuK2oqEFRolx4QE5eh2VulHRf6oImqkFCA5gvfbWDKfZdygzh
X-Received: by 10.66.221.8 with SMTP id qa8mr75529343pac.62.1426211378131;
	Thu, 12 Mar 2015 18:49:38 -0700 (PDT)
Received: from xps-iwamatsu.renesas.com (49.14.32.202.bf.2iij.net.
	[202.32.14.49])
	by mx.google.com with ESMTPSA id x1sm563561pdr.17.2015.03.12.18.49.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Mar 2015 18:49:36 -0700 (PDT)
Sender: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Mar 2015 10:49:26 +0900
Message-Id: <1426211366-30597-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
X-Mailer: git-send-email 2.1.3
Subject: [PATCH] can-utils: Change protocol from git to https
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2015 01:49:38 -0000

gitorious.org that is hosting can-utils has stopped providing git protocol.
That https is provided instead. This will change protocol to get can-utils
of source code from git to https.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 .../recipes-extended/socketcan/can-utils_git.bb    |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index d8de9df..1f7f751 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=43;md5=390a2c9a3c5e3595a0
 
 DEPENDS = "libsocketcan"
 
-SRC_URI = "git://git.gitorious.org/linux-can/${BPN}.git;protocol=git;branch=master"
+SRC_URI = "git://git.gitorious.org/linux-can/${BPN}.git;protocol=https;branch=master"
 SRCREV = "67a2bdcd336e6becfa5784742e18c88dbeddc973"
 
 PV = "0.0+gitr${SRCPV}"
-- 
1.7.9.5


