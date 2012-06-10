Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3N-0001fo-76
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:09 +0200
Received: by wibhm14 with SMTP id hm14so2039672wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=aRGPIeQ59yyrXRcOFXlwjjSdeOt8AnNvYtCi1ihJhPw=;
	b=Li7SHfxFw/GjZEdrOtpMPbcZDFIEnoeABin1kjAwld7BVLtNdpT4V3oPYyXqlhpC/t
	mc+zGqYnelY5YjA9MrlfCgj04skf6ZpeLlK/NNP+BnefYS25OtpGts91uerI04XQ7uis
	AE4gO7eo4hJ7w9/a4MVtTG3WWfJyzvWRFYdRzY4bO+fXLwtfqaIKiJK4ancrGIBCUAfA
	fJ8EUTX1JKFGEJZ73NXx/W6oybfHU3DUwDaCrKaTUvckZMiTrNPoL/VKB630FALT821X
	XDgSJO/3AtSo9uLHxUxzIWozWye/7HRskF4aad0qHMChHEmyNe+oG+qAA1wMqJBFd8wm
	RgxA==
Received: by 10.180.92.65 with SMTP id ck1mr15692169wib.14.1339364496589;
	Sun, 10 Jun 2012 14:41:36 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:35 +0200
Message-Id: <1339364820-2880-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 02/27] move systemd recipes to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-core/systemd/systemd-compat-units.bb   |    0
 .../systemd/systemd-compat-units/machineid.service |    0
 .../systemd-compat-units/run-postinsts.service     |    0
 .../systemd/systemd-machine-units_1.0.bb           |    0
 .../recipes-core/systemd/systemd-serialgetty.bb    |    0
 .../systemd/systemd-serialgetty/LICENSE            |    0
 .../systemd-serialgetty/serial-getty@.service      |    0
 .../recipes-core/systemd/systemd-speed-hacks.bb    |    0
 .../systemd/systemd-systemctl-native.bb            |    0
 .../systemd/systemd-systemctl-native/systemctl     |    0
 .../systemd/systemd/format-replace-m-uclibc.patch  |    0
 .../systemd/systemd/paper-over-mkostemp.patch      |    0
 .../recipes-core/systemd/systemd_git.bb            |    0
 13 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-compat-units.bb (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-compat-units/machineid.service (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-compat-units/run-postinsts.service (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-machine-units_1.0.bb (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-serialgetty.bb (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-serialgetty/LICENSE (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-serialgetty/serial-getty@.service (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-speed-hacks.bb (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-systemctl-native.bb (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-systemctl-native/systemctl (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd/format-replace-m-uclibc.patch (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd/paper-over-mkostemp.patch (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd_git.bb (100%)

diff --git a/meta-oe/recipes-core/systemd/systemd-compat-units.bb b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd-compat-units.bb
rename to meta-systemd/recipes-core/systemd/systemd-compat-units.bb
diff --git a/meta-oe/recipes-core/systemd/systemd-compat-units/machineid.service b/meta-systemd/recipes-core/systemd/systemd-compat-units/machineid.service
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd-compat-units/machineid.service
rename to meta-systemd/recipes-core/systemd/systemd-compat-units/machineid.service
diff --git a/meta-oe/recipes-core/systemd/systemd-compat-units/run-postinsts.service b/meta-systemd/recipes-core/systemd/systemd-compat-units/run-postinsts.service
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd-compat-units/run-postinsts.service
rename to meta-systemd/recipes-core/systemd/systemd-compat-units/run-postinsts.service
diff --git a/meta-oe/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd-machine-units_1.0.bb
rename to meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb b/meta-systemd/recipes-core/systemd/systemd-serialgetty.bb
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd-serialgetty.bb
rename to meta-systemd/recipes-core/systemd/systemd-serialgetty.bb
diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty/LICENSE b/meta-systemd/recipes-core/systemd/systemd-serialgetty/LICENSE
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd-serialgetty/LICENSE
rename to meta-systemd/recipes-core/systemd/systemd-serialgetty/LICENSE
diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta-systemd/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
rename to meta-systemd/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
diff --git a/meta-oe/recipes-core/systemd/systemd-speed-hacks.bb b/meta-systemd/recipes-core/systemd/systemd-speed-hacks.bb
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd-speed-hacks.bb
rename to meta-systemd/recipes-core/systemd/systemd-speed-hacks.bb
diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb b/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
rename to meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
rename to meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl
diff --git a/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch b/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
rename to meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
diff --git a/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch b/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
rename to meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd_git.bb
rename to meta-systemd/recipes-core/systemd/systemd_git.bb
-- 
1.7.4.4



