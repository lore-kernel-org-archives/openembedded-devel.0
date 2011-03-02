Received: from na3sys009aog101.obsmtp.com ([74.125.149.67])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1Puohc-00082a-J4
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 17:17:08 +0100
Received: from source ([209.85.210.182]) (using TLSv1) by
	na3sys009aob101.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTW5srnBxyfUg2BPdKXv+0VqxGNfk2HbL@postini.com;
	Wed, 02 Mar 2011 08:13:39 PST
Received: by mail-iy0-f182.google.com with SMTP id 12so76323iyj.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 08:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=/eJ6XOyouLxBlf/kuNCyx7jNXhnhvQsuaEuQaKDc7S0=;
	b=a0G2N3K+17f5y0Ug4Hmt+gal/5+QRFCnGe5K8sQcTF+9hWQ3Cz+Kqzlz6mS6CTGynZ
	b0bRKDuH8r9hki7/vixNGaeN6l5kDWaEKkjOs5th4qK6FXhGruvygwn8pWBm8hH5LXQ1
	jP41YRi7sWrj9CPNF72SndmAg1dOt814iH1kc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qTWuFckjWczrusa7VbP9MQlPYKdY69sCfdlJU4iL/MKab73L858a3MB2X2jwKNEO4s
	M+1NuwSYr/hyn4PbaWBxWeWdqUbhIfsdB7qJxpX/V3Aw9/r7Xuux74bB0+fAF1kW3LHk
	be7EIwyGZ+QEVoysT8CYBV+MzJbosKVVbchSc=
Received: by 10.42.228.3 with SMTP id jc3mr8362170icb.307.1299078320155;
	Wed, 02 Mar 2011 07:05:20 -0800 (PST)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id z4sm17934ibg.19.2011.03.02.07.05.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 07:05:19 -0800 (PST)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
Date: Wed,  2 Mar 2011 10:05:13 -0500
Message-Id: <a3ce82b2cf61bfced06945832d70aacedfb6ab7b.1299076392.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1299076392.git.bengardiner@nanometrics.ca>
References: <cover.1299076392.git.bengardiner@nanometrics.ca>
Cc: Andrea Galbusera <gizero@gmail.com>, Koen Kooi <koen@openembedded.org>
Subject: [PATCH v2 1/2] external-toolchain: allow override of linux-libc-headers provider
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
X-List-Received-Date: Wed, 02 Mar 2011 16:17:48 -0000

only set PREFERRED_PROVIDER_linux-libc-headers if it is not
already assigned a value.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
Tested-by: Andrea Galbusera <gizero@gmail.com>

---

Changes since v1:
 * rebased to 3dc72c4ca0a9ce677f6c3a56517626984b5eaaa0 of
   git://git.openembedded.org/openembedded#master
 * added Tested-by: Andrea Galbusera <gizero@gmail.com>

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



