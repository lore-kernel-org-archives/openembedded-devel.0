Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1P5DFq-00070l-GD
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 09:57:47 +0200
Received: by ewy1 with SMTP id 1so362791ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 00:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=QHm3tfHim3IIgMbJEIggS0qEL9GANevUyyZNm4lc08o=;
	b=nNtevIM/EBf1oV46Yv3xxvYXUrqu6nZmdArAJznGOI9xyXo++SUNBwXdaQ80wwjran
	w/RNLeM7TJ0Y/n8Eu8CDmK3dijXFV/THO19QwNMiqdJfpFz+Tq583PvWBcl3Li+iKPsX
	1F/1zXqwmnV/tRIDDOFahBsLADrM189TnhrH0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wsJqaRO97KGiFtUBDM1aDZ0TMdRH1POUACRv60G9jN8OC5pmNrCqjNKTKURc69AJxd
	PijIHF2R+hqj88S2PhFv9Qa0v0sP0nublm09q5s+VAMfUkcz1J5sd7OzzX3HXXe3QxSb
	YyPrcpDgfSNO/bHiYH/yFQ6CGLVMQqIKvHgjw=
Received: by 10.213.2.133 with SMTP id 5mr2125077ebj.86.1286783803033;
	Mon, 11 Oct 2010 00:56:43 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id p53sm3018470eeh.1.2010.10.11.00.56.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 11 Oct 2010 00:56:39 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Oct 2010 09:55:55 +0200
Message-Id: <1286783755-19145-3-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1286783755-19145-1-git-send-email-koen@openembedded.org>
References: <1286783755-19145-1-git-send-email-koen@openembedded.org>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCHv3 3/3] multi-kernel: adapt to kernel_do_compile_kernelmodules change in kernel.bbclass
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
X-List-Received-Date: Mon, 11 Oct 2010 07:58:12 -0000

---
 recipes/linux/multi-kernel.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/linux/multi-kernel.inc b/recipes/linux/multi-kernel.inc
index 70cfd87..0523a33 100644
--- a/recipes/linux/multi-kernel.inc
+++ b/recipes/linux/multi-kernel.inc
@@ -41,6 +41,7 @@ do_compileconfigs () {
         # Build and Install this alternative kernel
         do_configure
         kernel_do_compile
+        do_compile_kernelmodules
         kernel_do_install
 
         # Drop the resulting images in the deploy dir
-- 
1.6.6.1



