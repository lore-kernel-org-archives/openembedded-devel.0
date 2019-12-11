Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 586697FC4A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 00:08:53 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id p17so5121087wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 16:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QPyHp3RCjf9VC9GZl/K2tjiL6cH2TEwDzR17dYmjiFo=;
	b=vNMlT4V2u5YxDJVGuYdmwY9s8pEktRbMTO1ondUmR1JVqbTTijYqEspMOeirYoFUqn
	PrQKjjdW1BkmP1els46RPg9nOKK5iCm65EPgi27ZaVYZ/DZETdj8pp2dwfro6E39IcYD
	DSNEPOkXi+ZpJRVgdUGpgB6O8EEl+ArW8fUTdNp/chNJbB9GyLclhSpxl+h4DTPxrLSB
	h6S3a5+Tv85WGLX1SIpw3e4Mqd1Z83npshMYTgQtuE1FTNqOdSaDSjFEaKr1mlCSd8sF
	H/zyUzMj1vR5tPEtCwsC4C0N2IZOAsAhPljjiNbDjGhSOb4T30ON2vDxf9aarxVJuQsf
	SoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QPyHp3RCjf9VC9GZl/K2tjiL6cH2TEwDzR17dYmjiFo=;
	b=FfB0iEGFRJ2g3UPO+Uw8HQsbUsnvhy6vafGtPHfirFlMCmZBypQqGQ5BvHp115oSSb
	R0VLxTOBjlZueAbB/5jW9SND5MkmaiRbhyn+ZDQWeat7Kuux9mmxOvMlTT7nSZLaldcm
	3Qo4kj1J1AfRKnn6g9nW1KVBlOshfiTUZWl2mvHzf2kFWqon+NCYcLImuk+lYdccQQ9S
	CzM/gfpFS7TjmQzzivr8SLA1PED4Ffsawj/j2TVFDjgp6jocEcN2Yk3fix4DLaSkmp8Y
	R/7VTfR9woQhTQtvLpAl+Qa8isB1yjoBLFOj6lbiDZQweGVMgCRc+fkYPfVPYfnZwMsA
	ihew==
X-Gm-Message-State: APjAAAUOUj47ftWoG/AMuVs6/2NyU/dp4owIBQqI6VzeQuznh6dSlU0B
	8KrN9OJaOcW2Ra7xTapVpu8J0CEh
X-Google-Smtp-Source: APXvYqybajzyJ2LcmPr33g4MMmZKxgvzzwaB9MFFVZaoSy2ywNa9C43Jq/sPGChevxUqkN70zuHz1Q==
X-Received: by 2002:a7b:c956:: with SMTP id i22mr51816wml.65.1576022934114;
	Tue, 10 Dec 2019 16:08:54 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A278D51D7E1425A5C61C.dip0.t-ipconnect.de.
	[2003:f0:7f05:a278:d51d:7e14:25a5:c61c])
	by smtp.gmail.com with ESMTPSA id h8sm163481wrx.63.2019.12.10.16.08.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 16:08:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Dec 2019 01:08:43 +0100
Message-Id: <20191211000845.13166-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191211000845.13166-1-schnitzeltony@gmail.com>
References: <20191211000845.13166-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] accountsservice: fix build for systemd not in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 11 Dec 2019 00:08:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/accountsservice/accountsservice_0.6.55.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
index 36fecfe11..edc489000 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "ff2b2419a7e06bd9cb335ffe391c7409b49a0f0130b890bd54692a3986
 GTKDOC_MESON_OPTION = "gtk_doc"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
+PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false -Dsystemdsystemunitdir='no', systemd"
 
 SYSTEMD_SERVICE_${PN} = "accounts-daemon.service"
 
-- 
2.21.0


