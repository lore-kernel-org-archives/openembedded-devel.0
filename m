Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B53026A4AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2013 15:07:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6VF7mgM013325
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Jul 2013 08:07:48 -0700 (PDT)
Received: from burninator.wrs.com (128.224.146.166) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 31 Jul 2013 08:07:47 -0700
From: Joe MacDonald <joe.macdonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Jul 2013 11:07:39 -0400
Message-ID: <1375283260-22291-2-git-send-email-joe.macdonald@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1375283260-22291-1-git-send-email-joe.macdonald@windriver.com>
References: <1375283260-22291-1-git-send-email-joe.macdonald@windriver.com>
MIME-Version: 1.0
Cc: marcin.juszkiewicz@linaro.org, walters@verbum.org
Subject: [meta-networking][PATCH 1/2] cyrus-sasl: relocate files to package name dir
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
X-List-Received-Date: Wed, 31 Jul 2013 15:07:46 -0000
Content-Type: text/plain

A minor bit of reorganization of the cyrus-sasl recipe directory in
preparation for a build fix.

Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 .../cyrus-sasl/{files => cyrus-sasl}/Fix-hardcoded-libdir.patch        |    0
 .../cyrus-sasl/{files => cyrus-sasl}/avoid-to-call-AC_TRY_RUN.patch    |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/recipes-daemons/cyrus-sasl/{files => cyrus-sasl}/Fix-hardcoded-libdir.patch (100%)
 rename meta-networking/recipes-daemons/cyrus-sasl/{files => cyrus-sasl}/avoid-to-call-AC_TRY_RUN.patch (100%)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/files/Fix-hardcoded-libdir.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/files/Fix-hardcoded-libdir.patch
rename to meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/files/avoid-to-call-AC_TRY_RUN.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/files/avoid-to-call-AC_TRY_RUN.patch
rename to meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
-- 
1.7.10.4


