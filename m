Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 6CE3F73A1E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 15:16:36 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D584BD403BD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 16:16:35 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 22589D40344
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 16:16:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (f053007154.adsl.alicedsl.de
	[78.53.7.154]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 16:16:33 +0100 (CET)
Date: Tue, 10 Mar 2015 16:16:30 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150310151630.GI11160@mail.itconsulting-heinold.de>
References: <1425989994-22071-1-git-send-email-magnus@minimum.se>
	<CAP9ODKpy9HsOfQF+Shy7HON7k34+RJ97d=azmGt=hrvkhE50jw@mail.gmail.com>
	<3cca049f035271caa753ba240c184793.squirrel@lightmail.glesys.com>
	<CAP9ODKomzc2k9OJPd1Nj7WZ036fraAgO0yKdqRzm9subYu2soQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKomzc2k9OJPd1Nj7WZ036fraAgO0yKdqRzm9subYu2soQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java][PATCH] initials: silence "populate_sysroot manifest not found" warnings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Mar 2015 15:16:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2015 at 12:07:55PM -0300, Otavio Salvador wrote:
> On Tue, Mar 10, 2015 at 11:54 AM,  <magnus@minimum.se> wrote:
> >> On Tue, Mar 10, 2015 at 9:19 AM, Magnus Olsson <magnus@minimum.se> wrote:
> >>> A number of recipes in meta-java use autotools.bbclass for building;
> >>> internally
> >>> it uses the sstate-control populate_sysroot manifests to locate and copy
> >>> aslocals for configure dependencies as part of the do_configure step.
> >>> The manifest path differs depending on if it's a native package or not
> >>> so
> >>> autotools.bbclass looks at the package name to determine if its native
> >>> or not
> >>> (it's native if it ends with "-native").
> >>>
> >>> The warnings are emitted because a few (native) recipes in meta-java
> >>> (such as
> >>> cacao-initial, classpath-initial and more) are incorrectly being
> >>> classified as
> >>> non-native by autotools.bbclass, which makes it look for the manifest in
> >>> the
> >>> wrong place and finally gives up with the warning:
> >>>
> >>> WARNING:
> >>> /home/oe/tmp-glibc/sstate-control/manifest-mymachine-libecj-bootstrap.populate_sysroot
> >>> not found
> >>>
> >>> This happens for cacao-initial, classpath-initial, ecj-initial,
> >>> libecj-boostrap,
> >>> jamvm-initial and jikes-initial since they are all native and rely on
> >>> autotools.
> >>>
> >>> This patch renames the recipes so they end with -native, e.g
> >>> ecj-initial-native.
> >>> It also updates the recipes so they DEPEND on the corresponding new
> >>> name. This
> >>> helps autotools.bbclass to properly classify the recipes are native and
> >>> silence
> >>> the warnings.
> >>>
> >>> Signed-off-by: Magnus Olsson <magnus@minimum.se>
> >>
> >> What about the target packages? instead a class extend could be used.
> >
> > autotools.bbclass will assume it's a target package if the name doesn't
> > end with -native or starts with -nativesdk (kind of a catch-all), so
> > target packages should be fine.
> >
> > I think autotools.bbclass::autotools_copy_aclocals() can be patched to use
> > bb.data.inherits_class() to detect native and nativesdk packages (and so
> > will not need to look at the package name), but I still feel like this is
> > a good patch for meta-java since a -native prefix seem to be more or less
> > package name convention.
> 
> You've renamed the recipes. Has the corresponding target ones been
> preserved? I will check more carefully the patch today or tomorrow ...

It only effects recipes we needs to build the jdk, no target packages are effected.

Bye Henning

