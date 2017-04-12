Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 059F177DF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:17 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id l28so5818584wre.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TLTPX2eA7dUT/aps5MRuhthd1ANS9jO78Jn/I4w0GmM=;
	b=BQpvwGK3GOWsxb12KR1C3IhJ8sWio7mjqJqEMUGiJD8rjVFCYShkMMyigEwcGnTClK
	Gtdefn0hYmSTkB4VhwBlK5Gm3mLado+fi9AbGog6K7TKDeG+4329FGjQM/+Bbs99x4bV
	XgGWdcjiRR3NslpIaBy0J0cY8X+V4TcnmlHrdnrt1SMCtlljv9nbu5HF/PS9sVCXMDhf
	EHfITQkAwmdLn4EbPPDTcbBV2sqgIboCyl4H9U5T/kMruYjQkJC5424jOcxmOBuKqbUq
	AVi8Is8qxeF26GO5KfjFkzH3wV2a/i69Oz+8ehYObn0UW2vbI32mcxCYCvXAzguo1tfU
	7qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TLTPX2eA7dUT/aps5MRuhthd1ANS9jO78Jn/I4w0GmM=;
	b=cEJ/QN+OUIG02seB1TpbcaKF+744qascBAukxqZTr4ELfO4L6G9rPKAa2O37J/E5T7
	lxQU4Mg+f73KEToOaYzo/DgXvuPXs+WR+Dg3COGPRq0S8Qb2ONe6ahi1KdC88JLVb7Wl
	HtXhYAg5oi2Qa1UJsmubMVOCfh3PebEX02j17kszkFqZSo1vIra2gAbD/mUkg8fzxwTN
	4XwtyI5U4aryPUkYoJwSUxVNZNgqaDZ7is/h2t88VqncTBfL/mZPu+8D4klc2fdvUN6E
	cZDA7F2ksXVoqi8w8P1CKUEA8VOqjyusfQu93jUY8wuAickT7rstGyOcdGO0qrG31E18
	1hfQ==
X-Gm-Message-State: AN3rC/4ZphzjrdO0AQjIV6cSH6bcGCH8EN/Icy4Odbz+Bo+kjxEbORg2aH1BFIVjckYHfA==
X-Received: by 10.223.144.8 with SMTP id h8mr4289374wrh.45.1492027037980;
	Wed, 12 Apr 2017 12:57:17 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:38 +0200
Message-Id: <20170412195638.3243-30-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 29/29] xfce4-sensors-plugin: update 1.2.6 -> 1.2.97
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-sensors-plugin_1.2.6.bb => xfce4-sensors-plugin_1.2.97.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/sensors/{xfce4-sensors-plugin_1.2.6.bb => xfce4-sensors-plugin_1.2.97.bb} (86%)

diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.97.bb
similarity index 86%
rename from meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb
rename to meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.97.bb
index c2e0ed9..4d78bb2 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.97.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b94789bed9aec03b9656a9cc5398c706"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "33c2e343c1224d9c4ae757a70cbe08eb"
-SRC_URI[sha256sum] = "235ef842bd45e701bceebb21a384ab09f21afceea8ed95f91bb4c6cf3abe1bc0"
+SRC_URI[md5sum] = "0c74c3112c5e6e07647c116cd43ff5a7"
+SRC_URI[sha256sum] = "7524ec4534de9ef7f676de2895a41bf70b73b94da5a27fd4a022b16eda56d0f4"
 
 EXTRA_OECONF = " \
     --disable-procacpi \
-- 
2.9.3


