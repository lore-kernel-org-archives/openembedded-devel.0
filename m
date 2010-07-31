Received: from asmtpout026.mac.com ([17.148.16.101])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1OfABx-0007xn-VD
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 13:25:31 +0200
MIME-version: 1.0
Received: from [192.168.1.103] ([87.201.169.38])
	by asmtp026.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTPSA id <0L6F00I2G6DGNN00@asmtp026.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Jul 2010 04:24:56 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=6.0.2-1004200000 definitions=main-1007310046
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.0.10011,1.0.148,0.0.0000
	definitions=2010-07-31_02:2010-07-31, 2010-07-31,
	1970-01-01 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <4C53F85C.7080301@eukrea.com>
Date: Sat, 31 Jul 2010 15:24:36 +0400
Message-id: <7D0030BC-F8C2-479C-AF3D-072D5BD8D417@mac.com>
References: <A806EA3C-FD29-40A7-82E7-9391241EF930@mac.com>
	<C3A2B5D3-75D5-4A5A-843A-631916635440@mac.com>
	<4C53F85C.7080301@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.101
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is bitbake 1.10 the latest stable version?
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
X-List-Received-Date: Sat, 31 Jul 2010 11:25:31 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable

Hi Eric,

On Jul 31, 2010, at 2:18 PM, Eric B=E9nard wrote:

>>=20
> this may be because you have several BBTHREADS and thus several fetch =
running and outputing log at the same time.
>=20

With bitbake 1.8.19, I don't have that problem, as seen from the output. =
I have 6 threads set for make and bitbake, in the older instance, the =
formatting works better.=20

NOTE: Unpacking /usr/share/sources/Python-2.6.1.tar.bz2 to =
tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/
NOTE: Running task 167 of 3214 (ID: 659, =
/tool/overo-oe/org.openembedded.dev/recipes/util-linux-ng/util-linux-ng_2.=
16.bb, do_fetch)
NOTE: Running task 168 of 3214 (ID: 660, =
/tool/overo-oe/org.openembedded.dev/recipes/util-linux-ng/util-linux-ng_2.=
16.bb, do_unpack)
NOTE: Unpacking /usr/share/sources/util-linux-ng-2.16.tar.bz2 to =
tmp/work/armv7a-angstrom-linux-gnueabi/util-linux-ng-2.16-r9.3/
NOTE: Running task 169 of 3214 (ID: 2174, =
/tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libice_1.0.6.bb, =
do_setscene)
NOTE: Running task 170 of 3214 (ID: 2824, =
/tool/overo-oe/org.openembedded.dev/recipes/perl/perl-native_5.8.8.bb, =
do_setscene)
NOTE: Running task 171 of 3214 (ID: 2175, =
/tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libice_1.0.6.bb, =
do_fetch)
NOTE: Running task 172 of 3214 (ID: 2825, =
/tool/overo-oe/org.openembedded.dev/recipes/perl/perl-native_5.8.8.bb, =
do_fetch)
NOTE: Running task 173 of 3214 (ID: 2176, =
/tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libice_1.0.6.bb, =
do_unpack)
NOTE: Running task 174 of 3214 (ID: 2826, =
/tool/overo-oe/org.openembedded.dev/recipes/perl/perl-native_5.8.8.bb, =
do_unpack)
NOTE: Unpacking /usr/share/sources/libICE-1.0.6.tar.bz2 to =
tmp/work/armv7a-angstrom-linux-gnueabi/libice-1_1.0.6-r1/
NOTE: Unpacking /usr/share/sources/perl-5.8.8.tar.gz to =
tmp/work/x86_64-linux/perl-native-5.8.8-r15/
NOTE: Running task 175 of 3214 (ID: 2681, =
/tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libxdmcp_1.0.3.bb, =
do_setscene)
NOTE: Running task 176 of 3214 (ID: 2682, =
/tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libxdmcp_1.0.3.bb, =
do_fetch)
NOTE: Running task 177 of 3214 (ID: 2655, =
/tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libxau_1.0.5.bb, =
do_setscene)
NOTE: Running task 178 of 3214 (ID: 2683, =
/tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libxdmcp_1.0.3.bb, =
do_unpack)
NOTE: Unpacking /usr/share/sources/libXdmcp-1.0.3.tar.bz2 to =
tmp/work/armv7a-angstrom-linux-gnueabi/libxdmcp-1_1.0.3-r1/

Best regards,

Elvis Dowson=


