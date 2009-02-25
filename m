Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LcDhX-00087C-5J
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 07:57:03 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx02.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LcDeU-0008AS-7x
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 00:53:54 -0600
Message-ID: <49A4EAFC.3080806@dls.net>
Date: Wed, 25 Feb 2009 00:53:48 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: fakeroot fails to build
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
X-List-Received-Date: Wed, 25 Feb 2009 06:57:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

fakeroot fails to build -- any idea how we can fix this?

log file:

gcc -DHAVE_CONFIG_H -I.
-isystem/u/slug/slugos/tmp/staging/i686-linux/usr/include
-isystem/u/slug/slugos/tmp/staging\
/i686-linux/usr/include -O2 -MT simple.o -MD -MP -MF .deps/simple.Tpo -c
-o simple.o simple.c
mv -f .deps/simple.Tpo .deps/simple.Po
/bin/sh ./libtool --tag=CC   --mode=compile gcc -DHAVE_CONFIG_H -I.
-isystem/u/slug/slugos/tmp/staging/i686-linux/usr\
/include  -isystem/u/slug/slugos/tmp/staging/i686-linux/usr/include -O2
-MT libfakeroot.lo -MD -MP -MF .deps/libfakeroo\
t.Tpo -c -o libfakeroot.lo libfakeroot.c
./libtool: line 764: X--tag=CC: command not found
./libtool: line 797: libtool: ignoring unknown tag : command not found
./libtool: line 764: X--mode=compile: command not found
./libtool: line 764: X--tag=CC: command not found
./libtool: line 797: libtool: ignoring unknown tag : command not found
./libtool: line 764: X--mode=compile: command not found
./libtool: line 914: *** Warning: inferring the mode of operation is
deprecated.: command not found
./libtool: line 915: *** Future versions of Libtool will require
-mode=MODE be specified.: command not found
./libtool: line 1058: Xgcc: command not found
./libtool: line 1058: X-DHAVE_CONFIG_H: command not found
./libtool: line 1058: X-I.: command not found
./libtool: line 1058:
X-isystem/u/slug/slugos/tmp/staging/i686-linux/usr/include: No such file
or directory
./libtool: line 1058:
X-isystem/u/slug/slugos/tmp/staging/i686-linux/usr/include: No such file
or directory
./libtool: line 1058: X-O2: command not found
./libtool: line 914: *** Warning: inferring the mode of operation is
deprecated.: command not found
./libtool: line 915: *** Future versions of Libtool will require
-mode=MODE be specified.: command not found
./libtool: line 1058: X-MT: command not found
./libtool: line 1058: Xgcc: command not found
./libtool: line 1058: Xcommunicate.lo: command not found

(which goes on and on and on)


