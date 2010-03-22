Received: from mail-qy0-f203.google.com ([209.85.221.203])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Ntq8d-0006xZ-8B
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 23:30:27 +0100
Received: by qyk41 with SMTP id 41so765118qyk.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 15:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=jJk8ejMCi2HByum88RKblXnR/uXVBxkZfr/fHr/lyCI=;
	b=ojsQsYpprfKovaibCjpf+FdOGmr4j4Jst2boBJV1i2vGphjO3wRAP5rvIOm33Ctdbz
	pjwWd7JDANv6G91y4ZFHdlK5pISeCNeRNCgpGKEin2osv+hreWGomE/7ZVtWF3HxjZtR
	xaxM852FLTVUlA4zfOy+6LYeK7ztftOhLM1NE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	b=Lelnmb03GzMvd+FRKP66rPMJ3mkIpCHKtxwn2iid+f23zhg+ec+4BAx051tEvgcSHR
	LtxC5+cEPlB5WeZ71S4mGwu8+vHfSkL5Sb0TB0jPyjAOoOc5bKM+baL++T99XwYZfQUT
	A//tTp+QF+n4g9gJWADedkpfo1oDR21SDe8vI=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.226.1 with SMTP id iu1mr1681660qcb.19.1269296833270; Mon, 
	22 Mar 2010 15:27:13 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 22 Mar 2010 15:26:53 -0700
X-Google-Sender-Auth: 7ef955a36c9233a1
Message-ID: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.221.203
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: BBVERSIONS
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
X-List-Received-Date: Mon, 22 Mar 2010 22:30:27 -0000
Content-Type: text/plain; charset=UTF-8

Greetings all,

I'm emailing about a prototype I threw together of a BBVERSIONS
implementation in BitBake.  This functionality is similar to BBCLASSEXTEND,
but it lists versions, and sets PV rather than doing an inherit.  This
allows you to create one recipe that can build multiple versions of
something.  Either you can do one recipe that can build everything, or you
could (I prefer this) create one recipe for each range of versions which are
built in a given way with a given set of patches.

It helps if you think about an upstream change (which, say, breaks
application of a patch) as being a change going forward.  No one makes a
change assuming it'll be reverted the next release, so it's likely that a
given patch will apply through a set of versions, until another change
breaks it further.  So, metadata and patches is really rarely bound to just
one version, but is instead bound to the series of versions which can be
built in that way and which can have those patches applied.

The version from BBVERSIONS is added to OVERRIDES, to allow for version
specific metadata.  In addition, you can specify a name for the range of
versions, which is also added to OVERRIDES.  As an example, I created a
nano_1.0.0+.bb recipe which builds 1.0.0 through 1.0.6, its BBVERSIONS is
set to 1.0.[0-6].  The BPV variable gets set with the 1.0.0+ value, so it
can be used in the filespath, so the generic files go there, and individual
versions can override further if necessary.

I've been experimenting with a set of files and recipes to build every
version of nano that exists, from 1.0.0 through 2.2.3, with one recipe for
each set of versions.  I'm still investigating to find the optimal workflow
with this, someone else may want just one recipe for all versions, or they
may want to leave it as is, just one recipe per version, but I suspect this
may reduce the number of files duplicated across filespaths amongst versions
which could be grouped together into a single recipe.

Thoughts? Questions? Concerns?  I've been wondering if this is really
worthwhile, but I think it is.  I think there is value in keeping old
versions around, but this allows us to avoid cluttering up the repository as
much, and makes it so that one change to a recipe can affect all the
versions in that range by default, or all versions, rather than just the one
version you tested.  Of course, ideally you'd test all versions, but that's
the case today too, its just that now our recipes get bitrotted instead.
 Personally, I'd rather see the old version content continue to be brought
forward by default, and if it fails to build with that, we fix it, but it's
easier to fix a build than to unclutter the repository.

I'm hoping to get some input on this :)

The bitbake changes: http://github.com/kergoth/BitBake/commits/bbversions
The repository with my experimentations with nano (haven't pushed since I
split the recipe by version range yet): http://gist.github.com/338382
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

