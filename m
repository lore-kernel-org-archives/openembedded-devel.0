Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1StOn3-0008S8-1C
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 21:59:37 +0200
Received: by yhjj56 with SMTP id j56so5450377yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2012 12:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=1T5EZdjtb8kQR5JEGv91a/ZXsDYiP+7EaPRqkL3MvtQ=;
	b=pEZ/neL+zNa15iqk/q5a7BrBK2DKomiaavt/fgEdPt5ky7LgsblEJzKmNmANDChiLy
	+5N/c/8r6bKz8Xc1V6rJVKD0Eb0W3IVHBQQ5pOTqemISa7aLxlplTunMEE/b5ADNg/Dj
	li0tPQ3nVIQIl92+Fb+RCTOIqIjVuXe88Pr0/UZgb/B1Dz+lomerMfXkZMR4OdDoOMgy
	USpcA7eU1SNYBnV1FRPw7Qnm7dwx/0vd7sW+faEltFeU5tvkVwrI55vrrq3fJPdTOba2
	oObDrGO30abGwaLXizPufa7U++SZ9491ajhJhKogWcmy8VWJyGa+DBswrKhups2mBX9I
	nJWA==
Received: by 10.68.229.2 with SMTP id sm2mr37922559pbc.57.1343072888718;
	Mon, 23 Jul 2012 12:48:08 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:3d27:bb22:b95c:5526])
	by mx.google.com with ESMTPS id hw6sm10526515pbc.73.2012.07.23.12.48.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 12:48:08 -0700 (PDT)
Date: Mon, 23 Jul 2012 12:48:07 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120723194807.GB8985@bill-the-cat>
References: <cover.1342677797.git.apelete@seketeli.net>
MIME-Version: 1.0
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH 0/9] Pull request 20120719
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
X-List-Received-Date: Mon, 23 Jul 2012 19:59:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 19, 2012 at 07:20:31PM +0200, Apelete Seketeli wrote:

> Hello,
> 
> The patches that come as a follow-up of this message fix issues found
> while building muffinman-image on top of the 2011.03-maintenance
> branch.
> These modifications were tested by successfully building
> muffinman-image from scratch on a Debian Squeeze host.
> Please pull into 2011.03-maintenance branch.
> 
> The following changes since commit f9611c025109a3e0d6cebf12f49ae24c97759c09:
> 
>   psplash: convert from svn.o-hand.com to git.yoctoproject.org (2012-07-04 22:34:04 +0200)
> 
> are available in the git repository at:
> 
>   git://seketeli.net/~apelete/oe.git muffinman-image-fix

I have a concern right now.  It is that 9160263 was reported to have
changed the behavior slightly such that some SDK tasks/images now
fail.  So..

[snip]
>   opkg-utils: bump SRCREV to keep python2.6 compatibility

Is a little concerning.  Denys, can you point to an upstream task /
image that fails currently?  Thanks!

-- 
Tom


