Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OddyH-0001OI-2U
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 08:49:13 +0200
Received: by iwn34 with SMTP id 34so3565333iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 23:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=9K8R3ixcL3HBU0maSoiG9kOQ8UILuNRQtt1ErzZR7FU=;
	b=qQB+iXy7l10CXimqeA3Ap77MwYvcxIGGwLygYJ8QkZ+7ve5NSgXVOKxzU49eRx4stc
	wl2IvCRHUPYkSlRoAzUmlphDqtoV8Guj0k3RGA2CW78ymsg2BIJUJc9Hur+W0doQV3Hx
	N5Sp6N4gOzDYkX5/P2UnCdENd0CXKrpymOnvs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=l7PuwRpCZL2BrPgjs7aec7MiXFo7OUzLA4HW9nynn2BAi9O1KEEXm6yBRPrecQaUsH
	SdIifB1fooAnioM6BE6AwCAMQozFrdVHpWeEQSP3MXyfYEIfG1rkex6exnfqhHhFkeYf
	33zCSOavpJwGKbsBLEZzulQUXQjxi+GKv6EZA=
Received: by 10.231.192.67 with SMTP id dp3mr9706246ibb.180.1280213325322;
	Mon, 26 Jul 2010 23:48:45 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n20sm4506941ibe.5.2010.07.26.23.48.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Jul 2010 23:48:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jul 2010 23:48:27 -0700
Message-Id: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/8][v3] Make multi-machine toolchains to co-exist (revised again)
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
X-List-Received-Date: Tue, 27 Jul 2010 06:49:13 -0000

Hi

Following series of patches are for making multi-machine toolchains co-exist with
new cross staging for toolchain.

It changes the toolchain triplet from ${TARGET_ARCH}-${VENDOR}-${OS} to 
${TARGET_ARCH}-${CPU_SUB_TARGET}_${VENDOR}-OS

which means that a toolchain for armv7 is called arm-v7a_oe-linux-gnueabi-*
and for armv5te its called arm-v5te_oe-linux-gnueabi-*

They can coexist in same native sysroot. The symlinks would mean that
gcc will not accidently mix the assemblers or linkers.

MULTIMACH-* is not needed anymore as the TARGET_SYS is distinct enough
to serve same purpose.

I have booted a minimal-image on qemuarm qemuppc and qemumips successfully. The build for 
beagleboard native-sdk-image completed too.

Thanks
-Khem



