Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Klau1-0003hk-Ci
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Oct 2008 05:00:25 +0200
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Klapu-0001bY-U7
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Oct 2008 04:56:11 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 3 Oct 2008 04:55:39 +0200
User-Agent: KMail/1.9.9
References: <48E36C18.4090504@smartlink.ee>
	<200810020236.47828.zecke@selfish.org>
	<f96d234e0810020428g78256acfpdcf046cf9136fa27@mail.gmail.com>
In-Reply-To: <f96d234e0810020428g78256acfpdcf046cf9136fa27@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200810030455.39524.zecke@selfish.org>
Subject: Re: git master not updating
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
X-List-Received-Date: Fri, 03 Oct 2008 03:00:25 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 02 October 2008 13:28:47 Cliff Brake wrote:
> On Wed, Oct 1, 2008 at 8:36 PM, Holger Freyther <zecke@selfish.org> wrote:
> > On Wednesday 01 October 2008 14:24:56 Kalev Lember wrote:
> >> Hello,
> >>
> >> http://gitweb.openembedded.net/?p=org.openembedded.dev.git;a=summary
> >> The master head of org.openembedded.dev is not updating. I already
> >> spotted two bug reports (4584 and 4590) which reported issues that were
> >> fixed in monotone 4 days ago, but never got into git master.
> >
> > That is on purpose. People complained on irc that CIAbot reports
> > everything twice (master, org.openembedded.dev)... and there is no real
> > reason to have a branch called master.
>
> Hmm, and someone must have just fixed the repo so that a clone
> automatically checks out the org.openembedded.dev branch, and there is
> no master branch :-)

magic? ;)

master was just there for repo.or.cz... I removed it from the repo and made 
the default branch org.openembedded.dev, people in the wild should know what 
to do or execute git-checkout -b org.openembedded.dev 
origin/org.openembedded.dev

z.


