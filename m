Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin@ti.com>) id 1PR3ok-0007Sm-Qg
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 15:19:28 +0100
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id oBAEHrMg031696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Dec 2010 08:17:53 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBAEHqg5011882
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Dec 2010 08:17:52 -0600 (CST)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBAEHq9p010619
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Dec 2010 08:17:52 -0600 (CST)
Received: from dlee02.ent.ti.com ([157.170.170.17]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Fri, 10 Dec 2010 08:17:52 -0600
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 10 Dec 2010 08:17:51 -0600
Thread-Topic: srctree and stamps
Thread-Index: AQHLiFbXsFrsyHEZhUW5NvT6sbyheJOZjbGw
Message-ID: <A24693684029E5489D1D202277BE89448587464B@dlee02.ent.ti.com>
References: <A24693684029E5489D1D202277BE894484FB9740@dlee02.ent.ti.com>
In-Reply-To: <A24693684029E5489D1D202277BE894484FB9740@dlee02.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: martin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: srctree and stamps
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
X-List-Received-Date: Fri, 10 Dec 2010 14:19:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2010 at 20:01:28, Ambrose, Martin wrote:

> I find that using the latest srctree the stamps aren't updated in the sam=
e fashion
> as regular recipes. In the example below I build the srctree recipe (mypa=
ckage) and
> then build an image depending on same. Even though the package is built j=
ust prior
> the image build still processes several steps which seem redundant.
>=20
> I see some special handling of stamps in srctree.bbclass and wonder if th=
is
> is expected/desired behavior.
>=20
> Thanks for any help/pointers.=20

First: sorry for the double post -- some transitory problem with our mail s=
erver.

I found that the lack of expected stamps resulted in errors when building i=
mages
with srctree recipes as run time dependencies. Since the do_populate_sysroo=
t,
among others, task stamp was not present it was run again. Various errors
could occur depending on the nature of the recipe but I often saw

* resolve_conffiles: Existing conffile /home/user/work/oe/arago-tmp/rootfs/=
my-image/etc/device_table is different from the conffile in the new package=
.

The following patch to create the missing stamps is my resolution.
Comments welcome.

$ git diff classes
diff --git a/classes/srctree.bbclass b/classes/srctree.bbclass
index 4884b62..2effb89 100644
--- a/classes/srctree.bbclass
+++ b/classes/srctree.bbclass
@@ -100,7 +100,7 @@ python () {
 # Manually run do_install & all of its deps
 python do_populate_sysroot_post () {
     from os.path import exists
-    from bb.build import exec_task, exec_func
+    from bb.build import exec_task, exec_func, make_stamp
     from bb import note

     stamp =3D d.getVar("STAMP", True)
@@ -113,6 +113,7 @@ python do_populate_sysroot_post () {
         if not exists("%s.%s" % (stamp, task)):
             note("%s: executing task %s" % (d.getVar("PF", True), task))
             exec_func(task, d)
+            make_stamp(task,d)

     rec_exec_task("do_populate_sysroot", set())
 }

Regards,=20
Martin


