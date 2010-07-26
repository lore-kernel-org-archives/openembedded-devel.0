Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OdTsd-0007HQ-A9
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 22:02:32 +0200
Received: by pzk2 with SMTP id 2so1263612pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 13:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=YTn4VoX7JZQi+d7IMjan3QGh0wJ3Arrf3E+SRdKGFxM=;
	b=HMnMLk6NQufFWDz+PyWlJUyeE8MeAVvF8pf7Nyo54X2PvBxh1ZJZ37Q/+h2LmVwH0N
	zMrnU/iGBjLfK0wg+if5COI7SEEZaF533tjO5KTgCzWF6WJ+/XK5hkcOcr3Q458z7UjX
	gEibZWu36Z0lEJokUV1TRvOerHYalskhu3ufQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=dBG1eMTWGWP+xCYSm6XVHOBHAQShZHohq6w13JOVVMqfKuLGbno+87mygq/rcSrZyV
	HeNto83Ov7p2zxg84M6QpDGUWeW4I/ArqiH/NIGfNoc9o+9SNkX8rHvdPfZqq3JFxliy
	i1urx5BbD8NsJMOHZFSbjNzGoP6rBEf+5s8vk=
Received: by 10.142.48.6 with SMTP id v6mr8627776wfv.96.1280174533633;
	Mon, 26 Jul 2010 13:02:13 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q27sm4573766wfc.18.2010.07.26.13.02.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Jul 2010 13:02:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jul 2010 13:02:01 -0700
Message-Id: <1280174528-27682-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/7] Make multi-machine toolchains to co-exist (revised)
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
X-List-Received-Date: Mon, 26 Jul 2010 20:02:32 -0000

Hi

Following series of patches are for making multi-machine toolchains co-exist with
new cross staging for toolchain.

It changes the toolchain triplet from ${TARGET_ARCH}-${VENDOR}-${OS} to 
${TARGET_ARCH}-${CPU_SUB_TARGET}_${VENDOR}-OS

which means that a toolchain for armv7 is called armi-v7a_oe-linux-gnueabi-*
and for armv5te its called arm-v5te_oe-linux-gnueabi-*

They can coexist in same native sysroot. The symlinks would mean that
gcc will not accidently mix the assemblers or linkers.

MULTIMACH-* is not needed anymore as the TARGET_SYS is distinct enough
to serve same purpose.

I have booted a minimal-image on qemuarm qemuppc successfully. The build for 
beagleboard in same sysroot went fine too. So I am confident of
these patches.

Please give it a shot in your environments

If these patches look ok we can commit them and bump ABI once again

Thanks
-Khem




