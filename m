Return-Path: <menschel-d@posteo.de>
X-Greylist: delayed 439 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 15 Apr 2018 07:53:15 UTC
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	by mail.openembedded.org (Postfix) with ESMTP id 480F074563
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 07:53:15 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1E91B2101C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 09:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1523778356; bh=zAusc17JhrZanV58KyrXKJzmrTrLIvKHYMQNe67Jrl4=;
	h=From:To:Cc:Subject:Date:Autocrypt:OpenPGP:From;
	b=Ba47VxrMND/U3z2tAwAtZAcmcOvw6nBkSVOh4n2Tv9eNX821HHHaqPTrL5Zj8sXlu
	n0Wr5aSrGJstdSZpFrq5QbMjA0qJIF/0CrEpfyqi3cQpe1L5pGRp2pZyN8Q0UZBccr
	jiKn/CffZqT8sI/OIG1YG7K33zmfiZcoJ0HkEkqeRb824lgCmSeJAcCDiHmaRRSAT7
	dIjNDaab3shxK9v1qcHSbDzqAKu3IKQxyIPAdBMD5KD7v11ukEpgqIrPAQBD3nWmdC
	FifK5mPnCbN0351Cqau/l2NwAqRCy7mldB5Z1gePY9pv7MDgSkihuPu6C+osnJ9jhv
	j2ViIfTMtP2fQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 40P3Tv34NGz9rxD;
	Sun, 15 Apr 2018 09:45:55 +0200 (CEST)
From: Dennis Menschel <menschel-d@posteo.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Apr 2018 09:44:33 +0200
Message-Id: <20180415074434.2896-1-menschel-d@posteo.de>
X-Mailer: git-send-email 2.14.1
Autocrypt: addr=menschel-d@posteo.de;
	keydata=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
	8VgVw1bAd13Ch1WOARIgQy1dLuk9Q=
OpenPGP: url=https://posteo.de/keys/menschel-d@posteo.de.asc
Subject: [meta-qt5][PATCH 1/2] qtbase: fix umask for do_generate_qt_environment_file
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
X-List-Received-Date: Sun, 15 Apr 2018 07:53:16 -0000

The custom task "do_generate_qt_environment_file" generates the
directory "environment-setup.d" with permission 775 instead of 755.
When other recipes populate the same directory with different
permissions, a package manager like RPM will report this as an error.

The solution is to either set the installation permissions explicitly
with "install -d [-m 755]", or specify the umask for the custom task.

This commit uses the latter approach and fixes errors like the following
when trying to generate an SDK:

  $ bitbake <image-with-qt5> -c populate_sdk
  [...]
  Error: Transaction check error:
    file /opt/poky/2.4.2/sysroots/x86_64-pokysdk-linux/environment-setup.d
    conflicts between attempted installs of
    nativesdk-cmake-3.8.2-r0.x86_64_nativesdk and
    nativesdk-qtbase-tools-5.9.4+git0+0d9208cecb-r0.x86_64_nativesdk

A detailed discussion about this problem can also be found here [1].

[1] https://stackoverflow.com/a/49003464

Signed-off-by: Dennis Menschel <menschel-d@posteo.de>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index efcb82c..87da66e 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -209,6 +209,7 @@ fakeroot do_generate_qt_environment_file() {
     sed -i -e 's:${SDKPATHNATIVE}:$OECORE_NATIVE_SYSROOT:g' $script
 }
 
+do_generate_qt_environment_file[umask] = "022"
 addtask generate_qt_environment_file after do_install before do_package
 
 SRCREV = "6c6ace9d23f90845fd424e474d38fe30f070775e"
-- 
2.14.1


