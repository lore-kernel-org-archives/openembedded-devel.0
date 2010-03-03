Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Nms7I-0001fA-LN
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 18:12:14 +0100
Received: by pwi5 with SMTP id 5so927985pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 09:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=0xlriEt1nnfGTVKdWiD/nefZ0ZhEI32/ah+GVpYGLHQ=;
	b=Lag2/mAN/hmQpX6GFJyKAeGt8maUAMhmTK0g4xW7yD9sLSjT1jkadFVOj212P3RKa5
	enyFCRgwfynr0S6xurddDiJU3OLaqSYdCqZhckITilVC4IDDgSrfQuH9yQFBsp9INbjD
	X0bFtpU23rspHDPlfYcJnYVQyhmvXW2NZW9eI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	b=xd707CaYYY3yM+d4V4XEt9y5GTTjj5mX7xCVwME5vs0JuY3ioruvC1vjOQnznbHNCe
	/iAoQFtNl0FnX0c5DIYy9sV2GodmCsQsP9nKRF3Lm4Wqe8l4bWb9YlRfaQ2HD0Ach0Mx
	inG3Nj/glq/9+/fbi1MaqOOIWPQSjEiJvf8Bo=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.119.1 with SMTP id r1mr4497406wfc.314.1267636160138; Wed, 
	03 Mar 2010 09:09:20 -0800 (PST)
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 3 Mar 2010 10:09:00 -0700
X-Google-Sender-Auth: 67d70576e8c41790
Message-ID: <b6ebd0a51003030909u58f72751u19f5b3caab614450@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [RFC] Initial Proposal for Packaged Staging Revamp (was [RFC] Make some big changes right after next stable)
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
X-List-Received-Date: Wed, 03 Mar 2010 17:12:14 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 3, 2010 at 9:30 AM, Tom Rini <tom_rini@mentor.com> wrote:

> As many people know, there's a lot of "odd" internal things that OE
> does, that if we had it to do over, we would do differently.  What I
> would like to propose is that in time for the next stable branch we:
> 1: Define a set of DISTROs/MACHINEs/build targets that need to stay
> working
> 2: In a separate branch (per big change), get one of these big, going to
> leave some stuff broken changes
> 3: Define / document what needs to be done before these branches can be
> merged back (something like #1 is working still, and if applicable a
> guide to the common problems/how to fix people are going to run into).
>
> What I'm getting at is that this would let us do things like rework the
> "this is where we place things that we build other recipes with" concept
> so that sysroot just works (and otherwise makes more sense again).  Or
> "let us have more consistency in build with compared to what could end
> up on device".  And so on.
>
> What do people think?  And what would people work on?
>

I think this is a great idea overall, and have many ideas for large changes
to be considered.  Here's my first (note, have mercy, I haven't had much
need to write anything longer than a paragraph in some time, will need to
work on my writing more :):

Proposal for the Revamp of "Packaged Staging"

Goals:
- Simple implementation
- Managed staging area
- "Build" from cached/prebuilt binaries
- Reduce behavioral differences between the prebuilt and from scratch cases
- Intrinsic to the system, no longer opt-in

For those who aren't familiar with it, "packaged staging" is what it sounds
like.  It utilizes package management to manage the OpenEmbedded staging
area.  This provides a number of benefits, such as ease of uninstallation of
staging files, switch to different versions of staging files without leaving
remnants around, etc.  I believe that these benefits are obvious, and good
enough on their own merits (given people have hit the issues it fixes on
multiple occasions, even today) to argue for its inclusion as default
OpenEmbedded behavior, but there are other features, including caching of
build output to speed up builds and ease of checks for missing dependencies
via using this build output.

Currently, one opts into its usage by setting INHERIT += "packaged-staging".
 This results in a number of behavioral changes in a typical build.  An
early task for all recipes, 'do_setscene' starts to do more work, but note
that this component is not for the package management of staging, but was
done to take advantage of the packaged staging files instead as a cache of
previous build output, to speed up build time.  The setscene task checks to
see if the packaged staging package for this recipe already exists, and if
so, it extracts it, including the stamps for the recipe, so that most of the
subsequent tasks will be skipped if the package is valid.  It does some
sanity checks to determine this validity.

In addition to the do_setscene behavioral change are the pieces of code
which produce the packaged staging package, and which installs/uninstalls
pstage packages from the staging area.

I would like to propose an alternative to the current implementation, which
I believe will aleviate some headaches (for example, those caused by the
stagefile bits, which is more functionality that slips beyond the original
intent of package managed staging), make it easier to add more traceability
to the builds, reduce behavioral differences between the use of cached
binaries and building from scratch, and should help to prepare for some
possible moves in the future.

To summarize, I propose the creation of an archive/package which acts as the
primary artifact to come out of the build of a recipe.  By capturing *all*
output of a recipe into a single place, we reduce confusion and make things
easier to track.  Every subsequent task by the recipe (or other recipes)
will go based on this archive (or cached, extracted contents of this
archive, for performance).  Builds from cached binaries would operate based
on this archive, so that the execution of the subsequent tasks would be
identical between the prebuilt and from scratch cases, and it makes it clear
that this is not just "packaged staging" in concept or intent.

I intend this archive to essentially contain the output of do_install, and
to add the necessary bits into the build process to skip all tasks that
do_install depends upon if the archive already exists, without capturing the
stamps themselves into the archive, to reduce implementation headaches and
complexity.  Staging will be populated based on this archive (and new style
staging is already based upon do_install, so this is no great stretch),
likely using a generated package with a package manager under the hood for
staging alone, not all of TMPDIR, and not in a way that's at all user
visible.  Note that by doing it this way, it also moves the packaging
process, use of prebuilts will no longer mean that packaging has already
been completed.  This makes it easier for us to change around the packaging
of a recipe without having to rebuild the thing, and makes it easier for us
to move in a direction of separation of responsibilities at some point
(packaging is more distro policy than recipe responsibility), if we choose
to do so.

While I haven't fully worked out the logistics of the implementation of
this, I did, in the past, create a prototype of a "private staging areas"
implementation which also implemented this primary archive as a side effect,
and utilized it for the prototype.  Does anyone have any thoughts on this,
ideas for improvement, arguments either for or against a pstage revamp, or
alternative ideas for a revamp?  I'd love to hear what people think about
this possibility.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

