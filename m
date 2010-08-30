Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1Oq7ED-0001js-Ce
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 18:29:08 +0200
Received: (qmail invoked by alias); 30 Aug 2010 16:28:29 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp051) with SMTP; 30 Aug 2010 18:28:29 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19AWg5asN9AsrjeFP37Z3c1jSjfv2/ZstrA6oRj+/
	r8CaPbGTTun7LX
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Aug 2010 18:16:41 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <201008271556.24288.schnitzeltony@gmx.de>
In-Reply-To: <201008271556.24288.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201008301816.41691.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v2] clutter: Bump revisions to latest stable & cleanup
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
X-List-Received-Date: Mon, 30 Aug 2010 16:29:08 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 30 August 2010 03:53:09 pm nobody wrote:
>
>
>

Seems too much went wrong posting these patches:
- lines were broken in first version
- the patches are bulky
- did not read the signs of the time: Nowadays it is hard to make maintainers happy with patches restructuring / removing huge number of recipes
- ... ?

OK - understood - but

Current 'clutter' build situation (org.openembedded.dev / 'overo'-machine) is:

clutter_0.4svn.bb: fail (repository not found)
clutter_0.6svn.bb: fail (repository not found)
clutter-glx_svn.bb: fail (repository not found)
clutter -> clutter_0.8+git -> compile fail
clutter_svn.bb: disabled by DEFAULT_PREFERENCE = "-1"
clutter-cairo.bb DEPENDS clutter -> clutter_0.8+git -> fail (anyway clutter-cairo is part of clutter see http://www.mail-archive.com/dev@moblin.org/msg01099.html)
clutter_0.8+git -> compile fail
clutter-0.9_git: Build OK / only interactive tests -> clutter-examples (conformance-tests missing)
clutter-1.0: Build OK / No tests / empty clutter-examples pkg

clutter-box2d_0.10.0.bb: Build OK / example 'blockbox' in clutter-box2d

clutter-gtk_git.bb DEPENDS clutter -> clutter_0.8+git.bb -> compile fail
clutter-gtk-0.8_git.bb DEPENDS clutter -> clutter_0.8+git.bb -> compile fail
clutter-gtk-0.6_git.bb DEPENDS clutter-0.6 ->  fail (repository not found)

clutter-gst*.bb: DEPENDS clutter -> clutter_0.8+git -> compile fail (I think the svn recipes will not be found too)

A few words on the recipes I suggested (all build fine for overo):

clutter_1.2.12.bb:
- All tests are found in clutter-tests. For interactive ones menu entries are created under 'Graphics' / for interactive I created a small helper script 'test-conformance-run' running the 
conformance tests one by one (to survive crashes). All the test data required is found in ${datatadir}. From my point of view the conformance tests are very important to get an overview 
what is working or not. Most of the tests are running on overo.
- introspection is properly configured so no need to generally disable it
- The included files (clutter.inc and clutter-common.inc) were tested with the latest snapshot (clutter-1.3.12) and one of the latest git-version. For these the package clutter-cally-examples 
(cally is included in clutter since 1.3.8) was added. It seems that only git-versions (of all clutter packages) are missing gtk-doc.make so it was renamed and moved to 'files'-folder.

clutter-box2d_0.10.0_git.bb:
- Few commits after 0.10.0 the introspection build error was fixed upstream -> no need to fix here anymore
- The example 'blockbox' is installed in clutter-box2d-examples and is running on overo.
- Few days ago the 'blockbox' got a new example - my most favorite - see what happens after a while...

clutter-gst_1.2.0.bb:
- Created packages clutter-gst-examples / clutter-gst-tests. They start on overo but stop for reasons I have not yet resolved.

clutter-gtk_0.10.6.bb:
- Created packages clutter-gtk-examples. They start on overo but stop for reasons I have not yet resolved.

clutter-gesture_0.0.2_git.bb:
- Did not yet find a way to test it.

During the trials I found that I got multiple versions build for clutter* packages. grep lead to DEPENDS variety:
recipes/moblin/hornsey_git.bb: clutter-0.9 clutter-gst-0.9
recipes/moblin/bickley_git.bb: clutter-gst-0.9
recipes/moblin/nbtk_git.bb: clutter-0.9
recipes/gnome/libchamplain_0.2.8.bb: clutter-cairo clutter
recipes/gnome/libchamplain-gtk_0.2.8.bb: clutter-gtk-0.8
recipes/clutter/table.inc: clutter-gst
recipes/clutter/clutter-gst-0.9_git.bb: clutter-0.9
recipes/clutter/clutter-gtk-0.8_git.bb: clutter
recipes/clutter/aaina.inc: clutter
recipes/clutter/clutter-box2d.inc: clutter-1.0
recipes/clutter/clutter-cairo.inc: clutter
recipes/clutter/clutter-gst.inc: clutter
recipes/clutter/clutter-gtk-0.6_git.bb: clutter-0.6
recipes/clutter/clutter-gtk_git.bb: clutter
recipes/clutter/moblin-proto_git.bb: clutter-box2d
recipes/clutter/tidy.inc: clutter

E. g. clutter: we have depends on clutter (->clutter-0.8+git), clutter-cairo, clutter-0.6, clutter-0.9 and clutter-1.0!

OK long talk an now?

1. One of the reasons which lead me to the huge patches was my wish to remove versions from recipe names and prevent from inconsistency. E.g If I would only post clutter_1.2.12.bb it 
would not be build in case I want clutter-box2d. What is the reason behind this naming-style? Is it still required with stable releases of clutter?
2. Could somebody please spend some time on the recipes suggested and give some comments on it - I promise not to start discussions like PACKAGE_ARCH = "${MACHINE_ARCH}" 
Yes/No :-) - ?

Andreas


