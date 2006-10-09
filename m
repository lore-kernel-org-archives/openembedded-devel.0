Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GWqme-00054H-1z
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Oct 2006 10:46:48 +0200
Received: by nf-out-0910.google.com with SMTP id l36so1741841nfa
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Oct 2006 01:40:44 -0700 (PDT)
Received: by 10.78.204.20 with SMTP id b20mr5159969hug;
	Mon, 09 Oct 2006 01:40:44 -0700 (PDT)
Received: by 10.78.175.4 with HTTP; Mon, 9 Oct 2006 01:40:43 -0700 (PDT)
Message-ID: <74d0deb30610090140g40716743k35a2cddb555018d4@mail.gmail.com>
Date: Mon, 9 Oct 2006 10:40:43 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <1160382102.5741.19.camel@localhost.localdomain>
MIME-Version: 1.0
References: <45296EB8.7070704@dominion.kabel.utwente.nl>
	<1160382102.5741.19.camel@localhost.localdomain>
Subject: Re: [RFC] Removing MAINTAINER field from recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2006 08:46:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/9/06, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Sun, 2006-10-08 at 23:33 +0200, Koen Kooi wrote:
> > After some discussion about the actual meaning of the MAINTAINER field in OE we have
> > formulated a proposal:
> >
> >   'All MAINTAINER fields will be removed from the recipes in org.openembedded.dev, and
> > will only be valid in a distro config file'
> >
> > We have a number of reasons for doing this:
> >
> >  * A lot of the MAINTAINER fields are stale
> >  * Not all people listed in the MAINTAINER fields (want to) have commit access
> >  * People have blindly copied recipes without contacting the respective MAINTAINER
> >  * Certain MAINTAINER only care about supporting their $DISTRO
> >  * The SCM (monotone) holds all the information about who added the recipes and who edited
> > them.
>
> What is missing here is the proposed alternative. The idea we discussed
> was having a Maintainers file, similar in spirit to that in the Linux
> kernel where people can detail areas they're interested in and give some
> kind of indication of the type of support they want to give.
>
> For example, in the case of linux-openzaurus-*, I'd consider that I
> actively maintain that, and I'd like to be consulted on changes to those
> files.
>
> This removes all kinds of policy issues such as "when I copy a .bb file
> to a new version, who is the maintainer"?
>
> It also means when someone creates a branch, be it openzaurus, poky or
> something else, they don't have to go through and remove all the
> MAINTAINERS. The obvious concern there is .dev maintainers getting mail
> about some branch they have no control over and don't want bug reports
> about. Changing a single maintainers file is much easier than patching
> every .bb file.
>
> MAINTAINER would still exists but would become a distro variable so
> distros would still use it to set the maintainer of distributed packages
> but since this is usually a distro contact, setting it in a distro.conf
> file shouldn't be a problem (and it can be overridden on a per package
> basis MAINTAINER_pn-linux-opnzaurus = "").

Does this mean we'll have additional per-distro .conf files
which contain hundreds of MAINTAINER_pn-foo variables?

> The format of the maintainers file is yet to be determined and proposals
> are welcome. So far the requirements are something simple and consistent
> in an easily parsed format (both human and computer parsed). We need to
> list a contact, the packages covered and the level of interactivity of
> the maintainer (we need a list of these levels?).
>
>
> By creating this new file, we get the overhaul of the MAINTAINERS we
> need and it solves a lot of existing policy issues which we can't solve
> with the existing structure so personally, I'm very much in favour of
> it.

I'm all for the proposal of a MAINTAINERS file, especially as it allows
to state a general field of interest.

regards
Philipp


