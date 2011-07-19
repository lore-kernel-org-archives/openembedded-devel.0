Received: from tritech.se ([91.191.137.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1QjArY-0001RU-5t
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jul 2011 16:01:28 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p6JDvHbk028983
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2011 15:57:22 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Tue, 19 Jul 2011 15:57:18 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Added header file to linux kernel - how to export
Thread-Index: AcxGD4ih4YSdUb0mRcCpV/r1/P2CaQADDFeK
Date: Tue, 19 Jul 2011 13:57:17 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C06CA7F@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C06CA55@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C06CA55@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Added header file to linux kernel - how to export
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
X-List-Received-Date: Tue, 19 Jul 2011 14:01:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have made a patch to the linux kernel, involving adding some ioctl's. Rel=
evant definitions are in a .h file. Now I need to access this .h file from =
another recipe (that builds a utility using those ioctl's) but the headers =
in sysroots/xxx-linux/usr/include are put there (by linux-libc-headers?) lo=
ng before the target Linux kernel is patched and built.

I'm thinking about adding a do_install_append to the linux recipe but that =
doesn't feel right. Neither does adding a path from the util recipe build t=
o the work folder of linux kernel. Third alternative would be to build the =
driver as an LKM but I really like to have it built into the kernel...

If any of you have some good advice here I would be very happy!

Best Regards,
Mats


