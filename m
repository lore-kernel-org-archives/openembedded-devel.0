Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PlGrd-0004OE-R8
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 09:17:57 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PlGqi-0006cW-Kv by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 09:17:02 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PlGqh-00010e-E3
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 09:16:59 +0100
Date: Fri, 4 Feb 2011 09:16:59 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110204081659.GQ4580@excalibur.local>
References: <131E5DFBE7373E4C8D813795A6AA7F08032A16A5BE@dlee06.ent.ti.com>
	<4D403D6F.3040800@mentor.com> <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com> <20110203222035.GA19477@denix.org>
	<4D4B35A7.4040000@mentor.com>
	<AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Fri, 04 Feb 2011 08:17:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello.

On Fri, 2011-02-04 at 08:54, Frans Meulenbroeks wrote:
> 2011/2/4 Tom Rini <tom_rini@mentor.com>:
> > On 02/03/2011 03:20 PM, Denys Dmytriyenko wrote:
> >>
> >> On Thu, Feb 03, 2011 at 10:43:26AM -0700, Tom Rini wrote:
> >>>
> >>> On 02/03/2011 12:09 AM, Denys Dmytriyenko wrote:
> >>>>
> >>>> On Thu, Jan 27, 2011 at 08:02:44AM -0700, Tom Rini wrote:
> >>>>>
> >>>>> On 01/27/2011 04:27 AM, Frans Meulenbroeks wrote:
> >>>>>
> >>>>> The problem is that today we have QA Errors that are warnings
> >>>>> (coreutils-native) and QA Errors that result in a non-zero exit code
> >>>>> but
> >>>>> also don't "kill the build" nor make it obvious at the end that there
> >>>>> is
> >>>>> a
> >>>>> non-zero exit code (GNU_HASH, RPATH).  Finally we do have "kill the
> >>>>> build"
> >>>>> fatal checks in insane.bbclass, namely the do_qa_configure tests.
> >>>>
> >>>> Actually, I believe there was a simple error in the code which made QA
> >>>> Error
> >>>> on RPATH not kill the build[1]. BTW, GNU_HASH QA Error does stop the
> >>>> build.
> >>>>
> >>>> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/42168
> >>>
> >>> Good spotting.  But.. GNU_HASH QA error will give you a non-zero exit
> >>> code
> >>> and not kill the build so we're back where we started, albeit with a less
> >>> often hit in the community trigger (but I bet more often hit in private /
> >>> 3rd party collections).
> >>
> >> So, do you ack the patch, should I push it in? It will break the build for
> >> anyone still using libtool-2.2, specifically in gettext package...
> >
> > So, that would break angstrom-2008.1 so I don't think that's a great idea
> > until we fix it..
> 
> Then again, if we push it there will be some incentive to fix it.

So you are going to care care about the not yet ready for libtool 2.4 fallout?
Get warm with openjdk-6 then as it still needs libtool 2.2. :)

More serious, I think this should at least wait until after the upcoming 2011-03
release. We need to find a balance between waiting forever and not breaking
existing stuff.

regards
Stefan Schmidt


