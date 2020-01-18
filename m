Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 161C57FC7B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:15 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q10so25040237wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/WdfIQVGw+6OG1ONqjBuOC9WJ5xJV9hh9M3KA4ZRLvQ=;
	b=TQrNRErgxmco99EcL35XDehfEdwU4SQc9pjlgwv+uOHaGZVP7OK1odxEBDpgDF2JIX
	CfkdbCCcWGpkKBqpQgKEE9mUEz3l6e31PpsxczBgmSXOCBns7oa7VzA4w3qKlDl+5day
	0ETlA8l7Mn6zPgk++Oqf8pywGpBen3ujOgmrsCJG53hrZakD5LwqsypAk4MejELeV7tp
	gJjXkUQTH6mHZCMj5vkdqRq0eis74eNvCGRl3VIdqkz67wZka0snB2tPh395XupA+29d
	UXKPcwiQ99KerQMNRLgsMG8m1UY3F2mfqRpMRJ39GTmfmjUiibzZ9zqk/wITTYRKSrPF
	HbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/WdfIQVGw+6OG1ONqjBuOC9WJ5xJV9hh9M3KA4ZRLvQ=;
	b=KKJucwqAt6pHzOqmMmNpwfiU77+US28kxSn0weKOvMkWMf9ghe6iTiqNO5FATn217r
	o+wqP/d7UW2lRv6BMktlYF+GkPDBmryA3h9DhwwikSyNk3/9FnzaH6aESxFaQoI2nHuO
	KZiVqOTbXL4R1dfFUcDSD530Ttd6H5neihen0Ek27eVxvSYahpZB781nsUrVrxMvCc4E
	caFATCFphT0DN2AyBKpXsVwkdqkASze2lOaYdVbXIn0WaOZ6GVO3COltboLK7f6nWO92
	IKlGze8q6XojNuMpKld/cifUX98Y48FHcS09wkD7H5/+Cf8sI7QnP7G0IzGPiia6VOSz
	gJFg==
X-Gm-Message-State: APjAAAVZMCeRfFDyp/XKTkV0HZK7VtrJUq2uXcU/NH1ZomSioKqR6F2a
	Z6V0CoO/DaNzG+Nv+Qc4uCkogFMf1RI=
X-Google-Smtp-Source: APXvYqxeb+FaPRhxBbVVA7fqyGm+DOXH4HC21dXLqt3zrhiqL32jZUinXDRphnxYb41IsgoiVTNyUA==
X-Received: by 2002:a5d:548e:: with SMTP id h14mr7495388wrv.380.1579346895707; 
	Sat, 18 Jan 2020 03:28:15 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:45 +0100
Message-Id: <20200118112757.5287-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/23] parole: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-multimedia/parole/parole_1.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-multimedia/parole/parole_1.0.5.bb b/meta-xfce/recipes-multimedia/parole/parole_1.0.5.bb
index efee1aa93..f55b19459 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_1.0.5.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_1.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.xfce.org/apps/parole/start"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-inherit xfce-app gtk-doc mime
+inherit xfce-app gtk-doc mime mime-xdg
 
 DEPENDS += " \
     dbus-glib \
-- 
2.21.0


