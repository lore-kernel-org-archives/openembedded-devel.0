Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3ACCB6010E;
	Sun, 25 Aug 2013 14:38:03 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id y10so2467402pdj.36
	for <multiple recipients>; Sun, 25 Aug 2013 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:message-id:date:to:mime-version;
	bh=d3WQlxz2pkWaw0AkYj+2nR5djZrTCr1Zo5mIkQ2NWbs=;
	b=e/5d/uqAOxDLij8lJP3yuxEI0xWF0fHtohgGgGdGJmFhcjHg+IvdEg7YuHBAv1cKEX
	08qZxEEQKYchiWXbtcKbLFPUzupoEUt+pTiyQ5+jg8UwG/aW4yhSiHQ8zgiSS6jbgRCh
	xdinz78Wh7NLu6GZkK+WcXfp+omHm2J+0N4ZWSQSAfegwsvwlJEF/nUKiRfZtnX9Qhig
	7XvSsMG7m5NvjBMJgfz7jjn9404/w2nh9iHktH/mAjWsU7FGpQ6r6Qaxl/s/dnAAs9sc
	lOADpzJ4mdOBZxvm4i/B08SZMpJRecumgzPfbemqV/oZsv6pXUJ6dn1ZXX8Xju29C2Gp
	1TzA==
X-Received: by 10.68.160.193 with SMTP id xm1mr10392128pbb.88.1377441483259;
	Sun, 25 Aug 2013 07:38:03 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id s5sm12229591pbo.38.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 25 Aug 2013 07:38:01 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Message-Id: <8683DB7C-B756-4E61-B5EF-856E288139C4@gmail.com>
Date: Sun, 25 Aug 2013 18:37:54 +0400
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
X-Mailer: Apple Mail (2.1498)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [oe-core] QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Aug 2013 14:38:04 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
       I have modified the default qemuarm.conf file, to switch it over =
to using ARM Cortex A9, with hard float, vfp and neon support, by =
applying the following patch (which basically includes the =
tune-cortexa9.inc file).

diff --git a/meta/conf/machine/qemuarm.conf =
b/meta/conf/machine/qemuarm.conf
index d07084b..2ec57d8 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -1,10 +1,9 @@
 #@TYPE: Machine
-#@NAME: arm_versatile_926ejs
-#@DESCRIPTION: arm_versatile_926ejs
+#@NAME: qemuarmhf
+#@DESCRIPTION: Machine configuration for QEMU ARM Cortex A9 hard float.
=20
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-arm926ejs.inc
-#require conf/machine/include/tune-arm1136jf-s.inc
+require conf/machine/include/tune-cortexa9.inc
=20
 KERNEL_IMAGETYPE =3D "zImage"

I find that the kernel panics upon boot.=20

Is it possible to have a QEMU build with support for hard float?=20

I need this, so that I can bootstrap a Ubuntu build from scratch, using =
a QEMU arm hard float machine, using a oe-core generated QEMU and =
toolchain. I don't want to use the default armel or armhf emulator and =
toolchain provided by debian, and want to build my own version of the =
emulator and toolchain, specifically optimized for a particular target =
machine.

I've attached a screenshot below.



Best regards,

Elvis Dowson



