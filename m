Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OrYHx-0002rf-4E
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 17:35:02 +0200
Received: by iwn2 with SMTP id 2so1614006iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Sep 2010 08:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Efw/nfcpC37b7i3JLPkuyqWm8nd7ZUxsilduZzHIwgw=;
	b=U5vlfIz9zqMEA8JaUcLQPZpHNGdcWg/LBjQB914PpMgt+vAIEJyaq/UjXlW9zsS5FL
	mAn5zbnvrE8bFP82AUO8TPa9Gq3TX1NFlU+cJIBKf0LLNzJmJEZCx0Kj8xjKW0h9xJRZ
	NYgmEroi4uYCyamF2gKiFxxNntxhDOTVaSano=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=TJEDaR+vpbbcZaWB/MPYpfwy95LBeHvaHP9ePkdmgNxKS0Hym2L81kJfCtYj3KuDKl
	0ih2hRWvL6ZgJfdkNaWpcnh15FmfdK3M6P9u2iPV9gbYdWvI5OKIpWnemDmPhbiMeHi5
	AFC+js/rZ2LAKSk3b3SyTc5gmHGojkAYkjUCc=
Received: by 10.231.34.139 with SMTP id l11mr1042829ibd.141.1283528047325;
	Fri, 03 Sep 2010 08:34:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Fri, 3 Sep 2010 08:33:47 -0700 (PDT)
In-Reply-To: <201009031221.42662.schnitzeltony@gmx.de>
References: <201009031221.42662.schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Sep 2010 08:33:47 -0700
Message-ID: <AANLkTimhrzw9etPHFqtCUWz9fbwup6_A8gpMA20KepfO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: redland build fails
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
X-List-Received-Date: Fri, 03 Sep 2010 15:35:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 3, 2010 at 3:21 AM, Andreas Mueller <schnitzeltony@gmx.de> wrot=
e:
> On building redland I get
>
> | /bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC =A0 --mode=3Dc=
ompile
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -DHAVE_CONFIG_H -=
I. =A0-I../rasqal/src -I../raptor/src =A0-isystem/home/Superandi/OpenEmbedd=
ed/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -I/home/Superandi=
/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -I/hom=
e/Superandi/OpenEmbedded/tmp/sysroots/i686-linux/usr/armv7a/include -isyste=
m/home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/us=
r/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer=
 -ggdb3 -DPKGDATADIR=3D"\"/usr/share/redland\"" =A0-I../rasqal/src -I../rap=
tor/src =A0-isystem/home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstro=
m-linux-gnueabi/usr/include -I/home/Superandi/OpenEmbedded/tmp/sysroots/arm=
v7a-angstrom-linux-gnueabi/usr/include -I/home/Superandi/OpenEmbedded/tmp/s=
ysroots/i686-linux/usr/armv7a/include -isystem/home/Superandi/OpenEmbedded/=
tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimiza=
tions -frename-registers -fomit-frame-pointer -ggdb3 =A0 -DLIBRDF_INTERNAL=
=3D1 -isystem/home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linu=
x-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-f=
rame-pointer -O2 -ggdb3 -MT
> rdf_storage_mysql.lo -MD -MP -MF .deps/rdf_storage_mysql.Tpo -c -o rdf_st=
orage_mysql.lo rdf_storage_mysql.c
> ..
> | rdf_storage_mysql.c:49:19: error: mysql.h: No such file or directory
> | rdf_storage_mysql.c:50:26: error: mysqld_error.h: No such file or direc=
tory
> | rdf_storage_mysql.c:134: error: expected specifier-qualifier-list befor=
e 'MYSQL'
> ....
>
> I checked: these files are found in tmp/sysroots/armv7a-angstrom-linux-gn=
ueabi/usr/include/mysql. There is not path for usr/include/mysql.
>
> Any suggestions to get this buildingo?

patch redland to include <mysql/mysql.h> I am guessing right now it does
include <mysql.h> or you could add the above path to -I list so compiler fi=
nds
this header

>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


