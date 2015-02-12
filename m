Return-Path: <joe@deserted.net>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id AB0A373310
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 03:26:47 +0000 (UTC)
Received: by iecrd18 with SMTP id rd18so8987175iec.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 19:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=mrMa6jQXCpWRFdJwetNbpPEtKE70AGKbWsf/aTYqvMU=;
	b=ZZe0GmoBlhdUKofVst7VTU9V2UpJgVC+CsBVIoZc+ajkTVpUeAb7Lq8VJp/vLD+BqP
	BD2i62HDr0K4oqT2G6VTDVol7XDBFPOXLA0cqRyTEK0GKnV8vT4vS9ILLSnAffvFZQYZ
	hHaGzwPgcUbNsJqKulv35KIu7GNeY+gPUcsh3pzoVc3v2dmr93hMSj63RGQ02ZTUHtZe
	GeiG+XLTMisFD+PPmUw7TViMFn0khzC/Oz4UN2522wUYPYubRTOKbL+PG795M4dnE5FP
	yO/eAe5pDQKo0xNQruD+QD62A29+Kgil99hxieefbkiw+gPOjJ7toRR1nrcPFMATOM2m
	ziOQ==
X-Gm-Message-State: ALoCoQlMf8Zm54bYoGWuhQrVdhiMcKFLIY4P5xWCk0z0Y0kSjz1T8fdeRxhxgAkOTm7ab5cRNOf9
X-Received: by 10.107.164.221 with SMTP id d90mr2327333ioj.13.1423711606630;
	Wed, 11 Feb 2015 19:26:46 -0800 (PST)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id l6sm458953igv.8.2015.02.11.19.26.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Feb 2015 19:26:45 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Feb 2015 22:27:34 -0500
Message-Id: <1423711654-4649-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] postfix: Update SRC_URI
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
X-List-Received-Date: Thu, 12 Feb 2015 03:26:55 -0000

A significant number of the postfix mirrors are offline, including
Wietse's own site.  Swap in one of the functional mirrors.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

Considering the number of mirrors available for postfix, I considered defining a
POSTFIX_MIRRORS variable and using that in the SRC_URI, but that seems like
over-kill for something that is likely not going to be a long-term issue.

 meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index e73f2f0..1428114 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -15,7 +15,7 @@ DEPENDS_virtclass-native = "virtual/db-native openssl-native libpcre-native"
 LICENSE = "IPL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64375f37431336ea1b1b3005fe3fa354"
 
-SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
+SRC_URI = "http://cdn.postfix.johnriley.me/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
     file://makedefs.patch \
     file://install.patch \
     file://main.cf_2.0 \
-- 
1.9.1


