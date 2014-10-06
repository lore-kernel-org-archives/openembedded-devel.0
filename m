Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD2565E0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Oct 2014 17:41:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Oct 2014 10:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,664,1406617200"; d="scan'208";a="601339836"
Received: from sdimblex-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.65])
	by fmsmga001.fm.intel.com with ESMTP; 06 Oct 2014 10:40:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 06 Oct 2014 18:40:21 +0100
Message-ID: <2085629.65ZAJKt6JU@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <20141006173427.GX25706@jama>
References: <1412589301-6669-1-git-send-email-koen.kooi@linaro.org>
	<CAP0W-RkD2rwdWPKt=mkyGYPC8ahx56DEybrrSv3Lv_zsVDKi9Q@mail.gmail.com>
	<20141006173427.GX25706@jama>
MIME-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] php: update to 5.4.33
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
X-List-Received-Date: Mon, 06 Oct 2014 17:41:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 06 October 2014 19:34:27 Martin Jansa wrote:
> On Mon, Oct 06, 2014 at 07:24:23PM +0200, Koen Kooi wrote:
> > On 6 October 2014 17:31, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > On Mon, Oct 06, 2014 at 11:55:01AM +0200, Koen Kooi wrote:
> > > > One patch was a backport and can be dropped, add Upstream-status to
> > > > the
> > > 
> > > others.
> > > 
> > > Can we build modphp here and drop separate recipe:
> > > meta-webserver/recipes-php/modphp/modphp_5.5.15.bb
> > > 
> > > Currently they overlap in staged files, so only one of them will get
> > > built anyway.
> > 
> > We can probably do that, but I have no idea what the difference between
> > the recipes is, I just fix the QA warnings in the build :)
> 
> deja-vu :)
> http://comments.gmane.org/gmane.comp.handhelds.openembedded/57964
> 
> +Paul

I suspect the answer as to why they were split was that people building 
standalone php didn't want to build apache as well when they were never going 
to use it or mod_php.

I'm generally in favour of the recipes merging (and with the cleanup that has 
been done over the years to the php recipe, that ought to be easier), but I'd 
prefer to see it done as a shared inc file at least to begin with. It's on my 
todo list but if someone wants to beat me to it, don't hold back ;)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

