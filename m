Return-Path: <gizero@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id EFA9877B14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 06:44:50 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id o81so103569394wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 23:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Rx8ta4tvmPX3hgaZsgF9UBL2xZmW8v6OSExlCK4bLYI=;
	b=pv8Ey1QpJlTQ/GkbvIl3Mg3jNui9XknlGiRC4vhM1RflMCmnaDBNLPx77foCd7n9G/
	ndK773FvxyMbW6uw9Z/qVdx6dYuO9P6dTO9FrGfdLLt9ygCgqEYOni24u8ngkjpQuNUA
	o9BjDWH5cSif7Fq9o94FokvimftjSufG9ge7UMpNJBrpmxkUxbCNIteST/glFwKwFsZu
	6AX4zZ/I7oHYVEFPxgnttKHxsfAjjwMiAXpc8ZfusgpV9Dhxs549ZdlBa6QemPh1YuVw
	jvvSF5hxNGVJgp64OHmRt0QcNdHTg6ZivqTlwiNvgEAheslvcreXtnSdvmLNbAgGEtdD
	Kfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Rx8ta4tvmPX3hgaZsgF9UBL2xZmW8v6OSExlCK4bLYI=;
	b=C5FvKmyJFdYZd7V27yzcfLxX3O8NB0hHzLjB2wVFs88b9PKm+2FWoG3mSXBpFSbpiy
	xtFZM4eMy5P0hN9CVTf//OZLjbanAUvs4mnyS3x5AqMMUefitVwDAZfcf0mRzu5r88VW
	mVumelyKUlgpEG4lOwlx0ABCHM4pxX5e5knPqBq2uhm979VfyLj71hJ/UuaVxGyCwFoS
	dwhkFZPCwVP+Dw1R3V+JVML5l6XOB7sSI6lO5qqKB5J+PASf6IimdYfIqav7jAK50p7W
	WX+yuAls4isunQ9RIGSxY+NNlwqm+gdyePsi78JXPD/MrVcNqLZWP+dtshyK6W3sC2b1
	/USQ==
X-Gm-Message-State: AN3rC/7YpoUtdnRnBC5bb/o/F5/wAFTLa+TaP9fDMV2itrzjvTAiZSS6
	8v4GJZj4de9k1g==
X-Received: by 10.28.24.8 with SMTP id 8mr229797wmy.133.1492065891387;
	Wed, 12 Apr 2017 23:44:51 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by smtp.gmail.com with ESMTPSA id
	r52sm6983323wrb.37.2017.04.12.23.44.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Apr 2017 23:44:50 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 08:44:41 +0200
Message-Id: <1492065881-31167-2-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492065881-31167-1-git-send-email-gizero@gmail.com>
References: <1492065881-31167-1-git-send-email-gizero@gmail.com>
Subject: [meta-networking][PATCH 2/2] openvpn: avoid hardcoded path
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
X-List-Received-Date: Thu, 13 Apr 2017 06:44:51 -0000

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
index b6bd69f..db510de 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF += "--enable-iproute2"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '--disable-plugin-auth-pam', d)}"
 
 # Explicitly specify IPROUTE to bypass the configure-time check for /sbin/ip on the host.
-EXTRA_OECONF += "IPROUTE=/sbin/ip"
+EXTRA_OECONF += "IPROUTE=${base_sbindir}/ip"
 
 do_install_append() {
     install -d ${D}/${sysconfdir}/init.d
-- 
2.7.4


