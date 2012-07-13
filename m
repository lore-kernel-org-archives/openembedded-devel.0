Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSC-00080Q-LU
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:25 +0200
Received: by bkcik5 with SMTP id ik5so2247528bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=8iiDP7KqphdVoXAQ10NFuCvCTY6PPOf2dXtII0Ju2ZU=;
	b=efKXvUQPUNYP7lU1nhcvyMU6RCmZ+et7SSoy6f1RuxFig8/IXE7XH4sg/TnBNJjqBJ
	XT0KklpKUAIXPRTuwM68xK6RB8EX0dFfqvYzS0EBWuEZBDmdkoRlWt5JseMKT28K3vZK
	cds8KQs1SF38LGOghbpf+NMs0MKRbHBBCzioz8FIJkwdpQFfmbFaOeliJmqm4MZakx8l
	scvEzid5qTAYtq+Cj1QtOc6KuQpCzys4ott31RICzofyqn1mLUV05Wf3qWZfpPrBSj3p
	Rzfr9waHQGyL6QhQfazw5720oBdQth29puUedT238ctqwi68ltQNrCIBiSFbXnlDJslX
	G8Xg==
Received: by 10.205.125.4 with SMTP id gq4mr114601bkc.109.1342168270560;
	Fri, 13 Jul 2012 01:31:10 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:10 +0200
Message-Id: <1342168240-7760-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe,V2 02/32] move systemd recipes to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:26 -0000
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
1.7.6.5



