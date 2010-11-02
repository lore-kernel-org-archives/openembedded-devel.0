Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PDQMg-0000hR-DU
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 00:34:06 +0100
Received: by gxk26 with SMTP id 26so15290gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 16:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=tYeboPjTnae5KZ6edyahKkFhZlrgRKoIx1vShzMf+IE=;
	b=smlxwfRik8zkSMLizYuXnYyMB+/GCLHzyMltVV55DGhT2ETkkrMBwYVwYNFU6chWFj
	KUnJfftLkkVwmcSuo3CuPCJXaS1CL07ZeU3sgmuYT75mAU4c43p54DAomslocf4qIwY0
	HOWw/C/qtamH18c0loBZ9YMhRwTw6/bail+do=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=uPbvROY5ZWiVzZFBSshmm33825Tw03k++3iDX+wbC9DrvGQDt99f6bQUN/5zFAdv9r
	uFndJv6K0l0Zz8/pbMVyNOi5jPaaeB7kC2UDGqHyV69Cpgl9XUuX3DkOkQ3W59DNPVFk
	OgU/3rVsbegxgDO3yqAN4fIFgx91JdJ2oRduo=
Received: by 10.91.11.29 with SMTP id o29mr8399agi.65.1288740792323;
	Tue, 02 Nov 2010 16:33:12 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	g29sm4569859anh.16.2010.11.02.16.33.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 02 Nov 2010 16:33:11 -0700 (PDT)
Message-ID: <4CD09FB1.8090103@gmail.com>
Date: Wed, 03 Nov 2010 10:03:05 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.14) Gecko/20101020 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] python-cython_0.13.bb: Add python to DEPENDS.
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
X-List-Received-Date: Tue, 02 Nov 2010 23:34:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


/usr/bin/cython is a python script. Fix the license while here.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/python/python-cython_0.13.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/python/python-cython_0.13.bb b/recipes/python/python-cython_0.13.bb
index 61ad718..966e265 100644
--- a/recipes/python/python-cython_0.13.bb
+++ b/recipes/python/python-cython_0.13.bb
@@ -3,10 +3,11 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
 and the messy, low-level world of C."
 SECTION = "devel/python"
 PRIORITY = "optional"
-LICENSE = "GPL"
+LICENSE = "Apache-2.0"
 SRCNAME = "Cython"
 BBCLASSEXTEND = "native"
 NATIVE_INSTALL_WORKS = "1"
+DEPENDS = "python"
 
 SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
1.7.1



