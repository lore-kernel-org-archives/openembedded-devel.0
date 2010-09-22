Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OyDRJ-00076Z-Gi
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 02:44:03 +0200
Received: by pxi11 with SMTP id 11so3724pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 17:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=NHQPQ4dDjuYXV/f/vY02Sy00sNU8F5Tm68rRdeUSMWc=;
	b=Z53G9LJ+eBY6mDrH1m2SYKXdujPdVNQp59Vzy2djpd86nAbeA7czjOzbdoQFp1HHPx
	HcTcLPhrqT/pYnV4p4+jg2hgYlwnJcL4lAqjpx5E5kQ4Z62FF75sdoGGZfWx5ojOykK/
	8npE+ENrVTPg1kIqLhyJ4/6INlntMybBOMFBI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=EbZlQDe+kOXgGaS66XfpAbNdGgIYquhWH6EQhwLDcZq4TR4tuPPiw3O/W0Q1tBXsxh
	NOCa7YKWFIE67/N1g3aTEtvrLtR+Q24ZQSIo+D5lbwvghCWV1MUbglDPpKHQNFyQalQ2
	Zn74sNUZtLZJZSO/w96bEslCPMdPqp/+tE2Y4=
Received: by 10.114.111.12 with SMTP id j12mr12860145wac.95.1285116233631;
	Tue, 21 Sep 2010 17:43:53 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	d38sm16492886wam.20.2010.09.21.17.43.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Sep 2010 17:43:53 -0700 (PDT)
Message-ID: <4C995145.8090707@gmail.com>
Date: Wed, 22 Sep 2010 10:13:49 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] firefox_3.6.8.bb: Mark as COMPATIBLE_HOST="(powerpc|arm|i.86.*)".
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
X-List-Received-Date: Wed, 22 Sep 2010 00:44:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/mozilla/firefox_3.6.8.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/mozilla/firefox_3.6.8.bb b/recipes/mozilla/firefox_3.6.8.bb
index 825e692..b383de0 100644
--- a/recipes/mozilla/firefox_3.6.8.bb
+++ b/recipes/mozilla/firefox_3.6.8.bb
@@ -1,6 +1,7 @@
 DEPENDS += "cairo sqlite3 libnotify"
 PR = "r1"
 
+COMPATIBLE_HOST = "(powerpc|arm|i.86).*"
 # The .pc files below have "3.6" hardcoded, fix that before using them in a newer FF version!
 SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
 	file://jsautocfg.h \
-- 
1.7.1



