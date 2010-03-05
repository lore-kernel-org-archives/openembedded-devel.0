Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NnZeX-00079f-0m
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 16:41:27 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NnZbi-0001sl-St
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 15:38:31 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NnZbi-0000wa-Qm
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 15:38:30 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a51003030909u58f72751u19f5b3caab614450@mail.gmail.com>
References: <b6ebd0a51003030909u58f72751u19f5b3caab614450@mail.gmail.com>
Date: Fri, 05 Mar 2010 15:38:26 +0000
Message-ID: <1267803506.14566.854.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Initial Proposal for Packaged Staging Revamp (was [RFC] Make some big changes right after next stable)
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
X-List-Received-Date: Fri, 05 Mar 2010 15:41:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-03-03 at 10:09 -0700, Chris Larson wrote:
> To summarize, I propose the creation of an archive/package which acts as the
> primary artifact to come out of the build of a recipe.  By capturing *all*
> output of a recipe into a single place, we reduce confusion and make things
> easier to track.  Every subsequent task by the recipe (or other recipes)
> will go based on this archive (or cached, extracted contents of this
> archive, for performance).  Builds from cached binaries would operate based
> on this archive, so that the execution of the subsequent tasks would be
> identical between the prebuilt and from scratch cases, and it makes it clear
> that this is not just "packaged staging" in concept or intent.

Yes, this is pretty much what I have been thinking of as well.  I think
the only real difference between what you have suggested here and what I
have had mind is that I was originally planning to re-use the existing
binary package output (i.e. what you get from do_package) to populate
the staging directory.  The nice thing about that approach is that it
guarantees that you will get the same result for an in-tree OE build
compared to an on-target build against the installed -dev packages,
which would help to avoid some of the issues we have had in the past
with the -dev packages being defective through lack of testing.

Indeed, one of the main motivations for the work that I have been doing
on the toolchain-desuck branch is to remove the special-casing of the
toolchain recipes so that they just generate output packages which you
can then install in the same way as anything else.

Introducing a new archive format which captures the entirety of the
build output up to and including do_install is indeed quite tempting as
well, though.

p.



