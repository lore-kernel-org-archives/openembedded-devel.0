Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Ed-0007gp-8L
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:35 +0100
Received: by mail-wi0-f182.google.com with SMTP id hi18so4657190wib.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=XKO1UygDiRHiIF/HPclfgrxOP32/9QgPD0Q4jZodLto=;
	b=EaWpQ8H+EER6xDTU0hT8fLdLAJ4ScCdUWhB1NjNp/nUrYV5b+WSLKv8RndiuOygktD
	VKhivHJX98hX47pljykV1WPeABCO1oZWLeX0dXENOUlosisK26DJnbhb7PI7xECyv3Is
	5bWCDXsAO09J40Lzf+Ey166Kwsw4vwAUgEGnvYQoscuWfu4+bRHQWp3SKdmAj4+eVQFy
	z5Eo7McPu66T5dO+kgsBpnEOIXN/m7PeHsF5qACMW3AMrKN1U5g78Bghfw1WoLcLWT3e
	3px/4odLG0cDOfcW0MTkVKyENSnXv6/Nj5MBmensqtMTI3fmz40/X4ix+W9QjUbMVT9V
	Hn2g==
X-Received: by 10.194.7.131 with SMTP id j3mr4750322wja.23.1363974101374;
	Fri, 22 Mar 2013 10:41:41 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.40
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:28 +0000
Message-Id: <71806cbf0bf89a95d980beeb0797cb43aed33fc8.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn3VQQsEMDBhevWV+B89abluD4j48FYMdnBbXq364xu3FdVdY1nH8jQuIa7PD+U87lS57Oz
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/22] default-providers: change udev selection logic
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:29 -0000

Change the logic so that the udev provider is the standalone udev, unless the
systemd DISTRO_FEATURE is set.  The previous logic was designed to fail if both
sysvinit and systemd were enabled, which we're supporting now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-providers.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ebf2a09..f7ee789 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -38,4 +38,4 @@ PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_make ?= "make"
-PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','sysvinit','udev','',d)}${@base_contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','systemd','systemd','udev',d)}"
-- 
1.7.10.4



