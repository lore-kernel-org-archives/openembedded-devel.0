Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1PJTKH-0007XT-54
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 16:56:38 +0100
Received: from meyreuil.atmel.fr (meyreuil [10.159.254.132])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id oAJFqhTo010121
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 07:52:50 -0800 (PST)
Received: from [127.0.0.1] ([10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id oAJFt8h24788
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 16:55:08 +0100 (MET)
Message-ID: <4CE69DDB.9030500@atmel.com>
Date: Fri, 19 Nov 2010 16:55:07 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 204.2.163.5
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: parsing error while building from scratch: literki_git.bb
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
X-List-Received-Date: Fri, 19 Nov 2010 15:56:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

While trying to build from scratch the latest .dev branch with:
- at91sam9m10g45ek machine
- angstrom-2010.x distribution
- bitbake 1.10.1

I have the following error just after bitbake parsing .bb files:
 
nferre@RFOLXTS02:oe > bitbake console-image
NOTE: Out of date cache found, rebuilding...
NOTE: Handling BitBake files: | (0016/7222) [ 0 %]NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
NOTE: Handling BitBake files: / (0572/7222) [ 7 %]NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
NOTE: Handling BitBake files: \ (1055/7222) [14 %]NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Handling BitBake files: \ (1139/7222) [15 %]NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Handling BitBake files: / (3132/7222) [43 %]NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
NOTE: Handling BitBake files: / (4357/7222) [60 %]NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Handling BitBake files: / (4452/7222) [61 %]NOTE: Angstrom DOES NOT support ipkg because ipkg has been superseded by opkg
NOTE: Handling BitBake files: \ (5069/7222) [70 %]ERROR: Fetch command export HOME=/local/users/nferre; export PATH=/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/armv5te/bin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/sbin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/bin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/sbin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux//bin:/local/users/nferre/workspace/oe/bitbake/bin:/usr/local/codesourcery/arm-none-linux-eabi/arm-2008q1/bin:/local/users/nferre/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/local/users/nferre/bin; git ls-remote http://git.senfdax.de/git/literki master failed with signal 1, output:
 while parsing /local/users/nferre/workspace/oe/openembedded/recipes/literki/literki_git.bb
NOTE: <class 'bb.fetch.FetchError'>:Fetch command export HOME=/local/users/nferre; export PATH=/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/armv5te/bin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/sbin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/bin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/sbin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux//bin:/local/users/nferre/workspace/oe/bitbake/bin:/usr/local/codesourcery/arm-none-linux-eabi/arm-2008q1/bin:/local/users/nferre/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/local/users/nferre/bin; git ls-remote http://git.senfdax.de/git/literki master failed with signal 1, output:
 while evaluating:
${@bb.fetch.get_srcrev(d)}
NOTE: <class 'bb.fetch.FetchError'>:Fetch command export HOME=/local/users/nferre; export PATH=/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/armv5te/bin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/sbin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/bin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/sbin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux//bin:/local/users/nferre/workspace/oe/bitbake/bin:/usr/local/codesourcery/arm-none-linux-eabi/arm-2008q1/bin:/local/users/nferre/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/local/users/nferre/bin; git ls-remote http://git.senfdax.de/git/literki master failed with signal 1, output:
 while evaluating:
${SRCPV}
NOTE: <class 'bb.fetch.FetchError'>:Fetch command export HOME=/local/users/nferre; export PATH=/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/armv5te/bin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/sbin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/bin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/sbin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux//bin:/local/users/nferre/workspace/oe/bitbake/bin:/usr/local/codesourcery/arm-none-linux-eabi/arm-2008q1/bin:/local/users/nferre/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/local/users/nferre/bin; git ls-remote http://git.senfdax.de/git/literki master failed with signal 1, output:
 while evaluating:
${PN}-${EXTENDPE}${PV}-${PR}
NOTE: <class 'bb.fetch.FetchError'>:Fetch command export HOME=/local/users/nferre; export PATH=/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/armv5te/bin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/sbin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/bin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/sbin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux//bin:/local/users/nferre/workspace/oe/bitbake/bin:/usr/local/codesourcery/arm-none-linux-eabi/arm-2008q1/bin:/local/users/nferre/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/local/users/nferre/bin; git ls-remote http://git.senfdax.de/git/literki master failed with signal 1, output:
 while evaluating:
${PF}:${P}:${PN}:${BP}:${BPN}:files:.
ERROR: Fetch command export HOME=/local/users/nferre; export PATH=/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/armv5te/bin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/sbin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/usr/bin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux/sbin:/local/users/nferre/workspace/oe/tmp/sysroots/x86_64-linux//bin:/local/users/nferre/workspace/oe/bitbake/bin:/usr/local/codesourcery/arm-none-linux-eabi/arm-2008q1/bin:/local/users/nferre/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/local/users/nferre/bin; git ls-remote http://git.senfdax.de/git/literki master failed with signal 1, output:
 while parsing /local/users/nferre/workspace/oe/openembedded/recipes/literki/literki_git.bb
NOTE: Handling BitBake files: \ (5874/7222) [81 %]NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
NOTE: Handling BitBake files: | (5895/7222) [81 %]NOTE: Angstrom DOES NOT support fso-apm because regular apmd is good enough
NOTE: Handling BitBake files: \ (7034/7222) [97 %]NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
NOTE: Handling BitBake files: / (7221/7222) [99 %]Command execution failed: Traceback (most recent call last):
  File "/local/users/nferre/workspace/oe/bitbake/lib/bb/command.py", line 85, in runAsyncCommand
    self.cooker.updateCache()
  File "/local/users/nferre/workspace/oe/bitbake/lib/bb/cooker.py", line 829, in updateCache
    if not self.parser.parse_next():
  File "/local/users/nferre/workspace/oe/bitbake/lib/bb/cooker.py", line 1022, in parse_next
    raise ParsingErrorsFound
ParsingErrorsFound


Do you have clues where it comes from? Has is already been notified?

Best regards,
-- 
Nicolas Ferre



