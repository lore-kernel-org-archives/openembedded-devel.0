Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id DA8887FA81
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:13 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id q130so7270509wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QMXzKEb8/jzJXGpfkXF64naY8j0gRlZeRMlout4IuJo=;
	b=sjAckclXo0DBnVKWichMrpvMooyNPmoGnzuPzu8pnU7BALXiniQQLzuaMNDXN5jrdV
	b+OXl5nWA9muyXkp2QAhPSM5C+7X4HZab5MDOQvT5/5VBoeB5UW2gnCKp1lLmh82Nt18
	/3krKRZ1+NbBOUtpKdfKeYuCqODVW1Q0wZ6sKW98m1dhXXc8+r02fQHl+d4vlBzabKJL
	jjhjZtgKz9jPAQTXQEd7tWivIVUm8sLoST5kMPD7lEoNI4p0Xm7NN9WKxkriALuhENVS
	a0I68nhZV+ZkIkjPlbn2VZT224J0RAUKdH2lUU6pPUN9zJD3330QYp7CV/uBvR/SkIRs
	C9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QMXzKEb8/jzJXGpfkXF64naY8j0gRlZeRMlout4IuJo=;
	b=dL6VfuJgC5j4HArnDBMFJ0cW3yM4hWQhSglT/iwVYyJh1/UzEfZwk0rE5kqcSQQcLi
	20rtIBDXc39cj5NkP3AxXJuUUGQzdlsSLWeGYWUBg5s79vfVpobhCC/xDyusflftmNW4
	McH//sCPFXFpiUUQW6U64ALbPL8WfPMX0EgrjpifhKIZUGDez/+uAPQdzYWwPQQu42Q/
	XLgr4B8+Q2ln5+SLXfn77mvM6vGNUXKYG4NeB84SG4vRBRaf8F+YqmojRxvEoI75uzHR
	d1Gorw8gmXa5puuWTvx1z6apgwm8JrtJ6UQMaLRcxVXloAOSxLWLOFv9MUd+O9gCEgFu
	ClEg==
X-Gm-Message-State: APjAAAUIxfRavf0bilD492ff+YOP9jI/cQCOAWRdAqlmjMhPoY5VFD+x
	bBl7+uAJ+OodprVt66pjatcJdB1N
X-Google-Smtp-Source: APXvYqxrBREAE7+KYvnS5tO7+6BtQQbEkB9AsGlXc1OoGRKb1AZL8lk6MSTCwl91gbyRa9TNrvNh5A==
X-Received: by 2002:a1c:7311:: with SMTP id d17mr12306179wmb.49.1572219374427; 
	Sun, 27 Oct 2019 16:36:14 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:42 +0100
Message-Id: <20191027233545.4146-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/19] gspell: upgrade 1.8.1 -> 1.8.2
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gspell/{gspell_1.8.1.bb => gspell_1.8.2.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.8.1.bb => gspell_1.8.2.bb} (51%)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.8.1.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.8.2.bb
similarity index 51%
rename from meta-gnome/recipes-gnome/gspell/gspell_1.8.1.bb
rename to meta-gnome/recipes-gnome/gspell/gspell_1.8.2.bb
index 9de298c41..128a89f5d 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.8.1.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.8.2.bb
@@ -1,4 +1,4 @@
-SUMMARY = "spell adds spell-checking to a GTK+ applications"
+SUMMARY = "gspell adds spell-checking to a GTK+ applications"
 HOMEPAGE = "https://wiki.gnome.org/Projects/gspell"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8c2e1ec1540fb3e0beb68361344cba7e"
@@ -7,5 +7,5 @@ DEPENDS = "gtk+3 iso-codes enchant2"
 
 inherit gnomebase gettext gobject-introspection
 
-SRC_URI[archive.md5sum] = "8269918ea5ff798e49943e7daf6a32b9"
-SRC_URI[archive.sha256sum] = "819a1d23c7603000e73f5e738bdd284342e0cd345fb0c7650999c31ec741bbe5"
+SRC_URI[archive.md5sum] = "4f857382bc9d8d4afe1e67e5b5b9dbff"
+SRC_URI[archive.sha256sum] = "bb9195c3a95bacf556d0203e9691f7489e0d3bc5ae1e5a440c89b2f2435d3ed6"
-- 
2.21.0


