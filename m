Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OEHZD-0007Y5-5z
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 09:50:22 +0200
Received: by pxi14 with SMTP id 14so2695096pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=mEAS36F5i07ktjj+rN8bqDoYiee1deJt0fCm84tewn4=;
	b=TudYKc5Igzpi8UAtBuK435ZZPclwnumx/etNgiNKSBZ28M/nybWcbFlXgiw52nkTR8
	C5Ua7CFoX48J3tige0MervRKkhZHaR7G4RjdGTjjbupo0j33ZVpdNHwoS/+LMqEwamKY
	CMwEBj7gnQ4ObS5LJjb6RPHAgWaFsAWuDPU3s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dVmAKRMwLn+NFoRBV9G6fyo0z12FoQMrQ3eiNynva1bzXNWairb2c3yOvNKAUbrdWj
	YxxlFs3dqdRv3cVrG57G/obW8k2sABfQIFWkhtfF0OO2sRGh53Dg19EHbsf9YKOMZqo/
	NqUkBumzjAz3XKt2oOZwHymHGUGkx2OEs/M7w=
Received: by 10.115.64.20 with SMTP id r20mr5472784wak.205.1274168775067;
	Tue, 18 May 2010 00:46:15 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c22sm56460044wam.18.2010.05.18.00.46.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 18 May 2010 00:46:13 -0700 (PDT)
Date: Tue, 18 May 2010 00:46:06 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100518074606.GA19476@gmail.com>
References: <AANLkTinL4kGrM6P5Di1N4KI-95sFuEwDn-RM_SZ32cjS@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinL4kGrM6P5Di1N4KI-95sFuEwDn-RM_SZ32cjS@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problem at the very beginning
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
X-List-Received-Date: Tue, 18 May 2010 07:50:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/05/10 09:03), Grzegorz Toporek wrote:
> Hi all,
> 
> I'm new to the mailing list so I would like to say hello to everyone. I'm
> new to OE/bitbake as well so please be patient...
> 
> I was trying to build busybox package but unfortunately I got this error. Is
> it a type conversion problem?  I got this with "Simple Helloworld" either...
> 
> What should be mentioned, there was no a problem to build this for
> angstrom-2008.1 distribution (machine om-gta01). Now I have changed it to
> colibri, which is my boar, and the problem occurred.
> 
> I have attached all my .conf files to this e-mail.
> 
> Please help me with this problem. Looking forward to your reply.
> 
> ERROR:
> 
> NOTE: Handling BitBake files: \ (7927/8366) [94 %]NOTE: <type
> 'exceptions.TypeError'>:unsupported operand type(s) for +: 'NoneType' and
> 'str' while evaluating:
>   task-x11-illume   task-fonts-truetype-core   e-wm-menu-shr   shr-wizard
> shr-theme-gry   xcursor-transparent-theme   xinput-calibrator
> libx11-locale   ${@get_rdepends(bb, d)}   e-wm-config-illume2-shr
> ERROR: unsupported operand type(s) for +: 'NoneType' and 'str' while parsing
> /home/grzesiek/tele/openembedded/recipes/tasks/task-shr-minimal.bb
> NOTE: Handling BitBake files: / (8366/8366) [100 %]
> NOTE: Parsing finished. 7584 cached, 453 parsed, 328 skipped, 0 masked.
> ERROR: Parsing errors found, exiting...

the python code in
/home/grzesiek/tele/openembedded/recipes/tasks/task-shr-minimal.bb 

depends upon a metadata variable called LIBC and this is not set in your
distro file. This could be one of 'glibc|eglibc|uclibc" depending upon
what system library you want. In your case it seems to be glibc

So if you set 

LIBC = "glibc" in your distro file then it should work.

-Khem


