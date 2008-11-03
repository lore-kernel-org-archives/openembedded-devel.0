Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1KwqyN-00051B-NB
	for openembedded-devel@openembedded.org; Mon, 03 Nov 2008 05:23:27 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx02.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Kwp2O-0007HB-C6
	for openembedded-devel@openembedded.org; Sun, 02 Nov 2008 20:19:28 -0600
Message-ID: <490E5FAA.9070206@dls.net>
Date: Sun, 02 Nov 2008 20:19:22 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.17) Gecko/20080914 Thunderbird/2.0.0.17 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <490BF303.1030701@dls.net>
In-Reply-To: <490BF303.1030701@dls.net>
Subject: [RFC] Re: DISTRO_PR, ipkg dependencies, and meta toolchains...
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
X-List-Received-Date: Mon, 03 Nov 2008 04:23:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mike (mwester) wrote:

(Replying to my own email, and what's worse -- I'm top-posting!)
(And I changed the subject line to add [RFC] to get your attention.)

I found the problem.  Here's a fix:
--------------------------------------------
diff --git a/classes/package.bbclass b/classes/package.bbclass
index 8db000b..a1cbe61 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -459,7 +459,7 @@ python populate_packages () {
        for pkg in package_list:
                rdepends = explode_deps(bb.data.getVar('RDEPENDS_' +
pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "

-               remstr = "${PN} (= ${DEBPV})"
+               remstr = "${PN} (= ${DEBPV}${DISTRO_PR})"
                if main_is_empty and remstr in rdepends:
                        rdepends.remove(remstr)
                for l in dangling_links[pkg]:
--------------------------------------------

This changes the dependencies written into the "-dev" packages so that
they include the DISTRO_PR suffix correctly.

Note that this change will require a full rebuild of every -dev package
in order to correct the dependencies listed therein.

In addition, there are a couple of recipes that use DEBPV directly -- if
nobody  objects, I'll add DISTRO_PR to these as well:

linux-libc-headers/linux-libc-headers.inc
net-snmp/net-snmp_5.4.1.bb

(By-the-way, another solution might be to set DEBPV to include the
DISTRO_PR, but grep was unable to tell me where that variable is set.)

If nobody objects I'll commit this fix.

Mike (mwester)

> Consider the control data for openssl-dev (exerpts):
> 
> Package: openssl-dev
> Version: 0.9.7g-r7.1
> ...
> Depends: openssl (= 0.9.7g-r7), libcrypto0.9.7, libssl0.9.7
> Recommends: libc6-dev, libgcc-dev, libcrypto-dev...
> 
> Note in particular the openssl-dev version number, which has the
> DISTRO_PR appended to make it "-r7.1" instead of just "-r7".
> 
> But in the dependencies, it lists the specific version of the
> corresponding runtime -- without the DISTRO_PR.  And of course, that
> specific version doesn't exist (or rather, if it exists in someone's
> environment, it would be a left-over ipkg from before the DISTRO_PR was
> added).
> 
> One place this bites us is in the SDK assembling (bitbake
> meta-toolchain-<whatever>):
> 
> | Collected errors:
> |  * ERROR: Cannot satisfy the following dependencies for
> task-fso-toolchain-target:
> |        *  openssl (= 0.9.7g-r7) *
> 
> Poking about I can find a place in the appropriate bbclass files to hack
> things up so that my specific problem will be resolved -- but I'd prefer
> that someone who understands just how much of the rdepends/rrecommends
> needs this treatment offer some advice first.  (And of course, I should
> warn anyone who cares that I know Perl far better than Python, a fact
> that would almost certainly end up reflected in the patch I would write!)
> 
> Mike (mwester)
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


