Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RiJOy-000838-1x
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jan 2012 06:28:40 +0100
Received: by iakh37 with SMTP id h37so28138077iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jan 2012 21:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=QXTBQ41gZ0dsO7YHnlsMd2RIDRA6CVzSFN6IyDbRT8k=;
	b=FjFOAG9C9FQZPGZZmqWW3G2aJqp+uCvpAlbyKxmDDMzU2MNhbg3U/0Jh4zhiJZAdHI
	og7kP6I6ni3B5xc5BDiC2zBKkfqRW+V0amGjzc2rK2691plvuW/LKHP76pYJhtFPY+1U
	hBsvejkZ8x+bz8Co6duHsdlx+ftcQ0eOghamk=
Received: by 10.50.168.4 with SMTP id zs4mr65210753igb.28.1325654478177;
	Tue, 03 Jan 2012 21:21:18 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id lu10sm93404161igc.0.2012.01.03.21.21.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 21:21:16 -0800 (PST)
Date: Tue, 3 Jan 2012 21:21:38 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120104052138.GH31275@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <308727D9E105A34D845E688AECAF6F470A718A9A@DLEE74.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <308727D9E105A34D845E688AECAF6F470A718A9A@DLEE74.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: rt-tests recipe
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
X-List-Received-Date: Wed, 04 Jan 2012 05:28:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (27/12/11 13:25), Baransi, Moosa wrote:
> Hi All,
> 
> I am using the arago-devel with branch "next".
> 
> When building the rt-tests recipe, I get an error that the package cannot be found.
> Searching the web shows that the git was move from git.kernel.org to github. I changed the recipe (rt-tests_git.bb) accordingly:
> 
> 
> -SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tglx/rt-tests;protocol=git"
> 
> +SRC_URI = "git://github.com/clrkwllms/rt-tests.git;protocol=git"
> 
> When doing so, the package is found and the recipe compiles OK.
> 
> Are you aware of such an issue?


can you prepare a proper patch and submit pull request for 2011.03
maintenance branch please ?


