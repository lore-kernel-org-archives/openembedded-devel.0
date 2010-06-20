Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin@ti.com>) id 1OQM1r-00008i-Fq
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jun 2010 17:01:50 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id o5KEvDgN007816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jun 2010 09:57:13 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o5KEvCOD022160
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jun 2010 09:57:12 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o5KEvCSu006978
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jun 2010 09:57:12 -0500 (CDT)
Received: from dlee02.ent.ti.com ([157.170.170.17]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Sun, 20 Jun 2010 09:57:12 -0500
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 20 Jun 2010 09:57:07 -0500
Thread-Topic: [oe] Amend nullifies cache
Thread-Index: AcsQEQi8rLa4rbfDSO2hiIO4iR4r7AAceWUQ
Message-ID: <A24693684029E5489D1D202277BE8944560435A8@dlee02.ent.ti.com>
References: <A24693684029E5489D1D202277BE894456043549@dlee02.ent.ti.com>
	<AANLkTimkxAXIRkqjwUQqpDScvv09fMTqWTDSIrBuOCON@mail.gmail.com>
In-Reply-To: <AANLkTimkxAXIRkqjwUQqpDScvv09fMTqWTDSIrBuOCON@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {2881C41B-015C-48D7-811B-FA8B2955D8C1}
x-cr-hashedpuzzle: BEuX CG8X Cy9W DA1i E77M Funa Fye8 GeGt Gw1J IVwE IsVX
	I4ac JCHk JcWt JmS9 J4rm; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {2881C41B-015C-48D7-811B-FA8B2955D8C1};
	bQBhAHIAdABpAG4AQAB0AGkALgBjAG8AbQA=; Sun,
	20 Jun 2010 14:57:07 GMT;
	UgBFADoAIABbAG8AZQBdACAAQQBtAGUAbgBkACAAbgB1AGwAbABpAGYAaQBlAHMAIABjAGEAYwBoAGUA
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.41
X-SA-Exim-Mail-From: martin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Amend nullifies cache
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
X-List-Received-Date: Sun, 20 Jun 2010 15:01:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 19, 2010 at 19:37:00, Chris Larson wrote:

> On Sat, Jun 19, 2010 at 3:58 PM, Ambrose, Martin <martin@ti.com> wrote:
>=20
> >    # Adding all amend.incs that can exist to the __depends, to ensure t=
hat
> >    # creating one of them invalidates the bitbake cache.  Note that it
> >    # requires a fix in bitbake.  Without the bitbake fix, the cache wil=
l be
> >    # completely invalidated on every bitbake execution.
> >
> > Which bitbake fix is that so that I can confirm or deny? Though I expec=
t
> > I have it since this comment was added in an older commit (73bf2289) wh=
en the
> > file was named amend-recipes.inc. I couldn't find reference to this pat=
ch
> > in the ML maybe because of its age.
> >
>=20
> See 3adb0d1c23f8b0d153859e78899a0694a27aa0af in the bitbake git repositor=
y.
> It looks like this may not have been cherry picked to 1.8, I'm not certai=
n
> offhand.  I'd suggest trying out the 1.10 branch and seeing if you encoun=
ter
> the same problems.

Thanks for the pointer. Interesting I was coming to the same conclusion thi=
s was needed.
But reassured by the presence of a prior commit. Here I'm assuming=20
git://git.openembedded.org/bitbake.git is the authoritative bitbake repo.

	$ git diff 3adb0d^ 3adb0d
	diff --git a/lib/bb/cache.py b/lib/bb/cache.py
	index 2726193..05f0d4f 100644
	--- a/lib/bb/cache.py
	+++ b/lib/bb/cache.py
	@@ -273,7 +273,7 @@ class Cache:
	             for f,old_mtime in depends:
	                 fmtime =3D bb.parse.cached_mtime_noerror(f)
	                 # Check if file still exists
	-                if fmtime =3D=3D 0:
	+                if old_mtime !=3D 0 and fmtime =3D=3D 0:
	                     self.remove(fn)
	                     return False

I confirm this patch fixes my problem. Thank you.
Nice side benefit is that the "Handling Bitbake files" time decreased, for
handling 8500 recipes, from ~5min to ~ 30s. Sweet!

> > Looking further into the amend.bbclass I see that it doesn't add the
> > amend.inc files to the dependency list if they aren't present on the
> > filesystem. And I verified this by further debug prints. This is good
> > but leads to the question of where/when these non-existent
> > files are added to the dependency list.
> >
>=20
> This is incorrect.  The files that do *not* exist are the ones explicitly
> added to __depends, if you look at the class again.

My bad. It certainly looks that way in the latest version I have (4d642fd5d=
):
    d.setVar("__depends", depends + [(file, 0) for file in amendfiles if no=
t os.path.exists(file)])

I read this as if the amend file *does not* exist it *is* added to the depe=
nds list
with a file modification time of zero. But I don't understand my debug outp=
ut where,
after the line above, I added:
    for f in amendfiles:
        bb.msg.debug(1, bb.msg.domain.Cache, "MJA: amendfiles contains %s" =
% (f))

    for f,mtime in depends:
        bb.msg.debug(1, bb.msg.domain.Cache, "MJA: depends contains %s" % (=
f))

Then ran=20
	$ bitbake -D -b arago-feed-configs -f -c clean | grep MJA | grep -e amend =
| sort
	DEBUG: MJA: amendfiles contains /home/user/work/oe/arago/recipes/arago/ame=
nd.inc
	DEBUG: MJA: amendfiles contains /home/user/work/oe/arago/recipes/arago/ame=
nd.inc
	DEBUG: MJA: amendfiles contains /home/user/work/oe/arago/recipes/arago/fil=
es/amend.inc
	DEBUG: MJA: amendfiles contains /home/user/work/oe/arago/recipes/arago/fil=
es/amend.inc
	DEBUG: MJA: depends contains /home/user/work/oe/arago-oe-dev/classes/amend=
.bbclass
	DEBUG: MJA: depends contains /home/user/work/oe/arago-oe-dev/classes/amend=
.bbclass
	DEBUG: MJA: removing /home/user/work/oe/arago/recipes/arago/arago-feed-con=
figs.bb from cache since /home/user/work/oe/arago/recipes/arago/files/amend=
.inc doesn't exist

There are two entries (I guess) since the amend.bbclass is invoked twice.
Here I see the amendfiles list contains the paths to the non-existent files=
 but they=20
are not added to the depends list. Probably my debug print, invocation, or =
grep is lacking in some way.


Regards,=20
Martin


