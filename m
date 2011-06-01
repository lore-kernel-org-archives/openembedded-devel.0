Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRsnU-0000nK-DJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 23:17:48 +0200
Received: by bwz5 with SMTP id 5so496362bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 14:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=OQC0ZP4UD9HgpxIPa1dMASPp7p47vAdGyGGDIyhE0GI=;
	b=FFDCVx2jTV/mDFp9rP3zqHR/d1dVf+MSqJ7/Q9apcXbGojEuxnvjuVJUguHAB7dLPv
	H/7kWVAUVrq1GYp2Z4g/8juRJfD/9URBUKHgqquQVPdRnNLZfYp1jG9Dknha3kdxYaAe
	0CgqNSY3Mt1utiNRKGGz7taMpcb9H7SSg6EwE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rNmrEWk3be51vNSEbCOgJyhs6YeD5tSdMmh6tBAPAD7lpTdIV6EVZ/7L9Sw2qo6kYX
	6EV1Q0/rKhnMhPP3TCOXRb3+y11t7f0mYoh4VxcNxhkjgCQVDqtcL9t2GVPAGd80bgNe
	jjRfNiF5/rorRk1kOy1SKb+HZocBCC718tmSc=
Received: by 10.204.20.134 with SMTP id f6mr3211675bkb.165.1306962877623;
	Wed, 01 Jun 2011 14:14:37 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id a28sm6405fak.1.2011.06.01.14.14.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 14:14:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jun 2011 23:14:33 +0200
Message-Id: <3774457b630e8b651506aa1d0fa15b0f5c3446ab.1306962838.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <cover.1306962838.git.Martin.Jansa@gmail.com>
References: <cover.1306962838.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] siteinfo: add allarch-linux target
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
X-List-Received-Date: Wed, 01 Jun 2011 21:17:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/siteinfo.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/siteinfo.bbclass b/meta-oe/classes/siteinfo.bbclass
index f1db913..a081a5f 100644
--- a/meta-oe/classes/siteinfo.bbclass
+++ b/meta-oe/classes/siteinfo.bbclass
@@ -106,6 +106,7 @@ def get_siteinfo_list(d):
        target = bb.data.getVar('HOST_ARCH', d, 1) + "-" + bb.data.getVar('HOST_OS', d, 1)
 
        targetinfo = {\
+               "allarch-linux":           "",\
                "armeb-linux":             "endian-big bit-32 common-glibc arm-common",\
                "armeb-linux-gnueabi":     "endian-big bit-32 common-glibc arm-common armeb-linux",\
                "armeb-linux-uclibc":      "endian-big bit-32 common-uclibc arm-common",\
-- 
1.7.5.3



