Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRRG5-0001kr-1a
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 17:53:29 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3664488fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 08:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=OkXvLGu8Vn/TFOII12ipKPKMxmBhXripHfP1jEJA3oU=;
	b=kli88/gEbshLJC9FlygIzKTJaO+TaqLvMWCYx7KDmBwY6Ch3fmW8jHThXDTagIILbD
	fgTrYwSdSCdRBRlv4wkM+fMkxdahpqJ3RuUOI5TYqx+FJCRrku0iwG4y7fygsThe+q3E
	kcrzrHPw9TW7j4uOIYMi79m/Hk2Mi2peKi1+g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=c7SXsgeA96IWkXAqEXfGCsSIDbVGU5UaKWqLeJ+6Lq9d/f+eB2k1eNT8KCHWB7WkpZ
	EkJlyVdllLAmIVM7vKzJuX+sLuHB25Bfu9mKhfdgnHMLCZS2S42IM+xD12N24Pc6MEBn
	6sSQDa4TAzFnPOiFtITmTz6rT1fZ5MqCa7Q80=
Received: by 10.223.156.9 with SMTP id u9mr4911513faw.70.1306857014392;
	Tue, 31 May 2011 08:50:14 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id n15sm88349fag.18.2011.05.31.08.50.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 08:50:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 May 2011 17:49:55 +0200
Message-Id: <af2f1de23c491cdd25e80011971a9019f20c8f47.1306856963.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <b2a70421756ef2cc7d59c82fb4cd02141e99a52c.1306856963.git.Martin.Jansa@gmail.com>
References: <b2a70421756ef2cc7d59c82fb4cd02141e99a52c.1306856963.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306856963.git.Martin.Jansa@gmail.com>
References: <cover.1306856963.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] gpsd, tangogps, foxtrotgps, navit: move to new recipes-navigation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2011 15:53:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../foxtrotgps/foxtrotgps_1.0.1.bb                 |    0
 .../gpsd/gpsd-2.95/60-gpsd.rules                   |    0
 .../gpsd/gpsd-2.95/gpsd                            |    0
 .../gpsd/gpsd-2.95/gpsd-default                    |    0
 .../gpsd/gpsd-2.95/libtool.patch                   |    0
 .../gpsd/gpsd_2.95.bb                              |    0
 .../navit/navit-fpu.inc                            |    0
 .../navit/navit-icons/GPL-2                        |    0
 .../navit/navit-icons/configure.in                 |    0
 .../navit/navit-icons_svn.bb                       |    0
 .../navit/navit.inc                                |    0
 .../navit/navit/maps.xml                           |    0
 .../navit/navit/navit.xml                          |    0
 .../navit/navit/osd.xml                            |    0
 .../navit/navit/plugins.xml                        |    0
 .../navit/navit/speech.xml                         |    0
 .../navit/navit_svn.bb                             |    0
 .../tangogps/tangogps_0.99.4.bb                    |    0
 18 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-navigation}/foxtrotgps/foxtrotgps_1.0.1.bb (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/gpsd/gpsd-2.95/60-gpsd.rules (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/gpsd/gpsd-2.95/gpsd (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/gpsd/gpsd-2.95/gpsd-default (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/gpsd/gpsd-2.95/libtool.patch (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/gpsd/gpsd_2.95.bb (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit-fpu.inc (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit-icons/GPL-2 (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit-icons/configure.in (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit-icons_svn.bb (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit.inc (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit/maps.xml (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit/navit.xml (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit/osd.xml (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit/plugins.xml (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit/speech.xml (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit_svn.bb (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/tangogps/tangogps_0.99.4.bb (100%)

diff --git a/meta-oe/recipes-support/foxtrotgps/foxtrotgps_1.0.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.0.1.bb
similarity index 100%
rename from meta-oe/recipes-support/foxtrotgps/foxtrotgps_1.0.1.bb
rename to meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.0.1.bb
diff --git a/meta-oe/recipes-support/gpsd/gpsd-2.95/60-gpsd.rules b/meta-oe/recipes-navigation/gpsd/gpsd-2.95/60-gpsd.rules
similarity index 100%
rename from meta-oe/recipes-support/gpsd/gpsd-2.95/60-gpsd.rules
rename to meta-oe/recipes-navigation/gpsd/gpsd-2.95/60-gpsd.rules
diff --git a/meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd b/meta-oe/recipes-navigation/gpsd/gpsd-2.95/gpsd
similarity index 100%
rename from meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd
rename to meta-oe/recipes-navigation/gpsd/gpsd-2.95/gpsd
diff --git a/meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd-default b/meta-oe/recipes-navigation/gpsd/gpsd-2.95/gpsd-default
similarity index 100%
rename from meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd-default
rename to meta-oe/recipes-navigation/gpsd/gpsd-2.95/gpsd-default
diff --git a/meta-oe/recipes-support/gpsd/gpsd-2.95/libtool.patch b/meta-oe/recipes-navigation/gpsd/gpsd-2.95/libtool.patch
similarity index 100%
rename from meta-oe/recipes-support/gpsd/gpsd-2.95/libtool.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-2.95/libtool.patch
diff --git a/meta-oe/recipes-support/gpsd/gpsd_2.95.bb b/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb
similarity index 100%
rename from meta-oe/recipes-support/gpsd/gpsd_2.95.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb
diff --git a/meta-oe/recipes-support/navit/navit-fpu.inc b/meta-oe/recipes-navigation/navit/navit-fpu.inc
similarity index 100%
rename from meta-oe/recipes-support/navit/navit-fpu.inc
rename to meta-oe/recipes-navigation/navit/navit-fpu.inc
diff --git a/meta-oe/recipes-support/navit/navit-icons/GPL-2 b/meta-oe/recipes-navigation/navit/navit-icons/GPL-2
similarity index 100%
rename from meta-oe/recipes-support/navit/navit-icons/GPL-2
rename to meta-oe/recipes-navigation/navit/navit-icons/GPL-2
diff --git a/meta-oe/recipes-support/navit/navit-icons/configure.in b/meta-oe/recipes-navigation/navit/navit-icons/configure.in
similarity index 100%
rename from meta-oe/recipes-support/navit/navit-icons/configure.in
rename to meta-oe/recipes-navigation/navit/navit-icons/configure.in
diff --git a/meta-oe/recipes-support/navit/navit-icons_svn.bb b/meta-oe/recipes-navigation/navit/navit-icons_svn.bb
similarity index 100%
rename from meta-oe/recipes-support/navit/navit-icons_svn.bb
rename to meta-oe/recipes-navigation/navit/navit-icons_svn.bb
diff --git a/meta-oe/recipes-support/navit/navit.inc b/meta-oe/recipes-navigation/navit/navit.inc
similarity index 100%
rename from meta-oe/recipes-support/navit/navit.inc
rename to meta-oe/recipes-navigation/navit/navit.inc
diff --git a/meta-oe/recipes-support/navit/navit/maps.xml b/meta-oe/recipes-navigation/navit/navit/maps.xml
similarity index 100%
rename from meta-oe/recipes-support/navit/navit/maps.xml
rename to meta-oe/recipes-navigation/navit/navit/maps.xml
diff --git a/meta-oe/recipes-support/navit/navit/navit.xml b/meta-oe/recipes-navigation/navit/navit/navit.xml
similarity index 100%
rename from meta-oe/recipes-support/navit/navit/navit.xml
rename to meta-oe/recipes-navigation/navit/navit/navit.xml
diff --git a/meta-oe/recipes-support/navit/navit/osd.xml b/meta-oe/recipes-navigation/navit/navit/osd.xml
similarity index 100%
rename from meta-oe/recipes-support/navit/navit/osd.xml
rename to meta-oe/recipes-navigation/navit/navit/osd.xml
diff --git a/meta-oe/recipes-support/navit/navit/plugins.xml b/meta-oe/recipes-navigation/navit/navit/plugins.xml
similarity index 100%
rename from meta-oe/recipes-support/navit/navit/plugins.xml
rename to meta-oe/recipes-navigation/navit/navit/plugins.xml
diff --git a/meta-oe/recipes-support/navit/navit/speech.xml b/meta-oe/recipes-navigation/navit/navit/speech.xml
similarity index 100%
rename from meta-oe/recipes-support/navit/navit/speech.xml
rename to meta-oe/recipes-navigation/navit/navit/speech.xml
diff --git a/meta-oe/recipes-support/navit/navit_svn.bb b/meta-oe/recipes-navigation/navit/navit_svn.bb
similarity index 100%
rename from meta-oe/recipes-support/navit/navit_svn.bb
rename to meta-oe/recipes-navigation/navit/navit_svn.bb
diff --git a/meta-oe/recipes-support/tangogps/tangogps_0.99.4.bb b/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
similarity index 100%
rename from meta-oe/recipes-support/tangogps/tangogps_0.99.4.bb
rename to meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
-- 
1.7.5.3



