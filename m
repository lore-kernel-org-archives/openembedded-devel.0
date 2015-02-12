Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id D1332733B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:33 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id bs8so7608545wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=9jzKtA4t4fe0A0zfT1gZ4sLj1ttS9Y4o4TVXv0DRZ3U=;
	b=tKtsw45572sFFQIQ5yHaCmcmwRrV2iQRNiUS8pUWRn6VkL2y4nTAmPUhu2Mi11dd9a
	tQSRG6nsiuFCIQMpUFMQov3QXOTMjTypyIf686rqUo+8fjByZb5RfxQtL8YbYWyfsHTi
	/HYb6QcxhNzodfzo0V9Wx+Zsn60/U2a9qCG62akDmnFW5GrNDYVdB286SCL3msCD9VKl
	w42/fOw7VEV7nT9Qn5FmHpOIPx/GIqB07dSwJBDQ14LfwDEQ/rzaZalhpmubHox/UTqQ
	eifXi+lyXQttvWzxO4peDK1l0n2U4qlkvli7Afq5XXoP+FRtaTBVlUYiXIfnGrWkqYen
	VJnA==
X-Received: by 10.194.190.162 with SMTP id gr2mr11881833wjc.13.1423776154763; 
	Thu, 12 Feb 2015 13:22:34 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:55 +0100
Message-Id: <1423776119-14981-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 15/19] xfce4-equake-plugin: update to 1.3.6
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-equake-plugin_1.3.5.bb => xfce4-equake-plugin_1.3.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.5.bb => xfce4-equake-plugin_1.3.6.bb} (74%)

diff --git a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.5.bb b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.6.bb
similarity index 74%
rename from meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.5.bb
rename to meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.6.bb
index 76cd5d4..d4f069f 100644
--- a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.5.bb
+++ b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "7c520e2f1cd0cc5e33d8346b12e31c02"
-SRC_URI[sha256sum] = "43bbc781575c357c13ac6720eb8e8485115099411d5382668e106de58ab0e416"
+SRC_URI[md5sum] = "ee76ed3825999b24ee9c2c976d906e22"
+SRC_URI[sha256sum] = "8129067080c8a4656063e7cde20f13fabb47b49c84ce610916f54644acb93d67"
 
 FILES_${PN} += "${libdir}/xfce4/panel-plugins/xfce4-equake-plugin"
-- 
1.9.3


