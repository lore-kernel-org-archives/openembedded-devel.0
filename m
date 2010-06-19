Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin@ti.com>) id 1OQ73g-0007Tc-Gb
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jun 2010 01:03:24 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o5JMw6UW030906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jun 2010 17:58:06 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o5JMw6oR012764
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jun 2010 17:58:06 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o5JMw6fN028993
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jun 2010 17:58:06 -0500 (CDT)
Received: from dlee02.ent.ti.com ([157.170.170.17]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Sat, 19 Jun 2010 17:58:05 -0500
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 19 Jun 2010 17:58:01 -0500
Thread-Topic: Amend nullifies cache
Thread-Index: AcsQAt4iMq5welCRSluRDcqARHPKZg==
Message-ID: <A24693684029E5489D1D202277BE894456043549@dlee02.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {55B1F700-2A8C-48DA-A159-A19000B25309}
x-cr-hashedpuzzle: gK0= AaZ6 BIdY B7/4 C9ra C/Iw EYGS FxsJ GbRY GnSL GrOm
	ID+t IMYp Kgqe KrDL K2+G; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {55B1F700-2A8C-48DA-A159-A19000B25309};
	bQBhAHIAdABpAG4AQAB0AGkALgBjAG8AbQA=; Sat,
	19 Jun 2010 22:58:01
	GMT;QQBtAGUAbgBkACAAbgB1AGwAbABpAGYAaQBlAHMAIABjAGEAYwBoAGUA
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.152
X-SA-Exim-Mail-From: martin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Amend nullifies cache
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
X-List-Received-Date: Sat, 19 Jun 2010 23:03:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi.

I find that by inheriting "amend" in my local.conf effectively negates the =
cache.
I added a debug statement to cache.py to see why all my recipes were being =
removed from the cache every time.

	$ bitbake -D -b arago-feed-configs -f -c clean | grep MJA -A 2
	DEBUG: MJA: removing /home/user/work/oe/arago/recipes/arago/arago-feed-con=
figs.bb from cache since /home/user/work/oe/arago/recipes/arago/files/amend=
.inc doesn't exist
	DEBUG: Removing /home/user/work/oe/arago/recipes/arago/arago-feed-configs.=
bb from cache
	DEBUG: Parsing /home/user/work/oe/arago/recipes/arago/arago-feed-configs.b=
b

This seems undesirable as most recipes don't have amendments. Now retrying =
with empty amend.inc files.
Note I need two since (I think) the search is based on FILESPATH. The first=
 call is just to=20
rebuild the cache (i.e. calling without -b option to bitbake).
	$ touch ~/work/oe/arago/recipes/arago/files/amend.inc
	$ touch ~/work/oe/arago/recipes/arago/amend.inc
	$ bitbake arago-feed-configs -f -c clean
...
	$ bitbake -D -b arago-feed-configs -f -c clean | grep MJA -A 2

The last command had no match for grep indicating recipe wasn't removed fro=
m the cache.
Is this expected? Maybe I'm missing a config setting somewhere or possibly =
a patch...
I do see this comment in amend.bbclass

    # Adding all amend.incs that can exist to the __depends, to ensure that
    # creating one of them invalidates the bitbake cache.  Note that it
    # requires a fix in bitbake.  Without the bitbake fix, the cache will b=
e
    # completely invalidated on every bitbake execution.

Which bitbake fix is that so that I can confirm or deny? Though I expect
I have it since this comment was added in an older commit (73bf2289) when t=
he
file was named amend-recipes.inc. I couldn't find reference to this patch i=
n the
ML maybe because of its age.

Looking further into the amend.bbclass I see that it doesn't add the amend.=
inc files
to the dependency list if they aren't present on the filesystem. And I veri=
fied this by
further debug prints. This is good but leads to the question of where/when =
these non-existent
files are added to the dependency list.


Regards,
Martin

P.S.
No sure if this is the right mailing list but it seems specific to the way =
amend.bbclass
works with the cache. Let me know if I should post elsewhere.



