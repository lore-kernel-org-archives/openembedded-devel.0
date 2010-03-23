Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NuB1O-0007QI-3W
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 21:48:19 +0100
Received: by fxm25 with SMTP id 25so25294fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 13:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=DSrjp249zINzrfYv9G0zvTYxoTQTdrv48Hvx8OzzHYQ=;
	b=AQH0x+Ghym7JZa75MrDV5jvZwTvZ9l5Zn/sPRZI3hsiJEX1nrd0au8kLk8jloQBcc9
	srw+KqhO9itr4lLJ8DR5KXw7D4KHK1oKbwIGKofhSHfZKtXd2JkSSs9E7uz4YfhT2nEC
	QcACseVHGxrKUHRvjds8Zx2rxNGoUQ53wS1XQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=twh8aa1e3o5WQ01VbWAvnq+H8/EkQhVzZwOSZKHKTKS9z4Rg2rHqxm3Hoo1p4o2twZ
	Xcc1zXzNGsZM5eGKVWqiDI4Exg96w7SXPI32tb7zPxUebCpuuuqwwMutvwZYmAc/eCKq
	DdTCHtrm3KlWa2bqjdPR830liahqY0d/hI0lo=
Received: by 10.87.62.28 with SMTP id p28mr602844fgk.16.1269377106594;
	Tue, 23 Mar 2010 13:45:06 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d4sm1264998fga.5.2010.03.23.13.45.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 23 Mar 2010 13:45:05 -0700 (PDT)
Date: Tue, 23 Mar 2010 13:45:11 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100323204511.GA12446@gmail.com>
References: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com>
	<20100323094757.GE21210@jama>
MIME-Version: 1.0
In-Reply-To: <20100323094757.GE21210@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBVERSIONS
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
X-List-Received-Date: Tue, 23 Mar 2010 20:48:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/03/10 10:47), Martin Jansa wrote:
> On Mon, Mar 22, 2010 at 03:26:53PM -0700, Chris Larson wrote:
> > Greetings all,
> > 
> > Thoughts? Questions? Concerns?  I've been wondering if this is really
> > worthwhile, but I think it is.  I think there is value in keeping old
> > versions around, but this allows us to avoid cluttering up the repository as
> > much, and makes it so that one change to a recipe can affect all the
> > versions in that range by default, or all versions, rather than just the one
> > version you tested.  Of course, ideally you'd test all versions, but that's
> > the case today too, its just that now our recipes get bitrotted instead.
> >  Personally, I'd rather see the old version content continue to be brought
> > forward by default, and if it fails to build with that, we fix it, but it's
> > easier to fix a build than to unclutter the repository.
> > 
> > I'm hoping to get some input on this :)

I think it could be an useful experiment as an option for packages which
dont change so much as the releases progress. However adding stuff to build
for multiple version in same recipe can be error prone. I have seen this
happening with changes made to .inc files when other recipes break
silently.

Currently we have per version recipes (roughly) which gives a playground
for a given version one can do customization fairly easily and they are
contained.

If I make change to a given version the recipe will also affect other
versions even if nothing of interest was done for those versions due to say PR bump isnt it ?

I think moving bitrotted recipes to different location is probably also a good
way to speed up parsing time for general users without changing the bb
files too much. 

Recently asking new users about bitbake they were pretty much confused with
syntax I think this will add to it.

Thanks

-Khem


