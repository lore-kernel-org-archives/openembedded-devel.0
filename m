Received: from bay0-omc4-s25.bay0.hotmail.com ([65.54.190.227])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ali_3k1@hotmail.com>) id 1R8H7k-0004yX-AY
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 21:45:58 +0200
Received: from BAY168-W110 ([65.54.190.199]) by bay0-omc4-s25.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 26 Sep 2011 12:39:24 -0700
Message-ID: <BAY168-W1105B78F9D2BC795FE21E909DF30@phx.gbl>
X-Originating-IP: [110.93.212.98]
From: ali anwar <ali_3k1@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Sep 2011 00:39:23 +0500
Importance: Normal
In-Reply-To: <BAY168-W73BC4907A15BF1630143379D0F0@phx.gbl>
References: <BAY168-W900BD4DC529E727AD26E039D0F0@phx.gbl>,
	<BAY168-W73BC4907A15BF1630143379D0F0@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 26 Sep 2011 19:39:24.0399 (UTC)
	FILETIME=[FEC81FF0:01CC7C83]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: do_patch failure ltp_20101031.bb as file not uncompressed propely
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
X-List-Received-Date: Mon, 26 Sep 2011 19:45:58 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Any thoughts???
Ali



> From: ali_3k1@hotmail.com
> To: openembedded-devel@lists.openembedded.org
> Date: Fri=2C 23 Sep 2011 18:36:55 +0500
> Subject: Re: [oe] do_patch failure ltp_20101031.bb as file not uncompress=
ed propely
>=20
>=20
> To elaborate manually "tar -xf" untar as well as uncompressd the tp-full-=
20101031.bz2 file. Where as OE only uncompressed it and did NOT untar so I =
recieved following:
> ERROR: Error executing a python function in /home/qatools/ali/trunk/meta-=
oe/meta-oe/recipes-benchmark/ltp/ltp_20101031.bb:OSError: [Errno 20] Not a =
directory: '/home/qatools/ali/trunk/build_release_ltp/work/ppce500mc-linux/=
ltp-20101031-r0/ltp-full-20101031'
> Ali
>=20
>=20
> > From: ali_3k1@hotmail.com
> > To: openembedded-devel@lists.openembedded.org
> > Date: Fri=2C 23 Sep 2011 16:34:51 +0500
> > Subject: [oe] do_patch failure ltp_20101031.bb as file not uncompressed=
	propely
> >=20
> >=20
> > Hi All=2C
> > This is my first e-mail to OE mailing list. There is an issue which I a=
m facing with ltp recipe in open embedded which I like to discuss.
> > Currently ltp_20101031.bb for source points to http://downloads.sourcef=
orge.net/ltp/ltp-full-20101031.bz2. But problem is that do_unpack extracts =
ltp-full-20101031.bz2 to tar archive (GNU).
> > qa@qatools:~/ali/build_release_ltp/work/ppce500mc-linux/ltp-20101031-r0=
$ file ltp-full-20101031ltp-full-20101031: POSIX tar archive (GNU)
> > Where as manually I am able to untar the file properly using "tar -xf".=
 Now there are two solutions to this problem.=20
> > 1. We modify the source to contain `tar.bz2` in its name instead of onl=
y .bz2 if a tar archived is compressed=2C which I guess is the correct way =
as well.
> > 2. Change the functionality of OE to verify/ recognize the extracted co=
ntents and again uncompress it if required.
> > Notes:I am on a Ubuntu 10.04 64 bit host.
> > Thanks=2CAli 		 	   		 =20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>  		 	   		 =20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
 		 	   		  =

