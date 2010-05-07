Received: from szluug.org
	([85.17.92.45] helo=americium.stoicheia.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <soltys@szluug.org>) id 1OAPZR-00030h-5z
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 17:34:38 +0200
Received: from [192.168.0.3] (soltys.soad.pl [83.168.118.74])
	by americium.stoicheia.net (Postfix) with ESMTPA id 945B4680F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 May 2010 17:26:11 +0200 (CEST)
Message-ID: <4BE43043.2000605@szluug.org>
Date: Fri, 07 May 2010 17:22:43 +0200
From: =?UTF-8?B?S3J6eXN6dG9mICdzb2x0eXMnIEtvcm/Fm2Npaw==?= <soltys@szluug.org>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; pl;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.0.1
OpenPGP: id=C7D30884
X-AVK-Virus-Check: AVA 21.218;F1206
X-SA-Exim-Connect-IP: 85.17.92.45
X-SA-Exim-Mail-From: soltys@szluug.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: FreeBSD 8 bitbake errors
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
X-List-Received-Date: Fri, 07 May 2010 15:34:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
 
Hi all,
I'm trying to setup oe environment on fresh FreeBSD 8 install. I'd
installed everything listed in [1] and [2], but when I try to bitbake
anything I get this:

[soltys@ ~/oe/ngw100]$ bitbake nano
NOTE: Handling BitBake files: / (6387/8361) [76 %]ERROR: Information
not available for target 'i386-freebsd8'
ERROR: argument of type 'NoneType' is not iterable while parsing
/home/soltys/oe/ngw100/openembedded/recipes/openssl/openssl-native_0.9.8g.bb
ERROR: Information not available for target 'i386-freebsd8'
NOTE: <type 'exceptions.TypeError'>:argument of type 'NoneType' is not
iterable while evaluating:
${@siteinfo_get_endianess(d)}
NOTE: <type 'exceptions.TypeError'>:argument of type 'NoneType' is not
iterable while evaluating:
${@base_conditional('SITEINFO_ENDIANESS', 'le', '-DL_ENDIAN',
'-DB_ENDIAN', d)}         -DTERMIO -Os -fomit-frame-pointer -Wall
NOTE: <type 'exceptions.TypeError'>:argument of type 'NoneType' is not
iterable while evaluating:
${@'${CFLAG}'.replace('-O2', '')}
ERROR: argument of type 'NoneType' is not iterable while parsing
/home/soltys/oe/ngw100/openembedded/recipes/openssl/openssl-native_0.9.8g.bb
NOTE: Handling BitBake files: / (6426/8361) [76 %]ERROR: Information
not available for target 'i386-freebsd8'
ERROR: argument of type 'NoneType' is not iterable while parsing
/home/soltys/oe/ngw100/openembedded/recipes/openssl/openssl-native_0.9.7m.bb
ERROR: Information not available for target 'i386-freebsd8'
NOTE: <type 'exceptions.TypeError'>:argument of type 'NoneType' is not
iterable while evaluating:
${@siteinfo_get_endianess(d)}
NOTE: <type 'exceptions.TypeError'>:argument of type 'NoneType' is not
iterable while evaluating:
${@base_conditional('SITEINFO_ENDIANESS', 'le', '-DL_ENDIAN',
'-DB_ENDIAN', d)}         -DTERMIO -Os -fomit-frame-pointer -Wall
NOTE: <type 'exceptions.TypeError'>:argument of type 'NoneType' is not
iterable while evaluating:
${@'${CFLAG}'.replace('-O2', '')}
ERROR: argument of type 'NoneType' is not iterable while parsing
/home/soltys/oe/ngw100/openembedded/recipes/openssl/openssl-native_0.9.7m.bb
NOTE: Handling BitBake files: \ (7268/8361) [86 %]ERROR: Information
not available for target 'i386-freebsd8'
ERROR: argument of type 'NoneType' is not iterable while parsing
/home/soltys/oe/ngw100/openembedded/recipes/openssl/openssl-native_0.9.7g.bb
ERROR: Information not available for target 'i386-freebsd8'
NOTE: <type 'exceptions.TypeError'>:argument of type 'NoneType' is not
iterable while evaluating:
${@siteinfo_get_endianess(d)}
NOTE: <type 'exceptions.TypeError'>:argument of type 'NoneType' is not
iterable while evaluating:
${@base_conditional('SITEINFO_ENDIANESS', 'le', '-DL_ENDIAN',
'-DB_ENDIAN', d)}         -DTERMIO -Os -fomit-frame-pointer -Wall
NOTE: <type 'exceptions.TypeError'>:argument of type 'NoneType' is not
iterable while evaluating:
${@'${CFLAG}'.replace('-O2', '')}
ERROR: argument of type 'NoneType' is not iterable while parsing
/home/soltys/oe/ngw100/openembedded/recipes/openssl/openssl-native_0.9.7g.bb
NOTE: Handling BitBake files: | (8358/8361) [99 %]Command execution
failed: Traceback (most recent call last):
  File "/home/soltys/oe/ngw100/bitbake/lib/bb/command.py", line 85, in
runAsyncCommand
    self.cooker.updateCache()
  File "/home/soltys/oe/ngw100/bitbake/lib/bb/cooker.py", line 802, in
updateCache
    if not self.parser.parse_next():
  File "/home/soltys/oe/ngw100/bitbake/lib/bb/cooker.py", line 956, in
parse_next
    def parse_next(self):
  File "/home/soltys/oe/ngw100/bitbake/lib/bb/cooker.py", line 995, in
parse_next
    raise ParsingErrorsFound
ParsingErrorsFound


Any idea why I get errors and how to deal with them ?

Regards


[1]  http://wiki.openembedded.net/index.php/OEandYourDistro#FreeBSD
[2]  http://wiki.openembedded.net/index.php/Getting_started

- -- 

Krzysztof 'soltys' Koroscik
jid: soltys@szluug.org
e-mail: soltys@szluug.org

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
 
iEYEARECAAYFAkvkMEEACgkQNbd+EcfTCITZoACfQllUnz4KIwaYRfzVyeCIGSBQ
8PkAoLeTft9hzLgrP9gWGOi+TqWJAlc2
=x5i6
-----END PGP SIGNATURE-----



