Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 063C97C540
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Feb 2019 06:18:03 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id b5so1213252plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 22:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WPqJqo3FpL59hQEljB3S27ys0isf0mD1/q36eDgpEtA=;
	b=J2mpxCK8Szf4U2Uze+rwNSor0IrCImZphm/BYJe8C/c5cWRNmHr9KzXRhmeSb3MIPg
	iFhdrc0fmH0nm6kPGubk4VFOdzJjQi0o7R+9axfn2r4AIHBIE42tKdfJDujKyfkJuXbN
	3LM0yT8YLbeQAOz1Ng+yTepc5DfDfx5W4S84hD2jpbTRllTZ44vpZoSAi56DTwzsTzFY
	4K2ZIVFhraYYaHJ37rLj0LlLdwHJcy0yMNfJAW/a1vTfBNiBC4lBSXT5/hVmdvvgdpW3
	LGYIC0WVi2eQulW7oH+Ml8gJiJKT7x7GplIkTTMWC6Xkc4QNWfVxheV/Ub3yWrm0N9Hl
	R7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WPqJqo3FpL59hQEljB3S27ys0isf0mD1/q36eDgpEtA=;
	b=rQIMBiLZ6QAxJwbpmVqfk9+0MD/7xkpgt7OxP4j2fSNJBodduJKReRjWio0w4qK4Cy
	Y/EANbsoNcJk7n0jd1LQXLqloFbc8jgEfA9w536HDlaxUJKg8nbXSvglzwRWzxbFFzwc
	akiOiNB2qX4PU2iVrCkLNG8ACaOKpVFz93OAl2PJTFM6dbT4i0i87LrNkjaCOIAIwlv3
	W8pfLNukdTvX8EYL+iS39o6D9WUM5GftwBGfr1vWQ9mxKdT4XAauSsVg1NpTWCQiPhsT
	As/UTlEOpViNNdD7IPqhvHnwSdlJtXONkE1Jq31V2I2WwQAv9rHG8vCyQTPRGZRJHR3C
	v8yQ==
X-Gm-Message-State: AHQUAub4lCfpUKBDATfFVgjanNphgu3EZywCAnSp8WW5P6ONnmf4TeA8
	tUhTWc+7vI20fk3YhvghshsvvZ0l
X-Google-Smtp-Source: AHgI3IZ2tt/DMmcK/rjxYYbI9pRSYA0j3WqkG1wqTe5eG4xdddj2AONkrgpsPToOqnBNiREpa4Ua5Q==
X-Received: by 2002:a17:902:820c:: with SMTP id
	x12mr21180715pln.315.1549606684757; 
	Thu, 07 Feb 2019 22:18:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id b2sm1139905pgg.87.2019.02.07.22.18.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 22:18:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2019 22:17:48 -0800
Message-Id: <20190208061748.21556-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190208061748.21556-1-raj.khem@gmail.com>
References: <20190208061748.21556-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 4/4] gerbera: Update to 1.3.0
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
X-List-Received-Date: Fri, 08 Feb 2019 06:18:04 -0000
Content-Transfer-Encoding: 8bit

Add missing dependency on libnsl2
Turn systemd support into a packageconfig knob

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/gerbera/gerbera_git.bb         | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
index f763cf1e42..9c78da0d23 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
@@ -7,20 +7,21 @@ SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https \
     file://gerbera.service \
 "
 
-PV = "1.0+git${SRCPV}"
-SRCREV = "4435b165d121195aefd67d0287f7f9349e181d45"
+PV = "1.3.0+git${SRCPV}"
+# v1.3.0
+SRCREV = "c7a81fb41e446ee67b3eac90e2caecd6de651a16"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "expat zlib curl libupnp e2fsprogs sqlite3 "
+DEPENDS = "expat zlib curl libupnp e2fsprogs sqlite3 libnsl2"
 
 SYSTEMD_SERVICE_${PN} = "gerbera.service"
 
 inherit cmake systemd
 
-PACKAGECONFIG = ""
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=TRUE,-DWITH_SYSTEMD=FALSE,systemd"
 PACKAGECONFIG[taglib] = "-DWITH_TAGLIB=TRUE,-DWITH_TAGLIB=FALSE,taglib"
-
 EXTRA_OECMAKE = "-DWITH_JS=FALSE -DWITH_MAGIC=FALSE -DWITH_EXIF=FALSE -DLIBUUID_INCLUDE_DIRS=${STAGING_INCDIR} -DLIBUUID_LIBRARIES=-luuid"
 
 do_install_append() {
-- 
2.20.1


