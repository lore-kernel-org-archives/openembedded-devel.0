Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UN9WQ-0004vD-D2
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 00:17:43 +0200
Received: by mail-ea0-f182.google.com with SMTP id q15so447877ead.41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2013 15:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=5vdTMmOPJ+jjAXVdbTZQ7VKs20JTbcirCvBHBSZaFZ4=;
	b=pC/A4EC+ZYilRbCr0XDoMCd4SviaOq8TDEEDmDG4qe0TMUIy9wqggIibKaFCH5LKh8
	GbHzNnU9AE9Xq+WMT7A7fHw3pFlrnwVbw9HtD1cUDLtTG24b/3Urx+B4MSiOLWTtt3At
	60Fmo0i/gsgOk0Th6WdrRNwdHKbgiwxu/4fpmEn6A8Cu4MYXez7GJsefvrLH0hhZ7b7M
	6XE9I+cG6e/HDp8nEJnQIgepLtnytDKl9yT4HuOAprMfdPWqDtb07D29Wg8S/24N7QDE
	3uDTB039TWhE210Fae50WMbtFKg66Vvea9dyX6V8IBrWSCM8exSZQa8p1RdZrEQzJYai
	ZxMQ==
X-Received: by 10.14.223.69 with SMTP id u45mr14203396eep.23.1364940032102;
	Tue, 02 Apr 2013 15:00:32 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3CF4.dip.t-dialin.net.
	[91.10.60.244])
	by mx.google.com with ESMTPS id d47sm5204412eem.9.2013.04.02.15.00.30
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 15:00:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Apr 2013 00:00:15 +0200
Message-Id: <1364940019-23226-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364940019-23226-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364940019-23226-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce, V3 1/5] exo: inherit perlnative and add liburi-perl-native to DEPENDS
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
X-List-Received-Date: Tue, 02 Apr 2013 22:17:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* this fixes build on perl-less machines
* perlnative.bbclass adds perl-native to DEPENDS so remove it

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/exo/exo_0.10.2.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
index 4fdfd48..6aa1056 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
@@ -2,9 +2,10 @@ DESCRIPTION="Application library for the Xfce desktop environment"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 perl-native cairo"
+DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 liburi-perl-native cairo"
+PR = "r1"
 
-inherit xfce pythonnative
+inherit xfce pythonnative perlnative
 
 # SRC_URI must follow inherited one
 SRC_URI += " \
-- 
1.7.4.4



