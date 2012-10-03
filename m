Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJPz6-0006WZ-Jp
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 16:31:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Oct 2012 07:18:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,528,1344236400"; d="scan'208";a="201071717"
Received: from unknown (HELO helios.localnet) ([10.252.122.52])
	by orsmga001.jf.intel.com with ESMTP; 03 Oct 2012 07:18:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 03 Oct 2012 15:18:33 +0100
Message-ID: <2524595.q9KP7Ea2Q1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6CBF8D@039-SN1MPN1-001.039d.mgd.msft.net>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<5056040.jAUIlqh764@helios>
	<70CC66F5C30A414DADDA6973E4CA391A6CBF8D@039-SN1MPN1-001.039d.mgd.msft.net>
MIME-Version: 1.0
Subject: Re: [meta-webserver][PATCH 0/6] Add meta-webserver
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
X-List-Received-Date: Wed, 03 Oct 2012 14:31:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 October 2012 14:08:16 McClintock Matthew-B29882 wrote:
> On Wed, Oct 3, 2012 at 8:43 AM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > The answer is no, it doesn't.
> > 
> > I guess on reflection we probably ought to be consistent here though - for
> > better or worse, this is not what has been done when pulling in recipes
> > from OE-Classic for the rest of meta-openembedded. The commit message
> > does already list the changes from the original, and I'll concede that
> > having just one revision doesn't give a huge amount in the way of insight
> > on previous origin; ultimately as you say, OE-Classic is still there as a
> > reference for that.
> > 
> > OK, I've squashed those commits out on the branch. Would it be worth me
> > posting a v2 after all these changes?
> 
> Actually, this is one really annoying thing about OE. When people
> rename the file 'git blame' comes worthless. Is there a way around
> this?

Usually it picks up on renames just fine, but as with git diff -M there is some 
fuzziness in how it determines the difference between a file rename and an 
unrelated delete followed by an add; sometimes the difference is too great for 
git to consider as a rename with its default settings. I just tested, you can 
improve rename detection with git blame by using the -C option though; 
adjusting the -M value might also help.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


