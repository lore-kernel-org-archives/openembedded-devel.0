Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 89AA16A9BA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2013 00:19:28 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id xb12so1025230pbc.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 17:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=KNmtIup0ma/Tz3GbfXJv0AmU+XAMYaMe9wOgEcyGhWE=;
	b=SBmvapLj4IC0o+rcHqoLdRz6/iAFp3ecVEdxda0MTmO8x2/uDi0feYfNlKYidb4Q0K
	MXn+O8cn3TlrouSJzriwbxyvOH2xWACuS6MBe07LGFGJo0mdxLyemOQHIll2RSlONw/P
	PBGkK2/+AZ0eaxXfDpJiIj6WpZtH8B/lQ2gEvLWslscCSz5DS1DHGHaGQTiOqN5rFO4i
	pDOYvPy+4MCe30pRQ0VuR6rrcyfcBe52CIS0g8cIDIVYr7yfEM8SnDnroh73oPm2eoLa
	cMkGE6Ql+01VKQ78x/6o9yhYAwkX/w7+v1q08wfGVZDhEpNZ7lz83cLvVj9ArZEhzdzI
	Gm2g==
X-Received: by 10.68.224.136 with SMTP id rc8mr4602232pbc.109.1371255569838;
	Fri, 14 Jun 2013 17:19:29 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id xd2sm4193117pac.15.2013.06.14.17.19.28
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Jun 2013 17:19:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jun 2013 17:17:08 -0700
Message-Id: <1371255429-32747-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1371255429-32747-1-git-send-email-raj.khem@gmail.com>
References: <1371255429-32747-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-browser][PATCH 2/3] libxi_1.7.1.bbappend: Remove
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
X-List-Received-Date: Sat, 15 Jun 2013 00:19:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This bbappend was generating native version of libxi
which was used by older chromium recipes but they are
gone. So let this go as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
CC:Eric Bénard <eric@eukrea.com>
CC:Denis Carikli <denis@eukrea.com>
CC:Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-graphics/libxi/libxi_1.7.1.bbappend |    2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 recipes-graphics/libxi/libxi_1.7.1.bbappend

diff --git a/recipes-graphics/libxi/libxi_1.7.1.bbappend b/recipes-graphics/libxi/libxi_1.7.1.bbappend
deleted file mode 100644
index c90046b..0000000
--- a/recipes-graphics/libxi/libxi_1.7.1.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-PRINC := "${@int(PRINC) + 1}"
-BBCLASSEXTEND += "native"
-- 
1.7.9.5


