Received: from 3a.49.1343.static.theplanet.com
	([67.19.73.58] helo=pug.o-hand.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@linux.intel.com>) id 1OC99i-0004n1-W7
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 12:27:12 +0200
Received: from [10.250.128.198] (unknown [158.43.2.102])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 3C74B12EC119
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 05:49:44 -0500 (CDT)
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BE91403.9080001@ge.com>
References: <1273507486.2994.189.camel@localhost.localdomain>
	<4BE91403.9080001@ge.com>
Date: Wed, 12 May 2010 11:23:15 +0100
Message-ID: <1273659795.2936.179.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-1.fc12) 
X-SA-Exim-Connect-IP: 67.19.73.58
X-SA-Exim-Mail-From: josh@linux.intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Supported Python version for OE?
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
X-List-Received-Date: Wed, 12 May 2010 10:27:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-05-11 at 09:23 +0100, Martyn Welch wrote:
> Joshua Lock wrote:
> > Hi,
> >
> > A question, (perhaps for the TSC?):
> >
> > 	"What's the minimum Python version we want to support in OE?"
> >
> > According to the wiki we support Python 2.4 and above but I wonder if
> > people have any thoughts with regards to bumping it?
> >   
> 
> I'd suggest that the better question to ask is:
> 
>      "Which versions of which distros do we currently intend OE to work on?"

That's a good way to re-phrase it.

> 
> Given that the revisions of Python for the following distributions are
> as follows:
> 
> Ubuntu 10.04 LTS - 2.6.5
> Ubuntu 8.04 LTS - 2.5.2
> 
> Debian lenny (stable) - 2.5.2
> Debian squeeze (testing) - 2.5.3
> Debian sid (unstable) - 2.5.4
> Debian etch (oldstable) - 2.4.4
> 
> Fedora 12 - 2.6.2
> Fedora 11 - 2.6
> Fedora 10 - 2.5.2
> Fedora 9 - 2.5.1
> Fedora 8 - 2.5.1
> Fedora 7 - 2.5
> Fedora 6 - 2.4.3
> 
> RHEL6 (beta) - 2.6.2
> RHEL5 - 2.4.3
> 
> OpenSUSE 11.2 - 2.6.2
> OpenSUSE 11.1 - 2.6.0
> OpenSUSE 11.0 - 2.5.2
> 
> This would suggest that using 2.5 features should be ok for the majority
> of people. My one area of concern would be those using RHEL. RHEL 6
> isn't out yet and v.5 uses 2.4.3 - this wouldn't impact me, so I'm not
> overly fussed.

Hmm, thanks for the data. I'm not overly fussed either but suspect that
supporting RHEL5 is a desire for at least a while after RHEL6 comes out?

> 
> > The reason I ask is because I had a user contact me about using Python
> > 2.5 features (str.partition) in relocatable.bbclass, I hadn't even
> > noticed this and seems like not many others have but it's clearly
> > affecting at least one person.
> >
> > I have a pretty trivial (if ugly) patch to work around this, but it
> > raised an interesting question so I thought I'd ask that before sending
> > the patch.
> >   
> 
> The only other question I can think of is "is there an advantage to
> using the Python 2.5 features?".

Only that it's less code and that the code is more thoroughly tested.
The patch was just what prompted me to question a Python 2.4 dependency.

Thanks,
Joshua
-- 
Joshua Lock
        Intel Open Source Technology Centre



