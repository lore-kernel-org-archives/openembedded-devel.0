Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OrTbZ-00069q-Hf
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 12:34:46 +0200
Received: (qmail invoked by alias); 03 Sep 2010 10:34:09 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp060) with SMTP; 03 Sep 2010 12:34:09 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19PsahnNNZP+Ut/SafLI9tKD+e3EQ0sMX8zHnN0H9
	EfWweuJdmtsq4s
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 3 Sep 2010 12:21:42 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201009031221.42662.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: redland build fails
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
X-List-Received-Date: Fri, 03 Sep 2010 10:34:47 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On building redland I get

| /bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompi=
le=20
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -DHAVE_CONFIG_H -I. =
 -I../rasqal/src -I../raptor/src  -isystem/home/Superandi/OpenEmbedded/tmp/=
sysroots/armv7a-angstrom-linux-gnueabi/usr/include -I/home/Superandi/OpenEm=
bedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -I/home/Super=
andi/OpenEmbedded/tmp/sysroots/i686-linux/usr/armv7a/include -isystem/home/=
Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/inclu=
de -fexpensive-optimizations -frename-registers -fomit-frame-pointer -ggdb3=
 -DPKGDATADIR=3D"\"/usr/share/redland\""  -I../rasqal/src -I../raptor/src  =
=2Disystem/home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-g=
nueabi/usr/include -I/home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angst=
rom-linux-gnueabi/usr/include -I/home/Superandi/OpenEmbedded/tmp/sysroots/i=
686-linux/usr/armv7a/include -isystem/home/Superandi/OpenEmbedded/tmp/sysro=
ots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -fr=
ename-registers -fomit-frame-pointer -ggdb3   -DLIBRDF_INTERNAL=3D1 -isyste=
m/home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/us=
r/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer=
 -O2 -ggdb3 -MT=20
rdf_storage_mysql.lo -MD -MP -MF .deps/rdf_storage_mysql.Tpo -c -o rdf_stor=
age_mysql.lo rdf_storage_mysql.c
=2E.
| rdf_storage_mysql.c:49:19: error: mysql.h: No such file or directory
| rdf_storage_mysql.c:50:26: error: mysqld_error.h: No such file or directo=
ry
| rdf_storage_mysql.c:134: error: expected specifier-qualifier-list before =
'MYSQL'
=2E...

I checked: these files are found in tmp/sysroots/armv7a-angstrom-linux-gnue=
abi/usr/include/mysql. There is not path for usr/include/mysql.

Any suggestions to get this buildingo?

Andreas


