Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id B2448770DF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 14:34:45 +0000 (UTC)
Received: by wmec201 with SMTP id c201so49209043wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 06:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe_de.20150623.gappssmtp.com; s=20150623;
	h=subject:references:to:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=F1aFLBjZkB/GX1G9Bii7d2a4Fn8E0Ggsj/muLPp+hn8=;
	b=uHdKutPTGvJT2y0/bxuaqWPpbAGCXbyHIn9LHfd6thtcvrS+PZycwFi+XVIhJgzMYv
	vCdGmDmj8Dgl8WJBygGS1U3VXBrkg/2zIbg30JMYfmySqcxBk0x4FNNb5RAJlHak3a+c
	hlxS0k/9/OTyQXG83Sa/6iVEg365Aqj9TcUjRAqpT2Ou0YvA5xYhIfgkSZrAqNdQdFmY
	C9UU6JGDO+GRGqFsFea4kJyCXUERomChiXnm2u4wlDJBfGw2at//b26yUsz6AOrwzSgJ
	j4qej1rXmfmwQUxR3LM3jFj5PR2rL0gZ+cceKNXZuLNJLol0BNzwPdXbWD9xgbQ97l5g
	JMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:references:to:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=F1aFLBjZkB/GX1G9Bii7d2a4Fn8E0Ggsj/muLPp+hn8=;
	b=gccmy4MNeWJqGBTvYMiDgsCEzoSNrkz/tPjEQHoX8FrwIi2WlnzKGC5dICqZ6/g97J
	LYIcWGytn6vZoSBw/dFDhi2v8u80JmW36WZI1y/FHX9OTe8gAc9cyH+91HMTZR+OYZ/B
	IfCLZsjUoVpejX4+kV0INLbup1i4CF57QZN0vNyBwU/mGfTDzYJlFcB2qvpfkPid076y
	fiUauNla47ZIHZXvcwfiRP9ua1szNo0JdXhwIfqGyZ2T61oQXTJZSpg2DSVxxVGuvh0a
	hVKtdHMoyEL5aQyCHTDJYZggBBf7F1z2tU0snJygNh3T9bKUbBSN3j7hf1cyznX4n6O4
	asrQ==
X-Gm-Message-State: ALoCoQlenD/dXrIEwkozTI/0XgBCDeYBaJuipZUPmvtnnV8WCSouIIaoGFJxI0kvEzU9BlvMlbSG
X-Received: by 10.194.10.162 with SMTP id j2mr10595588wjb.43.1447252485385;
	Wed, 11 Nov 2015 06:34:45 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	s9sm6126237wmf.2.2015.11.11.06.34.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 06:34:44 -0800 (PST)
References: <1447161133-3700-2-git-send-email-sledz@dresearch-fe.de>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Forwarded-Message-Id: <1447161133-3700-2-git-send-email-sledz@dresearch-fe.de>
Message-ID: <56435203.1060004@dresearch-fe.de>
Date: Wed, 11 Nov 2015 15:34:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447161133-3700-2-git-send-email-sledz@dresearch-fe.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] syslog-ng: add UPDATE_ALTERNATIVE for syslog-service
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
X-List-Received-Date: Wed, 11 Nov 2015 14:34:47 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Use ALTERNATIVE mechanism in OE to manage the syslog service to
avoid conflicts with other syslog implementations like rsyslog
or busybox.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index a990bf8..54f6920 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -96,12 +96,18 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"

 # no syslog-init for systemd
 python () {
-    if 'sysvinit' in d.getVar("DISTRO_FEATURES", True).split():
+    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
         pn = d.getVar('PN', True)
         sysconfdir = d.getVar('sysconfdir', True)
         d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-init')
         d.setVarFlag('ALTERNATIVE_PRIORITY', 'syslog-init', '200')
         d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (sysconfdir))
+
+    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
+        pn = d.getVar('PN', True)
+        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service')
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True)))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/${BPN}.service' % (d.getVar('systemd_unitdir', True)))
 }

 INITSCRIPT_NAME = "syslog"
-- 
2.6.3




