Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8B0FE7F8B5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:13:19 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id q70so15271301wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 13:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8luiLi8w/q/Bpfo5PNYoDnkztbQJysZUEHS3TN6+0I0=;
	b=st2C91n8qx+4m+W7mJefS5QcXFJOOfoZSTeoPXk0o7qCaPZGCq6l+hRrN2DiKP07sR
	1IyYmS/s3UOMYl4GNpIkH+lcmRJymayJ7vyxOFnkiobIaQeZZSxoyHEu5jEIljZLsJ4u
	rKFIyY63jiPuHY9cOaIsPOYFSBOXwKTnfGYperHlApaFSqGDVv8bEzB0rQqJVGvz52n3
	L8jqdScCAN7rcBk+Q6wfdZ7c8idTZsIrmyLJbtyNrYXF4bUpbAqNTMjbr8456x8DqxkK
	9xRB5y4M3S/C3ALo9bU5lBrtW+qsvX2ojOJUwTqLzd0EcjMll7q8VBIAtVEBXUYcVMMT
	JuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8luiLi8w/q/Bpfo5PNYoDnkztbQJysZUEHS3TN6+0I0=;
	b=nSzv9AQhu95XbJTheWQ7CfOQiMZ+RhZqDDnFLnd9n37wAgsHPQ8WxMHTFH+3AzgBMc
	lwOauitrdYy8WnjqzYpJd/pIi3IPtQV+zn47DH+TeAPvHFpKH6c+jH1s39++LS5AYE8i
	3+yir7tAAnBm+FdYhtBhoSfadJpYMoxapzNLIKYWpl+owQJ7f7tYYIQPjFt85KUOcado
	WtT1VTxUhZO8397pUjfZlUIorWGYekq79sdR+EPIPzLXAR3X+KkxkIV/Ims1wNsL/J60
	Yo50QGUzrcCK7wq9O64y50QuGhEutf4zKh0ldYQZqTCN9IPt8PfEN3aNl4MG5RdUjtD8
	J24Q==
X-Gm-Message-State: APjAAAVtrT7+hA6chAclMbx7RXRVhnCrfoXGigaXa+o3zm+x6iGCGg2P
	FBnoUKDVGSezr0NkhBAsCTEI85XZ
X-Google-Smtp-Source: APXvYqyFx3f9Gf4/n9TbfWM0Tr1H3a5S1OFkcpHzzDprTbu8n2QVwtZrp9Eae5tgVfBr99FEc5hwMA==
X-Received: by 2002:a7b:cbd9:: with SMTP id n25mr27351173wmi.64.1574025199995; 
	Sun, 17 Nov 2019 13:13:19 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F081983E6CF71012ACD6C9A.dip0.t-ipconnect.de.
	[2003:f0:7f08:1983:e6cf:7101:2acd:6c9a])
	by smtp.gmail.com with ESMTPSA id
	g5sm18564687wma.43.2019.11.17.13.13.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 17 Nov 2019 13:13:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Nov 2019 22:13:06 +0100
Message-Id: <20191117211306.27233-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117211306.27233-1-schnitzeltony@gmail.com>
References: <20191117211306.27233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] evolution-data-server: add upstream-version-is-even & gsettings to inherit
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
X-List-Received-Date: Sun, 17 Nov 2019 21:13:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evolution-data-server/evolution-data-server.bb              | 2 +-
 .../evolution-data-server/evolution-data-server.inc             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
index a8bb69f00..82160b1ed 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
@@ -6,7 +6,7 @@ DEPENDS = " \
     dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
 "
 
-inherit distro_features_check cmake gtk-doc gettext gobject-introspection perlnative pythonnative
+inherit gsettings gobject-introspection distro_features_check cmake gtk-doc gettext perlnative pythonnative
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 2e5176ce7..0893f8e92 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
                     file://src/camel/camel.h;endline=24;md5=342fc5e9357254bc30c24e43ae47d9a1 \
                     file://src/libedataserver/e-data-server-util.h;endline=20;md5=8f21a9c80ea82a4fb80b5f959f672543"
 
-inherit gnomebase
+inherit gnomebase upstream-version-is-even
 
 SRC_URI[archive.md5sum] = "d1701875bbac80d6d62e9acfc6c43bea"
 SRC_URI[archive.sha256sum] = "6ff56ba04cb639e627fe9d6e0ada106a10cadd68a0d53b8ec72b4e285df53abe"
-- 
2.21.0


