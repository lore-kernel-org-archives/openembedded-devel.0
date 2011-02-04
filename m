Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PlMFJ-00015T-C0
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 15:02:45 +0100
Received: (qmail invoked by alias); 04 Feb 2011 14:01:47 -0000
Received: from p4FE0FB3C.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.224.251.60]
	by mail.gmx.net (mp057) with SMTP; 04 Feb 2011 15:01:47 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/hWyp3Zgnh80Hdsiym/QUkKU9J6uYdzmPBoPa+Vk
	727g5zpEae4I5E
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 4 Feb 2011 14:58:18 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <201101271038.18945.ml@vdm-design.de>
	<AANLkTi=f0V2=U9rAZd9HTk8VdgqZbRC+2NJ8YE-4SZbw@mail.gmail.com>
	<AANLkTi=7X86Wvps_HETYz7mkCSZbDKLxBHP1uW6NUbMN@mail.gmail.com>
In-Reply-To: <AANLkTi=7X86Wvps_HETYz7mkCSZbDKLxBHP1uW6NUbMN@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201102041458.18471.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
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
X-List-Received-Date: Fri, 04 Feb 2011 14:02:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 04 February 2011 14:10:33 Frans Meulenbroeks wrote:
> 2011/2/4 Otavio Salvador <otavio@ossystems.com.br>:
> > On Fri, Feb 4, 2011 at 09:57, Frans Meulenbroeks
> > <fransmeulenbroeks@gmail.com> wrote:
> >> Actually I did not react on the libtool forcing upon everyone, but on
> >> the QA errors (where this thread was about).
> >> That was also the cause of the ostrich remark (which was definitely
> >> not aimed at you in person, but more a general comment, triggered by
> >> the fact that I have some experience with projects being outsourced to
> >> an unnamed country where a bug report also could be "repaired" by
> >> removing the message or the the symptom instead of tackling the root
> >> cause).
> >>
> >> What I see is a lack of interest in fixing the existing QA errors.
> >> I've sent out a few error reports to the list a while ago, (on recipes
> >> that I feel not comfortable with), but unfortunately that did not
> >> result in any action :-(
> >
> > I think we ought to FAIL on QA errors. Distros can ignore the errors
> > if they want but OE as a whole cannot do that.
> 
> I tend to agree with this.
> Actually it would be nice if insane.bbclass would allow a way to
> specify which tests you want to do.
My suggestion: Run alI tests but make it configurable what causes just warnings 
and what causes errors (not too many options e.g. all QA cause errors or 
warning). There are different roles: OE-Users do not want the build to be 
broken - images with QA errors might run without errors. OE developers might
appreciate to get a hard error for the package currently working on or for test 
builds.

Andreas



