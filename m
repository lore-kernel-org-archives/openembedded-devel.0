Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1ScZB1-0003XW-HT
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2012 11:38:47 +0200
Received: by werg55 with SMTP id g55so222724wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2012 02:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version:x-mailer;
	bh=13CUBGFYl0mVNOTQ/X7ZKTrYq7+UHvxqBNV+1pC6bXw=;
	b=NoEhPGwP71dbl8LPJoVn8HAzbAIbX+RMFmczeRN7l4ZgsDVofY//V3/KjQ1eqW3aur
	x+3fCXAxkaUlzEo4shiG1QCR1Cckn2jkw512HpyqVTOjb1qleYrSqW3Nmd9gltjg2WM3
	Kf8feiHeZf/GmmmvFMHBGIHPnD5q6ykc2G+MFq16xVnONtLTr+7JoeA8h0bQdPwjAIjP
	fVCrpmKaixCZOquOG3UPrMOA4twvHWR8rFNAHxvsGSXzSzMuCFVTMbW5SnGvCSl7opvW
	TUh7AsWYhagbMNwuUmMKZhAVwG9q27khan2Xf8cd6kxhR9LJhG2w6HWuYBlYdbBrNz+F
	6vIQ==
Received: by 10.216.216.95 with SMTP id f73mr375380wep.149.1339061299324;
	Thu, 07 Jun 2012 02:28:19 -0700 (PDT)
Received: from [192.168.1.36] (1.Red-83-60-183.dynamicIP.rima-tde.net.
	[83.60.183.1])
	by mx.google.com with ESMTPS id hv7sm153677wib.0.2012.06.07.02.28.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jun 2012 02:28:18 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Thu, 7 Jun 2012 11:28:19 +0200
Message-Id: <94B716D7-1C23-4BA7-980C-A7858FA3C5DA@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [poky] Impact of tune configuration in meta/conf/machine/qemuppc.conf
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
X-List-Received-Date: Thu, 07 Jun 2012 09:38:47 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
     What would the impact be, if I change the tune configuration in =
poky/meta/conf/machine/qemuppc.conf, from tune-ppc603e to tune-ppc440 ?

#@TYPE: Machine
#@NAME: qemu PPC Emulator setup
#@DESCRIPTION: Machine configuration for running an PPC system under =
qemu emulation

require conf/machine/include/qemu.inc
require conf/machine/include/tune-ppc603e.inc

KERNEL_IMAGETYPE =3D "vmlinux"

SERIAL_CONSOLE =3D "115200 ttyS0"

Best regards,

Elvis Dowson=

