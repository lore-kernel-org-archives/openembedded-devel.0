Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aguirre.nicolas@gmail.com>) id 1SIO7t-0003VW-C8
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 19:48:09 +0200
Received: by dadz8 with SMTP id z8so2816888dad.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 10:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=ABYWrVVi/5sRkWiXckjQ+VqixrqKrmy/0YVoD1x3IwQ=;
	b=sF52FMRY1xfmzPWP4Bvj3bj2Pa5jV8wGkGMx3OxllKGq60WukzsZrlwdKAccJOnzaL
	kgwaLHG3SHuGjhnX71jYtN8hQPgWAKyCs5g0ETsaTAXUwwftGWHSZOfDW84i2edd+NPi
	aEUVaxqCmCHj65mUds9QGFKEIFqrM68FszvilJkG4bjjiRewF07kuGebQgT2CMb+Edgb
	Q8GKQkYoafh8qlf4b3pKMRVoJr3/vZn/0mdudnn3Leu+ruJ7siAdp+/06PQIdPjM8IYt
	ofIx83jm6ncNflk8+O/lowR5dEC2Ypv8Wo+7UbNRhCu6FOhbv2rFZnYbqlUDMC+aym2W
	CZSg==
Received: by 10.68.213.104 with SMTP id nr8mr4361451pbc.91.1334252328010; Thu,
	12 Apr 2012 10:38:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.21.68 with HTTP; Thu, 12 Apr 2012 10:38:27 -0700 (PDT)
From: Nicolas Aguirre <aguirre.nicolas@gmail.com>
Date: Thu, 12 Apr 2012 19:38:27 +0200
Message-ID: <CAHTvVMen9K_AGfn8O7GMgKvY0XZ-oiDg3oOmSz_sBK6GSGChtQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Hard floating point support for armv7a wmmx2 processor in oe-core
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
X-List-Received-Date: Thu, 12 Apr 2012 17:48:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm building an oe-core minimal image and toolchain for the cubox[1]
which has a Marvell Armada 510 SoC, also known as Dove.
It's a armv7 Arm processor with wmmx2 instruction set [2].

I setup a new machine for the cubox and added :
require conf/machine/include/arm/arch-armv7a.inc
in my cubox.conf file

I also added
ARM_FP_MODE = "hardfp"
TARGET_FPU = "hardfp"
in my local.conf file.

It finished the build sucessfully for angstrom efl-nodm-image.

I don't know exactly which option enable and where to add it to enable
hard floating point.
I see in meta-oe/meta/conf/machine/include/arm/arch-armv7a.inc
references to the armv7ahf architecture but without idea how to
activate it.

Btw is the 'a' after armv7 important for me ? As it seems that this
arm core is an armv7 and not armv7a. I dont find arch-armv7.inc file
in oe-core.

Another problem is, how to add support for wmmx2 instruction set ?
There is tune-iwmmxt.inc but it seems to refer to armv5 arch. There is
a way to enable this instruction set ?

Any help would be appreciate :)

[1] http://www.solid-run.com/products/cubox
[2] http://www.marvell.com/application-processors/armada-500/

regards,
-- 
Nicolas Aguirre
Mail: aguirre.nicolas@gmail.com
Web: http://enna.geexbox.org
Blog: http://dev.enlightenment.fr/~captainigloo/


