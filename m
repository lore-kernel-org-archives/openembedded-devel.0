Received: from smtp-1.concepts.nl ([213.197.30.124])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OK6vp-00039s-I3
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 11:41:46 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-1.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OK6d8-00025C-Bs
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 11:22:26 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 5D2756A11A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jun 2010 11:22:21 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 3 Jun 2010 11:22:17 +0200
User-Agent: KMail/1.9.9
References: <201006022351.38129.pieterg@gmx.com>
	<201006031002.31685.pieterg@gmx.com> <20100603082740.GL16035@jama>
In-Reply-To: <20100603082740.GL16035@jama>
MIME-Version: 1.0
Message-Id: <201006031122.17227.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1OK6d8-00025C-Bs
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
X-SA-Exim-Connect-IP: 213.197.30.124
X-SA-Exim-Mail-From: pieterg@gmx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AUTOREV and SRCPV
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
X-List-Received-Date: Thu, 03 Jun 2010 09:41:46 -0000
X-Groupsio-MsgNum: 19811
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_JR3BMdyNP+d3yhL"

--Boundary-00=_JR3BMdyNP+d3yhL
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 03 June 2010 10:27:40 Martin Jansa wrote:
> A bit better would be to disable LOCALCOUNT_OVERRIDE only for recipes
> you want to be AUTOREV (then git clone will stop for recipes you don't
> care about even with BB_GIT_CLONE_FOR_SRCREV and after removing cache
> those LOCALCOUNT will stay 0 as it was before).

Check, this would be a good workaround for me at the moment.
Should we propose this patch? (see attachment, patch against bb 1.10)
Are the bitbake people reading along here?

Rgds, Pieter

--Boundary-00=_JR3BMdyNP+d3yhL
Content-Type: text/x-diff;
  charset="us-ascii";
  name="0001-allow-BB_LOCALCOUNT_OVERRIDE-to-be-defined-per-packa.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-allow-BB_LOCALCOUNT_OVERRIDE-to-be-defined-per-packa.patch"

From 6265ab521627a38b9b0596149e31119b2073f5ba Mon Sep 17 00:00:00 2001
From: pieterg <pieterg@gmx.com>
Date: Thu, 3 Jun 2010 11:13:42 +0200
Subject: [PATCH] allow BB_LOCALCOUNT_OVERRIDE to be defined per package

---
 lib/bb/fetch/__init__.py |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/bb/fetch/__init__.py b/lib/bb/fetch/__init__.py
index 085f864..a586fda 100644
--- a/lib/bb/fetch/__init__.py
+++ b/lib/bb/fetch/__init__.py
@@ -695,7 +695,8 @@ class Fetch(object):
=20
         latest_rev =3D self._build_revision(url, ud, d)
         last_rev =3D pd.getValue("BB_URI_LOCALCOUNT", key + "_rev")
-        uselocalcount =3D bb.data.getVar("BB_LOCALCOUNT_OVERRIDE", d, True=
) or False
+        pn =3D bb.data.getVar("PN", d, True)
+        uselocalcount =3D bb.data.getVar("BB_LOCALCOUNT_OVERRIDE_pn-%s" % =
pn, d, True) or bb.data.getVar("BB_LOCALCOUNT_OVERRIDE", d, True) or False
         count =3D None
         if uselocalcount:
             count =3D Fetch.localcount_internal_helper(ud, d)
@@ -705,9 +706,10 @@ class Fetch(object):
         if last_rev =3D=3D latest_rev:
             return str(count + "+" + latest_rev)
=20
-        buildindex_provided =3D hasattr(self, "_sortable_buildindex")
-        if buildindex_provided:
-            count =3D self._sortable_buildindex(url, ud, d, latest_rev)
+        if not uselocalcount:
+            buildindex_provided =3D hasattr(self, "_sortable_buildindex")
+            if buildindex_provided:
+                count =3D self._sortable_buildindex(url, ud, d, latest_rev=
)
=20
         if count is None:
             count =3D "0"
--=20
1.6.5.rc1.44.ga1675


--Boundary-00=_JR3BMdyNP+d3yhL--
