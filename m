Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1OUSIF-0005UT-VP
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 00:31:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id CBD391416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jul 2010 00:10:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X23HAukfhVE3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jul 2010 00:10:12 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id BD8F51417193
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jul 2010 00:10:12 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 02 Jul 2010 00:05:38 +0200
Message-ID: <1278021938.8213.7.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: invalid removal of rpath from native binaries during installation or staging
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
X-List-Received-Date: Thu, 01 Jul 2010 22:31:41 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Hallo.

Packages like perl-native and gettext-native compile correctly, but then
stage broken binaries, that miss rpath from binaries. Such binaries work
only if the library of the same name exists in the host system, which is
not correct.

Example:
ERROR: log data follows (/OE/build/tmp/work/x86_64-linux/libxml-parser-perl-native-2.36-r2/temp/log.do_configure.27765)
| perl: error while loading shared libraries: libperl.so: cannot open shared object file: No such file or directory

Now try:
ben:/OE/build> /OE/build/tmp/sysroots/x86_64-linux/usr/bin/perl
/OE/build/tmp/sysroots/x86_64-linux/usr/bin/perl: error while loading shared libraries: libperl.so: cannot open shared object file: No such file or directory
ben:/OE/build> /OE/build/tmp/work/x86_64-linux/perl-native-5.8.8-r19/perl-5.8.8/perl
(this instance works)

Work around: simply copy binaries from work directly to sysroots and compilation continues correctly.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



