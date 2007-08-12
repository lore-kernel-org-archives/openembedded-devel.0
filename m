Received: from [212.47.7.226] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <utx@penguin.cz>) id 1IKCDk-0004gA-Dl
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Aug 2007 14:07:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id CFB6C3098768
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Aug 2007 14:06:54 +0200 (CEST)
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (penguin [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25191-02
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Aug 2007 14:06:54 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 54A17309751C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Aug 2007 14:06:53 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46BA010A.1020106@dominion.kabel.utwente.nl>
References: <46BA010A.1020106@dominion.kabel.utwente.nl>
Date: Sun, 12 Aug 2007 14:06:52 +0200
Message-Id: <1186920412.5193.15.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.2 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at penguin.cz
Subject: Re: Reminder: autotools 2.61 will be made default tomorrow
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Aug 2007 12:07:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

ERROR: '/OE/org.openembedded.dev/packages/autoconf/autoconf-native_2.61.bb' failed

It seems that we have a new requirement for the build environment:
/OE/build/tmp/work/x86_64-linux/autoconf-native-2.61-r0/autoconf-2.61/build-aux/missing: line 54: help2man: command not found

After installation of help2man from distro repository, it works.

I based my build environment on SuSE minimal compilation chroot. Here is
(maybe outdated) list of required additional packages in the build
environment.

If you are interested, I can retry bootstrap of an actual OE to update
this list.

bison: Probably no more needed, added to native.
python-devel: I don't remember why.
subversion: For fetching.
diffstat: I don't remember why.
git: For fetching.
help2man: For autoconf-2.61.
monotone: For fetching org.openembedded.dev.
zlib-devel: Probably ne more true, bug 2561.
unzip: Probably no more needed, added to native. For spectrum_fw.
wget: For fetching.
gcc gcc-c++ libstdc++: Initial compilation.
gcc33: Even if qemu now accepts gcc4, at least in SuSE it does not work.
bc: For linux-rp on collie.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



