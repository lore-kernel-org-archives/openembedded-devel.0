Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ocb6b-0005w8-Tj
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 11:33:18 +0200
Received: by pxi12 with SMTP id 12so1844143pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 02:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=fySg9NVkIKCHqNagiBZIKQN6zyW2QSCKKYugWbedzW4=;
	b=jZHAmBgSaeyL7KJ0neo3lsp7+4qIjY5Dw6SqR/9XifrQoNTFU/KvOwppD0q40BmBXP
	6ElfLmQwUnLJjd2B/+7W3uUk4xLtsZbsPi26dHHOfRLUj6wiZD8+25gU7P7mnDakc3MS
	zn91mUnKO6m6jgnFj+0tDnxZGUIPp8QXWLzG8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=OyFTbgxrtT7qz0QD6KwqLXZlST2d51GLXkGMk8FrV3jAJab2lFJxWyuPDvQ+q84arl
	L4hMHygoMoozwqZUhlgHG8oQ3OKE4VlQpXUvErQ5jt9mlP7xh04VYNlmUFl9bGRGaw2L
	+e+UfTpO/ZblpJfKl1NkVl70z0UCCPCgxS7yA=
Received: by 10.114.77.10 with SMTP id z10mr7274775waa.168.1279963983006;
	Sat, 24 Jul 2010 02:33:03 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d39sm2139120wam.4.2010.07.24.02.33.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 24 Jul 2010 02:33:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Jul 2010 02:32:52 -0700
Message-Id: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/3] Make multi-machine toolchains to co-exist.
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
X-List-Received-Date: Sat, 24 Jul 2010 09:33:19 -0000

Hi

Following three patches are for making multi-machine toolchains co-exist with
new cross staging for toolchain.

It changes the toolchain triplet from TARGET_ARCH-VENDOR-OS to TARGET_SUB_ARCH-VENDOR-OS

which means that a toolchain for armv7 is called armv7-oe-linux-gnueabi-*
and for armv5te its called armv5te-oe-linux-gnueabi-*

They can coexist in same native sysroot. The symlinks would mean that
gcc will not accidently mix the assemblers or linkers.

I have booted a minimal-image on qemuarm successfully. The build for 
beagleboard in same sysroot is underway.

Please give it a shot in your environments (especially Koen's env)

Thanks
-Khem




