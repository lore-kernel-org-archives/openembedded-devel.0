Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1MWdVS-0005Js-JD
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 23:49:47 +0200
X-AuditID: 0a1e000a-b7b2dae000000dcf-e7-4a7211f12199
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jul 2009 17:34:31 -0400
Message-Id: <1248989671.3629.1358.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
Cc: Phil Black <Phil.Black@hillcrestlabs.com>
Subject: Packaged-staging and RPATH with native/cross/sdk
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
X-List-Received-Date: Thu, 30 Jul 2009 21:49:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm trying to use packaged-staging to set up a sane prebuilt toolchain
environment to share with other developers. I view packaged-staging as a
promising route of creating a "Stage 3" version of OE (to use some
Gentoo parlance). While building the toolchain isn't all that painful,
even on a decent system it can add 1-2 hours to the build process, and
every individual developer needs to redo the toolchain and base
libraries for every feature branch. This is all needlessly wasted time
since they're all ultimately building the same things if on the same
arch.

Packaged-staging seems to give me everything we need in order to
accomplish this except for the way RPATH is handled. This is a known
issue which is worked around in packaged-staging with the following
snippet:

    # These classes encode staging paths into the binary data so can
only be
    # reused if the path doesn't change/
    if bb.data.inherits_class('native', d) or
bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d):
        path = bb.data.getVar('PSTAGE_PKGPATH', d, 1)
        path = path + bb.data.getVar('TMPDIR', d, 1).replace('/', '-')
        bb.data.setVar('PSTAGE_PKGPATH', path, d)


I'm currently toying with changing the references to rpath in
bitbake.conf to use $ORIGIN rather than an absolute path, but perhaps
some of you have better ideas. (I have a feeling this is going to run
into some nasty edge cases).

(The other, less elegant idea I am toying with is: modify the
packaged-staging install to hotfix the binary data to point at the new
install location, but this seems uglier and possibly harder to
implement)

If this special case is taken away, then distributions can much more
easily share a prebuilt toolchain and set of system libraries for
potential developers or with a team. It also gives us some other nice
properties (e.g. you want to relocate your OE directory because your
disk is filling up, but you don't want to have to do a full rebuild)


Thoughts, suggestions, reasons this won't ever possibly work?

--Chris Conroy


