Received: from na3sys009aog114.obsmtp.com ([74.125.149.211])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1Pzu47-00077c-BS
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 17:59:19 +0100
Received: from source ([209.85.214.178]) (using TLSv1) by
	na3sys009aob114.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTYDsAdD0Ajm9KcfTWayNkwsN1c4Rlh84@postini.com;
	Wed, 16 Mar 2011 09:57:38 PDT
Received: by iwn9 with SMTP id 9so2338025iwn.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 09:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=y5QtEmLBKNdgFDJvFciOZYHgBSiKq/UlcfgO0HfApEg=;
	b=XH9ZGB07xpoBauwbhN60shbsuyhH8VSpT5tAkvhgUiymA6IU860PZylpPdncTbFsPM
	Qmx+iIPTK+ZrZlA+a3+FXUCZ+8UEu3bzog4jC96Hkup129sZY5pQ8n3OYYpg6W4gZERi
	dwIuwuQzNOvqnZX2urBJSfySIt6bVtiLQopf0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=n/Ah6aDVqLKQ8bKTceDyJB0r6Ua2Ezw/PClLbFxG/SR4kxoUJmo4TTDQ16sPfreNiL
	t03UzkZ9yZJJONK5eg15O84mR5/rrMdaC91GZsqQagTIRI7Zh45+6ijXQ+cWLU4G2SBl
	YG6EACC0gLxosaHc/Xe1rKnjO3dmFA+MKoJ7Y=
Received: by 10.43.54.18 with SMTP id vs18mr294220icb.313.1300294247755;
	Wed, 16 Mar 2011 09:50:47 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id q34sm39593ibu.40.2011.03.16.09.50.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 09:50:46 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 12:50:36 -0400
Message-Id: <925e89153270dc162957903bc793ecbfdbf6ec05.1300293663.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1300293663.git.bengardiner@nanometrics.ca>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
Subject: [2010.03-maintenance] [PATCH 3/7] external-toolchain: allow override of linux-libc-headers provider
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
X-List-Received-Date: Wed, 16 Mar 2011 16:59:19 -0000

only set PREFERRED_PROVIDER_linux-libc-headers if it is not
already assigned a value.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
Tested-by: Andrea Galbusera <gizero@gmail.com>
Signed-off-by: Tom Rini <tom_rini@mentor.com>
(cherry picked from commit 829ea5110bc82f71a225f168bcb6a9a327b1b5c8)

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
---
 conf/distro/include/toolchain-external.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/toolchain-external.inc b/conf/distro/include/toolchain-external.inc
index ab50308..12dc454 100644
--- a/conf/distro/include/toolchain-external.inc
+++ b/conf/distro/include/toolchain-external.inc
@@ -4,7 +4,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-toolchain-${T
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-toolchain-${TOOLCHAIN_BRAND}"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain-${TOOLCHAIN_BRAND}"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain-${TOOLCHAIN_BRAND}"
-PREFERRED_PROVIDER_linux-libc-headers = "external-toolchain-${TOOLCHAIN_BRAND}"
+PREFERRED_PROVIDER_linux-libc-headers ?= "external-toolchain-${TOOLCHAIN_BRAND}"
 
 TOOLCHAIN_VENDOR ?= "${TARGET_VENDOR}"
 TARGET_VENDOR := "${TOOLCHAIN_VENDOR}"
-- 
1.7.1



