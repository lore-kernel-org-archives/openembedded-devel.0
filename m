Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PnRx9-0002EQ-7a
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 09:32:39 +0100
Received: from [2001:638:602:1183:9903:4c2c:3413:de08] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PnRw6-0001fx-Ht by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 09:31:37 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PnRw5-0001cv-CQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 09:31:33 +0100
Date: Thu, 10 Feb 2011 09:31:33 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110210083133.GL28019@excalibur.local>
References: <4D519C83.9060502@mentor.com>
	<09D9BE2AC4AA764DABAA8C91E48D819E011A79A329@DEMCHP99E35MSX.ww902.siemens.net>
	<20110209095644.GE28019@excalibur.local>
	<iitplc$ago$1@dough.gmane.org>
	<AANLkTinrp6netE73j_iQmHu+sA5T4sUDEJJbijL45dKR@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinrp6netE73j_iQmHu+sA5T4sUDEJJbijL45dKR@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: 2011.03 release testing, starts soon!
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
X-List-Received-Date: Thu, 10 Feb 2011 08:32:39 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello.

On Wed, 2011-02-09 at 12:30, Khem Raj wrote:
> On Wed, Feb 9, 2011 at 2:18 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> > On 09-02-11 10:56, Stefan Schmidt wrote:
> >
> >>> 2. Do not delete the release branch after 2011.03 will be released (just like
> >>>    it was done for 2010.12), but let it live and allow developpers committing
> >>>    bug-fixes (backporting choosen things?) reported back by OE users (some would
> >>>    would be happy to contribute this way)
> >>
> >> That was already discussed. We make a tag with the release rev from which can be
> >> branched again _if_ people are stepping up to support this branch on a mid or
> >> long term base.
> >>
> >> The branch Tom is using until the release is pretty useless froma history point
> >> of view (all changes must be in master as well). When he thinks the release is
> >> good enough the tag gets added and the old branch deleted. For the last release
> >> nobody cared to support it afterwards with bugfixes so no release branch was
> >> created.
> >>
> >> I'm thinking about this for the upcoming release. If all works well we will base
> >> a product on it which I would like to support directly from such a release
> >> branch.
> >>
> >> The hard part is how people could decide on pooling resources on this. Defining
> >> goals for such a branch and stuff. E.g. only take serious fixes? What about
> >> package updates? Security fixes? changes on the toolchain or classes?
> >>
> 
> I would suggest to take only bugfixes and refrain from infrastructure
> changes which usually
> happen metadata wide and toolchain and classes are biggest part of
> this and with time backports
> into long term branches become more and more complex and painful and
> it may be that you have to do
> entirely different patch to solve the same issue in this branch which
> has been fixed differently upstream

Staying away from infrastructure and toolchain changes is something I really
want to see for such a branch.

From my BugLabs side I would expect bug fixes but also some package updates.
That would be stuff based on the java/osgi framework we are deploying so
hopefully it would not make problems for anyone else. I don't expect to much
problems with that.

With regards to the lifetime I don't see this as a several years branch fo our
product (thinking about oe-core for the next release). Obviously it is still
fine for other people to use it that long. The current stable branch is a good
example for this. It is still used and different companies/people are happy with
it having no updates at all for some time. :)

I would expect something else for the branch on top of the 2011-03 release. Some
more changes in the begining while fixing problems that poped up after the tag
was created but commits will slow down after some months.

> I think if such a branch is to be created it should be created from
> the release tag after the release happens

Agreed.

> >> This is up to the group who wants to support such a branch. Anyone else
> >> interested in doing this for 2011-03?
> 
> If such a branch is expected for long term then its better to decide
> its policies on patches
> from upstream pov all fixes that go into this branch should first go
> into master if its not
> a direct backport of some sort. That way we can be sure that we dont
> lose changes that should be in master.

Agreed as well. It gets a mess if we start fixing stuff in the release branch
only.

regards
Stefan Schmidt


