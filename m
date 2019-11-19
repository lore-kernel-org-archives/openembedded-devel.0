Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id AA5977F845
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:17:44 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l7so22461363wrp.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 23:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Ii/FtiI8NacNfXsuNmU8QNBqPMVmZQcvPuueKbS4kRc=;
	b=OaIbVEfVSDyoHTPAgzkIe3qDYnELu+NwyXB1ytFGScv+evsUSfvKx8le6UjooTwT+o
	nYJiIWJiHezHTYHbAizXIovdEJctuE0C4RP4QXhB+nX+8xK8TjTL/WHRIvDUPFmTGcpl
	FKxsse7GBAGBZtctXxQIyGA3qX6ocW/6Day1jSesJU+lpi2UZH0/koTlHlko3Kn7d/f/
	9iJsJhtCFdg4K1q1H6jZlCkUPDNlIIIo51u/lV8SV/TPlCfLluJzRn7N2w2omzsNOSFH
	YnULroyMM6Rm2dXK7YbkTtTRePV3PWreOilMKSSEi/KM9/VEwvlIhBbOCoD9dszeKaoN
	Lg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ii/FtiI8NacNfXsuNmU8QNBqPMVmZQcvPuueKbS4kRc=;
	b=lGaI5GA/6ejPg1a8tNa2vaKU9IwSNrbIqwx+aFN42Wd11ZxYNlLu2Q30qh1qBOhwli
	LrCdnDRhOz0egDKrwvhwGu27hXXFKqq1Db1i14XBF/VkVytlgRp+fFppgpOK0mflE/it
	9IUqHHBaAJZ1/uUlg/krGCZWo+s5jN+KDTN5HvuOB77yxctpiiOmVz50dIK0GH5va8DL
	bpeXugSAxEbz60szCdqZM3wlaJv6PJyTOhpmXHtKuUc5ScbKR0do55Rj40FQiKc3HwEY
	LLalZkHXOiXUd/7lIP2jR8p8pV3ZjS2cgE6fHlIAlKN1LQw+Dk3NUgVm36MuhxTX+eF2
	qzqQ==
X-Gm-Message-State: APjAAAVu7cBysdyZhdHD4UHmIpMf6W06YNiFAIApYFbrnLGZjkHgjnZM
	sUyGWdFfpyNax83Wv0kr5CS+zaJF
X-Google-Smtp-Source: APXvYqxvd4fOV81z6SvjIsmf4te9EsbgPBe5FFv2ZYvQI3T8RqqGqaraDDXURJUySlArCfwOceH8ew==
X-Received: by 2002:adf:f709:: with SMTP id r9mr33453514wrp.8.1574147865163;
	Mon, 18 Nov 2019 23:17:45 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0CB657F29A81DEDF319DFC.dip0.t-ipconnect.de.
	[2003:f0:7f0c:b657:f29a:81de:df31:9dfc])
	by smtp.gmail.com with ESMTPSA id
	b1sm24480182wrs.74.2019.11.18.23.17.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 23:17:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 08:17:26 +0100
Message-Id: <20191119071730.2682-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119071730.2682-1-schnitzeltony@gmail.com>
References: <20191119071730.2682-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] nautilus: add tracker-miners to RDPENDS
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
X-List-Received-Date: Tue, 19 Nov 2019 07:17:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nautilus does not start and complains:
| (org.gnome.Nautilus:863): GLib-GIO-ERROR **: 21:03:52.326: Settings schema 'org.freedesktop.Tracker.Miner.Files' is not installed

Thought I tested that successfully...

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
index 11193b591..611c7a63c 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
@@ -30,3 +30,7 @@ FILES_${PN} += " \
     ${datadir}/metainfo \
     ${datadir}/gnome-shell \
 "
+
+# mandatory - not checked during configuration:
+# | (org.gnome.Nautilus:863): GLib-GIO-ERROR **: 21:03:52.326: Settings schema 'org.freedesktop.Tracker.Miner.Files' is not installed
+RDEPENDS_${PN} += "tracker-miners"
-- 
2.21.0


