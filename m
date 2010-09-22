Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OyDQv-000759-S7
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 02:43:39 +0200
Received: by pvg6 with SMTP id 6so3730pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 17:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=RtzpUA46kYgAMIXHYnOqqklT4vqRm24IqyE7g5JMRBk=;
	b=FmUq3v5eSbPPq0bGnWNTHSWh1W7eVPhSYS/Zb65sK1LxE9Q1ZohBAXgUAT/xY1Dj4d
	R55Q9XVTwMIHObHbBSJFmv9W1qwJYU27XJvMoOnUvUy5m8HuMWkBN9cPUBaXGTI1i+M1
	yWIb9oQHIFbtte8ic0r6UHjBdMp59jYCEMVCA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=tcppFGl6OT7xkJRfd3nZJfMkYpcuIol2+p6hm0cvbO8VmSyKeFwx1xa4UU/MxsyxU5
	NV8Ldhk148ooxr/TiksbgoO6IOAnMolsZlOjKPZ+TvGhXL3QQd3uRW7nF3z6EOXhAshD
	ikiKJznvuy3WNaXAPCcRmovZHw5scAAasNjBA=
Received: by 10.143.9.19 with SMTP id m19mr9834073wfi.127.1285116204382;
	Tue, 21 Sep 2010 17:43:24 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	i20sm10735157wff.17.2010.09.21.17.43.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Sep 2010 17:43:23 -0700 (PDT)
Message-ID: <4C995127.2020207@gmail.com>
Date: Wed, 22 Sep 2010 10:13:19 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] python-numpy: Mark as COMPATIBLE_HOST="arm.*".
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
X-List-Received-Date: Wed, 22 Sep 2010 00:43:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/python/python-numpy_1.1.1.bb |    1 +
 recipes/python/python-numpy_1.4.1.bb |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/python/python-numpy_1.1.1.bb b/recipes/python/python-numpy_1.1.1.bb
index f5c23e0..878e060 100644
--- a/recipes/python/python-numpy_1.1.1.bb
+++ b/recipes/python/python-numpy_1.1.1.bb
@@ -4,6 +4,7 @@ PRIORITY = "optional"
 LICENSE = "PSF"
 PR = "ml0"
 
+COMPATIBLE_HOST = "arm.*"
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
            file://unbreak-assumptions.diff \
 	   file://trycompile.diff \
diff --git a/recipes/python/python-numpy_1.4.1.bb b/recipes/python/python-numpy_1.4.1.bb
index f4941cf..062b1a3 100644
--- a/recipes/python/python-numpy_1.4.1.bb
+++ b/recipes/python/python-numpy_1.4.1.bb
@@ -4,6 +4,7 @@ PRIORITY = "optional"
 LICENSE = "PSF"
 PR = "ml0"
 
+COMPATIBLE_HOST = "arm.*"
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
 	   file://config.h \
 	   file://numpyconfig.h \
-- 
1.7.1



