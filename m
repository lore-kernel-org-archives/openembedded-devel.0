Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 875D673D46
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jan 2016 21:47:39 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b14so20835018wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 13:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=TNNh1BR1tROq8aR72+NnZCtnxg+S1RMyoqInLC2fUM0=;
	b=vtkEcJDIfBg2LazjVSBw1DX1slaH7oxEzMQHW3Tlscl3R86yxRowdObhOkUvnNpbuZ
	3IE0vjv1MBTw8Cu7EDag3S1sqA7MzcNlhfe4xe82vYJYcLnVbykMV8dGdKMKX9+YphCG
	WGV2o0WidKzbayd2uc+qoRVsnEDpvJ9qdFOhXdKkEG0J1KuCYCgtiFn908UFxmixHEGx
	rE7sEGijVG0091y8eN2ZBlGIlAZd1FeCbwKeeovWpnug5QusEM0ej+P3FQuCg1zpbxsL
	u9u1ZT7mxlYLl5umlxoIlZzvBmwUkzJ/XzjmYSJiBvyq48iT1wLrZOHZuZcVQ6wewTba
	3Ang==
X-Received: by 10.28.137.213 with SMTP id l204mr5901855wmd.100.1452376059538; 
	Sat, 09 Jan 2016 13:47:39 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D02.dip0.t-ipconnect.de.
	[79.223.29.2]) by smtp.googlemail.com with ESMTPSA id
	z17sm112721160wjq.1.2016.01.09.13.47.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 13:47:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 22:47:21 +0100
Message-Id: <1452376042-19248-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1452376042-19248-1-git-send-email-schnitzeltony@googlemail.com>
References: <1452376042-19248-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] xfce4-power-manager: remove udisks rdependency
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
X-List-Received-Date: Sat, 09 Jan 2016 21:47:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

udisks spin down feature support was removed in:

commit dc6ef998a2f19b6c2fcbfb48164db04be44c885d
Author: Harald Judt <h.judt@gmx.at>
Date:   Sun Jul 13 21:34:22 2014 +0200

    Remove disk spin down feature (3/3)

    Finally, let's remove the low-level code and remaining definitions.

commit c9d0626110e4b6e906610e9a2316cdac7a11d58e
Author: Harald Judt <h.judt@gmx.at>
Date:   Sun Jul 13 21:26:21 2014 +0200

    Remove disk spin down feature (2/3)

    Remove all related GUI widgets from the settings dialog.

commit 3ad75fad293fb66e6316aa5820ee064f264eafa4
Author: Harald Judt <h.judt@gmx.at>
Date:   Sun Jul 13 21:22:05 2014 +0200

    Remove disk spin down feature (1/3)

    The spin down feature does not work and would need a rewrite
    to work with udisks-2. What's more, it is probably functionality
    best handled by other tools or scripts, so let's remove it from
    the power manager.

    As a first step, this commit removes all interfacing code between
    GUI and low-level udisks functions.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
index 4a9accf..fa38c8a 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
@@ -34,7 +34,7 @@ FILES_xfce4-powermanager-plugin = " \
 "
 
 RDEPENDS_xfce4-powermanager-plugin = "${PN}"
-RDEPENDS_${PN} = "networkmanager udisks ${@base_contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
+RDEPENDS_${PN} = "networkmanager ${@base_contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
 
 # xfce4-brightness-plugin was replaced by xfce4-powermanager-plugin
 RPROVIDES_xfce4-powermanager-plugin += "xfce4-brightness-plugin"
-- 
2.5.0


