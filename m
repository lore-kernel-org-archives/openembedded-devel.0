Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 95AF575080
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 02:11:40 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id z4-v6so1280368iof.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 19:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=PJiAsgjG+HiWuGnC0KvfC/Kglp2/Gmy4X2V3kFGmhfk=;
	b=I32HF/Gh6pI2hrixR6Rr0HPNU9SkNvt+hBFCyf8iPJLG962fM/nMHNA6CeYXcB8ACB
	+la1qCdahuvx8ZolfVRyQPgyqa7Sy6wZ24Oe+Bkrzjhs5yzGw04K/2+40Ca0Q4+XLdPW
	4ChDwVvYeGS62ZdQPonxu6sdVzplNaqcgzl7sEnJoKCE/K4/z4KqRt8+YLA78gY8iC/q
	WksH/69MQ3+JAxJwC5R8T6lb6ZOlnSctLQuXdeNilRHV+OUyaCsE+zNXyNWS6XJyZys4
	HerGhWcXuGJ1iwTugNm/yUTyRPG1F5JqvBGlvrtHXpyu9qmrkExZq2NtFePIv/XRJfDL
	WmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PJiAsgjG+HiWuGnC0KvfC/Kglp2/Gmy4X2V3kFGmhfk=;
	b=q0XGSFOhdrzbqUrqtfe0lNTzewT2tKzdZftdtJQXqG393iHYVeVRwIbzL2VMmJA2KL
	UxAogH64kn0+zaUeHcJRAEY9e1H8X5SmPbIYyAjhltsMqZ35m1Q6uQOHgGucEsnPJHAV
	p1N6MzHw0VZ+13glKxw+eDP9Em2Diu5zLg1f1sJL52xOE0RCYkqVn4pqdzlz3aZHY/sS
	T+kdFkuThluii0zejUBgUEBj7dmcUm8gZXFknNzC4AW5szM0F/kFM18BsXxX5Wt67dQo
	jJ0NvKnC6KWHY0/p4pdeWdDGylDNZ27C43HWk7x8hvXyVMYuZSMyRqmO/eNYj7KqPBz1
	QvIA==
X-Gm-Message-State: ALQs6tD0VSSJcGmUZdRYOt07sd0mi9aGPRMPtsb6FVQgPkHO8/Qoh59G
	qGiKQOPNttxPhKVYghfFbewbBtr4
X-Google-Smtp-Source: AB8JxZp01S0Nb8h8fG1aXmciKLsYzPsML/kDbS9m36FLSusEA6Ws897xT8+oGA2j3tI/Qg4bMg9NUQ==
X-Received: by 2002:a6b:3708:: with SMTP id
	e8-v6mr52214055ioa.69.1525918301037; 
	Wed, 09 May 2018 19:11:41 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	b75-v6sm16816058ioa.50.2018.05.09.19.11.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 19:11:39 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 22:11:38 -0400
Message-Id: <20180510021138.24382-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-multimedia][PATCH] tinyalsa: switch away from github archive
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
X-List-Received-Date: Thu, 10 May 2018 02:11:40 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb
index fa5449ff6b..66b95db00f 100644
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb
@@ -6,9 +6,9 @@ SECTION = "libs/multimedia"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=dbdefe400d894b510a9de14813181d0b"
 
-SRC_URI = "https://github.com/tinyalsa/tinyalsa/archive/${PV}.tar.gz"
-SRC_URI[md5sum] = "ec5c1cc175fcb8c9d3d0adcececf10a9"
-SRC_URI[sha256sum] = "d92b438cea348ae316c4b2cbf367b4f01ed821a947e6a34d813624e9e3c936c1"
+S = "${WORKDIR}/git"
+SRCREV = "df11091086b56e5fb71887f2fa320e1d2ffeff58"
+SRC_URI = "git://github.com/tinyalsa/tinyalsa.git;protocol=https;"
 
 do_configure() {
     :
-- 
2.17.0.rc2.3.gc2a499e6c


