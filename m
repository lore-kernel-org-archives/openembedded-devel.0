Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P0DNV-0000aD-4u
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 15:04:22 +0200
Received: by bwz2 with SMTP id 2so3330490bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 06:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=MQLQCXrT7WcarQTbNqeUr0eHVbPnuOG6IvS3czVmg9E=;
	b=isAzGidNZdOmoolxf90Kj0mopr5P+JIbkN3sFQT3oxk1Grt/BypeXkNC2zQfALybzs
	izCzMZa915W3kb3Qp3xDTCMmEKWAJFZvjLXMGGw0QsdX+FxDSxKb376MjULR0qnTy8Ug
	ZU4t3icutcJYDfWTEF3NY0Du499mspiWT0Wow=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=B085G8fzddcGvQx8QMRcAMqaKmqIu1obHALo22JY4c+Zt15W7n68nIvLnD9RBdhgMA
	Qp4ensaX+vftUXiMhR5HC/dCJSq4qZ2ix6eTvSTgr3XGeETAUo5hmKUnvUpvKyymTtI4
	+ZK8AeVrvh+23hQAWtO7kXqCVzbJTOTXNV8dw=
Received: by 10.204.50.206 with SMTP id a14mr5282882bkg.65.1285592647912;
	Mon, 27 Sep 2010 06:04:07 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id g12sm4355346bkb.2.2010.09.27.06.04.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 27 Sep 2010 06:04:07 -0700 (PDT)
Date: Mon, 27 Sep 2010 15:04:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100927130431.GI6483@jama>
References: <AANLkTi=Wt1eRcSoXzjwMJizLBgQ-+hV=Xj1UWW155MWQ@mail.gmail.com>
	<20100926112659.GB6483@jama>
	<AANLkTimQJUyZRsX6a5EA4FruiM5DVVbVD8e676Ri+ARe@mail.gmail.com>
	<4CA084B6.4070404@mwester.net>
	<AANLkTiku8QxSPdShCwUgsxphHYTRpf+fg5XE++jBgegW@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTiku8QxSPdShCwUgsxphHYTRpf+fg5XE++jBgegW@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some more non fetching recipes
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
X-List-Received-Date: Mon, 27 Sep 2010 13:04:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 27, 2010 at 02:51:24PM +0200, Frans Meulenbroeks wrote:
> To clarify:
> Things that do not fetch because they require a manual download with
> accepting a license etc, I do not consider as broken.
> And of course we should keep these (I know the ixp4xx situation quite well).
> But how many of those do we have? I know about the ixp4xx and some ti
> ones. Maybe there are a few more that I missed but then again, most of
> the ~1000 recipes Martin mentioned and a lot of the recipes I listed
> above do not fall into this category but refer e.g. to a cvs server
> that is not there any more, to a version, tag or tarball that does not
> exist etc etc.
> 
> For me those recipes are broken. And if it is a recipe that is broken
> for a prolonged amount of time, there is apparently no interest in it,
> and personally I would like to have this indicated one way or another,
> or, even better, move these recipes into a dedicated folder(like
> nonworking). In that case the recipe is still there should somebody be
> interested in it, but it does not clutter up the main recipe dir.
> (and note again that I feel things like the ixp4xx and the ti codecs
> etc do not fall into this group).
> 
> And yes: we can also try to repair them by finding alternate sources
> etc (although this might be hard if someone changed from cvs to git).
> Then again if the recipe has been broken for a long time, without
> anyone taking action, filing a bug, reporting it on the list, I feel
> that there is not really interest in that recipe any more and
> personally I see it as a waste of time to try to repair them.

When I did this test, I've fixed those SRC_URI where I found new
location (usually moved to old subfolder etc.)

Then there was many recipes where original SRC_URI didn't work but I was 
able to find it with google ie 
http://familiar.handhelds.org/source/
was great source for really old releases, but I didn't change SRC_URIs
in this case because I don't know how long it will be there and it
doesn't feel like "proper" mirror. But because my main goal was to test
checksums I was moving to from checksums.ini to recipes it was enough
for me. And I didn't include those in my "download status" - but they
still cannot be downloaded (but at least I have them locally in
downloads dir).

Then there were other recipes where I wasn't able to find source
archive even with google (listed as 404 in status).

Some recipes with different checksums (then I kept checksums from
checksums.ini and noted that in status).

And worst case were recipes where original SRC_URI downloaded ie some
.html about domain no longer existing - which was detected as mismatched
checksums and needed manual check (those were also listed in status).

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


