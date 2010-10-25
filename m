Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PAWiX-0004Oi-Cu
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 01:44:44 +0200
Received: by iwn42 with SMTP id 42so203451iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 16:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=/CR5P/OOhH+TQ77j59x3B/09Zi9SpjbxfMNNSx8fIao=;
	b=OJQfFHRztnUaqJHdNosy6Vv9PiFZcTMxKceWLSl+7C4WdZQcwjhaKEE7ubCY9OOGDJ
	YyDAhiRf2Ss1/iVpIqgXeFabv+iEwQLrcvUyjUEub8NDqRqx3vHG8BXG+84YhexW3Qvp
	pnwgBVcpvU1EAuqVqM2z/aOsMPT3ZEkzXczNw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=mSqmWNHX2PH8nEpd71GA6o5gh5p2YBTs4wpyaJxDCiGE2Kcy7PquBJh/mw+nV9INF5
	waw92w/H+lgmr+aMFhKJatbrxd4fBII/+a6BYhCx+yYtGPOC6p7O80Qt6iwp0itgyHSV
	ndOIrrph1kCqn1BcYK4Jn0LcBApqmsTztRv7c=
Received: by 10.42.57.73 with SMTP id c9mr5931302ich.39.1288050234990;
	Mon, 25 Oct 2010 16:43:54 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	in12sm8694197ibb.9.2010.10.25.16.43.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 25 Oct 2010 16:43:53 -0700 (PDT)
Message-ID: <4CC61633.3080808@gmail.com>
Date: Tue, 26 Oct 2010 10:13:47 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.14) Gecko/20101020 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] espgs_8.15.3.bb: Depend on cups as EXTRA_OECONF has --enable-cups.
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
X-List-Received-Date: Mon, 25 Oct 2010 23:44:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


pstoraster/gdevcups.c:74:25: fatal error: cups/raster.h: No such file or directory

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/espgs/espgs_8.15.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/espgs/espgs_8.15.3.bb b/recipes/espgs/espgs_8.15.3.bb
index ba03f00..c2349e0 100644
--- a/recipes/espgs/espgs_8.15.3.bb
+++ b/recipes/espgs/espgs_8.15.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "ESP Ghostscript is an up-to-date GNU Ghostscript distribution \
 including bug fixes, new drivers, and additional support for CUPS."
 HOMEPAGE = "http://www.cups.org/espgs/"
 SECTION = "libs"
-DEPENDS = "jpeg zlib libpng tiff fontconfig"
+DEPENDS = "jpeg zlib libpng tiff fontconfig cups"
 LICENSE = "GPL"
 PR = "r1"
 
-- 
1.7.1



