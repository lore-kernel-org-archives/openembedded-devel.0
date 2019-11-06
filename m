Return-Path: <paul@betafive.co.uk>
X-Greylist: delayed 611 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Nov 2019 16:11:35 UTC
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id DB7837F7C8;
	Wed,  6 Nov 2019 16:11:35 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 0FA8C2212F;
	Wed,  6 Nov 2019 11:01:24 -0500 (EST)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Wed, 06 Nov 2019 11:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:date:from:to:subject:content-type; s=
	fm2; bh=K/ie/aHI5wWDLouwAuP/q5rC78xsZUEV6zOsmUGp5Do=; b=hXfH+tLG
	T9yFPi/bJ1+0AUy0qizmGP4scCb/f8UjsSNTuBRRb6sZxuNGO3ZDS+k+KiL37xj8
	myScK3TXuE3po86JqKhYZEWNJoP0wwbD88uajSXo1QFpBl0ubIhHjEO123mxt013
	EC21gTJXIh9BEppCiXXcYklw4my8rPYcDjmo9Sb4Gau0I35dSPN7gQNWOEffcAhc
	CkqXs/+zoG5RO9FpFzGce87TRACu6isEone46RIW8KqjoqWWovSCfsyNxpjlRDfU
	utd73C79EsOvhscypPt1Smnn2gVf6v6+lKiCLWyWUgc5QJU2+Pa04B/kIx1Idk06
	aJzBesuVcnC70Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=K/ie/aHI5wWDLouwAuP/q5rC78xsZ
	UEV6zOsmUGp5Do=; b=dugMcMEO4AVvD5+1xx58GI5GeYIHWLXg+qu0MbslKJKwr
	RVMpW6oLr3mkcTCjSW5Krw2AXUnNmgsOC27i/TOL0QJULF+OncB8D8sh8dndmFiS
	/5tR7G9fLYVFtG3WFakEVsvJxX0C13OhBvJBsAPushraSrJaV1pyvUpTLX8Z0n0b
	TmPOHeRJhHdSDH/G0gcT8D7hntU9F1sV4ljRnEqP8JexLja5frNSs0usPPWEFbs9
	s8jOMiZrnmHSxB05BPprfTxgF0Z3Xu9LJ/IlC+pd2pvHY7nbFMghozL2ncpUQMEQ
	1nCawZeszZ7fKXx5W5VrSQ1q+Lu6XSo2GdLMbPKIQ==
X-ME-Sender: <xms:U-7CXeeQpNnfaBrOCIdr2Ybmhn_h3X2q0txR9t_QhOfkKNpfy0Vhhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddujedgkeehucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepofgfggfkfffhvffutges
	thdtredtreertdenucfhrhhomhepfdfrrghulhcuuegrrhhkvghrfdcuoehprghulhessg
	gvthgrfhhivhgvrdgtohdruhhkqeenucffohhmrghinhepghhoohhglhgvrdgtohhmpdhg
	ihhtlhgrsgdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdhophgvnhgvmhgsvg
	guuggvugdrohhrghenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsegsvghtrghf
	ihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:U-7CXUVVpM-Jz4TicbPk-xfUooobvbmU1Xz0IihC2zHRcBvcRCMITQ>
	<xmx:U-7CXU8rRFCXIHxQk7B0s2tFJ_0HgzWSbTgJ_8AQiZJCr0RCF5D2aQ>
	<xmx:U-7CXbNXrRqHPAFohQgnEvNIjq7lJOtai7rmuUW7x85eYMJo2Eitpw>
	<xmx:U-7CXdWJ15C0WNkggTIYgBpzZa_Lkrdi6x2NzM-ttrOAeR_hQmwHiQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7C919E00AE; Wed,  6 Nov 2019 11:01:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-509-ge3ec61c-fmstable-20191030v1
Mime-Version: 1.0
Message-Id: <ab96ec4a-5dcb-4d01-8519-13c00094a44c@www.fastmail.com>
Date: Wed, 06 Nov 2019 16:01:03 +0000
From: "Paul Barker" <paul@betafive.co.uk>
To: "Yocto discussion list" <yocto@yoctoproject.org>,
	"OE Devel" <openembedded-devel@lists.openembedded.org>,
	"OE Architecture" <openembedded-architecture@lists.openembedded.org>
Subject: Using GitLab for OE/Yocto layers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Nov 2019 16:11:36 -0000
Content-Type: text/plain

Hey folks,

We had some initial discussion at OEDEM about the patch submission process and how repositories are hosted (see https://docs.google.com/document/d/1Qm1mJ6xLozWW9NgBnokue7TmhwgFP8b2HR8TUlaQwNs/edit#heading=h.o4qtddy8bh9i).

Patch submission via mailing list still has some key features (such as ability to compose a patch response offline) and I don't expect that the core OE/Yocto repositories will be changing their workflow in the short term. However, lots of tools and non-core layers already use a pull request model for patch submission, typically via GitHub or GitLab.

I'd like to propose that we set up a common place for OE/Yocto repositories which want to use this pull request model and start to collaborate on some of the tooling. As discussed in OEDEM, GitLab has a few major advantages over GitHub, BitBucket, etc here as they've got a track record of working well with open source projects and we can run the software on our own infrastructure if desired. We can use something like https://gitlab.com/openembedded at first to trial things and then maybe move to https://gitlab.openembedded.org (or gitlab.yoctoproject.org) if things look good.

I see the following advantages to this approach:

* Increased bus factor for repository administration - several layers currently have only one admin or live in someone's personal GitHub account, we risk losing access to these if the person in question disappears.

* Integrated issue tracking - we can standardise on a few issue labels and use milestones in GitLab to correspond to Yocto release branches. As the repositories would be in the same group we would be able to make use of group-level issue lists and boards to show issues across several layers.

* Integrated merge request tracking - Similar to issues, we would be able to see a combined group-level list of open merge requests. This is a good view to use to help out other layer maintainers as you can easily see new merge requests across all repositories and pick a few to review.

* Separation of patches to different repositories/branches - Where one mailing list takes patches for many repositories it's often confusing which repository or branch is the target for a given patch.

* Easier contribution from behind corporate firewalls or buggy email servers - contribution is via ssh/https.

* Subgroups - GitLab supports more than one layer of grouping so we can organise repositories even within the top level "openembedded" group.

* Ability to enable/disable merge requests per-repository - With GitHub you can't disable pull requests. If your repository takes patches by another method you have to manually watch out for pull requests and comment on each one to tell the contributor how to submit patches. With GitLab this isn't necessary as you can just turn off merge requests for that repository.

* Ability to standardise on automated testing - we can integrate patchtest and yocto-check-layer with GitLab CI and run these scripts on each merge request. This requires a bit of work in both test scripts to allow configuration as not all tests will be appropriate for all layers. However it's much easier than integrating these scripts with several incompatible repository hosts and CI systems.

* Ability to standardise on security - If we want to we can enforce two-factor authentication (2FA) for logins, make use of the merge request approvals feature in GitLab, etc. We don't need to do that initially but it may be useful in the future.

At the risk of bikeshedding I'd like to get some feedback on these ideas at this stage. Have I missed any advantages/disadvantages? Is anyone interested in helping to guinea pig this with a couple of layers/repositories to see how it works in practice?

-- 
Paul Barker

