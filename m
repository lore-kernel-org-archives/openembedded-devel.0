Return-Path: <brendank310@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 062A879ACA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:42:00 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id z2-v6so10022748qts.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hW528ukN7pQ8Iq3jU9ktav7dsya+QavekEGHIwSDRS8=;
	b=ddQSnd8ttzfGsGAWoP2BKtC5mKEP2ze6A4qrct+55IOq4q2CiTksNTSeQtYi1vOAS2
	joultmenkKGI9yOagUnqaVf91jgti+A831Rf8hbyehl7yNmnaprkPjNvXzCSqGp3DHx1
	/a2bNEqzxejI5xpJOcez/qk4JlZcomLXgMLXpZYsej5hYLFbC0RxpQ9q3aVRt6CQ4+xl
	jsjOMGMGA+oaBy3hMgJgOWiwilRA40NrKHBiiHHarRylfJjnBsHHx32qpa+FC151viCN
	SXBIP39m8SgPVvSVZjYrm43hvtQ1dPXzl5gM9/jA/qxHWltFugnr7lszbKPYjH4J5hUK
	tjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hW528ukN7pQ8Iq3jU9ktav7dsya+QavekEGHIwSDRS8=;
	b=tpfudFEw4oByScPDxNA4LyhaRYg51scIB22CMvhpqtNISh6iSPvbeCjJyKzoHB2Ocs
	fHzBpzzhERAIfO+jNOZGm466WW0b+VLX8CZ3Ju/Z1cqaRdH8fV90MFk9USijXvUtxXB/
	gS0+tOBBHvgsdhCymqbYBasi5B3ulxygRp5R4/mQ6MWXZp7XK6xpt/jz52YQj/GulK1x
	FXmO3VxsbrkJyM1BSIyc4Tl/TYRWCxuqPAASnLWtoIk0SH1EEmnMp5c40BbsxoxmWbnt
	0whuHQysyAUj8J06wGgZb8xjcgrCShpLlsMibiEk9buiAhNc81WwlJZRHcM7sPU85GdR
	xKuQ==
X-Gm-Message-State: AGRZ1gKzLgRYm4tziW1aTlzlcXCTuSN0cXBDH00GSSWbganADO78iccl
	vou2oJpyI2feARboc8mdtIPKyQgW
X-Google-Smtp-Source: AJdET5dwW83Eksy6ewBNEOtulaa9dneKriElLdN2FnEmFIzDQbj4Mo16Zu5dsehphG46KQVDqKMQGQ==
X-Received: by 2002:a0c:ade7:: with SMTP id x36mr13791092qvc.218.1540831321774;
	Mon, 29 Oct 2018 09:42:01 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.42.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:42:00 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:13 -0400
Message-Id: <dd28c909c895c7e30064a9646f5ccbde1414d3fa.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 16/16] gnome-tweak-tool: add recipe for the GNOME Tweak tool
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
X-List-Received-Date: Mon, 29 Oct 2018 16:42:01 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by:  Brendan Kerrigan <kerriganb@ainfosec.com>
---
 .../recipes-gnome/gnome3/gnome-tweaks_git.bb  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-tweaks_git.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/gnome-tweaks_git.bb b/meta-gnome/recipes-gnome/gnome3/gnome-tweaks_git.bb
new file mode 100644
index 000000000..fe305c922
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/gnome-tweaks_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "GNOME Tweaks"
+LICENSE = "GPLv2"
+DEPENDS = " \
+            gnome-shell \
+          "
+
+LIC_FILES_CHKSUM = "file://LICENSES/GPL-3.0;md5=9eef91148a9b14ec7f9df333daebc746"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-tweaks.git;protocol=http;branch=master;tag=3.30.1 \
+           "
+
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${libdir}"
+FILES_${PN} += "${datadir}"
+
+inherit pkgconfig meson gobject-introspection gettext
+
+
-- 
2.17.1


