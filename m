Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id 42C497ED22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:43:16 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id d17so8134791lfa.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=kgNr8xV0PfxZuVO8b6eMJnMkjBDFOpQco31V0gXSy44=;
	b=p7HDfKkSto0opf8zIJKQ9VxiqZuAtN23pgEqi2+Z4FogbowatbNJqA/BbiIqIPvfIN
	6wmCg/Q3ImGVIY7J0Sk52pvBEp3KdZArQ3xEhBryV8vAQKPjfcyu5RG7x+cGKgpYpUkd
	ZQgpVccazmC6cMrjJduNLZisd5sPjgrsmnU6Objm20b1OW5trIg1njwynNp+5hyPv2BS
	pOQm2KjmPmqFccc9ERV0h0dOl2ZuQO8xVDzzv0lScvZR2PM/LiKqD7vtBidKFi7/F7cd
	KE4gmwtoTpsBtVdHEIk6IUEdyaYp+NYY/pOs2r/o89rQfPQp5bx8GmHdMvXa/IMM2tmm
	M5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kgNr8xV0PfxZuVO8b6eMJnMkjBDFOpQco31V0gXSy44=;
	b=Bpqc46rCP2l5u02XK1pkvwilDjObwBRamuoqrz8v2AxyuBSYIeZKYbl/lj4CtNArTV
	MD8WESLJOWbx9hrUqHiIAuxDqKex5Ja0OPJMuXI1M0GPjGh+mWbm6u6pihE5SwOMS851
	dR/5/IdJLpBtNzCuZhKvQANBCoPah/jUr6NO2KSXlB3qR7yY52lliyAZixSjm6GxlA7k
	sq98FlBIWTC+R7HvCG1IBvJQ9Sa8i3zYDl785EcEG1tyIhIiG4UXJ+jDabTsSuhdFdR+
	LCkbytjHjlw6fY8b84OxUZpB+jaZvtmoHYwnuS/6XJXKozDLvFAVKhtW6BQgFy/Gtd2k
	3dOw==
X-Gm-Message-State: APjAAAXFOTmiwHauD+6vSOUNMGn+mJj6Mn0Dt6APscIyIYjA24DuuddA
	7KIAOcAz8nxfcAVlDSXtsh4kjp4eiPg=
X-Google-Smtp-Source: APXvYqz1mRgbLkfDClKEnp+sHnXBxyi0btbwJdZJ3xPNDkIiVUIkYO0Eyd7NldX+XCgL/MtZDSMiAw==
X-Received: by 2002:a19:2c1:: with SMTP id 184mr4427046lfc.100.1568590996642; 
	Sun, 15 Sep 2019 16:43:16 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	p27sm8550157lfo.95.2019.09.15.16.43.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:43:16 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:43:13 +0200
Message-Id: <20190915234313.14270-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] catch2: update to 2.9.2
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
X-List-Received-Date: Sun, 15 Sep 2019 23:43:16 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../catch2/{catch2_2.7.2.bb => catch2_2.9.2.bb}             | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-test/catch2/{catch2_2.7.2.bb => catch2_2.9.2.bb} (83%)

diff --git a/meta-oe/recipes-test/catch2/catch2_2.7.2.bb b/meta-oe/recipes-test/catch2/catch2_2.9.2.bb
similarity index 83%
rename from meta-oe/recipes-test/catch2/catch2_2.7.2.bb
rename to meta-oe/recipes-test/catch2/catch2_2.9.2.bb
index b5c857329..57fc935f7 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.7.2.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.9.2.bb
@@ -5,10 +5,8 @@ HOMEPAGE = "https://github.com/catchorg/Catch2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/catchorg/Catch2.git \
-          "
-# v2.7.2
-SRCREV = "7c37501b070c0e9ea9cdedbeac2059f0a6b0a8ab"
+SRC_URI = "git://github.com/catchorg/Catch2.git"
+SRCREV = "2c869e17e4803d30b3d5ca5b0d76387b9db97fa5"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


