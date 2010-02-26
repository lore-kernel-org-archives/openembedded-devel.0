Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nl3GM-00039K-2D
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 17:42:03 +0100
Received: by fg-out-1718.google.com with SMTP id e21so41273fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 08:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=EyrB73g6+NuPmeyuc4c79W6HFJyQMhA6oyFbBH2EkFU=;
	b=ub3LypMs2osVZrcRJx3ABGZZxoIJCvL7cJ2SzJ1b3lA7UF3+gvtuUWGO4ld9Vm8KKN
	DaO2Q9nV/Gng8q2BpLuRnl2iF3DEr9dv+t2D/ngLnjtHKp1rcthyHEFyidHV0QdFu+IS
	pAR972WE2XnIQ0COonzuUykox8rJQuNz1dCRE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=GgCM9NEfp5Lg57jz3GlinZIPn9ORzmEpgtiv/7vYQJw6JcwgmXsvD447AeqCVkDGuD
	41f4oNBlnogZqhTUhbUvlI0V+gBP8B0ZKu4A1c4IF/jk9vEm3ftSGhCMU7niAMHInRia
	xUn3fZtOR3Tlro4F9mGOYzcu/mgjmY6AO/Iy0=
Received: by 10.87.51.9 with SMTP id d9mr1316012fgk.35.1267202356937;
	Fri, 26 Feb 2010 08:39:16 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm234028fxm.14.2010.02.26.08.39.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 08:39:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2010 17:39:16 +0100
Message-Id: <1267202357-8614-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Generating slightly different images for different IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 26 Feb 2010 16:42:03 -0000

Hi,

on om-gta01 we had problem that even our minimal image
shr-lite-image is too big for its 64MB NAND chip

We're slowly stripping packages not really needed, but it would be 
nice to remove whole /boot with kernel-image.

Problem is that when we're booting on gta01, than /boot/uImage is used so 
it should be installed in .tar.gz image. But when booting from NAND, then
kernel is usually in different NAND partition and /boot on rootfs partition
is useless.

In patch is what I used now to generate images like this, but it's not optimal at all
1) It copies whole rootfs 3 times if you have all jffs2/ubi/ubifs in FSTYPES, 
   instead just once for -no-boot version (it's possible ie if we expect certain order 
   of making FSTYPES or prepare -no-boot always with normal rootfs and don't remove it
2) task-base still depends on kernel-image and I don't see how to easily remove that 
   dependency, without defining different image recipe and building it separately. 
   So with next kernel upgrade user will get new kernel-image which will probably fail
   to install because of lack of space.

Is there better way to solve it or should we try harder to save space somewhere else?



