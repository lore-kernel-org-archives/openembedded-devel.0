Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OswuN-0007Hz-2P
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 14:04:16 +0200
Received: by iwn2 with SMTP id 2so5168997iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 05:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=4zxhn0j6D0Vy9QTzitJf6iZi2scLEVfNWYgiVVpPeko=;
	b=NbxmtheEk6q28MBaEbTHkrQHwx6oUMXOG4af8YWv7prH5lvT3suEHKHvNVft5fnCmr
	D1ow43IyLc2/f9fBzUZAgkB0mWgz6B/eXfUUTxEBeKH/Pa/m8L4oRrb0iDU3YsznOs8p
	weh5JucBNzhJBe0AmiKc0dK4RvDt2y8/6p+Sg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=nVg5vm2fxBSJhG9YD+J1wi8dKDBe7Ph0aWNHZGsWzLKKm2KKCW3ujEvBu6371ZRf0z
	8lWpCQOl0YYLf4uqyDRsfAJ3tHKOebKBvy/mjVKBoiBiVsRiA71zMXShxurquENTQH22
	Sr/yVI0RcXLFX4jp15c51sGTr3W5J25BGcZxA=
MIME-Version: 1.0
Received: by 10.231.14.140 with SMTP id g12mr7223035iba.84.1283861013607; Tue,
	07 Sep 2010 05:03:33 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Tue, 7 Sep 2010 05:03:33 -0700 (PDT)
Date: Tue, 7 Sep 2010 14:03:33 +0200
Message-ID: <AANLkTin3YxQRro77PNMBcpb0MYdqALAa32NdYqZgL1Xg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: a note on OE recipes and quality
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
X-List-Received-Date: Tue, 07 Sep 2010 12:04:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Recently there have been some remarks on quality.
That triggered me to write down my views on quality in relation with OE.
The ideas are mine, there are no plans to enforce something at the
moment, but I would like to stir up a discussion what we find good
practices.
As a followup in due time we could come up with some rules/guidelines/whatever.
I guess quality could also be a topic at OEDEM.

As a starter let me try to identify the perfect recipe. (and of course
my analysis won't be perfect so please add).

For a recipe I see three facets wrt quality:
- functional
- the metadata
- maintenance.
Let's try to write down what a good recipe has in each of these facets
(in no particular order). Note also that not all items have the same
weight.

Functional
========
* A good recipe should build for the target/distro it is intended for
(and if it is only applicable for e.g. a specific set of machines this
is indicated with COMPATIBLE_MACHINE and friends)
If it does not build it might still be useful as a reference or as a
starter to get the recipe in good shape again, but it definitely does
not get the bits on the target moving so as such it is not too useful.
* A good recipe should also deliver what it is supposed to deliver.
E.g. if it builds but does not package any files or if the program do
no not work, the package is not too useful.
* The package, when build, should not have QA warnings, or other
(relevant) errors or warnings (e.g. files not in any package, install
errors etc etc).

Metadata
=======
* The dependency tree should be complete (but not overspecified). If
configure is used, it should reflect with what configure uses. (we
need to avoid that if you happen to build package X before even if not
in DEPENDS, that the package is configured differently because X is
found).
* configure invocation should explicitly disable packages that are not
supposed to be there.
* recipes should use a standard style/layout (e.g. as given by
oe-stylize and as described in [1]). This makes it easier to find ones
way in a recipe one is not familiar with.
* Certain fields are always present in a good recipe (e.g. LICENSE,
DESCRIPTION, HOMEPAGE etc etc)
* recipes should be as simple as possible (and not simpler). Please no
fancy python constructs unless really unavoidable. Other people should
be able to easily understand things, not having to start a puzzle as
the latter may lead to mistakes more easily
* if there is a complicated snipped of code or a specific reason to do
something in a certain way it should be mentioned in a comment.
* using BBCLASSEXTEND is encouraged, using legacy staging is discouraged


Maintenance
=========
I feel a good recipe is maintained. Tasks that a good maintainer
should perform are:
* regularly checking for new versions and make them available when
they are worthwhile
* regularly check for important patches and security advisories, and apply them
* decide on what older versions are still useful to be kept. E.g. it
might not be too useful to keep rc1, rc2, rc3 or even x.y.1, x.y.2 etc
if they are only bugfixing releases or releases with minor
enhancements. If changes are big (or e.g. footprint changes
drastically) it might be useful to keep some older versions.
* watches the mailing list and bug tracker for patches, reviews them
and applies them if correct/applicable.
* monitors the  bug reports in bugzilla. (btw: I do not see it as the
role of the maintainer to fix bugs that are also present upstream,
although it would be nice,)
* where needed: tries to get patches upstream and/or reports bugs up-stream.

[1] http://wiki.openembedded.net/index.php/Styleguide


Feel free to comment, but please keep this a friendly, open and
constructive thread.

Frans


