Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpfR1-0002dm-C2
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 12:20:39 +0100
Received: by yie16 with SMTP id 16so532830yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 03:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=laKLM/6+M9MfSXOpAXpLuczwmKf0CMPjclPECdMJWko=;
	b=j284p1zR4lkTPdiN0yesJcU2mcgzBzAVR8bp2q7a78Ho+c5KoMgDf0kIAIbT6SODv8
	5hTptsmJk4QeNwXeCQ5ySoxI63CpGFF83RPI//PRno5H8BJm8H6F/JDm0cs+5upTxaXf
	aOsv3jqCDdclyynNPGPKolrn4/R+/dxxIMBlU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=kv0n9Z6oP+inU+vcc/0XhJKTIB3P+flwtKasdF2jfpx8+cr5mlmKLB9058tdhPii8y
	mEUhZyzODvPGDiRw0RGGXDUk/6P9t0+2+ar+TIQARN2y8S0fEIN7ujjK4jo5H4DP86ep
	QDNRM8E8h0BDG6DxUxSRn13UPyMyP73qSMJEA=
Received: by 10.236.102.178 with SMTP id d38mr825500yhg.59.1297855167642;
	Wed, 16 Feb 2011 03:19:27 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 68sm3057927yhl.19.2011.02.16.03.19.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 03:19:26 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:18:50 +0000
Message-Id: <1297855134-19216-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 09/13] sdk.bbclass: cache ${libdir} as ${target_libdir}
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
X-List-Received-Date: Wed, 16 Feb 2011 11:20:39 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/sdk.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/sdk.bbclass b/classes/sdk.bbclass
index 4fe17b8..bf77744 100644
--- a/classes/sdk.bbclass
+++ b/classes/sdk.bbclass
@@ -7,6 +7,7 @@
 # or indirectly via dependency.  No need to be in 'world'.
 EXCLUDE_FROM_WORLD = "1"
 target_includedir := "${includedir}"
+target_libdir := "${libdir}"
 
 # Save MULTIMACH_ARCH
 OLD_MULTIMACH_ARCH := "${MULTIMACH_ARCH}"
-- 
1.7.2.3



