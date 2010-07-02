Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OUZ76-0002k3-OF
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 07:48:37 +0200
Received: by pwi10 with SMTP id 10so1154388pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 22:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=KUotQ9Lx0iDjtnoCb7A6ZXW71Yog5epl2uQBS8ZQXrc=;
	b=N01yDxLTMIwEOH13K77QBcn9rtbmsHbLipmfJo0JPl3bsIov/TF36uREwoPwNpuXeS
	O7t8Xxool7Hv1oe1zgJ0Xbmyoph4b4COjlrxIet56E0M3N4bAEllq3MT3rW+6TEYzc2x
	nzPcXOtjfZpcYvPUNKu10bZ53IaJK8+mzmdeo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=rCWJakuZ+mB6qFUjhvt6hIaF34brTgjsTdFXlDXsO9QSMnOV4WUL+vxqcU+ptB5z8C
	5/ZECZWCFBcXTOEvht4pMnZbI8G+bDgMlMUWoDQBlodHbSXaslky8ZujiMnv6vtybF7y
	iqOoZkIrRjnYK7MUbvIp9zKAnm1D5vmM9FYA4=
Received: by 10.142.134.13 with SMTP id h13mr336117wfd.119.1278049430254;
	Thu, 01 Jul 2010 22:43:50 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 23sm358480wfa.22.2010.07.01.22.43.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Jul 2010 22:43:49 -0700 (PDT)
Message-ID: <4C2D7C8E.2010904@gmail.com>
Date: Fri, 02 Jul 2010 15:13:42 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] x264_r2245.bb: fix build for mipsel (duplicate the mips fix).
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
X-List-Received-Date: Fri, 02 Jul 2010 05:48:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/vlc/x264_r2245.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/vlc/x264_r2245.bb b/recipes/vlc/x264_r2245.bb
index 93e4226..f533bfc 100644
--- a/recipes/vlc/x264_r2245.bb
+++ b/recipes/vlc/x264_r2245.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "H.264 encoder"
 LICENSE = "GPL"
-PR = "r6"
+PR = "r7"
 
 X264PV = "snapshot-20100531-2245"
 
@@ -15,6 +15,7 @@ inherit autotools lib_package pkgconfig
 # default --extra-cflags
 X264_ECFLAGS = ""
 X264_ECFLAGS_mips = "-fPIC"
+X264_ECFLAGS_mipsel = "-fPIC"
 
 # disable use of assembler written functions
 X264_DISABLE_ASM = "--disable-asm"
-- 
1.7.1



