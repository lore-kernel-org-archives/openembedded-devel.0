Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OQlyT-0007aV-Kl
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 20:44:02 +0200
Received: by pxi3 with SMTP id 3so1571238pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 11:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=5epZtoZ/3wgD/CH19MkeYmOABuVPt9siqxFXIkLcaTA=;
	b=WcKHcSsttXIUdEqu63m+TiELvAxay0KGkjzWQEAikkQ6qXKgNVUFD6l3myDGVD5dsd
	9ZPNGVgVE0RKAWJC3p7EAPt2vnVgKd0XXC1En077yS+BcifBNCqjOaDWxna6xJbn4oeA
	kjWNJhVF51z6ACXw6RjxrwbCXXfhuknrc4SyE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=BSUgzhc45Dn0iYXEByWuGVZnKwF9kGpC4XUpGRwTZ0uYs5C4/32QHEYnufX+FCT7a3
	Z69tyMhlJmllTmIvZTkCGJmzYbkoKQyAO9GoRxw+fmMFtqJi/MNhwVVmWflU8M++c785
	6sxaYN0aTJiPceRtaMPCj5adjtTRxy9ZrVi6I=
Received: by 10.114.188.16 with SMTP id l16mr4329917waf.87.1277145259400;
	Mon, 21 Jun 2010 11:34:19 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id f11sm14574903wai.23.2010.06.21.11.34.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 21 Jun 2010 11:34:18 -0700 (PDT)
Date: Mon, 21 Jun 2010 11:35:18 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20100621183518.GB27606@gmail.com>
References: <1276606987-8681-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<20100621182406.GA27606@gmail.com>
	<lylja8qluj.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lylja8qluj.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] ipkg-utils: convert mtime to int before comparing it
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
X-List-Received-Date: Mon, 21 Jun 2010 18:44:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/06/10 20:31), Enrico Scholz wrote:
> Khem Raj <raj.khem@gmail.com> writes:
> 
> > On (15/06/10 15:03), Enrico Scholz wrote:
> >> The st_mtime attribute (which is a float) is compared against a value
> >> from the timestamp database, which was stored as an integer there.
> >
> >
> > Is it stored as integer or long int? Did you try it on x86_64 box.
> 
> As 'int'. The ipkg-make-index-track-stamps.patch stores them as
> 
> +    pkgsStamps[basename] = fnameStat.st_mtime
>      ...
> +    pkgsStampsFile.write("%d %s\n" % (pkgsStamps[f], f))
> 
> and reads them back as
> 
> +            s, f = l.split(" ", 1)
> +            pkgsStamps[f] = int(s)
> 
> 

OK

Acked-by: Khem Raj <raj.khem@gmail.com>


> > -+          if pkgsStamps.has_key(basename) and fnameStat.st_mtime == pkgsStamps[basename]:
> > ++          if pkgsStamps.has_key(basename) and int(fnameStat.st_mtime) == pkgsStamps[basename]:
> 
> 
> 
> Enrico


