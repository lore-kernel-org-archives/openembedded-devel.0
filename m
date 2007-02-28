Received: from [212.27.42.65] (helo=smtp8-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <alain2210@free.fr>) id 1HMN72-0006Fs-Vn
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Feb 2007 12:36:49 +0100
Received: from imp6-g19.free.fr (imp6-g19.free.fr [212.27.42.6])
	by smtp8-g19.free.fr (Postfix) with ESMTP id 93BB7166EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2007 12:36:48 +0100 (CET)
Received: by imp6-g19.free.fr (Postfix, from userid 33)
	id 50888115FE; Wed, 28 Feb 2007 12:36:48 +0100 (CET)
Received: from AMontsouris-151-1-82-44.w83-202.abo.wanadoo.fr
	(AMontsouris-151-1-82-44.w83-202.abo.wanadoo.fr [83.202.114.44]) 
	by imp.free.fr (IMP) with HTTP 
	for <alain2210@127.0.0.1>; Wed, 28 Feb 2007 12:36:48 +0100
Message-ID: <1172662608.45e569504186d@imp.free.fr>
Date: Wed, 28 Feb 2007 12:36:48 +0100
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.5
X-Originating-IP: 83.202.114.44
Subject: problem with fakeroot-native
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
X-List-Received-Date: Wed, 28 Feb 2007 11:36:49 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to use oe for making an image for a wl500g with distro asusoe
(this is only a try) that use linux-uclibc.
Bitbake want to make fakeroot-1.2.13 and it begins with fakeroot-native. =
I get
an errror :
| checking target system type... Invalid configuration `i686-uclibc': sys=
tem
`uclibc' not recognized
| configure: error: /bin/sh
/mnt/devel/oe/build-dev/tmp/work/fakeroot-native-1.2.13-r1/fakeroot-1.2.1=
3/config.sub
i686-uclibc failed

Seeing the log.do_configure :
NOTE: Running
/mnt/devel/oe/build-dev/tmp/work/fakeroot-native-1.2.13-r1/fakeroot-1.2.1=
3/configure
                 --build=3Di686-linux              --host=3Di686-linux   =
          =20
--target=3Di686-uclibc                  =20
--prefix=3D/mnt/devel/oe/build-dev/tmp/staging  <snip>

This target --target=3Di686-uclibc seems to be the origin of the problem.=
 Is is
normal for a native package ? Should it be --target=3Di686-linux ? How ca=
n I
correct this ?

Thanks,

Alain


