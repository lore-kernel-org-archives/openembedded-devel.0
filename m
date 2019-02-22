Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id E2DA47CC28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 17:30:11 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v13so3243122wrw.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sgpluaMc5W0Mt4q1CeFNBXPru9zQ14/C3sUlFHbPKLY=;
	b=Naw8olDaDlM6hrFA6GwOxuyOVucJQD26pLv7rDwI/guejkOYB/ysdTH3g7MQPVqOdP
	X+6fURIcL/zhXgsp8d5QMqn1aHcht8uVKYU4zbG/yEJzPZYB8SeKNV3nL2F4AVSgnes0
	NDMDWOlug8JrNYdKhc29VSdzSTfWRO0LxAyJJYSigmeSInXjvF8DePEaYgFKKxIiFuaD
	8vgr3H3QQa2xko+GRn9jCRXwJykEE59+xKecQ2DVYTkXPDONuqXQBWiTrwCqROmK0xuN
	LYBE/3+yVQa6J3jPPgf9zU2Dy2h5lH5Hz8R3KpAuJzlpKdALCjFrkzffcuxpvmzWMI4P
	EdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sgpluaMc5W0Mt4q1CeFNBXPru9zQ14/C3sUlFHbPKLY=;
	b=apuDvJfq1fDhLJkuxP5lg4pxZHyJyuHKhgNDNoUs+CTyPzBiNGFuUrYrfcVLH/rx2Q
	lCxYsFkG6Lylf8DNflmgN7pGqj7gQvd1+/zqnIF/reEWFDf7B4bxT+Ae/WJArlLaqwUy
	8xV+Sm7h9kmACDYeXl5dHz82Ujk/9N+gFWiZjSydx9OzRpLaTek1sJdmpWwRUHpha3MC
	VZbtNRIRqFBxkEsw4ducrNGFx6AdqRTtaJDlqV0oI/lD3pDgcYu+DUQHmyrzTMUoqzuK
	RTXF8Vby5xWoZTPNYMVjYWAwzl8kxiGRXgKmowXCM5n4GFEnXLQMZqj9wWFd6mq2KQRb
	NLcg==
X-Gm-Message-State: AHQUAuYEOjJeMHV+gh0FoECDkLtJOdzbLFIHRJNU+ePvDbibZuH+qTek
	HZaBDIurCHY50ktbEbcFRgBFepmX36NWFA==
X-Google-Smtp-Source: AHgI3IZE7oUBCHNtuzlsLBdTmIyCBpDuB8F20Jo6vjAv5GoeGZNcOwP+mH4kFJc1xk8qQvHiQhnY4A==
X-Received: by 2002:a5d:6346:: with SMTP id b6mr3872043wrw.118.1550856612338; 
	Fri, 22 Feb 2019 09:30:12 -0800 (PST)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	q24sm1337597wmq.16.2019.02.22.09.30.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 09:30:11 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Feb 2019 18:29:48 +0100
Message-Id: <20190222172949.3661-4-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
References: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH 3/4] packagegroup-meta-oe: fixup package that now require polkit
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
X-List-Received-Date: Fri, 22 Feb 2019 17:30:12 -0000
Content-Transfer-Encoding: 8bit

After below commits to add polkit as a required distro feature:
97a1a55 polkit: add polkit as a required distro feature
c049e02 polkit: inherit distro_features_check

We need to propagate that to all recipes that use/need them, such as
this packagegroup, otherwise 'world' will fail.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 96672db9a0..5fcf9899b6 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -243,7 +243,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     sjf2410-linux-native satyr sdparm pty-forward-native serial-forward \
     sg3-utils sharutils smem spitools srecord ssiapi start-stop-daemon stm32flash \
     syslog-ng system-config-keyboard tbb thin-provisioning-tools tokyocabinet \
-    tree udisks udisks2 uhubctl unixodbc upower uriparser usb-modeswitch \
+    tree uhubctl unixodbc uriparser usb-modeswitch \
     usb-modeswitch-data usbpath uthash utouch-evemu utouch-frame \
     vim vim-tiny websocketpp wmiconfig xdelta3 xdg-user-dirs xmlstarlet \
     zbar zile \
@@ -251,6 +251,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "libcanberra", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xorgxrdp xrdp", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "bluez4", "procmail", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "udisks udisks2 upower", "", d)} \
     ${NE10} \
     "
 
-- 
2.20.1


