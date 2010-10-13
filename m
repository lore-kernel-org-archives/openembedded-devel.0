Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1P5vWm-0004sk-Sm
	for Openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 09:13:37 +0200
Received: by gwb17 with SMTP id 17so1534906gwb.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 00:13:04 -0700 (PDT)
Received: by 10.236.108.179 with SMTP id q39mr17381133yhg.35.1286953984147;
	Wed, 13 Oct 2010 00:13:04 -0700 (PDT)
Received: from [192.168.10.100] (cm198.psi191.maxonline.com.sg
	[58.146.191.198])
	by mx.google.com with ESMTPS id j27sm3983228yha.30.2010.10.13.00.13.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Oct 2010 00:13:03 -0700 (PDT)
From: Sean Cross <sean@chumby.com>
Date: Wed, 13 Oct 2010 15:13:00 +0800
Message-Id: <2C68B7D9-DAA8-4214-B57B-BA908F184C8F@chumby.com>
To: Openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux-imx-git: Fix compile error by making rotary coder a builtin
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
X-List-Received-Date: Wed, 13 Oct 2010 07:13:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


There is a problem with certain functions not being exported in the =
kernel.
This causes a compile error.  As a workaround, make the rotary coder a =
builtin.
---
 .../linux-imx-git/chumby-falconwing/defconfig      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux-imx-git/chumby-falconwing/defconfig =
b/recipes/linux/linux-imx-git/chumby-falconwing/defconfig
index ac3be51..c93fe50 100644
--- a/recipes/linux/linux-imx-git/chumby-falconwing/defconfig
+++ b/recipes/linux/linux-imx-git/chumby-falconwing/defconfig
@@ -902,7 +902,7 @@ CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=3Dy
 CONFIG_TOUCHSCREEN_USB_GOTOP=3Dy
 # CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
 CONFIG_INPUT_MISC=3Dy
-CONFIG_INPUT_STMP3XXX_ROTDEC=3Dm
+CONFIG_INPUT_STMP3XXX_ROTDEC=3Dy
 # CONFIG_INPUT_ATI_REMOTE is not set
 CONFIG_INPUT_ATI_REMOTE2=3Dm
 # CONFIG_INPUT_KEYSPAN_REMOTE is not set
--=20
1.7.0.4



