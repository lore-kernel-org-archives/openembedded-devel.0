Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OsPQG-0004bl-HT
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 02:18:57 +0200
Received: by pvg6 with SMTP id 6so1339418pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 17:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=PQWnicfUE9Io7sWgrUtONBSh+Y738kICeASQtzUijxg=;
	b=Ya4HQ0Tp9In4r+eVV7uw2TgjWE/L9j2bReFxBVwd+5jh83XrSDlsdkte11G5ZCldCq
	g605CFTou5r2Zvnad6tsGYZXm78Vfxt2ZLXoRRNmKI3V8yLXo18dLAUyLCV0fUOXiGFL
	DQhneE7eLFe8l72VcbQvgygy2wFYu+L6PTLw4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=E8UTjS5T3bZk6eHa/XkXGECxEXOcCZfg1gorF+eivroZVzusF0xiBkHZzBOkeZxO5L
	EY8+pUpX0owKDX9jKufeNFAIQQSrAoshQBPPFTIIlaqfOLsv7U5K5sRkrsyyzuGICl8L
	WmiUCmjjYEzPLirNxDfJrP5bzFRcfe6i3WzCk=
Received: by 10.142.231.7 with SMTP id d7mr1910392wfh.162.1283732296725;
	Sun, 05 Sep 2010 17:18:16 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	n35sm3362183wfa.15.2010.09.05.17.18.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 05 Sep 2010 17:18:16 -0700 (PDT)
Message-ID: <4C843342.7000601@gmail.com>
Date: Mon, 06 Sep 2010 09:48:10 +0930
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
Subject: [PATCH] gdb-common, gdb-cross-sdk: don't install libiberty on 64bit hosts.
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
X-List-Received-Date: Mon, 06 Sep 2010 00:18:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gdb/gdb-common.inc    |    3 +--
 recipes/gdb/gdb-cross-sdk.inc |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes/gdb/gdb-common.inc b/recipes/gdb/gdb-common.inc
index c3eef69..93d5492 100644
--- a/recipes/gdb/gdb-common.inc
+++ b/recipes/gdb/gdb-common.inc
@@ -31,7 +31,6 @@ do_install_append() {
 
 	# We use libiberty from binutils
 	rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
-	rm -f ${D}${libdir}/libiberty.a
-
+	rm -f ${D}${prefix}/lib{,64}/libiberty.a
 }
 
diff --git a/recipes/gdb/gdb-cross-sdk.inc b/recipes/gdb/gdb-cross-sdk.inc
index 7c85653..21f3267 100644
--- a/recipes/gdb/gdb-cross-sdk.inc
+++ b/recipes/gdb/gdb-cross-sdk.inc
@@ -1,7 +1,7 @@
 require gdb-cross.inc
 LICENSE = "GPLv3"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 inherit sdk
 
-- 
1.7.1



