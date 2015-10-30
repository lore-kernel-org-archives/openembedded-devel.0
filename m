Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 78F8177128
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:22 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so9318935wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=HbFZqHM0Od91H2e4tkaGAkE8O2ylMwpcIRgF2SXBsFc=;
	b=wRkJpiIMcyX9bgIxs8j8gzYfMQho5XUaaRZMUeNtog4u1InwKOg+zon+/6zR/pd5oq
	7cWvc024N0kJLZ9pkMOJ/LvQrvXjxnSQV9U8Xg9/E+UuLpymPmoq61+Te52CMPH1UKQD
	L+1VwCzfuCi/qOq/E6dzyMQX+X/+lUZXrNGh7Ok5vjMLK2BedJIZnGCn+NbuF6mnpswK
	plI7XBNXyFukDOz13oBs/sFHME15HjDKvzBzQRCFL0gPF62s59jGQTGuUzssYS1RAsNk
	B7GgEhjMF2MJCYIWL5yqiK5MJkdaS4zbnQGwwGCjoNVBP++Qa7+ciHwTVzyvt0BMkSxM
	Lc0g==
X-Received: by 10.28.18.21 with SMTP id 21mr3212443wms.34.1446207262298;
	Fri, 30 Oct 2015 05:14:22 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:39 +0100
Message-Id: <1446207225-15386-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 07/13] gnulib: move meta-networking -> meta-oe
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
X-List-Received-Date: Fri, 30 Oct 2015 12:14:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A more common place is required for gnulib because of other recipes (e.g
fontforge) will depend on it

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../netcf => meta-oe/recipes-support/gnulib}/gnulib_git.bb                | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-networking/recipes-support/netcf => meta-oe/recipes-support/gnulib}/gnulib_git.bb (100%)

diff --git a/meta-networking/recipes-support/netcf/gnulib_git.bb b/meta-oe/recipes-support/gnulib/gnulib_git.bb
similarity index 100%
rename from meta-networking/recipes-support/netcf/gnulib_git.bb
rename to meta-oe/recipes-support/gnulib/gnulib_git.bb
-- 
2.1.0


