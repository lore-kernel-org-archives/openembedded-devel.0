Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin@ti.com>) id 1PJcn5-0000SQ-0y
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Nov 2010 03:03:03 +0100
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id oAK21XPr022905
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 20:01:33 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id oAK21WOZ000757
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 20:01:32 -0600 (CST)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oAK21WP9004194
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 20:01:32 -0600 (CST)
Received: from dlee02.ent.ti.com ([157.170.170.17]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Fri, 19 Nov 2010 20:01:32 -0600
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Nov 2010 20:01:32 -0600
Thread-Topic: srctree and stamps
Thread-Index: AQHLiFbaaG7jQwth0USzRX5m2Vibqg==
Message-ID: <A24693684029E5489D1D202277BE894484FB9741@dlee02.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.153
X-SA-Exim-Mail-From: martin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: srctree and stamps
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
X-List-Received-Date: Sat, 20 Nov 2010 02:03:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello.

I find that using the latest srctree the stamps aren't updated in the same =
fashion
as regular recipes. In the example below I build the srctree recipe (mypack=
age) and
then build an image depending on same. Even though the package is built jus=
t prior
the image build still processes several steps which seem redundant.

I see some special handling of stamps in srctree.bbclass and wonder if this
is expected/desired behavior.

Thanks for any help/pointers.=20

$ bitbake mypackage
$ ls -l ~/work/oe/arago-tmp/stamps/armv5te-none-linux-gnueabi/*mypackage*
-rw-rw-r--. 1 user user 0 Nov 19 18:40 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_build
-rw-rw-r--. 1 user user 0 Nov 19 18:37 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_distribute_sources
-rw-rw-r--. 1 user user 0 Nov 19 18:40 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_package
-rw-rw-r--. 1 user user 0 Nov 19 18:40 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_package_stage
-rw-rw-r--. 1 user user 0 Nov 19 18:40 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_package_stage_all
-rw-rw-r--. 1 user user 0 Nov 19 18:40 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_package_write
-rw-rw-r--. 1 user user 0 Nov 19 18:40 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_package_write_ipk
-rw-rw-r--. 1 user user 0 Nov 19 18:39 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_populate_sysroot_post
-rw-rw-r--. 1 user user 0 Nov 19 18:39 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_qa_staging
-rw-rw-r--. 1 user user 0 Nov 19 18:37 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_setscene
lm $ bitbake myimage
...
lm $ ls -l ~/work/oe/arago-tmp/stamps/armv5te-none-linux-gnueabi/*mypackage=
*
-rw-rw-r--. 1 user user 0 Nov 19 18:40 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_build
-rw-rw-r--. 1 user user 0 Nov 19 19:03 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_compile
-rw-rw-r--. 1 user user 0 Nov 19 19:03 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_configure
-rw-rw-r--. 1 user user 0 Nov 19 19:03 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_copy_license
-rw-rw-r--. 1 user user 0 Nov 19 19:03 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_create_srcipk
-rw-rw-r--. 1 user user 0 Nov 19 18:37 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_distribute_sources
-rw-rw-r--. 1 user user 0 Nov 19 19:03 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_generate_toolchain_file
-rw-rw-r--. 1 user user 0 Nov 19 19:03 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_install
-rw-rw-r--. 1 user user 0 Nov 19 18:40 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_package
-rw-rw-r--. 1 user user 0 Nov 19 18:40 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_package_stage
-rw-rw-r--. 1 user user 0 Nov 19 18:40 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_package_stage_all
-rw-rw-r--. 1 user user 0 Nov 19 18:40 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_package_write
-rw-rw-r--. 1 user user 0 Nov 19 18:40 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_package_write_ipk
-rw-rw-r--. 1 user user 0 Nov 19 19:03 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_populate_sysroot
-rw-rw-r--. 1 user user 0 Nov 19 18:39 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_populate_sysroot_post
-rw-rw-r--. 1 user user 0 Nov 19 19:03 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_qa_configure
-rw-rw-r--. 1 user user 0 Nov 19 18:39 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_qa_staging
-rw-rw-r--. 1 user user 0 Nov 19 18:37 /home/user/work/oe/arago-tmp/stamps/=
armv5te-none-linux-gnueabi/mypackage-mypv-r1.do_setscene

-Martin=


