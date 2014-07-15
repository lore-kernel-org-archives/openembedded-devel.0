Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 332B270579
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:43 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so5117508wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=SH23MjXxrDpTu7ZjogdQDraZPJ5+CjLY0ca9W7Pl5ng=;
	b=R+6Lr5IvJH3yuc3HuWsxJloNlfPz1DQanvLZL1dVDKd8v0wz7wCcXLy3SxaI9eL33z
	GPbDPeRIw7wnpCj71pE/QGA0H7uRO8PaiIp2YJp4dOhd1ypKYC9mRXbia2H+tU5cuRw4
	nqKtCFco+sPzaJsgqL4zjo/IjIfIA9NiriRkcUp+yCkF6Djvv8vJwtTVwvu0QJCEuceH
	Yt21lDvYRQBGsjyZb45BEDe2h6YRxiUdEOjW0FB4ItXwAaSi43XZN3yU1tfDb8/IgqvY
	zRzYEtDkg8f61q9rNmf72mMgu0HcX+IfC3hitMKdy+I9NQlxMl3JUdCyYsrUUaF6lhIS
	I0cQ==
X-Gm-Message-State: ALoCoQlfL2HfI7VIRhpOAhlIU58lm9Vwo3egj9M2r22U1D6xC2rZvhMGulP3E8+quDMOAftPlRM+
X-Received: by 10.180.9.71 with SMTP id x7mr6621767wia.61.1405441124763;
	Tue, 15 Jul 2014 09:18:44 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	au7sm33554040wjc.41.2014.07.15.09.18.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:18:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:18:32 +0100
Message-Id: <2124e92b03474bad56401b7a42fa8ce888b92399.1405440532.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/7] libid3tag: use "foreign" automake strictness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jul 2014 16:18:44 -0000

libid3tag doesn't want GNU-levels of automake strictness so tell it to be
"foreign".

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libid3tag/libid3tag/obsolete_automake_macros.patch              |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch b/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
index 8a04b54..2845fb1 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
@@ -6,7 +6,8 @@ diff -Nurd libid3tag-0.15.1b/configure.ac libid3tag-0.15.1b/configure.ac
 +++ libid3tag-0.15.1b/configure.ac	2013-01-03 06:41:02.734835014 +0200
 @@ -28,7 +28,7 @@
 
- AM_INIT_AUTOMAKE
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
 
 -AM_CONFIG_HEADER([config.h])
 +AC_CONFIG_HEADERS([config.h])
-- 
1.7.10.4


