Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PV3rn-0004Lq-Uv
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 16:11:08 +0100
Received: by ywi6 with SMTP id 6so1877992ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 07:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/uyF8pcKqftXTZBWq3hlS+3lm5d0Iz/60f64eAbItmY=;
	b=YCIT9tm8sJbqBtxbngPp1dyJAZ98RNcR69pUBY+FI4Xo7SE39zASJaVZ1trSd+SLCH
	qBICGgeiivTQv+byB0ySFwVNjPy90gHGtLOu2wAlxVc8++znLOfbUm93dh4UmDLQYO6j
	oLpt3yhunJJhqDSE3U6pfXnYragxy4xku3yZk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Rklo7xyS5j9CWCH6K/WJMEJXlD7DISCaWVh8NwuxiCfLVuNambQo8q9V6H64BH4Rfs
	EPKd23aVpe4gLvBufz01ENHnFByIJPJwcelcpsVSWjq0tBM+LP6ZqTurE20l7rTv1OaH
	03tn26u0pkTGb8utM7BmcRlzJ9mz7/s57LY6g=
Received: by 10.150.57.16 with SMTP id f16mr8864290yba.16.1292944260535;
	Tue, 21 Dec 2010 07:11:00 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id l4sm8238466ybj.21.2010.12.21.07.10.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 07:10:59 -0800 (PST)
Date: Tue, 21 Dec 2010 07:11:13 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101221151113.GC4665@gmail.com>
References: <20101221133550.GI3282@jama>
MIME-Version: 1.0
In-Reply-To: <20101221133550.GI3282@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: nail@nslu2-linux.org, tim.ellis@foonas.org
Subject: Re: mesa depending on samba or samba depending on extern talloc?
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
X-List-Received-Date: Tue, 21 Dec 2010 15:11:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/12/10 14:35), Martin Jansa wrote:
> On 2010-10-20 I've pushed newer mesa-7.9
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=30a3ea891d4511059a51882674f33aff2dddb96e
> which depends on talloc
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=fabce288e40037d28c70f0f034185176f85e8664
> and separate talloc recipe (because building whole samba just to provide talloc for mesa seems wrong
> and samba produced ICE before khem's fix) 
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=afce52663d6b5b79c097136fa794dd3f76a4afff
> 
> Today I noticed, that usr/lib/pkgconfig/talloc.pc from talloc recipe was enough for mesa to compile, 
> but because there was no libtalloc.so link it wasn't used in the end (as ldd confirms).
> 
> so talloc stages:
> bitbake@jama ~ $ ll tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.*
> -rwxr-xr-x 1 bitbake bitbake  32K Dec 21 13:30 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.a
> -rwxr-xr-x 1 bitbake bitbake  73K Dec 21 13:30 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.so.2.0.1
> bitbake@jama ~ $ ll tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/pkgconfig/talloc.pc
> -rw-r--r-- 1 bitbake bitbake 251 Dec 21 13:30 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/pkgconfig/talloc.pc
> 
> samba adds:
> bitbake@jama ~ $ ll tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.*
> lrwxrwxrwx 1 bitbake bitbake   14 Dec 14 13:33 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.so -> libtalloc.so.1
> -rwxr-xr-x 1 bitbake bitbake 123K Dec 14 13:33 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.so.1
> 
> now for sure I don't want to install whole samba on target (just for libtalloc) so I have few options
> 
> 1) fix talloc to install libtalloc.so -> libtalloc.so.2.0.1 (conflicts with samba in sysroot)
> 2a) move libtalloc to separate package in samba recipe and make mesa depending on samba
> 2b) move libtalloc to separate package in samba recipe in case someone builds 
>     it before mesa, but still depend only on fixed talloc
> 3) fix talloc + force samba build to use already installed libtalloc instead of building own version
> 
> Option 3) looks best, but I'm not sure how tightly samba depends on talloc 
> and don't have time to test all samba versions we currently have
> (3.0.23c, 3.0.34, 3.2.15, 3.3.0, 3.3.9, 3.5.6), so 2b) looks as easier fix.
> 
> CCed 2 samba maintainers (wrt MAINTAINERS file) or if there is someone who cares about samba
> recipes: can you clean recipes/samba a bit and provide some feedback on talloc issue?

I think its the same problem as described here 
http://lists-archives.org/samba/39218-re-re-libtalloc-on-samba-3-2-0.html

I think disabling the use of shared libs would be an ok solutions to. Try
that out.

> 
> Regards,
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


