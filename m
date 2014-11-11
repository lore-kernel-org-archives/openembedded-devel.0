Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 94CBF65CED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 17:54:00 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id h11so2410522wiw.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:54:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wan2dS+tF+MSdkXKwy7G0cQve9tK7FP/9gNJjBecFjk=;
	b=bRJdFU9aIKsOJdoioe0Vh8fwebEFW6NUtagRWjvdp7Avo2+Z+JfooWdg/Vso5UHb1a
	N/qVCclmt88oL0/8BPJ0SKoH4vEhjxpYZ6rsm1HDUr3S9vq8Z1e9x2L/OJVt+bX47LED
	Kfp9UDtFjYTcuZtYkbIc2DewPKUQNzNfdPzl6PkMQKs28WZgTbG+tnroMPrXfKYB5AgR
	/vkE1FmAojkflS8U/UNoJtciwIc32crzDpdDyvrW7ZzDjgVwx2zK6uYRneZHSRVsUinr
	Vp/UYZ1G9WqKXL+qF8Zu14azJ5AaZgfJL99qYg8oxkSzAS3DCaYHPs+JA5hVyEJGC/mh
	rnXw==
X-Gm-Message-State: ALoCoQmNHNxsJlXx6Jr8IitrIJpF4KIgDB6+BDge96AhMeYaZ68X2fTxVqvtSO4W5U08HkGVMh71
X-Received: by 10.180.86.198 with SMTP id r6mr43159330wiz.29.1415728440414;
	Tue, 11 Nov 2014 09:54:00 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dx8sm14461196wib.2.2014.11.11.09.53.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 09:53:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Nov 2014 17:53:48 +0000
Message-Id: <1415728430-30366-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1415728430-30366-1-git-send-email-ross.burton@intel.com>
References: <1415728430-30366-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/5] gupnp-av: use GNOME_MIRROR in SRC_URI
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
X-List-Received-Date: Tue, 11 Nov 2014 17:54:02 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.6.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.6.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.6.bb
index b1b793b..b8cfa27 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.6.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.6.bb
@@ -1,6 +1,6 @@
 require gupnp-av.inc
 
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.12/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/0.12/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "f56cdb269376a9e6cb062eb9960ccf57"
 SRC_URI[sha256sum] = "e0553d60dd7c7277c65c02a68a270c4dcb9036a4c7075c902fc8111c6a5e6a44"
 
-- 
1.7.10.4


