Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AA3D47707B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:04 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a140so1212810wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XjexMH9S+9UZgwWNFDEed+D/Ak2rlh3klAn44hBsO7k=;
	b=waof1yhKmRpOTPFo6Z87vjsINzaGll6XEapm7YoMYdMo0r64SLXDIRjLnTn9rtuOb+
	XrJH/cIS2pnCks60aO/I03IoaTHN6gxEpzj124HPAV2P0oubEAHYYzYixR0yfNGGL2So
	eJOkfhbpC/cqX06zB6AcBSj5VpO7FwedpfkTFKZ67SGG5jsjJsuM8LBvVdjrXmja5XTN
	jTN+XZcATM5Gr9vZY9xdl+H8/Dov17LBES2qRDKvI3ZO7fqbMtmhvvalqBCAAhzn3j82
	8udIW5N3IumViWflBVWbQBVbgKSOG6Uei9a3Q8AKLFZlow1HgUs1hccieo62RyNw+X7v
	P3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XjexMH9S+9UZgwWNFDEed+D/Ak2rlh3klAn44hBsO7k=;
	b=gEw+tLz1osCtVB028fClgSMvixzKUC1t32XlWO2HdZOO2TNL7aZPvQZ8l5yp4IXueI
	c4IMXy0MtilGPaQZL27mrS20vP+N/vBLBH5JNSn3ETH8ZzsoeLbKj/zYUAGI7KIwESbv
	iKLw/2WEX8Q3vmBTAJSQoRU8sNkRBwdLATkInEE2i9AKcGw/HeCoxem3pVTQdPwflQq8
	GI/KiZgkZ8iTyN9bgnfHVcikxFZ1zILH+Ibb831QeIa958lokMJrdHLO6HFOq2d1vi4+
	6hO56Q3LPLP9639UhSDg9zO3omPxWMofrXJLUSNw9nlOkDxr4XYrfn6KZnmmWIlhqa8l
	WP/w==
X-Gm-Message-State: AD7BkJIdoAozaMuN6ovzagvFj3J92IoOQkWc5IRm7c/fodPSvJdj8NvwAQWj1ZrfNdlddw==
X-Received: by 10.194.95.40 with SMTP id dh8mr22933988wjb.146.1459834745322;
	Mon, 04 Apr 2016 22:39:05 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:19 +0200
Message-Id: <1459834720-17165-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 10/31] qtlocation: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtlocation_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 5072903..2ee747f 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "03163a3c9129b7f982b690e750056506c3d06b41"
+SRCREV = "ca4bce553d03a64fa119650990083267ea9c8d31"
-- 
2.5.5


