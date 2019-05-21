Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB127E101
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:37 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id b76so8313077pfb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=22vJ03wj6sBDyrE1BnaGjfUaMHKmLSnWbdTm350Bl6o=;
	b=KNHpIblxh9LSZN3Bme1Rm6WWRvOd7UnV0piwscC21lvlg3AKwY/lWJXmhlnG0bXySY
	KUTqA0WtGCse3Zjp4IIIAwHhDV1gdMiPWoGqR00klUGXvAu/VzikNMuEDzlsZZ2WkVbm
	TW5iJJo2yoslaBTsFUXftf210tGUzRSdLrS3VhBM9J+7A7+MhyEiq2JIh30pliNAKOTt
	pImorz5K8lW+goJoPU1XNf8pG75jN0jNPNm5movQnvhX91azr7ILukDkpC0Q0CVDOu7a
	BdNoFCNm9NnWhm1j/nuRm2CLCUJo8x3m0uukf8sfSe4Qaf9otVummS9bk3Du3ibnjEZg
	Nnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=22vJ03wj6sBDyrE1BnaGjfUaMHKmLSnWbdTm350Bl6o=;
	b=ta2zVQx1pZpsIIvY6LW6ZbNcCE0XjEJGba586YVE0PV33CwauGSU7ihGqJvPIX6/Nz
	6hpyv8B30wDgF5PT84LIcG58MoLCUlHqHD5I2UNThmU4PdUzjfVhwoG8AsJj+6CgBz2Y
	uWYVJ7xO1BeMfOlB1ZZ1Pz2LfctFQTeubKAoO59uXFHs8UNAenScdojzJGlDN2tBrTE7
	EUSJNzbejfrsKbHEZ6pKMjLCczXTYV+y71O9Jdo+5kfHR269Q6yU3uXhc9H1CQ31+5fl
	f6pGwvpN2mgMAMRZBhyC3MkO1ySVAtxMYIkuSu2hoDMZdPhAvOyENU9TXASRyXZ52XF5
	fttw==
X-Gm-Message-State: APjAAAWe+QqRr4sGgeZ3EiGtd6JSuKkqwLShSK2h6cQAJaJDwUvQpBU/
	W9Z3jnOxXZLVM5vJ+PBi1PQFe8dI
X-Google-Smtp-Source: APXvYqylcdW2WrflWPYOjm+iIxXgsGm3g1QyKwf8U/H4thJ9OJOJz9SxKFgqHKGGOHkVT0rIBba2Xw==
X-Received: by 2002:a63:a08:: with SMTP id 8mr79014227pgk.46.1558410998634;
	Mon, 20 May 2019 20:56:38 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:01 -0700
Message-Id: <ddf9156c384735afecddebbf4534ec5422a53db8.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior][patch 01/34] cpupower: remove LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 21 May 2019 03:56:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

cpupower is a 'special' recipe since it does "inherit kernelsrc" ,
which essentially means that it doesn't have its own sources, but
reuse the kernel source tree, from virtual/kernel recipe. As such,
checking the license file in cpupower recipe does not seem relevant,
since it does not fetch anything (kernelsrc has "deltask do_fetch")
and the fetching is deferred to the virtual/kernel recipe.

so we are basically checking the COPYING file twice. If there was any
license issue, it would have been caught by virtual/kernel recipe
already.

Hence we remove LIC_FILES_CHKSUM like it is done for perf recipe in
OE-core in meta/recipes-kernel/perf/perf.bb.

It has the nice side effect that BSP layers can use different kernel
versions without worrying about any LICENSE checksum changes in
between kernel versions.

Reported-by: Daniel Díaz <daniel.diaz@linaro.org>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7142f09407b81c2221bbf1c5078641ab4bc63ee9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/cpupower/cpupower.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index 9289738..abf1585 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -2,7 +2,6 @@ SUMMARY = "Shows and sets processor power related values"
 DESCRIPTION = "cpupower is a collection of tools to examine and tune power \
 saving related features of your processor."
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 DEPENDS = "pciutils gettext-native"
 PROVIDES = "virtual/cpupower"
 
-- 
2.7.4


