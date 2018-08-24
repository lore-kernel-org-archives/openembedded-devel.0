Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id B65A5745F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 20:57:45 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id k19-v6so5074139pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 13:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pTwpCsu7thLvkfva5Y293cvkEcn7zI9Iew2iu+DtbXs=;
	b=W57340nVBOUsgCvFZZ1mPnDzWJDEqR2EsR2rKperNkQuUvvJhq+6uQLv9DvNTfpEv/
	o9Ne63f7HP/5d2tEqZCg4FQrtohPt5BZGwfccQmKENGdl3YNmG7EdLw6O7+lwlDM88gR
	2OdbX8WWu8Xgv7P9tyGqSbu9lg2Rcgm5HnegHcb5adYwDxEsOdu29gOcUlaV9BqAEpER
	tfF6sYmuv8+z7gYONkPXfvwTqlzu+abURLL7XgxgeXE5K9IOYhjPGYlR5oPttIEUQMom
	8ZbSwEbzpe5pAk0UtlPDA6OqKBAjH1kaxZMTDv9GHFqvHbNrCe/xFvcfWFhwDYiU4uQV
	Uk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pTwpCsu7thLvkfva5Y293cvkEcn7zI9Iew2iu+DtbXs=;
	b=rfBwnYiUmQRQ8ykIh99XS2D6toBqv2iOlg6ecIY9mh7HJ1kjQ37R1m+f99Pc3AVDsU
	ulpgWIT3eDiF4bS6XRmkL3DylO5XozCggE5ePBdLoiSK/YMVFcCeoWhsFAffcv3ShfAP
	9PmBkmWellX3CA3U8MqOHY7t9uqmwyEe7kneRD2Nq3l09VBd5jMW+utVaSHchX1K3DDI
	COMOu6SfUlWQqtR7NIIETTi6NoQxVrBGcq9F1kk63n0nt+/R5L08I+UsJCPPKCK+0UeW
	mFihkL03fAFm5zd4/QqJQ49Z/m2g8YRMs2nTuche8iyAVUlBwn++UsSBW12u5B+OzUm+
	w3tQ==
X-Gm-Message-State: APzg51DwFFFfLpgftJ9ujscAiSleVSDAxJ80JySlJrQWYuwxynEvsTNP
	xFJQXz6G2X1juBROxLHFoRGTkz9M
X-Google-Smtp-Source: ANB0Vdbjle5jW8HN/sS1OuWs19EX3Gd45tdDCkudc0uNvck3f1yRmiSBjCUcD5jENI0d6I4VtzEFXQ==
X-Received: by 2002:a63:170e:: with SMTP id
	x14-v6mr3012499pgl.364.1535144266481; 
	Fri, 24 Aug 2018 13:57:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	t16-v6sm9018362pga.21.2018.08.24.13.57.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Aug 2018 13:57:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Aug 2018 13:57:38 -0700
Message-Id: <20180824205738.12829-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [meta-gnome][PATCH] gedit: Add dep on python-six-native
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
X-List-Received-Date: Fri, 24 Aug 2018 20:57:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes errors e.g.
recipe-sysroot-native/usr/share/gtk-doc/python/gtkdoc/common.py", line 31, in <module>
    import six
ImportError: No module named 'six'
make[3]: *** [install-data-local] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index ba425ad6b9..928f8c6bbc 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -3,7 +3,9 @@ SECTION = "x11/gnome"
 LICENSE = "GPLv2+"
 PR = "r2"
 
-DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ gtksourceview2 iso-codes intltool-native gnome-common-native libice"
+DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ \
+           gtksourceview2 iso-codes intltool-native gnome-common-native \
+           libice python-six-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-- 
2.18.0


