Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RiVO4-000833-WC
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jan 2012 19:16:33 +0100
Received: by ghrr17 with SMTP id r17so7452559ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jan 2012 10:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=dlRpFzIN2V16YVPEHERfTtcpy78suGnGx/NrMRR/PUE=;
	b=vJ/mBTAaS8lkp20Pu+3wmIVh093sD2pHiij7meW7vwm/oR8LSHIrXQoYf3UPAEw9P4
	L2jH28mN8Pn6LanJ9hCPh6oGxqfZDsitOSdga+/MsYz7A3pMzGCz2tifL9e426bDsjQH
	KnuJuVYpLMZTwCCQup5L4MJzh/eMgfwZxdf6s=
Received: by 10.50.190.196 with SMTP id gs4mr68892825igc.14.1325700550774;
	Wed, 04 Jan 2012 10:09:10 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id
	g34sm191765463ibk.10.2012.01.04.10.09.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jan 2012 10:09:09 -0800 (PST)
Date: Wed, 4 Jan 2012 10:09:32 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120104180932.GD32676@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <CAObi9r-QdBpK9hzwQr1M1tjjKW1F+qLfr2CLbjyWCAuSuEUKAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAObi9r-QdBpK9hzwQr1M1tjjKW1F+qLfr2CLbjyWCAuSuEUKAQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: some ipk contents missed in rootfs - fuse_2.7.4
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
X-List-Received-Date: Wed, 04 Jan 2012 18:16:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (04/01/12 15:27), mgundes wrote:
>          Hi all,
> 
>          I am using classic oe. I try to compile fuse_2.7.4 and everything
> ok but I think "fuse-utils" package contents are not included ro rootfs.


you should have it in IMAGE_INSTALL too.

> "fuse-utils" is in my PACKAGES variable and it is generated, I can see it
> under directories below with other PACKAGES ipks.
> 
> tmp/deploy/ipk/armv6/fuse-utils_2.7.4-r0_armv6.ipk
> tmp/work/armv6-oe-linux-gnueabi/fuse-2.7.4-r0/staging-pkg/deploy/ipk/armv6/fuse-utils_2.7.4-r0_armv6.ipk
> 
> $ *dpkg -c  fuse-utils_2.7.4-r0_armv6.ipk*
> 
> drwxr-xr-x root/root         0 2012-01-04 15:07 ./
> drwxr-xr-x root/root         0 2012-01-04 15:07 ./sbin/
> -rwxr-xr-x root/root      5816 2012-01-04 15:07 ./sbin/mount.fuse
> drwxr-xr-x root/root         0 2012-01-04 15:07 ./usr/
> drwxr-xr-x root/root         0 2012-01-04 15:07 ./usr/bin/
> -rwxr-xr-x root/root      8060 2012-01-04 15:07 ./usr/bin/ulockmgr_server
> -rwsr-xr-x root/root     18296 2012-01-04 15:07 ./usr/bin/fusermount
> 
>          When I check PACKAGES in environments I can see all packages are
> correctly assigned to it.
> 
> $ *bitbake -e fuse | grep PACKAGES=*
> # PACKAGES=fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev
> libulockmgr-dbg ${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-static
> ${PN}-locale
> PACKAGES="fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev
> libulockmgr-dbg fuse-dbg fuse fuse-doc fuse-dev fuse-static fuse-locale
> 
>          Is there any idea, why fuse-utils package contents are not
> included to rootfs but other packages' contents are added?
> 
>          I tried too many thing since yesterday :)
> 
>          All recommendations are wellcome.
> 
> Thanks,
> Regards
> 
> -- 
> MahmutG
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


