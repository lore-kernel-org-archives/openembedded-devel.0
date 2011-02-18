Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PqUOM-0007Da-NF
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:45:20 +0100
Received: by mail-yw0-f47.google.com with SMTP id 41so337920ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 09:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=laKLM/6+M9MfSXOpAXpLuczwmKf0CMPjclPECdMJWko=;
	b=vIOOHhi4Bu2vrV6BS8/wDZfDWMWc87ylavgCcC2Fy2gbJHWcRqlySnNVC8yRbBfmvV
	Gk/edBhMbcuU12hsvbFmCxF3iZx7qAZ/NeOy8cPYEqmrKhW4PLdlbplVBq2+XMVrnyuB
	q6O7U6f49T/0KEbKfi49DJLSnhakmIgrSwVSc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=acZElGCXkjSYKN9R0hJBqWHwBKCTDLttOtelwkGNjfU5GmjlBORtTePTdBotC9WVwv
	T+0H7WlBXm6UGwvQh7zfnPmiX09DwY6VjJ5grqcTF2N0MUbGXOShBeap5BtpDRB2eQRf
	KzlP1YKKWqKciqN7CgwKxvFO95KV3MCtxghJc=
Received: by 10.150.239.21 with SMTP id m21mr1394463ybh.424.1298051046979;
	Fri, 18 Feb 2011 09:44:06 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm1480538yhl.23.2011.02.18.09.44.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 09:44:05 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 17:43:23 +0000
Message-Id: <1298051011-10445-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 08/16] sdk.bbclass: cache ${libdir} as ${target_libdir}
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
X-List-Received-Date: Fri, 18 Feb 2011 17:45:20 -0000

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



