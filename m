Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ObdfE-0002n0-J7
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 20:05:06 +0200
Received: by pvg13 with SMTP id 13so3015860pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 11:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=L3X1Kwto4n36Q92NQY0BgfuZOpFA5Yj2X3bjox799Ck=;
	b=itDLFECgs57JUE1d3imsnmNYPdEYN7tEfPWFbK1oriUFqdZNJjN9yunvbAt7UqiQtW
	gRex04bto6lPJqSNbsRV/6kg7J+hXAN68A/VB9XHC0ONr2t9AxpYlPfgKEE8k3cjlBH1
	IvAwrbh5cRA/F3BaynmsbfxMgi6L/99poz1uo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=rj03o+k28oTVWHAULx1tH7VNMeTWAfQ/SIA0pxU7hCn5yCw1Ywc9R0kA8yehKvB4fH
	9PfmFSLRx2g/hibMToYY9VWojJ2XT94QhZwLeYMO+Gz+UnYtVCy6omeihihedDlrfakr
	b3aAG0Ndmj6nerWnWCL9UrTqttT6tTDnPw6RQ=
Received: by 10.142.144.16 with SMTP id r16mr638744wfd.131.1279735492102;
	Wed, 21 Jul 2010 11:04:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm9343482wfl.1.2010.07.21.11.04.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 21 Jul 2010 11:04:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 11:04:42 -0700
Message-Id: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages into native sysroot
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
X-List-Received-Date: Wed, 21 Jul 2010 18:05:06 -0000

Hi

The following 4 patches are based on  Jushua's work in poky to get rid of
cross dir and install the toolchain in  native sysroot.

I have done native-sdk-builds for uclibc and eglibc. It could build the images
and the images booted fine in qemu on mips and arm.

I would  appreciate if someone could lend a hand in testing these patches

And as we have changed tmpdir layout with this patch I have also bumped ABI
which means tmp has to be nuked before you try these patches.

Please review/ack/nack

Thanks
-Khem





