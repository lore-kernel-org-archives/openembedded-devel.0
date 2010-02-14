Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NgjLY-0000JH-1X
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 19:37:35 +0100
Received: by bwz19 with SMTP id 19so2984486bwz.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 10:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=OcsWpOqAxdWy681jc+tlvDR1oKIGRXOanRw4tFSvwis=;
	b=nqr8vVpbgs0xubctf2XSWpkr5WZr3gSfWDJQfRTAZMilDgtQSW4nsnVQhcD7sDbIRE
	xiBJLs6yk/U7uYMI9c6JXJGjJOwXsI6JeHMH2DmqI5/whsV4SPLjiT5qcXiRjxTMeVFB
	2oxtzQ35dft5R5jC/hMdoxG02mmEU1KDDPaoE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Xr2xgaB3iTr+5XuUccMZ98rUMTvReXy3RX70y0TkrP2ZwkbIrwq9pxoTWrKG0s/0Iw
	+tSawLrevWi7yskxbvYd+e+IiD3CXrRriIJitmV5ojw0B/S3RInz8ag8uey4EN+fLVqi
	J9ix3kIQ8AqZPyCZtsHUOyXJ5iCVw2ACxrc1s=
Received: by 10.204.35.79 with SMTP id o15mr927470bkd.106.1266172493525;
	Sun, 14 Feb 2010 10:34:53 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 15sm2316094bwz.12.2010.02.14.10.34.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 14 Feb 2010 10:34:52 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NgjLz-0006uo-OA; Sun, 14 Feb 2010 19:37:59 +0100
Date: Sun, 14 Feb 2010 19:37:59 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100214183759.GH30265@mx.loc>
References: <20100214170414.GG30265@mx.loc>
	<20100214173347.2B1D61817E775@dd20204.kasserver.com>
MIME-Version: 1.0
In-Reply-To: <20100214173347.2B1D61817E775@dd20204.kasserver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: = ? UTF-8 ? B ? Ww== ? =oe= ? UTF-8 ? B ? XQ== ? = How to sane replace a path in a pkgconfig file ?
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
X-List-Received-Date: Sun, 14 Feb 2010 18:37:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 14, 2010 at 06:33:45PM +0100, bernhard.guillon@opensimpad.org wrote:
>> On Sun, Feb 14, 2010 at 03:23:09PM +0100, bernhard.guillon@opensimpad.org wrote:
>> >Hi all,
>> >currently I am working on fixing blackbox. I had to add a lot of includes to fix compiler errors.
>> 
>> I have an import of the CVS tree here, fyi:
>> http://git.busybox.net/~aldot/git/blackboxwm/
>> http://git.busybox.net/~aldot/git/bbkeys/
>> 
>> There were a couple of debian's patches applied (still by brad), i'd
>> recommend to use all blackbox-0.70.1..master patches and base off that.
>> 
>
>Hi,
>thanks for the hint, the debian patch for the includes looks like mine so I will use the debian patch for updating the recipe :)
>
>But my problem is not the compiler errors but openembeddeds pkgconfig class.

I'm aware of that but unfortunately i can't help you with the pkgconfig class.

>When will pkgconfig be called? Before or after do_stage()? What is the right function to place the code of replacing  the wrong path of the pkgconfig file? The original package does it in do_stage() but it seems at least on my build system that pkgconfig class is called after do_stage(). 

classes/pkgconfig.bbclass suggests that .pc are fixed up in
do_install_prepend() (why does the efl class duplicate this, btw?)
and that this depends on stage.

btw.. someone should
sed -i -e s/vw/w/ docs/usermanual/reference/class_pkgconfig.xml

>Also is it safe to just replace the path in pkgconfig files in do_install_prepend()? Because then there is no file with the build path. 
>
>So I need a function which gets called after pkgconfig class?

I'd try to remove that explicit .pc handling from blackbox and see what
happens and start from there (i.e. don't know yet).

cheers,
Bernhard


