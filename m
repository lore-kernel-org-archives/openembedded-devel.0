Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5616E601DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 20:10:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JKGLXj001672; Wed, 19 Jun 2013 21:16:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zhsANDJVlpYS; Wed, 19 Jun 2013 21:16:21 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JKGGKO001666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 19 Jun 2013 21:16:18 +0100
Message-ID: <1371672596.20823.198.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 21:09:56 +0100
In-Reply-To: <D76D4BAB-5FE3-4E5E-9417-AFA7E4986724@gmail.com>
References: <1721274.vjFAy2UInG@helios>
	<CAJTo0LY4nFf_K6BSwp4acRQYubKgPUGHCQN5am=CeZ1YLHVMTw@mail.gmail.com>
	<D76D4BAB-5FE3-4E5E-9417-AFA7E4986724@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: Re: Patchwork access
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2013 20:10:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-06-19 at 09:42 -0700, Khem Raj wrote:
> On Jun 19, 2013, at 4:40 AM, "Burton, Ross" <ross.burton@intel.com> wrote:
> 
> > On 19 June 2013 10:09, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> >> A few people have been asking for access to patchwork recently, and it seems
> >> like it isn't possible to create an account at the moment. Can we come up with
> >> a plan to solve this?
> 
> The patchwork has same issue as wiki w.r.t to spam and phony account creations,
> disabling the register page from active links reduces it tremendously. I will put interactions
> on wiki on how to still use it after register link is not shown. The functionality is still there
> but it can be seen on website.
> 
> > 
> > It's also sad that the oe-core patchwork isn't really usable as it's
> > not detecting patches that have been merged.  Who's the right person
> > to investigate this?
> 
> its a heuristic and best effort approach its not totally automatic. e.g. if V2 of a patch is send
> and V1 is still there then it might close V1 if hashes are same. OE-Core patchwork is mainly
> for reference as it was decided for cherry picking patches etc. for local use its not the patch
> management solution for OE-Core as much as it is for other layers in there.

FWIW I'm having a lot of local success with subject line (commit
summary) matching as I have a script which moves emails around IMAP
depending on the subject line being in the git repo. Its just a quick
hacky script though, nothing special...

Cheers,

Richard




