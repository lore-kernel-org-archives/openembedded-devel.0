Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4725074E12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 23:09:33 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id e21-v6so622332pgv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 16:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=y6CWaEI/CynLXTnatNCEL28qnV5AcAfrvDLU95/Y/58=;
	b=sS/JcPU6+H4vguA/G8OWcEVYq6TOZMODjYbZcRXCvay+HlAx/1uDOSgMxXXu72VXaV
	P3/e6sNMwGwxdwz/P58Tda5t6mOLeSxWvlGkz3CdqouVOlB5iLyxC/Yf7aWuPCIo0hPe
	TxnmMmCCukzACjfC+k68pkHyjPO5ZO4vufj83is4qsOIB1+q52E7dO5Peh+/Pm9Xcwvc
	/burOaf+y/h5D6XgLNCYMgBV0IuGKjeinVPyP82Y8QVWC1RU4rOoLwGNiVtCOyxECnWV
	UhD9aHbwIz9oZqpwmmTUTRdSSdaQSmqs1eTLBsFnKRJqS0dcVK4hxvojRcLM8W/EYNoz
	q+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y6CWaEI/CynLXTnatNCEL28qnV5AcAfrvDLU95/Y/58=;
	b=SBAXE4sLA7/vhej+Ywch3IARB6aClaMdyZI176eR14czceydvjVXRd7dwJmy5gtdF2
	q5Dsw4ZO2pPHHNK4peHI9vbkIcY6bPbraI7sQ/yXGu96tokKVuVjEUNBLwNfjf2uxDTa
	9YKiQP7lte4Erx3xEoQPQmcm8rFNqBqxobur84Swh/bQF7mdlxA1qGQPg6zca0SPpwbR
	zkM0dB0txDjw8ySWbmNat8mJXuATw4DGIiX8divYfviuur+V2T/hJqerrNVSk78McmuZ
	VTJ97gQ4k9VHZPqPeUT8RAVZjHNyo8kaw8jV3y+UX/9i3c7JtJvVYiuP2v9GMxdoe4l0
	d9cg==
X-Gm-Message-State: ALKqPwewrLrqyN3VecfyFZmTOchmjHcy5qFx9xaMX7zoEBET6hYwl6EE
	/ZM8qZOgRfqu6fexFuhxWI7wkQ==
X-Google-Smtp-Source: AB8JxZrh+tTEqVW0CkhzDEE/ViQ5YfWoH6RkwMEmJU7Szo0J6hf7MwTQzIubO/oSTWz+buIu0y1v7g==
X-Received: by 2002:a62:c898:: with SMTP id
	i24-v6mr17914196pfk.35.1526857774955; 
	Sun, 20 May 2018 16:09:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	u86-v6sm27043120pfg.71.2018.05.20.16.09.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 May 2018 16:09:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2018 16:09:32 -0700
Message-Id: <20180520230932.32899-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-gnome][PATCH V2] network-manager-applet: Package gir-1.0 files into devel package
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
X-List-Received-Date: Sun, 20 May 2018 23:09:34 -0000

Fixes QA errors e.g.

ERROR: network-manager-applet-1.8.10-r0 do_package: QA Issue: network-manager-applet: Files/directories were installed but not shipped in any package:
  /usr/share/gir-1.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2:
- Add a comment explaining reason for packaging gir files

 .../network-manager-applet/network-manager-applet_1.8.10.bb  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
index dc2b964be5..91ae8b740b 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
@@ -43,3 +43,8 @@ FILES_${PN} += " \
     ${datadir}/libnm-gtk/wifi.ui \
     ${datadir}/libnma/wifi.ui \
 "
+
+# musl builds generate gir files which otherwise go un-packaged
+FILES_${PN}-dev += " \
+    ${datadir}/gir-1.0 \
+"
-- 
2.17.0


