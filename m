Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Ku-00007k-Q8
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 19:05:07 +0100
Received: by mail-wg0-f52.google.com with SMTP id 15so3303199wgd.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=4EyGhC82HtVUm9S/FUddB/6oRLMjoGyABPzX0OEDipA=;
	b=G0TXUVqFTB/0ZxU4V1g6RiOpAMje02oqt0RPcRmOHQnExseB+MCThmyvWqo/5H9vEm
	fmfXLmlnmEa2tCqDAFxxYhGAmPY+XFgRxz6ESjNkB3ADQbD2I9vbmUzx9WxNKfFoBByt
	UK3XPQStNOlrl21ryPV2uRpGJXrH3QzVGccJvw6comFS7/H+2+JLCFs3BE6YfwP7iAZj
	aZvuKM6WD79sqo1t3LO6LUvVNbCV+3YiYjfiwYrdfRL+JwaQsm4ELwcAS47DgCHyMDtl
	Oqkm9eEDEZjxqjUPuiBVhDdVsLZkE9hIz71i+h8aAv7N1JQI9IsxKk7dMcIAljvTPohX
	OKDA==
X-Received: by 10.180.14.202 with SMTP id r10mr4616363wic.8.1363974112772;
	Fri, 22 Mar 2013 10:41:52 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.51
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:37 +0000
Message-Id: <0c0c54634fd4fa9e2faa24b8941e2106a8216578.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlZBoeHxXxDG5NgJqBjKJnYB8Ro8b4+cVkFzybkFssfNwSZZgjJDdwFDTnWXfjOqUITweH9
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 17/22] local.conf.sample.extended: remove obsolete DISTRO_FEATURES_INITMAN reference
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
X-List-Received-Date: Fri, 22 Mar 2013 18:05:10 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-yocto/conf/local.conf.sample.extended |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample.extended b/meta-yocto/conf/local.conf.sample.extended
index 8e5dca5..747636c 100644
--- a/meta-yocto/conf/local.conf.sample.extended
+++ b/meta-yocto/conf/local.conf.sample.extended
@@ -214,7 +214,3 @@
 # Put the following two lines in the conf file with intact.
 #ARCHIVER_CLASS = "${@'archive-${ARCHIVER_MODE}-source' if ARCHIVER_MODE != 'none' else ''}"
 #INHERIT += "${ARCHIVER_CLASS}"
-#
-# set init manager: sysvinit or systemd
-# sysvinit is the default choice
-#DISTRO_FEATURES_INITMAN ?= "sysvinit"
-- 
1.7.10.4



