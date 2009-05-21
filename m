Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJY-0005ca-Mr
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:24 +0200
Received: by mail-fx0-f172.google.com with SMTP id 20so805174fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=jauYVGmaKL5/W1atNax4D3sp4n04yFcJDfl5RHUONzc=;
	b=K5nTiK94ne8gUv3IXssZJUpYC3ckbWjxgtZkVo3KyuVzTj+bgescvCfJy1D9i+CK2s
	8FTLMJEzKeEBG+1gn+WyJMj2YeljZafK3h70fDSNeKFj6h45atzvsibVXm63dDS+Nnr1
	66RVhh6aLlqtfoNNhiOpdxe4kFZ+q95masS2M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=ck0H9vmf57fgiEhDNOztvf8vMweJ/wEBGbVFJEdnWDr+2yhz3W1buCmkdIXXqSJ/GS
	Q1ZXa0lVqCGThWzFQM/tOsKa2Zivnh9v6O9e2rvtsmVpRQrY51snddw0QJ8gooTNaxlV
	CSUAQqafT1i+Erv5Wea1Za5P5AHfVDJihTTU8=
Received: by 10.103.121.19 with SMTP id y19mr644096mum.42.1242873593426;
	Wed, 20 May 2009 19:39:53 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id e10sm5481512muf.44.2009.05.20.19.39.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:50 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 07AB06103B7; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:25 -0300
Message-Id: <1242873578-17444-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-10-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-10-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 10/23] conf/licenses.conf: add CUPS license
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
X-List-Received-Date: Thu, 21 May 2009 02:47:25 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/licenses.conf |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/conf/licenses.conf b/conf/licenses.conf
index 01c4747..c067627 100644
--- a/conf/licenses.conf
+++ b/conf/licenses.conf
@@ -1,6 +1,5 @@
 SRC_DISTRIBUTE_LICENSES += "GPL GPLv2 GPLv3 LGPL LGPLv2.1 LGPLv3"
-SRC_DISTRIBUTE_LICENSES += "BSD Apache-2.0 QPL AFL"
+SRC_DISTRIBUTE_LICENSES += "BSD Apache-2.0 QPL AFL CUPS"
 SRC_DISTRIBUTE_LICENSES += "MIT Sleepycat Classpath Perl PSF PD Artistic"
 SRC_DISTRIBUTE_LICENSES += "bzip2 zlib ntp cron libpng netperf openssl"
 SRC_DISTRIBUTE_LICENSES += "Info-ZIP tcp-wrappers"
-
-- 
1.6.3.1.54.g99dd



