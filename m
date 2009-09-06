Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MkH18-0000Vn-Kg
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 14:38:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id B8BC61417182
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Sep 2009 14:12:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xFT6Yo1nRUxC
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Sep 2009 14:12:41 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 0EDCF1416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Sep 2009 14:12:40 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 06 Sep 2009 14:19:36 +0200
Message-Id: <1252239576.4136.10.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: very obscure race: access to a just-populated binary
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
X-List-Received-Date: Sun, 06 Sep 2009 12:38:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hallo.

I just encountered a very obscure race during the build: do_configure
called grep exactly in the moment, when another process populated it:

=EF=BB=BF/OE/build/tmp/staging/x86_64-linux/usr/bin/intltoolize: line 231=
: /OE/build/tmp/staging/x86_64-linux/usr/bin/grep: Text file busy
/OE/build/tmp/staging/x86_64-linux/usr/bin/intltoolize: line 246: /OE/bui=
ld/tmp/staging/x86_64-linux/usr/bin/grep: Text file busy

ls -al --full-time
work/armv5te-angstrom-linux-gnueabi/libgnomecups-0.2.3-r0/temp/log.do_con=
figure.412=20
-rw-r--r-- 1 sbrabec users  1234 2009-09-06 03:23:45.000000000 +0200 work=
/armv5te-angstrom-linux-gnueabi/libgnomecups-0.2.3-r0/temp/log.do_configu=
re.412
ls -al --full-time work/x86_64-linux/grep-native-2.5.1-r2/temp/log.popula=
te_staging_preamble.21860=20
-rw-r--r-- 1 sbrabec users 12079 2009-09-06 03:23:44.000000000 +0200 work=
/x86_64-linux/grep-native-2.5.1-r2/temp/log.populate_staging_preamble.218=
60
=EF=BB=BF
I guess it may be fixable by:
- do not populate binaries by installation in place
=EF=BB=BF- extending of DEPENDS/RDEPENDS of native packages
- do_unpack should respect dependencies, otherwise it can happen with
  unzip-native


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



