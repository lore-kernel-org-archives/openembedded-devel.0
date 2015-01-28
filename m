Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 98E4460017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 15:51:49 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id w62so21616576wes.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 07:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vH0xvuhOC0p0jiqRQs2QLXq1m3e0rp2LcDqyqe0mHC4=;
	b=Dn8KKHOG9KkAUgQQG0gmNisL/C5fJf5p7mPI4CHgVcjV0hJkyJupnpph6HbTKqhvQX
	GRwGhm2rvS38mbriwC23SsHzy1EmJXC6zRPUzgye0tn9J/GS3WV+1LB7iAcEbGhsxkAE
	8GxTLrFjhFH30XMGJ5kWCB7EzzuGdBKieuVzhCNlZyh8ijyS5oK0FRPCmLlF9+i+BN1E
	nRpL7dkIFW8Rs1V2gSTV2aSbZ4w8NuqulC1x0B2eOXan9x6emoXq4KwCElpf/dY8vfm+
	zwy3EGincaA0CIMacb70gu6ne0RT3TzYnq2kayeI9JQkgPRaActexko9kFXwkkJ+sQX4
	Lxlg==
X-Gm-Message-State: ALoCoQmBPerVIg7gH1Gxynn7JUVl8IJxteakdJOom8Y3qDpiD2dkMHrJKPBiErIGORaZ2a40c2We
X-Received: by 10.180.23.36 with SMTP id j4mr8071247wif.69.1422460310058;
	Wed, 28 Jan 2015 07:51:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id q10sm6626050wjr.41.2015.01.28.07.51.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 07:51:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jan 2015 15:50:05 +0000
Message-Id: <1422460205-18051-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][meta-gnome] gnome-settings-daemon: add PACKAGECONFIG for smartcard support
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
X-List-Received-Date: Wed, 28 Jan 2015 15:51:51 -0000

Smartcard support is enabled by default and results in a floating dependency on
NSS.  Add a PACKAGECONFIG for this and disable it by default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb             |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index 729d750..f45acab 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -15,6 +15,7 @@ S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio glib-2.0 libcanberra"
+PACKAGECONFIG[smartcard] = "--enable-smartcard-support,--disable-smartcard-support,nss"
 
 EXTRA_OECONF = " \
     --x-includes=${STAGING_INCDIR} \
-- 
1.7.10.4


