Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id AC7A37D164
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:44 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id j9so19112166wrn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZGEzzVPiB87SWsmLYeyFPrlZdoakMgc0NVfa83qNY+E=;
	b=rcXER7gDp7LlZLXT/xmQDocrzggRE58gfANxVfS6PE8H4RDx8dnZvySOWfFSEu7v3r
	LgOCjKqmDooW+FQrzyIYc3cjMBEnzG+GbunnEZsFrnjFhlYF3c6X8BP/UWa9DdcVfXo1
	K3VuT2SJxGvoWKvvjtDC3zEg1GAS++wQ5LmMA7w1GUPfDS8KKyPbJO2n45fRm4orHWgI
	VHGGL+Vd/VheIyX6ubhvpIKgSWHXjDsZ01/BiOibJ/Qj8S6WEO04da1TnZrJvQPVn9d6
	sXQKryMG55j/oLvrCkqgW/ksazruYKWqV3izhrQ7BZOqRNJs4vn2GpYBvLDLX1dqv8RL
	tWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZGEzzVPiB87SWsmLYeyFPrlZdoakMgc0NVfa83qNY+E=;
	b=jyIEv+n8RCy5xLTbyLuyThrEzAQSgo6GjMGN13Le23qbBgFNCUp+13RZUQq44qZ/X/
	TZ3JBbncVvMBkPQscKXaMm0iA9Jf7X9oeZWlGQLUAAp4lnEXsDfY/HJ7+ZItV325fvAT
	gGHvzEMJ3Vvh0cBvgrJvAAEXxAv+TSG7kRP10yU73d2s117B19rN5VTt0RvY5b9/Vzil
	hHRDWvGZ0rhj092LYu+43G3LKi9/0cvC/Pod2qzClX8NPiRKpiZKqIkul2MA61MCsRE9
	GJNgIpUqbX/AWmk4dbCuP4IDSifz5odS3awI+ega1dtvVyfuzqSSTHAfWXQ7pi4QoQ/d
	F16w==
X-Gm-Message-State: APjAAAVWBZgsnnNylwv2j4hzIoPc9PxxY0cdrZJJjyFUJX+oeCC3x8le
	u7edQwTsnfAQEA9LVcpsc72TGfLE
X-Google-Smtp-Source: APXvYqwI3lji++mkmslu2S14Krdmp5raLhDx+MfaD9eAkBd+jOI5n88LVCYGPi+O0T949nl0sPNW7w==
X-Received: by 2002:adf:cd06:: with SMTP id w6mr24866824wrm.52.1553700945339; 
	Wed, 27 Mar 2019 08:35:45 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:35:08 +0100
Message-Id: <20190327153509.23928-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/15] xfce4-whiskermenu-plugin: upgrade 2.3.1 -> 2.3.2
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...menu-plugin_2.3.1.bb => xfce4-whiskermenu-plugin_2.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.3.1.bb => xfce4-whiskermenu-plugin_2.3.2.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.1.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.2.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.1.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.2.bb
index c2a37abf9..230a24faf 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.1.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "ed16fcc671cb4e4853701b81fdb5dcee"
-SRC_URI[sha256sum] = "22fb7277adc2e2313dfada03d69040edc3ac2c2080104cbdd9a3c47ebad0cab2"
+SRC_URI[md5sum] = "e9aa6c33463bd564c47e1943c0fc7ac3"
+SRC_URI[sha256sum] = "f1bf6be37f7778a486b16ef115d4c05120cc12c87e4af3af9c5001276bdcb7cc"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.20.1


