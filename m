Received: from bay0-omc4-s5.bay0.hotmail.com ([65.54.190.207])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ali_3k1@hotmail.com>) id 1R762G-0007Fx-Sq
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Sep 2011 15:43:25 +0200
Received: from BAY168-W73 ([65.54.190.199]) by bay0-omc4-s5.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 23 Sep 2011 06:36:55 -0700
Message-ID: <BAY168-W73BC4907A15BF1630143379D0F0@phx.gbl>
X-Originating-IP: [110.93.212.98]
From: ali anwar <ali_3k1@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Sep 2011 18:36:55 +0500
Importance: Normal
In-Reply-To: <BAY168-W900BD4DC529E727AD26E039D0F0@phx.gbl>
References: <BAY168-W900BD4DC529E727AD26E039D0F0@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 23 Sep 2011 13:36:55.0487 (UTC)
	FILETIME=[DC2E44F0:01CC79F5]
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
X-List-Received-Date: Fri, 23 Sep 2011 13:43:25 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


To elaborate manually "tar -xf" untar as well as uncompressd the tp-full-20=
101031.bz2 file. Where as OE only uncompressed it and did NOT untar so I re=
cieved following:
ERROR: Error executing a python function in /home/qatools/ali/trunk/meta-oe=
/meta-oe/recipes-benchmark/ltp/ltp_20101031.bb:OSError: [Errno 20] Not a di=
rectory: '/home/qatools/ali/trunk/build_release_ltp/work/ppce500mc-linux/lt=
p-20101031-r0/ltp-full-20101031'
Ali


> From: ali_3k1@hotmail.com
> To: openembedded-devel@lists.openembedded.org
> Date: Fri=2C 23 Sep 2011 16:34:51 +0500
> Subject: [oe] do_patch failure ltp_20101031.bb as file not uncompressed	p=
ropely
>=20
>=20
> Hi All=2C
> This is my first e-mail to OE mailing list. There is an issue which I am =
facing with ltp recipe in open embedded which I like to discuss.
> Currently ltp_20101031.bb for source points to http://downloads.sourcefor=
ge.net/ltp/ltp-full-20101031.bz2. But problem is that do_unpack extracts lt=
p-full-20101031.bz2 to tar archive (GNU).
> qa@qatools:~/ali/build_release_ltp/work/ppce500mc-linux/ltp-20101031-r0$ =
file ltp-full-20101031ltp-full-20101031: POSIX tar archive (GNU)
> Where as manually I am able to untar the file properly using "tar -xf". N=
ow there are two solutions to this problem.=20
> 1. We modify the source to contain `tar.bz2` in its name instead of only =
.bz2 if a tar archived is compressed=2C which I guess is the correct way as=
 well.
> 2. Change the functionality of OE to verify/ recognize the extracted cont=
ents and again uncompress it if required.
> Notes:I am on a Ubuntu 10.04 64 bit host.
> Thanks=2CAli 		 	   		 =20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
 		 	   		  =

