Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N2hqk-0000UV-Qx
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 09:56:21 +0100
Received: by ewy5 with SMTP id 5so8624074ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 01:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=ko30WeUD+kU1XwqQ17/wj22NxpOGyB0d5FbqBcJ9SXo=;
	b=ahCTAvNOyR1jvY/G+yYVI4qZLc+oWqOpSFYdCRgUrcm4GjIPEAkx94pYM5EroV2Rkf
	LMqBo1Z/BhQmDvfpjmMG42+hoZkwkCsZpYAZ6iv6XgYaGHxBUjGlULoBEzUn+V/Ls3IH
	ANsbDL8lTF49fgu4Bs5X7LCv5q36qHK8IZgfA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=MZ9igDczptG6IM9yXfZye6nPGvPxnoduoj9KD9DP2vjjdUFLo8o3+cAkmuhG/KCAwY
	KvYeGMJiuA++vMoMThsidhsGrC+H4BHLHDhLUcnoorKGe69NcKoi66drDpddMN68UllK
	X0IHZW5Ag9O9NE3X+dWxNCbJJYszrDjjDXH/I=
MIME-Version: 1.0
Received: by 10.216.90.70 with SMTP id d48mr42802wef.159.1256633711120; Tue, 
	27 Oct 2009 01:55:11 -0700 (PDT)
Date: Tue, 27 Oct 2009 09:55:11 +0100
Message-ID: <70c9a9110910270155j3d9aed71m4f106612a94b8cfe@mail.gmail.com>
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/5] igep0020.conf: Fix missing u-boot entrypoint
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
X-List-Received-Date: Tue, 27 Oct 2009 08:56:22 -0000
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 conf/machine/igep0020.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/machine/igep0020.conf b/conf/machine/igep0020.conf
index 512a977..7430646 100644
--- a/conf/machine/igep0020.conf
+++ b/conf/machine/igep0020.conf
@@ -24,6 +24,9 @@ IMAGE_FSTYPES += "tar.bz2 ubi"
 # Guesswork
 SERIAL_CONSOLE = "115200 ttyS2"

+UBOOT_ENTRYPOINT = "0x80008000"
+UBOOT_LOADADDRESS = "0x80008000"
+
 # do ubiattach /dev/ubi_ctrl -m 4
 # From dmesg:
 # UBI: smallest flash I/O unit:    2048
-- 
1.5.4.3


