Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Or3uq-00036q-OD
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 09:08:59 +0200
Received: by pvg6 with SMTP id 6so42670pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=iOqTJjELhq7VLBukNv2Mq/nquCGh7ITVZtLDG1jXwtI=;
	b=orRC5gYbY1wSPmX1iIDxHYAhwhEAn9l2ooUE+mOaYMObvIT4NcONOkGD485K6SNFfg
	s6Skk4rKRTa5Xvre4D0oxwE+//qfMmgEkx35nYvreA2NHNTCXnd1LMdIm6v0UtqXlZ8P
	4sRRiBLXFU9WojJfs59le/faDpVzGgg9mVPuY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=o2qmFSBcFSF8YXJKlMhCDNiTecsmMmhDAzMY5Y5L2mWWTJ4yTXyBYi4QUaHgPigkTs
	ncyO0S76/z67/IwmDnuLPMmwHBQ/iOMnvysV7079ieDymDEacRYRmlxThmSl4j72ijTg
	7EJm4ZnjaVBvYxFTOpvlM0/WCZqbYkyk9rq04=
Received: by 10.114.58.19 with SMTP id g19mr9935192waa.73.1283411300692;
	Thu, 02 Sep 2010 00:08:20 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id x9sm295929waj.15.2010.09.02.00.08.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 02 Sep 2010 00:08:19 -0700 (PDT)
Message-ID: <4C7F4D5E.6070206@gmail.com>
Date: Thu, 02 Sep 2010 16:38:14 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
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
Subject: [PATCH] mbmerlin_0.8.1-2.bb: Don't overwrite a file staged by libx11.
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
X-List-Received-Date: Thu, 02 Sep 2010 07:08:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

If mbmerlin is staged, packages which use the x11.pc file will get one
that mbmerlin provides.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/mbmerlin/mbmerlin_0.8.1-2.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes/mbmerlin/mbmerlin_0.8.1-2.bb b/recipes/mbmerlin/mbmerlin_0.8.1-2.bb
index 5c3a93a..e5c582a 100644
--- a/recipes/mbmerlin/mbmerlin_0.8.1-2.bb
+++ b/recipes/mbmerlin/mbmerlin_0.8.1-2.bb
@@ -1,5 +1,5 @@
 LICENSE = "GPL"
-PR = "r3"
+PR = "r4"
 
 inherit pkgconfig gpe
 
@@ -19,3 +19,8 @@ CFLAGS += " -D_GNU_SOURCE"
 
 SRC_URI[md5sum] = "c379c781ac05d3b64228f48362aecaca"
 SRC_URI[sha256sum] = "d2a482d4b7bce5cc41bacddc8ef48ebd21fecbe6585b74036e432c030595b11f"
+
+do_install_prepend() {
+    # This package is not x11, this file should not be staged.
+    rm ${S}/build/x11.pc
+}
-- 
1.7.1



