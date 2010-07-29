Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1Oeb3y-0007m8-KT
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 23:55:00 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o6TLkvik002386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 29 Jul 2010 16:46:57 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o6TLkvAO003828;
	Thu, 29 Jul 2010 16:46:57 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o6TLkvaV001656;
	Thu, 29 Jul 2010 16:46:57 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Thu, 29 Jul 2010 16:46:57 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Jul 2010 16:46:55 -0500
Thread-Topic: [oe] [PATCH 1/1] distribute_license: added class to copy
	license files
Thread-Index: AcsvYFjeyuF9YnPRSRGFNigcsYqZXgAAdXlg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F0802E9149617@dlee06.ent.ti.com>
References: <1280415061-28353-1-git-send-email-chase.maupin@ti.com>
	<20100729205504.GE29814@mx.loc>
In-Reply-To: <20100729205504.GE29814@mx.loc>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/1] distribute_license: added class to copy license files
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
X-List-Received-Date: Thu, 29 Jul 2010 21:55:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Bernhard Reutner-Fischer [mailto:rep.dot.nop@gmail.com]
> Sent: Thursday, July 29, 2010 3:55 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: Re: [oe] [PATCH 1/1] distribute_license: added class to copy
> license files
>=20
> On Thu, Jul 29, 2010 at 09:51:01AM -0500, Chase Maupin wrote:
> >* This class can be used to copy license files from package
> >  sources into the deploy directory so they can be distributed.
> >* By default it searches the top-level source directory for
> >  files matching COPYING* or LICENSE*
> >* Search depth and pattern can be modified using the
> >  LICENSE_SEARCH_DEPTH and LICENSE_FILES variables
> >  respectively.
> >
> >Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> >---
> > classes/distribute_license.bbclass |   56
> ++++++++++++++++++++++++++++++++++++
> > 1 files changed, 56 insertions(+), 0 deletions(-)
> > create mode 100644 classes/distribute_license.bbclass
> >
> >diff --git a/classes/distribute_license.bbclass
> b/classes/distribute_license.bbclass
> >new file mode 100644
> >index 0000000..795a404
> >--- /dev/null
> >+++ b/classes/distribute_license.bbclass
> >@@ -0,0 +1,56 @@
> >+# distribute-license.bbclass will search the sources of a package to
> >+# a given depth looking for a match to the specified pattern and if
> >+# found will copy the matching file(s) to the deploy directory.
> >+#
> >+# This class is used to collect license files such as COPYING or
> >+# LICENSE where they are found and save them per package.
> >+#
> >+# This package uses the following variables to control its operations:
> >+#   - LICENSE_FILES         =3D Pattern of license files to be searched
> for.
> >+#                             By default this is COPYING* and LICENSE*
> but
> >+#                             this can be changed per package.
> >+#   - LICENSE_SEARCH_DEPTH  =3D The maximum depth to search in the pack=
age
> >+#                             sources for files matching the
> LICENSE_FILES
> >+#                             pattern.
> >+
> >+
> >+# Files to copy for the licensing.  By default this is looking for
> >+# files following the patters COPYING* or LICENSING* in the top
> >+# level sources directory.
> >+LICENSE_FILES ?=3D "COPYING* LICENSE*"
> >+
> >+# Maximum depth to look for license files
> >+LICENSE_SEARCH_DEPTH ?=3D "1"
> >+
> >+distribute_license_do_copy_license() {
> >+    # Change directory to source directory
> >+    cd ${S}
> >+
> >+    # Turn of globbing so that wildcards are not expanded in for loop
>=20
> /s/of/off/

I'll update this

>=20
> >+    set -f
>=20
> hush: set: -f: invalid option

I thought bash was the standard shell for working with OE.  Is that wrong?

>=20
> >+
> >+    # Check if LICENSE_FILES exist.  If so copy them to DEPLOY_DIR
> >+    for lic in ${LICENSE_FILES}
> >+    do
> >+        res=3D""
>=20
> superfluous

True, I'll go ahead and remove it.

>=20
> >+        res=3D`find . -maxdepth ${LICENSE_SEARCH_DEPTH} -name "$lic"`
> >+        if [ "$res" !=3D "" ]
>=20
> breaks on older test(1) impls that don't handle empty strings properly.
> Could be that this one is moot by now though.

So did this break for you?  I've never seen this issue.

>=20
> >+        then
> >+            mkdir -p ${DEPLOY_DIR}/licenses/${PN}
> >+            cp $res ${DEPLOY_DIR}/licenses/${PN}
>=20
> install -D ${DEPLOY_DIR}/licenses/${PN} ${DEPLOY_DIR}/licenses/${PN}

I'll change this

>=20
> >+        fi
> >+    done
> >+
> >+    # Turn globbing back on
> >+    set +f
>=20
> hush: set: +f: invalid option

Same question as above

>=20
> >+
> >+    # Just to be clean change directory back to where we started from.
> >+    cd -
> >+}
>=20
> What's the reason you don't do that in python instead?
> Just curious as it would save quite some potential hazzle..

I know shell and not python, it's as simple as that.  If you want to rewrit=
e this in python with the same functionality that's OK with me :)

>=20
> >+
> >+EXPORT_FUNCTIONS do_copy_license
> >+
> >+# Put after do_patch in case a patch adds the license files
> >+do_copy_license[deptask] =3D "do_patch"
> >+
> >+addtask copy_license after do_patch before do_configure
> >--
> >1.7.0.4
>=20
> someone should bump git to 1.7.2, a BBCLASSEXTENDEDed version seems to
> work for me ...

Sorry, I don't understand what my git version has to do with BBCLASSEXTEND.


