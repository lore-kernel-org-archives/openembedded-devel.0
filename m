Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A8EA871C90
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:08:27 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c85so33419964wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 06:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RT0AFngnHJk2qaSScXzVg+jorrRG/VFdZCQbeqtwTto=;
	b=Q2v2Pz9SHc3eVDV+3ZUapNjBsUHsg3UHx2k0/vjRj7wY4klVGSt1wxNxW067QWzkne
	SXVUTeAWU9hjC7IngtkOD+lMj1I/5ug/itQfRnjT4uZzfdBgZeJXy0Zudc7d8/rmbbN8
	Cm7DhEKq8ml2+FcpkKC2jToKJLSJAtrDOfK30p2Xyb/CSOS65yGyOyEat+ATXnEZs4Qf
	1XLNy+gfLoM24w422yf3fcuDiKAindFqqUklJXD7RRiJL3J/lIpw+Gt3bH2Fm6a0IJkN
	LvOJprcnVwYhO5mG6Br+F4qVPnaf7FIc65stgaLsffSmvD/Q753+4jvUkhJa8qO2vyvQ
	ECuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RT0AFngnHJk2qaSScXzVg+jorrRG/VFdZCQbeqtwTto=;
	b=mRl9ftq1g41PwuL+IT9+1xeqAw5mRa9IbJljOcBDbWLUKUf1KP3mBezQefIBydDdoB
	JvRzExwO07IiS8X0jos54c0RNdwokrhAkvtqEPfLTH5aTd5wBddPckuG24gSBvSxr+Ce
	V85chreZQe+SEQps6Kgz9DAQFNd6phYjTPlqoqgHxbA5B8MirtVmzqx+BT9OYSA2pVj/
	LCt9zMuzgIpQhoJqjTJmX6hQS0iF1JeBEk6Q6V0JygJHcAsumVhcMjj/rzGiqLRAqmEW
	BcVLkQjwX3eZ4i+APN3s5eKdLsQNmhQzyJJUJgZ5BqKmtDmIc/CoSFMDHjhCS4LItqj1
	NVVg==
X-Gm-Message-State: AMke39lu/7MJeB9aP3jxzFerce7kF3HiXGCEGZufWVl7vcK1f7uCv/obUirWayJ9ttKTLw==
X-Received: by 10.28.127.13 with SMTP id a13mr17053918wmd.96.1486562907485;
	Wed, 08 Feb 2017 06:08:27 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id
	a72sm13143357wrc.48.2017.02.08.06.08.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 06:08:26 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:07:54 +0100
Message-Id: <20170208140755.12812-3-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170208140755.12812-1-andreas.kling@gmail.com>
References: <20170208140755.12812-1-andreas.kling@gmail.com>
Cc: Andy Kling <andreas.kling@peiker-cee.de>
Subject: [meta-gnome][PATCH 2/3] dconf: fix bash completion in wrong package
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
X-List-Received-Date: Wed, 08 Feb 2017 14:08:28 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  bash completion is used by dconf itself not by editor.
  move file to main package.
---
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
index 2830e717b..f7666cc0f 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -22,10 +22,10 @@ PACKAGES =+ "dconf-editor"
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${libdir}/gio/modules/*.so \
+    ${datadir}/bash-completion \
 "
 FILES_dconf-editor = " \
     ${bindir}/dconf-editor \
     ${datadir}/icons \
-    ${datadir}/bash-completion \
 "
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/libdconfsettings.so"
-- 
2.11.0


