Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 87189770CD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:55 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id v16-v6so10506132wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WRj9TgfmMh5lIVCrXGzpMhBSxYoUHyx9nsBVYB/Kt8E=;
	b=PEyEtBPOlrlzWltid9/1zjqsy6pr+10gqiE/aMVicfT0CCXTaBmzwEJdGCWRZzbD3c
	9Zzd8KAFrJB2QMNV1g/L9HRih+2obrD/B4iPB07Urcrhs6GLMfk3cxwHZ5S39mwSYbFr
	lbveGMt8b4O0G6paBNQTi8uq0A3unQzRysjsP5CmPs/NUgiCisgCZdX/5RHmz7FYMpMX
	JReOiQbZI+XtyBkESW6odip5Rm7u/UF3wXFRc7Y1YNm1lTyGhKeqLIMYMrGWzcjr6ok+
	+qFN6JvViuXSIubH1FxHeE1QGoJ4a7ssD1bOlcrejnTxBXb+fTdRIuy61/WjKOc2fHNY
	T/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WRj9TgfmMh5lIVCrXGzpMhBSxYoUHyx9nsBVYB/Kt8E=;
	b=jRhnTisl8IjX5ah9mss67BaxnhsM2TiF9glrFQpg5q8befd0yLHqMGh74qnSSkWnsS
	U74GxjREvvLYiSrkgweHpBW1jUgwHDctpw0GW+f1zGAIW4nkeiqm39ja4+eth46qazJW
	q21iKeDth+bvwnAIwyxEOcLeLv47mkjKO3gvAam9VmHgxsf+esyrL82qgjGnFUBifTDt
	JfsVkrRnRTRtHyOoUjjodb4lXsLmxbbcgmxzZmnyANHFUakZn61RfMTOPOF4IK4mQcqk
	GFKbzKitxVfvKN1LuYHs0A8/lz9Pm3HYTRvnnkYFixIF2llxBD2iFnBs9R6WoYLwmqX1
	IHRg==
X-Gm-Message-State: APt69E2KVy3tnXW8H3qQ/J6Ot9JXcbSsRCtgLtULdg09aijDm4rtMT/s
	AnL6K+Z4BWRAVRCBxVkG0MhYFg==
X-Google-Smtp-Source: ADUXVKJQc9he3QrNUezEh1D1UxgWVRhR35ma0nrqWOayPcchQ+KP/PIlukadVpD35C1W/vE5xiYyfg==
X-Received: by 2002:a1c:9b04:: with SMTP id d4-v6mr5786163wme.8.1528643335938; 
	Sun, 10 Jun 2018 08:08:55 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:15 +0200
Message-Id: <20180610150821.9536-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 13/19] xfce4-taskmanager: upgrade 1.2.0 -> 1.2.1
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-taskmanager_1.2.0.bb => xfce4-taskmanager_1.2.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.2.0.bb => xfce4-taskmanager_1.2.1.bb} (61%)

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.0.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.1.bb
similarity index 61%
rename from meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.0.bb
rename to meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.1.bb
index f9555852d..8afea1d22 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.1.bb
@@ -6,5 +6,5 @@ inherit xfce-app
 
 DEPENDS += "gtk+ cairo libwnck libxmu xfce4-dev-tools-native exo-native"
 
-SRC_URI[md5sum] = "6f30ce3c688454812008281065a6e05c"
-SRC_URI[sha256sum] = "5746d473ad428b13db7c05cfcbc8099fbea13da6be26d3a9359bcb4de971ba69"
+SRC_URI[md5sum] = "4a2d0b1e8001fb343139a97d57b56eaa"
+SRC_URI[sha256sum] = "22e523e2ee231713f40a48890d8cbae99320ac1173f7c68502f490318e1e0409"
-- 
2.14.3


