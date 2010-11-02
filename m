Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1PDEnv-0007Gy-MU
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 12:13:29 +0100
Received: by wya21 with SMTP id 21so6723390wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=V/9aMBk/NW0ylsW5n/sQZXpDpVHQd48SUVkEYEP78SI=;
	b=nHK/e3FJCKcwLj1Vu2swUfU5BIlitIH2JdKN3agVT2aDBKGHmPOgr7yKCoHC5ZtSza
	2WQYbYVhXGeRxpaIF2S7FyidT/PsouiKCNE7FSoxWFg8x0wGaaoogqiNAlllsMnsN+E+
	TZLdpGf0+PFi9XedzPE50ALpOvIihFwmzM/dc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=xHaUaNeQMm5ZoK10VtKD6sPoWMtJglhn5uxYT7Rq0XGv+PIGkjw7wrvHw5gYordbE3
	tYAUBAxSSuEQwZ0wJk65+2UsncPt27OLPyh6PCEl88TkfX9aYB7anSC/6cnkF/iU9PMh
	/sQgw/8on2qF/5ImE7CWbjML9JQE3WNV+klOQ=
MIME-Version: 1.0
Received: by 10.227.146.147 with SMTP id h19mr9565753wbv.197.1288696357698;
	Tue, 02 Nov 2010 04:12:37 -0700 (PDT)
Received: by 10.227.163.79 with HTTP; Tue, 2 Nov 2010 04:12:37 -0700 (PDT)
Date: Tue, 2 Nov 2010 12:12:37 +0100
Message-ID: <AANLkTim8-ucJpsB_bDCeodFoWqR8vNBJwR3JfTZGMahC@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OEDEM 2010 notes (ELCE 2010)
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
X-List-Received-Date: Tue, 02 Nov 2010 11:13:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello all,

here are the OEDEM notes. I just took the (raw) collaborative notes and
added some context for those who didn't attend ELCE2010 or OEDEM2010.

All disclaimers apply. See below. Cheers,

Leon Woestenberg (likewise on #oe)



OpenEmbedded Developer Meeting, Cambridge, UK, Europe, October 29-30, 2010

Report of the event to inform non-participating members and users, based on
the notes from a collaborative text editing session using Gobby. This report
is probably inaccurate, incomplete or just totally incorrect in some areas
and is provided as-is.

Venue: The Vere University Arms hotel, Darwin conference room.

Intel Corporation provided the arrangement for the room and lunch.

Not all participants are OpenEmbedded e.V. members, but all participants seemed
OpenEmbedded users in one way or another, directly or indirectly:

* Philip Balister (crofton)
* Stefan Schmidt
* Florian Boor (florian)
* Phil Blundell (PB)
* Koen Kooi (irc:koen) (Angstrom) (Texas Instruments)
* Denys Dmytriyenko (irc:denis)
* Jeff Polk (Wind River)
* Mark Hatle (Wind River)
* Richard Purdie (Intel) (irc:RP)
* Saul Wold (sgw)
* Joshua Lock (left before lunch)
* Patrice Vilchez (Atmel, friday till 15:00)
* Leon Woestenberg (Sidebranch) (irc:likewise)
* Nicolas Ferre (Atmel (Atmel, friday till 15:00)
* Frans Meulenbroeks (Axon Digital Design) (irc:eFfeM)
* Roger Monk (Texas Instruments)

* Walter Goossens (Axon Digital Design)


At ELCE2010, two major announcements (for us):
- CELF merged with the Linux Foundation
- the Linux Foundation announced the Yocto Project (.org)
 http://www.yoctoproject.org/

== Yocto Project relations ==

Richard explains some points behind Yocto.

Basically it is Poky with some more projects under the same umbrella.
Small stabilized subset of OpenEmbedded, forwards the ideas of Poky.

Checksums on every task.
Aim to keep bitbake version in sync with OE.
Two way thing on how the two (three) projects work together.

Yocto is by the Linux Foundation, not Intel.
Intel proposed this, they drive this, along with Wind River etc.

MeeGo totally unrelated, different team. Is focussed on a vertical stack.

Philip/Richard: Its important to keep the communications flowing in
both directions
Koen asked to make statement on the OE website about the relation
Yocto is not only Intel but really different architectures and companies

Poky is the build system of Yocto.

Frans main objection is even more diversion, thus more work on syncing.

fakeroot -> pseudo, advantages but also performance issues.
checksums

Core classes being in sync? Yes, trying, that's the aim.

Poky has done lot of work cleaning up the meta data.

Koen notes that the Poky handbook should be re-licenced to allow commercial use.
Richard took a note.

Machines maintained in seperate layers. In GIT repositories, as BSP layers.

More discussion of poky/yocto/openembedded

Yocto feed policy is documented on the website. Basically, they do not
publish traditional feeds.

== Stable Branches ==

Need to clearly document the aims, objectives and policies of a
"stable" branch are.
on the page discussing Getting Started.

Everyone has a different definition of "stable". Expectations should be clear.

Discussion of stable branch documentation.
Crofton points out the stable branch is described at:
http://wiki.openembedded.org/index.php/Stable

A bug in stable is b*tched about, but happy users of stable are not cheering
for it.

Stable could be a starting point for people that don't want a moving target.

Work more in a process: Move towards freeze, just before branching.
If clearly defined, this can work with external schedules.

All/any stabilization planning guidance would be good to help commercial parties
plan their internal overlays, releases etc.

Bit more predictable.

Stable release January and July (or Spring/Fall).


Use gitolite to enforce branch policies.
Provide http support on git repository.

Contents of release

 * Git tag
 * Changelog
 * Test matrix
 * Auto generated test matix (?)

Tinderbox needs work to support matrix testing.


Freeze ahead of release to give the release POINT some value.
Maintenance on the release stable BRANCH is up to the users of that branch in
and in consensus within that group.

Release Details

Goal for release date: December 1, 2010

 * Automated test reports (optional)
 * No new features
 * Focus for the release is improving the testing process.


== Recipe ==

Recipe licensing process from Yocto.
Commercial users need to be careful about licensing.
Yocto checksums the licensing info, it hard-errors on mismatch.
Currently optional, mandatory in the future.
Review Debian license standards.

debian license url: http://www.debian.org/legal/licenses/
previous discussion on ML with the link to Debian format definition:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/38585/focus=38590
technical link: http://dep.debian.net/deps/dep5/ (currently down, use
cached copy)

Moved to discussion of changes in Poky

Logging has changed from functions to tasks.
RPM backend does a lot of things more correctly.
RPM deps used to generate dependencies. Usable by any packaging
mechanism. Performance hit. Very thorough.
RPM 5 based. RPM 4 will not crosscompile, Yocto uses RPM 5 due to
cross compile support.

Discussion of "source rpms". Long term enhancement.
Need conclusion section of meeting where we capture long term goals.

== Layer Discussion ==

Yocto has chosen a set of overlays, each with a functional and closely
related set of recipes.

One of the reason for the layers (SBP) (BSP?) is to make the interdependency
of its recipes implicit, so it's replacable as a  whole.

Possibly a lot of dependencies inside the layer (such as a kernel and
associated tools, such as profiling). If someone wants to replace a kernel,
they have to provide the complete set in that layer. The layer makes that
more obvious to the user.

Less dependencies between layers.

=== Yocto and OpenEmbedded ===

http://yoctoproject.org/community/governance

(How) can OpenEmbedded people work in Yocto?

Yocto commits: Kernel-style model of responsibility. Tree of responsibility for
maintenance of part of the source code commit tree.

The Yocto project on flickr
http://www.flickr.com/photos/davest/5125472890/in/photostream/
http://www.flickr.com/photos/sipmab/95742466/
Prevent duplicate work, benefit in both ways.

See what isn't in Poky today in terms of recipes, and what are key features in
OE that aren't in Poky?

Need for a roadmap (libtool 2.4, GCC 4.5 (and cortex stuff from Linaro), the OE
guys need ARM Cortex support.

Poky's cross toolchain has a included host-native C library included, to not
depend on the host system's C library.

Moving to layers; layer versioning so that interdependent layers have
version-mismatch checking and warnings.

Exchange public ideas on improving OE/Poky/Yocto on common topics:
* automated qemu based testing of images
* user interface for package selection (buildroot inspired)
* kernel partial configs
* out-of-kernel-tree module builds
* ...
* ...
* <other proposals?>

as a pilot project, to test the waters on colab.

Make these working groups target a specific release in the timeframe.
Meetings on IRC. Dedicated meeting point / time on IRC.

Intel could show the roots of the Yocto project (OpenEmbedded) much clearer,
as well as the values therein, to build and keep community buy-in for future
collaboration (sp?).

Many companies are using OpenEmbedded but have no idea how to work with the
community.

About seven different build projects (see CELF 2009?). Checksums idea was
forwarded by e2factory, sharing patches was forwarded by ptxdist.

(G)UIs to package selection (image creation), but not all variables in one
stage.


== Merge fetch and unpack tasks ==

Fetcher code is a disaster wrt to maintainance.
Much overhead of first tarring, then untarring after fetch.

Now: SCM -> tar -> (no-op fetch) -> unpack
No impact for non-SCM packages
fetch-all? Good point, not thought of yet. To be solved.
Conclusion: Do not combine fetch and unpack tasks, instead, enhance
existing tasks,
probably make unpack task call internal bitbake fetcher
OE-utils is quite in sync, Chris and Richard work on it both, in both projects.

Swabber: looks into the strace of a step, does QA sanity checks on it.

have a way to make all fetchers be /bin/false to test mirror status
and allow offline operation

eula acceptance upfront?

avoid scm passwords in tinderbox logs

Clear public statement
Joint roadmap, timeline schedules.
Draft of the release goal.

Saturday schedule: finish before lunch, clear up remaining issues after lunch.
8:30 gather
9:00 START!^WCOFFEE


Saturday Agenda

> Timeline
- Release Tag for OE metadata
- Organize community meetings with announced topics - Board to discuss
- Manually tested and tested-to-run-on-board Matrix for the upcoming release
- Recipe quality (e.g. remove legacy staging, merge native & target
recipes, cleanup, update LICENSE etc etc)

- Sort out old "core" recipes toolchain (khem) kernel 2.4 (hrw)
- Where is the donation form/button?
 http://wiki.openembedded.org/index.php/Donate (incomplete yet)


Timeline

Rough timeline:

20101101 - Announce Yocto Project (Crofton)
20101102 - call for members (Stefan)
20101115 - voting proposal for new members (Stefan)
20101201 - tag release
20110301 - tag release
20110601 - tag release
20110901 - tag release
20111201 - tag release



Tag metadata on December ~1st.
RP will start integrating Poky class changes after release (i.e. ~1st of Dec).
 - Least invasive to most invasive
 - This starts the process of converting the meta-data to work as a layer

Decision point. What does OpenEmbedded do moving forward? (Have some
direction by Jan 1)
 - Community Discussion (initiated by the board after a board meeting).
 -- Board recommendation
 -- TSC recommendation
 - Community Vote by e.V. members

* Adopt the name of the Tentacle Steering Committee for TSC


There are serious branding and terminology issues we are avoiding for
the time being in order to make technical conversation possible.



Poky provides a clean core set of recipes. Have an extra, but
seperated set of (possibly non- or less-clean) recipes could be an
approach of working within the Yocto project umbrella.

The OE eV members, board, TSC and/or users should decide on whether and how
to proceed to work together with the Yocto Project.

Merge with Poky (in either direction) brings the issue of the Poky assumption
of the non-existance of legacy staging.

Koen mentions 15 legacy staging packages left in OE based Angstrom build and
that includes GNOME.

Stefan: Building all recipes (world for Beagleboard) has 150 recipes left with
legacy staging.

Note (Frans) there are in total about 55 .inc files and 400 .bb files
with a do_stage line.

Online voting rules (fully) based on: http://ev.kde.org/rules/online_voting.php

Extend testing table.

Bitbake 1.10 as the requirement for release and thus also for testing
the upcoming release.
Client/server split was in 1.10, which requires Python 2.5+
Master bitbake requires 2.6

=== Commit Messages ===

1. Don't ACK patches without agreeing with the commit messages
2. Encourage complete commit messages so the change can be completely
understood (What it changes and why its needed).
3. Anyone consistently committing with poor messages risks their
direct commit access
4. "git-notes" can possibly be used to clear up commits after the fact
- investigate
On git-notes, see:
http://www.kernel.org/pub/software/scm/git/docs/git-notes.html

http://wiki.openembedded.org/index.php/Commit_Policy
http://wiki.openembedded.org/index.php/Commit_log_example


=== TSC re-election ===
- staggered TSC members (i.e. each member has a different elected
period in the TSC).
- January 7th 2010 TSC meeting minutes mentions the yearly TSC re-election.


Afternoon session:
discussion about testlab stuffs

End of OEDEM discussions. (~15:00)

Some ppl decide to spend some time on patchwork cleanups.
Some ppl are leaving to catch their trains and planes.
Some ppl go shopping stuff for their spouse.
Etc.


-- 
Leon


