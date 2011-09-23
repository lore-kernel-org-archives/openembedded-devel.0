Received: from bay0-omc4-s10.bay0.hotmail.com ([65.54.190.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ali_3k1@hotmail.com>) id 1R7487-0003aG-Ic
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Sep 2011 13:41:19 +0200
Received: from BAY168-W90 ([65.54.190.199]) by bay0-omc4-s10.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 23 Sep 2011 04:34:51 -0700
Message-ID: <BAY168-W900BD4DC529E727AD26E039D0F0@phx.gbl>
X-Originating-IP: [110.93.212.98]
From: ali anwar <ali_3k1@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Sep 2011 16:34:51 +0500
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 23 Sep 2011 11:34:51.0407 (UTC)
	FILETIME=[CEB059F0:01CC79E4]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: do_patch failure ltp_20101031.bb as file not uncompressed propely
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
X-List-Received-Date: Fri, 23 Sep 2011 11:41:19 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi All=2C
This is my first e-mail to OE mailing list. There is an issue which I am fa=
cing with ltp recipe in open embedded which I like to discuss.
Currently ltp_20101031.bb for source points to http://downloads.sourceforge=
.net/ltp/ltp-full-20101031.bz2. But problem is that do_unpack extracts ltp-=
full-20101031.bz2 to tar archive (GNU).
qa@qatools:~/ali/build_release_ltp/work/ppce500mc-linux/ltp-20101031-r0$ fi=
le ltp-full-20101031ltp-full-20101031: POSIX tar archive (GNU)
Where as manually I am able to untar the file properly using "tar -xf". Now=
 there are two solutions to this problem.=20
1. We modify the source to contain `tar.bz2` in its name instead of only .b=
z2 if a tar archived is compressed=2C which I guess is the correct way as w=
ell.
2. Change the functionality of OE to verify/ recognize the extracted conten=
ts and again uncompress it if required.
Notes:I am on a Ubuntu 10.04 64 bit host.
Thanks=2CAli 		 	   		  =

