Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1MTGr5-0008Th-8m
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 17:02:11 +0200
Received: from w1190.wlan.rz.tu-bs.de ([134.169.204.174] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1MTGdE-0002EV-Vi by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2009 16:48:07 +0200
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1MTGdE-0007az-Ke
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 16:47:52 +0200
Date: Tue, 21 Jul 2009 16:47:52 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090721144752.GA26047@excalibur.local>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: devmem2 checksum mismatch
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
X-List-Received-Date: Tue, 21 Jul 2009 15:02:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

I just run into this one:
NOTE: The MD5Sums did not match. Wanted: 'be12c0132a1ae118cbf5e79d98427c1d' and Got: 'e23f236e94be4c429aa1ceac0f01544b'
NOTE: Task failed: Checksum of 'http://www.lartmaker.nl/lartware/port/devmem2.c' failed

Seems they changed the file. Version control is really nothing for everybody. ;)

The checksums matching the file from

[http://www.abcsinc.com/small-linux/devmem2.c]
md5=e23f236e94be4c429aa1ceac0f01544b
sha256=3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639

now. What is the policy here? Just change checksums.ini?

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 4cd330c..71a9024 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -4723,8 +4723,8 @@ md5=e23f236e94be4c429aa1ceac0f01544b
 sha256=3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639
 
 [http://www.lartmaker.nl/lartware/port/devmem2.c]
-md5=be12c0132a1ae118cbf5e79d98427c1d
-sha256=ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191
+md5=e23f236e94be4c429aa1ceac0f01544b
+sha256=3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639
 
 [http://pknet.com/~joe/dgen-sdl-1.23.tar.gz]
 md5=b1896c1b21ddb152626aec2e8a157a3a

regards
Stefan Schmidt


