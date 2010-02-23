Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Njxeo-00044y-Oh
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 17:30:49 +0100
Received: by iwn9 with SMTP id 9so3449667iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 08:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=ZX87kuk6ti9lHvYbA1vr8u033ZGdl4wXItjCKw0nsYA=;
	b=xjStoyiPHKH3JISa0L5w8JnU02hSOWhYupH5JNi9L4bCa53CpIbouVMIHF5QyFRMpU
	4CNC+JBFegcW7NHJKWPA6BuyDHDRkD5zfsvFXwEjL2Q4xEfkHHy16d0DZrpstrAiXfGU
	gvLajQfg2XiONQZLF+L2DSqDTP/Z6NW8hw/Lw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=rS8OqIjXNwef7lUG0b3ofOvSVy8zm1I85TkgpsTOhvNce65s1ITfG+OPk9hmdG00pj
	Fk74Nbttq9LhxsJCBrmw1iAQMKdrtoRRXIUCKTo3xt7GMzBQIoAUGumPZawM4jXAwmxo
	T1ugQu5GWin6Ogn33iomxdPslr8yvDboH2/YM=
MIME-Version: 1.0
Received: by 10.231.144.15 with SMTP id x15mr1448566ibu.99.1266942479136; Tue, 
	23 Feb 2010 08:27:59 -0800 (PST)
Date: Tue, 23 Feb 2010 11:27:58 -0500
Message-ID: <f96d234e1002230827y25028493l7f25ab05b6fbac76@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: gettext native failure
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
X-List-Received-Date: Tue, 23 Feb 2010 16:30:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

make[4]: Entering directory
`/scratch/oe/oe-from-scratch/tmp/work/x86_64-linux/gettext-native-0.17-r5/g=
ettext-0.17/gettext-tools/src'
=E2=88=98 /bin/sh ../x86_64-linux-libtool --tag=3DCC   --mode=3Dlink gcc
-std=3Dgnu99  -isystem/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/=
usr/include
-O2 -g  -L/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
-Wl,-rpath-link,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/li=
b
-Wl,-rpath,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
-Wl,-O1 -o msgcmp msgcmp-msgcmp.o libgettextsrc.la
=E2=88=98 x86_64-linux-libtool: link: gcc -std=3Dgnu99
-isystem/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/include
-O2 -g -Wl,-rpath-link
-Wl,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
-Wl,-rpath -Wl,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
-Wl,-O1 -o .libs/msgcmp msgcmp-msgcmp.o
-L/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
./.libs/libgettextsrc.so
/scratch/oe/oe-from-scratch/tmp/work/x86_64-linux/gettext-native-0.17-r5/ge=
ttext-0.17/gettext-tools/gnulib-lib/.libs/libgettextlib.so
/usr/lib/libcroco-0.6.so /usr/lib/libglib-2.0.so -lncurses -lc
-Wl,-rpath -Wl,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
=E2=88=98 /usr/lib64/libxml2.so.2: undefined reference to `gzopen64'
=E2=88=98 collect2: ld returned 1 exit status

http://bugs.openembedded.org/show_bug.cgi?id=3D2679

http://bugs.openembedded.org/show_bug.cgi?id=3D5139

Looks like a classic case of using the staging libz, but libxml2 from
the host.  It appears that libxml2 cannot be built in OE until gettext
is built.  Any thoughts on this one?

Thanks,
Cliff


