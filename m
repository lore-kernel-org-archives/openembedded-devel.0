Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0D26A785A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 15:14:02 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l49so2609109wrl.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 08:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=65dC98a1osz6QUYUTQui2LHuOh1Qeb5y1kk/ZG+8i+4=;
	b=NMt58nbJQF88ItWbtTCNSAQ/XXtOx/FvmzZ2hSHq95dMsyHDY1JnO8dUcnTFrlCnHG
	OWuQUi4imH6SG7svXFzhqYSaYGMmEDJ1JMg6xMLCE8uqODtdxufTNENgeGA+0RZOMJ8b
	62ki2CHodGsyG66Tz58m+UiyNr1q01ftTTaCKpO2AxtmqVr0GUJe4eBF50vpHSj7jiAF
	7iCOb/oDEe5FKNuHs4Q87JcQcP6jiBOxpj57yQBS4a1Rst8mcwwmbxgxsZRlngNcKTaK
	mjFJkWnO8pmeQkjEHzeI7g681Ir7PwVcIjj5HVoWwBeokuONAc+nG4G+yethxXoV2mco
	9Shw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=65dC98a1osz6QUYUTQui2LHuOh1Qeb5y1kk/ZG+8i+4=;
	b=EO3vdgUWpoyT3b5I4t3Fb1jQsx44Sh/tnOhiin1GjLUefvdZZyMIjOJ3k+aN2YNE6V
	mkuGLcLmfx7UHU/bGqvIW56ZHFIiMMq+1wRr9PoGlUwwWQyrLMm1kf9a21CUNU3LVdRg
	Gh/WOMYcpvWvBfFfwUc4Jns3FtMLBNAONlUnvvcjmUxKcOqTAZx0VESXCvgZ+/KksiEs
	Hzukw1MwT+o32pSTnSREg3ZvOk+caMlt4jz3DHQiB6sKrHGq+BW/UbhU6To5XBR3Wp96
	YFpYmMO9x9075m26XPEJ9xIQ3TM+Wn7+GW+k+Qq+ja+btxc6mAWopGZB4oEliKDZMRDd
	qF1Q==
X-Gm-Message-State: AElRT7GvgYoZXXSLYr6KRoejAf36YqtnEMYnl87mpMAPlqgiDEVoH1dk
	CdvISRHvJf85NTwgXfA8eBjkRQ==
X-Google-Smtp-Source: AIpwx4/pTe++Aq9Ue+qRRfmJ9SDPbPzZPi37v1u6rrJZpDwEX1BC4lsqlU1aYh79siovunRwsPkvSA==
X-Received: by 10.223.209.131 with SMTP id h3mr3240081wri.238.1522250043444;
	Wed, 28 Mar 2018 08:14:03 -0700 (PDT)
Received: from localhost.localdomain (p50971113.dip0.t-ipconnect.de.
	[80.151.17.19]) by smtp.gmail.com with ESMTPSA id
	n49sm5986665wrn.90.2018.03.28.08.14.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Mar 2018 08:14:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2018 17:13:31 +0200
Message-Id: <20180328151331.20660-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180328151331.20660-1-schnitzeltony@gmail.com>
References: <20180328151331.20660-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] xterm: add update-alternatives for resize to avoid conflict with busybox
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
X-List-Received-Date: Wed, 28 Mar 2018 15:14:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_330.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_330.bb b/meta-oe/recipes-graphics/xorg-app/xterm_330.bb
index e3bb0fb6e..16f9b7882 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_330.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_330.bb
@@ -27,3 +27,8 @@ do_configure() {
 }
 
 FILES_${PN} += "/usr/lib/X11"
+
+# busybox can supply resize too
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "resize"
-- 
2.14.3


