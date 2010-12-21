Received: from mail-bw0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PV5Fp-00068Y-FX
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 17:40:01 +0100
Received: by bwz12 with SMTP id 12so4786257bwz.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 08:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=rgfG6Rz437DCLkXFnV4IuadLDo1Q50YYlTmudxrJSBo=;
	b=MED/uKeIaJQRimPersCvZC2PlxDkpslmIr5lIzxzh3yyYmzVAvqda1BFHnyV1Bn+R8
	YaHFDphE81DR3GBITpiVAfv/u3WvS977Kxcs7WLtJMhXfO4I9mKHeRE5vLyfIZgbjLqL
	nt/1Qt5A722EGMxtxZ6aKoWqRU/TX2+7x8Mk8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=If6OMQm8X0zCLapMNkch3/d5kpY6VMd196Mne1OBCBk77TNueZnkldMLBEINKsAKh7
	mXHgGXM+6T7PF4d0MkSK3nwNUpKU+exUit7cA1jEivkKCakHXYb3IJL9ooovFgPyv5ii
	owokTMf/g5DQZcUT/DJ8J5DiIHLpxLVNDq7Yg=
Received: by 10.204.55.65 with SMTP id t1mr3682330bkg.140.1292949596492;
	Tue, 21 Dec 2010 08:39:56 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j11sm4482753bka.12.2010.12.21.08.39.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 08:39:55 -0800 (PST)
Date: Tue, 21 Dec 2010 17:39:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101221163937.GJ3282@jama>
References: <20101221133550.GI3282@jama>
 <20101221151113.GC4665@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20101221151113.GC4665@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Tue, 21 Dec 2010 16:40:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 21, 2010 at 07:11:13AM -0800, Khem Raj wrote:
> On (21/12/10 14:35), Martin Jansa wrote:
> > On 2010-10-20 I've pushed newer mesa-7.9
> > http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=30a3ea891d4511059a51882674f33aff2dddb96e
> > which depends on talloc
> > http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=fabce288e40037d28c70f0f034185176f85e8664
> > and separate talloc recipe (because building whole samba just to provide talloc for mesa seems wrong
> > and samba produced ICE before khem's fix) 
> > http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=afce52663d6b5b79c097136fa794dd3f76a4afff
> > 
> > Today I noticed, that usr/lib/pkgconfig/talloc.pc from talloc recipe was enough for mesa to compile, 
> > but because there was no libtalloc.so link it wasn't used in the end (as ldd confirms).
> > 
> > so talloc stages:
> > bitbake@jama ~ $ ll tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.*
> > -rwxr-xr-x 1 bitbake bitbake  32K Dec 21 13:30 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.a
> > -rwxr-xr-x 1 bitbake bitbake  73K Dec 21 13:30 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.so.2.0.1
> > bitbake@jama ~ $ ll tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/pkgconfig/talloc.pc
> > -rw-r--r-- 1 bitbake bitbake 251 Dec 21 13:30 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/pkgconfig/talloc.pc
> > 
> > samba adds:
> > bitbake@jama ~ $ ll tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.*
> > lrwxrwxrwx 1 bitbake bitbake   14 Dec 14 13:33 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.so -> libtalloc.so.1
> > -rwxr-xr-x 1 bitbake bitbake 123K Dec 14 13:33 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.so.1
> > 
> > now for sure I don't want to install whole samba on target (just for libtalloc) so I have few options
> > 
> > 1) fix talloc to install libtalloc.so -> libtalloc.so.2.0.1 (conflicts with samba in sysroot)
> > 2a) move libtalloc to separate package in samba recipe and make mesa depending on samba
> > 2b) move libtalloc to separate package in samba recipe in case someone builds 
> >     it before mesa, but still depend only on fixed talloc
> > 3) fix talloc + force samba build to use already installed libtalloc instead of building own version
> > 
> > Option 3) looks best, but I'm not sure how tightly samba depends on talloc 
> > and don't have time to test all samba versions we currently have
> > (3.0.23c, 3.0.34, 3.2.15, 3.3.0, 3.3.9, 3.5.6), so 2b) looks as easier fix.
> > 
> > CCed 2 samba maintainers (wrt MAINTAINERS file) or if there is someone who cares about samba
> > recipes: can you clean recipes/samba a bit and provide some feedback on talloc issue?
> 
> I think its the same problem as described here 
> http://lists-archives.org/samba/39218-re-re-libtalloc-on-samba-3-2-0.html
> 
> I think disabling the use of shared libs would be an ok solutions to. Try
> that out.

Hi,

after reading
http://lists.freedesktop.org/archives/mesa-dev/2010-August/002523.html
and checking how is this solved in gentoo, I have tried Option 3) 
(see resulting 2 patches sent here)

and resulting /usr/sbin/smbd is not linked to libtalloc
(--without-talloc seems enough).

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


