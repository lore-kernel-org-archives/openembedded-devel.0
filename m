Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OYCw6-0007IN-Cy
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 08:56:23 +0200
Received: by pvg13 with SMTP id 13so1974843pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 23:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=vqYhdIfL+7Tvd+v7nLhVPsa+2DWNDQdIqGW5HFZm88A=;
	b=Rmt/sOyMtscD0xUVGIhL4VoJTdWUBda61T2atpnx8DbD9mPPLApsyA0dd8vv1VJ3WE
	ycci4c0u82mHVSyqtF6y/xsgvMxeZu/MihefkEdl+96aU84vmmTLl7HFerZvBe8JAvgH
	xs8JqTA9aGVd2hWCKwONoIfiAdvjgitg766T8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=aMAcbXI1jjHhTEbNduZx8nb00ePtZzltAWZcEuFD7AJlY0xR+KURlFkFXXmKp9Na9v
	N0IysUp3CJAWYORmaR+toSSIpgatHjMXAQnsr/9hJkwJUBh6wZ3+58VcwfRIyZfHLymy
	zkidcVJxSro09zSbJESIBBVl6wo3lMnDxfcRk=
Received: by 10.114.109.8 with SMTP id h8mr15564801wac.208.1278917481228;
	Sun, 11 Jul 2010 23:51:21 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	q6sm63543218waj.10.2010.07.11.23.51.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 11 Jul 2010 23:51:20 -0700 (PDT)
Message-ID: <4C3ABB63.4040004@gmail.com>
Date: Mon, 12 Jul 2010 16:21:15 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
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
Subject: [PATCH] perl_5.8.8.bb: Don't use hostperl's $Config{cppflags} with cross compiler.
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
X-List-Received-Date: Mon, 12 Jul 2010 06:56:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Fixes /usr/local/include Badness.

make[2]: Entering directory `/home/grg/oe2/tmp/work/mipsel-oe-linux/perl-5.8.8-r34/perl-5.8.8/ext/Errno'
hostperl -I/home/grg/oe2/tmp/work/mipsel-oe-linux/perl-5.8.8-r34/perl-5.8.8/Cross/../fake_config_library -MConfig Errno_pm.PL Errno.pm
CROSS COMPILE Badness: /usr/local/include in INCLUDEPATH: /usr/local/include
No error definitions found at Errno_pm.PL line 216.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/perl/perl_5.8.8.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index 4f4c468..f09360f 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -104,7 +104,8 @@ do_configure() {
 }
 do_compile() {
         if test "${MACHINE}" != "native"; then
-            sed -i -e 's|/usr/include|${STAGING_INCDIR}|g' ext/Errno/Errno_pm.PL
+            sed -i -e 's|/usr/include|${STAGING_INCDIR}|g' \
+                   -e 's|$Config{cppflags}||' ext/Errno/Errno_pm.PL
         fi
         cd Cross
         oe_runmake perl LD="${TARGET_SYS}-gcc"
-- 
1.7.1



