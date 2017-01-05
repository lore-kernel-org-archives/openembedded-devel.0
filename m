Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C42B571A92
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 17:11:42 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m203so97671491wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 09:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=R8FrdoLO69vt8geDO3+o7AK/HKuic8h992A3whBON08=;
	b=ZOHps6gE6m/fR7KbNBGDA/FLZaYEj3zDd78GB40y2/esQi4Q/HFJoUB+LXXIUfVDni
	EfX4QNOKCJTB8Tf+UImzv+ro3LLsuH7CTMrAuNmcqXZHWE9zSg0MHh9FBU59MXnQ6xRy
	+nyLITz2B4M1J6w+4qOFXaDcCcCpsDSAW/LEjsDxhZOMK+T7eMFhFOsLvryehcDOYVch
	thz+2aggE3FT5ko9FKDZH1Hvych6KAaewvxM9xLzdUjaIE6fwsmdBTP4wEl3f+O6WF0d
	mNFQnQZuw7/F7ATMinMV6kxu2HBgiLWoO9O+gB++OBXv4aQaD62GY4tVqgbf/+AaKeg+
	0KsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=R8FrdoLO69vt8geDO3+o7AK/HKuic8h992A3whBON08=;
	b=L5zOCY2TZbZavLGpLQ6cuwGWNErd1WVIeYWeJ80vxK8AU0GOrEEcKvxZ5O0+Bdlw2V
	zLzsyzdBBmM9qdbcZSfOZKESj/ZaFNQelwh42auIPfkRAJ1JBrRMhFsJ/ZHC5wfVz2Z1
	F+oqCg+VMJdAx0VrxGqVhptBlIhTjtlS4qw+3AlfFlP1fWiyTnQPZgqiXQmQrlStqEGj
	kacUHfjcj2lY8um61oEigurh8RAN8mPEaCKaBqVuDvjid5vpL/u9HSR5Oig41cIYji+C
	W18wJi9Pu72ry2J9mNcVfs4ejNcxm7lSY3JK+axtI7IL8RAylqmilDmmpOCIJC3WLktA
	jh+w==
X-Gm-Message-State: AIkVDXI4r+bzU9ZTtq8sp+iNRn/ocjL7FNRgTD85jFewYJXtCJ/YbOIvynPkDvrhmfSfnQ==
X-Received: by 10.28.134.146 with SMTP id i140mr66072057wmd.100.1483636302813; 
	Thu, 05 Jan 2017 09:11:42 -0800 (PST)
Received: from localhost.localdomain (p579F79CC.dip0.t-ipconnect.de.
	[87.159.121.204]) by smtp.googlemail.com with ESMTPSA id
	81sm101153107wmw.7.2017.01.05.09.11.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jan 2017 09:11:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 18:11:19 +0100
Message-Id: <1483636284-6351-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] glibmm: update 2.44.0 -> 2.50.0
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
X-List-Received-Date: Thu, 05 Jan 2017 17:11:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/glib-2.0/{glibmm_2.44.0.bb => glibmm_2.50.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.44.0.bb => glibmm_2.50.0.bb} (87%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.44.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
similarity index 87%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.44.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
index d9cffff..ebe7747 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.44.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
@@ -14,8 +14,8 @@ SRC_URI = " \
     ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.xz \
     file://remove-examples.patch \
 "
-SRC_URI[md5sum] = "32ee4150b436d097fe2506d0b0b13a75"
-SRC_URI[sha256sum] = "1b0ac0425d24895507c0e0e8088a464c7ae2d289c47afa1c11f63278fc672ea8"
+SRC_URI[md5sum] = "e7416beff6cba1f38c2bccd0dc8c3278"
+SRC_URI[sha256sum] = "df726e3c6ef42b7621474b03b644a2e40ec4eef94a1c5a932c1e740a78f95e94"
 
 do_install_append() {
     install -d ${D}${datadir}/glibmm-2.4
-- 
2.5.5


