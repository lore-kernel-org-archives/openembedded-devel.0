Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <serra82@gmail.com>) id 1N5bJ9-0001k3-RK
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 09:33:38 +0100
Received: by bwz9 with SMTP id 9so8469964bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2009 00:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=w5J6Q63WGtjsKvWJc1f7AvwhGsD6i6Ts2nQmvKCJHt4=;
	b=YWjW+MBJ8CTEoJbhnyv3cxGFhtP1D/dhH3l+cT/Q4ManX8MOErnuhvSAaHQGmZlXW4
	XOmb3jjd5wMBtvNGkQnNzsOcRyB4GFyxHaRmSn37xeEVU/Zhsbgf9i3034rnGY+y3t7B
	ejFOz5pv6UgWfq0TKIf1EraUQRPpF4aTsxffE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=MkqV/Ac4pu0A0vCZHXCUhXqI7l1SGO0KnWPJIf5/6zcO2006cEGzRcbxltgZzChRzh
	PrLSA5djee1Oaih0LGtJdgWdz7ux0N9n+l4J7Iw6x8W/GW6chu6+QAaz+zhJw9fAU6Ct
	LauR/GYMZb/amFk9ZGhh46ejkmBfVvJad1QsU=
MIME-Version: 1.0
Received: by 10.103.87.35 with SMTP id p35mr450971mul.75.1257323543484; Wed, 
	04 Nov 2009 00:32:23 -0800 (PST)
Date: Wed, 4 Nov 2009 09:32:23 +0100
Message-ID: <afb7987a0911040032g2bebec62j70a81dd409561c17@mail.gmail.com>
From: Andrea <serra82@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: serra82@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [patch] ti-cs1-omap3530 upgrade
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
X-List-Received-Date: Wed, 04 Nov 2009 08:33:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Is possible upgrade cs1-omap3530?
thank you
Andrea Seraghiti

diff --git a/recipes/ti/ti-cs1-omap3530_1.0.1.bb
b/recipes/ti/ti-cs1-omap3530_1.0.1.bb
index 9779c33..039aa92 100644
--- a/recipes/ti/ti-cs1-omap3530_1.0.1.bb
+++ b/recipes/ti/ti-cs1-omap3530_1.0.1.bb
@@ -1,12 +1,12 @@
 require ti-codec.inc
 require ti-cs1-omap3530.inc

-SRC_URI        =
"http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_3_00/latest//exports/cs1omap3530_setuplinux_1_00_01-42.bin"
+SRC_URI        =
"http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_3_00/latest//exports/cs1omap3530_setuplinux_1_00_01-44.bin"

 # Specify names of the InstallJammer binary file and the tarball it extracts
-BINFILE = "cs1omap3530_setuplinux_1_00_01-42.bin"
+BINFILE = "cs1omap3530_setuplinux_1_00_01-44.bin"

-S = "${WORKDIR}/dvsdk_3_00_01_42/cs1omap3530_1_00_01"
+S = "${WORKDIR}/dvsdk_3_00_02_44/cs1omap3530_1_00_01"

 DEPENDS="ti-codec-engine ti-dsplink-module"




diff --git a/conf/checksums.ini b/conf/checksums.ini
index a2d7bda..d5a9944 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -4486,6 +4486,10 @@
sha256=8b718c344cf19417447cbc16867d2e04434654c13b330598b96720ead146b961
 md5=0aa2f94c39123f1a0352983e5366179c
 sha256=4bab529afa00cafde3bc5df2769578c88438f80c5152d4257cd0e86986f95bc4

+[http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_3_00/latest//exports/cs1omap3530_setuplinux_1_00_01-44.bin]
+md5=4db567252e6c43119e1c0aafe401a679
+sha256=e042e1aad42a6728adf5c955dc38e4f8331fc0eacd833f1cd75d9cbb4faff0b5
+
 [http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_3_00/latest//exports/cs1omap3530_setuplinux_1_00_01-42.bin]
 md5=a1e19ef37638e977d059fd22af666301
 sha256=fc7ac2829df8d394635aa1cc704b78e93ca287111df1001e5738ae2282691219


