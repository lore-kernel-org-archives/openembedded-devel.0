Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTe0k-0007YW-1w
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 19:27:02 +0100
Received: by iahk25 with SMTP id k25so3333492iah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 10:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ydZcodM3qfMW8bsVdLuhtTtnL4ij6doOnhYB7lJJpjo=;
	b=iQF1pRZQ1RKAGPqL8BReQze4Rn6Wo08OQeb5WPPRBbtvEU3lRg76ZC94j4beclDgKp
	5vAaNxJdSlruK2ehBEunf5jX027o/9xy/yqCEWQ9bR1Vk5h62IqqE4gkE7EQ5uB8m8f4
	Xkg0Vk6ODdc4p2zzBd9pXMTet4AA4gbfYO594=
Received: by 10.42.168.202 with SMTP id x10mr8466558icy.4.1322158828329;
	Thu, 24 Nov 2011 10:20:28 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id dd36sm90058851ibb.7.2011.11.24.10.20.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 10:20:26 -0800 (PST)
Date: Thu, 24 Nov 2011 10:27:13 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Mr Dash Four <mr.dash.four@googlemail.com>
Message-ID: <20111124182713.GH28767@sakrah.homelinux.org>
Mail-Followup-To: Mr Dash Four <mr.dash.four@googlemail.com>,
	openembedded-devel@lists.openembedded.org
References: <4EC81A85.8050704@googlemail.com>
	<CAMKF1srcWq1mD4wNZEi2Eff2iMCVcwvjL_swTJ7z1Y6=qjZA1Q@mail.gmail.com>
	<4ECE4B0D.6030401@googlemail.com> <4ECE5422.3070504@googlemail.com>
	<20111124174936.GA28767@sakrah.homelinux.org>
	<4ECE87A9.8040109@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <4ECE87A9.8040109@googlemail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: "cannot find -lppl_c" link error
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
X-List-Received-Date: Thu, 24 Nov 2011 18:27:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/11/11 18:06), Mr Dash Four wrote:
> 
> >>Am I missing something here or is this a bug?
> >I think the fact that you have ppl/cloog installed its trying to use it
> >general distros dont install them by default and hence more often gcc
> >with OE is build without them.
> >
> >what we could have done in OE is disable ppl/cloog exlicitly in
> >configure
> OK, but how does this tie up with the error I am getting? The
> ppl/cloog libs are clearly installed and in the library path, but
> the toolchain's gcc cannot be build because the said libraries
> "cannot be found"? How do I correct this so that my build could
> proceed further?

I have no idea OTOH probably adding --with-ppl=no --with-cloog=no
to EXTRA_OECONF might help

-- 
-Khem


