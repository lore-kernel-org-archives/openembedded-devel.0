Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RCBWs-0002uF-Kf
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 16:36:02 +0200
Received: from ad.chargestorm.se (85.231.30.150) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Fri, 7 Oct 2011 16:30:24 +0200
Date: Fri, 7 Oct 2011 16:30:40 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20111007143026.GA5934@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1316616945.git.Imran_Mehmood@mentor.com>
	<j5em9g$3pd$1@dough.gmane.org> <4E89AF1F.3040107@mentor.com>
	<4E8F096F.5040003@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4E8F096F.5040003@mentor.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v3 0/2] pull request for twm and xclock recipes
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
X-List-Received-Date: Fri, 07 Oct 2011 14:36:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Imran Mehmood <imran_mehmood@mentor.com> [111007 16:15]:
> On 10/03/2011 05:48 PM, Imran Mehmood wrote:
> > hi koen,

> > On 09/22/2011 11:57 AM, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1

> >> Op 22-09-11 08:31, Mehmood, Imran schreef:
> >>> From: Imran Mehmood<Imran_Mehmood@mentor.com>

> >>> The following changes since commit
> >>> 94a25d92b4d0e9379caaab127ccac1a94e9e4d28: Imran Mehmood (1): cramfs: 
> >>> Adds
> >>> cvs version recipe (initial recipe)
> >> That isn't in meta-oe, so I can't pull your git tree. I'll grab the 
> >> patches
> >> from patchwork for now, but in the future please use a clean tree for 
> >> pull
> >> requests

> > Sorry for much delayed response I was busy with some other issues. I 
> > fixed the warning messages with xclock but before sending the patch 
> > again just wanted to clear a confusion regarding your response below.

> > I passed 94a25d92b4d0e9379caaab127ccac1a94e9e4d28 to 
> > create-pull-request script with -r because I wanted to create pull 
> > request for all commits on my branch, made after this one. If its 
> > wrong whats the right way or thing to do? I mean

In order to make it easy for everyone to pull from your git tree, the
pull request should be based on a commit that is in the upstream git
tree.

In other words, the error/problem with your pull request was that you
had created a branch, then commit X-number of patches to that branch.
However, you only used the latest Y-patches (with Y being less than X)
in your pull-request.

A better approach would have been to create a new branch, cherry-pick
the Y-patches that you wanted to upstream into this new branch. And
finally, create a pull request for this new branch.

Cheers,
Anders

> >  what commit id should I pass to the script? Please explain a bit more 
> > in detail so that I can prepare next patch as per requirements.


-- 
Anders Darander
ChargeStorm AB / eStorm AB


