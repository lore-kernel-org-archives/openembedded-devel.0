Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1LYdtJ-0007tt-EQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Feb 2009 11:06:25 +0100
Received: from 79-79-208-205.dynamic.dsl.as9105.com ([79.79.208.205]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1LYdrd-0007m5-T6
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Feb 2009 10:04:42 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <871vu2chee.fsf@neumann.lab.ossystems.com.br>
References: <200902131728.08634.openembedded@haerwu.biz>
	<878woae03q.fsf@neumann.lab.ossystems.com.br>
	<fce2a370902130939m708ada3dn55be8cdeadacbfbb@mail.gmail.com>
	<871vu2chee.fsf@neumann.lab.ossystems.com.br>
Date: Sun, 15 Feb 2009 10:04:40 +0000
Message-Id: <1234692280.4890.436.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: checksums situation
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
X-List-Received-Date: Sun, 15 Feb 2009 10:06:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-02-13 at 16:37 -0200, Otavio Salvador wrote:
> Ihar Hrachyshka <ihar.hrachyshka@gmail.com> writes:
> 
> > On Fri, Feb 13, 2009 at 7:08 PM, Otavio Salvador <otavio@debian.org> wrote:
> >> Marcin Juszkiewicz <openembedded@haerwu.biz> writes:
> >>
> >> <...>
> >>> This solution also has one nasty part - now we can keep SRC_URI for
> >>> multiple versions in common file, but if we switch to storing it in
> >>> SRC_URI we will have to change that.
> >>>
> >>> Other solution proposed on IRC was to keep checksums in extra file in
> >>> each directory of packages/ subdirectory. I think that it is not best
> >>> but sounds better then one file.
> >>>
> >>> What do you think? Which way we should go? Do you have other ideas?
> >> <...>
> >>
> >> What about having a checksums for _each_ recipe?
> >>
> >> foo_1.0.bb
> >> foo_1.0.md5sum
> >
> > This will waste directories and will make tree navigation harder.
> 
> Well; so let's just create a md5sums directory at OE topdir and add the
> dirs and files there.

That would work, and it'd certainly be better than the single monolithic
checksums.ini, but it would still be a bit of a nuisance for overlay
users. 

Your original suggestion of a .md5sum file sounds reasonable enough to
me; I'm not really sure I buy the argument about wasting directories.
But I still think it would be even better to find a way to put the
md5sums inside the .bb file itself.

For packages where the SRC_URI is defined locally in the .bb file then
there's no real problem: the existing ";md5sum=..." notation will work
fine.  For packages where SRC_URI is inherited from some class or
include file, obviously that doesn't work.  In that case I guess the
easiest solution is just to put the checksums in a separate variable,
something like:

CHECKSUMS = "foo_${PV}.tar.bz/md5=076e48835bee2609a3713b35fb89631c"
CHECKSUMS += "foo_1.0-${PR}.patch/sha1=9bfbeca5db4887b62826da6d0169c62c244f6188"

p.




