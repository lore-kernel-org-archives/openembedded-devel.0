Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EED8D65EC9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 16:56:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 May 2014 09:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1004,1389772800"; d="scan'208";a="535331830"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.213])
	by fmsmga002.fm.intel.com with ESMTP; 07 May 2014 09:56:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 07 May 2014 17:56:08 +0100
Message-ID: <2938048.PgBWojNThS@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.2-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <20140507164844.GF30955@jama>
References: <1399445635-29373-1-git-send-email-koen.kooi@linaro.org>
	<6062362.lpz6Qfmmsr@peggleto-mobl5.ger.corp.intel.com>
	<20140507164844.GF30955@jama>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] openldap: fix build against gnutls3
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
X-List-Received-Date: Wed, 07 May 2014 16:56:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 07 May 2014 18:48:44 Martin Jansa wrote:
> On Wed, May 07, 2014 at 09:57:52AM +0100, Paul Eggleton wrote:
> > On Wednesday 07 May 2014 10:29:21 Koen Kooi wrote:
> > > Khem Raj schreef op 07-05-14 09:47:
> > > > On Tue, May 6, 2014 at 11:53 PM, Koen Kooi <koen.kooi@linaro.org> 
wrote:
> > > >> ++                              TLS_LIBS="-lgnutls -lgcrypt"
> > > > 
> > > > Does this mean we need something more in DEPENDS or DEPENDS part of
> > > > PACKAGECONFIG too ?
> > > 
> > > Should be automatic since gnutls depends on it. It's not a new
> > > dependency.
> > 
> > BitBake does not automatically ensure dependencies-of-dependencies are in
> > the sysroot. They almost always will be, but I have seen failures in
> > these kinds
>
> Are you sure it doesn't?

Pretty sure, yes.
 
> But I'm also in favor of specifying dependencies-of-dependencies in
> cases where the recipe configure task explicitly check for them (so that
> when the required dependency is no longer included in "parent"
> dependency, e.g. after moving it to PACKAGECONFIG).

If the recipe's configure task explicitly checks for them then to my mind they 
cease to be dependencies of dependencies and become just dependencies.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

