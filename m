Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 64A1C7FA15
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:44 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id b11so5964696wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=HZf+gWrrVOf+KR1u04+qCOPU604qwl/u4Own0N2KAw4=;
	b=S/ogRZsHdaJ1J/n9qFk+GvxpooheMdkOh3sf3qzW6XmKVhsTy7tSAjcR9PW2ojx6bp
	p4o2oK5wTKC3DgwWM1vCktHlVc4hPhrDGkhgYH+Ya6A6V4DJq5+KDouYxU+5A7b06arq
	J9N/iewwxJesVUb77NaHRW+2n63Jt0SyxX8pBr3AzmfWelQ5/WAc8yJ1BtVghYD+Je5h
	kZkUMHlID86owK8iVa0LHvdSaq2Dn+//Yr7cx10BzFVhtlIS8qO3iwmjxY0lv198tROR
	vUNntD2kFYVVjeMB5DOty75PylBZNYheQ+3Agck84+XHlF2BIaYdKhwh2DOtiPnvC1cB
	A9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HZf+gWrrVOf+KR1u04+qCOPU604qwl/u4Own0N2KAw4=;
	b=oM9zxxJqcZ7+MZHxNQp6NScYfKof3TxFpZIpnXQvj6POyoLOg+zzhIAUrc8F3knJ8Z
	AjIz9/ExffoT9WXgBLIxAmHO1lyi5iAmZDytaFWqMLRRfSumgGEqQ6YK2YH1zU7ssu1e
	sp5ExOlYZ9Bo7qql6WGA+LKytOm8qpJ29X+yDbeY04CvaJN7Ild97/nCKBsECYeaE1Cx
	mX2bXrtNoL6kbcHuH1SIPJPJFTjiz0zbpyd29Y2NMXDJiDHKJFxJXG4FG8pjPZvJccFj
	7aBW3+ocQInG+BHGGtLAIKTjrFssjytK3ul1xRxXrY5IGcuX5Km2PDXwBnPYpQy1zapf
	Mb/Q==
X-Gm-Message-State: APjAAAX4wU6D9wXoi4rM/66hY5pP/2a5Yz+CbgOtUhMCC4TSvzAqHNi5
	X2+qLbNCIfunfHF8dFCJ3nYUPqcg
X-Google-Smtp-Source: APXvYqwTAYWHRTZSCPnQkeziHcotRpn/8IzQGoBruJgWd/+6XnKHzhhu0Ei2EbM5u2EknzH3aDVylg==
X-Received: by 2002:a7b:c632:: with SMTP id p18mr7251668wmk.175.1575590984986; 
	Thu, 05 Dec 2019 16:09:44 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:09:11 +0100
Message-Id: <20191206000912.19841-21-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 20/21] gnome-flashback: initial add 3.34.1
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For all those wanting GNOME 2 e.g on targets without graphics acceleration

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-flashback/gnome-flashback_3.34.1.bb | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb
new file mode 100644
index 000000000..ff95d2a5f
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb
@@ -0,0 +1,34 @@
+SUMMARY = "GNOME Flashback (GNOME 2) session"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+inherit gnomebase gsettings gtk-icon-cache gettext upstream-version-is-even features_check
+
+REQUIRED_DISTRO_FEATURES = "x11 polkit"
+
+DEPENDS += " \
+    upower \
+    ibus \
+    libxkbfile \
+    polkit \
+    metacity \
+    gnome-desktop3 \
+    gnome-bluetooth \
+"
+
+SRC_URI[archive.md5sum] = "e328a51b69d97e291709458dfd8c0a1a"
+SRC_URI[archive.sha256sum] = "ddba0c9661ad93b58ccbde267f6ecbc02da2c15f9d38d87d5504f4670c2fbc77"
+
+do_install_append() {
+    # no oe-layer has compiz -> remove dead session
+    rm -f ${D}${datadir}/xsessions/gnome-flashback-compiz.desktop
+}
+
+FILES_${PN} += " \
+    ${datadir}/xsessions \
+    ${datadir}/desktop-directories \
+    ${datadir}/gnome-session \
+    ${systemd_user_unitdir} \
+"
+
+RDEPENDS_${PN} += "metacity gnome-panel"
-- 
2.21.0


