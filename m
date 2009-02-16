Received: from [80.67.172.39] (helo=webmail.no-log.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1LZ3SF-00005h-Io
	for openembedded-devel@openembedded.org; Mon, 16 Feb 2009 14:24:11 +0100
Received: by webmail.no-log.org (Postfix, from userid 33)
	id 9A5484BECE; Mon, 16 Feb 2009 14:22:20 +0100 (CET)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AFRWCldXDSo=
Message-ID: <34765.AFRWCldXDSo=.1234790540.squirrel@webmail.no-log.org>
Date: Mon, 16 Feb 2009 14:22:20 +0100 (CET)
From: "GNUtoo" <GNUtoo@no-log.org>
To: openembedded-devel@openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: bzip2-full-native_1.0.5.bb problem and possible fix
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
X-List-Received-Date: Mon, 16 Feb 2009 13:24:11 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

hello, what's the reason of:
>cp ${STAGING_DATADIR_NATIVE}/automake*/install-sh ${S}/
in bzip2-full-native_1.0.5.bb
I've:
>| cp: will not overwrite just-created
`/home/embedded/oetmp_openmoko/work/i686-linux/bzip2-full-native-1.0.5-r0=
/bzip2-1.0.5/install-sh'
with
`/home/embedded/oetmp_openmoko/staging/i686-linux/usr/share/automake-1.9/=
install-sh'

if I remove :
cp ${STAGING_DATADIR_NATIVE}/automake*/install-sh ${S}/
It works.

should I commit the change or was this line here for a reason?

by the way here's my setup:
*om-gta02 machine
*openmoko distro

(I've also a bug device to test(armv6) (without a working LCD))
Denis.


