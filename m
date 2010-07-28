Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Oe2yR-0006vY-02
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 11:30:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 1ED321417181
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 11:36:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8zaqaZQPeZ2K
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 11:36:07 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id E772D1416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 11:36:06 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Jul 2010 11:30:34 +0200
Message-ID: <1280309434.7083.8.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: bitbake: staging of binary over symlink breaks sysroot (lzma x xz)
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
X-List-Received-Date: Wed, 28 Jul 2010 09:30:51 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

I just built an angstrom image and thinks failed.

lzma image depends on lzma-native, grep and other programs that use .xz
suffix for tarballs depend on xz-native.
This fact itself is bad - it creates file conflicts in the sysroot.

But things were even worse:
- xz-native staged xz binary and lzma as a symlink to xz.
- lzma-native tried to stage lzma 4 minutes later

But staging of lzma apparently went wrong. Instead of removal of lzma
symlink and installation of lzma binary, bitbake followed the symlink
and staged lzma as xz with a result of broken build environment.

I have bitbake-1.8.18.

-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



