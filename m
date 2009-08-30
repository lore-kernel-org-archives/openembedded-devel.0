Received: from [209.85.223.195] (helo=mail-iw0-f195.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mhi5s-0006Rz-6u
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 12:57:09 +0200
Received: by iwn33 with SMTP id 33so1390932iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2009 03:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=RkEpCZLpXWYJD7ny8HQdDSyiuqcJNXlBplCiwP+mQ7Y=;
	b=rDvsb/BJ1W6sali0GVa69aoYw4f1JrciKlgx5guKyElocJM+JFtJARAajKo+PTPbxS
	S7JCfI7NW/Wq3KbA6k46vkAJIi2Nx5g+ZPbi/GE+snBthunrn5yaUNyU1osz2UZA6dR6
	gpf5cs6nydJG/JM3ZhvAwIeDaz9NePtDHtJoA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=kRD9D36609miAaUgoxnnorvlKgVP+EGqPLrBHsOlFtVZ56Za9nwP2qJKfuitm7xJo+
	Yd0UFogPIR0Txh1CAsxXPaXDmjJ6Voewr0CMvrmcl2oNs0t45fnSwxS662N2V3lx7wPd
	c7KSgReTn2xTVy3OIQ0wdNiC794cfuUjrPT6Y=
Received: by 10.231.81.148 with SMTP id x20mr4546937ibk.2.1251628723087;
	Sun, 30 Aug 2009 03:38:43 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id 21sm271204pzk.15.2009.08.30.03.38.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 30 Aug 2009 03:38:42 -0700 (PDT)
Date: Sun, 30 Aug 2009 03:38:36 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090830103836.GA19944@gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<20090829020254.GC6785@smtp.west.cox.net>
	<19c1b8a90908290050q60b6d47dw7b559087e343dc41@mail.gmail.com>
	<20090830012244.GA5033@gmail.com>
	<1251619852.4215.666.camel@lenovo.internal.reciva.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830092250.GA16275@gmail.com>
	<1251626062.4215.687.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1251626062.4215.687.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS	= linux-gnuspe for e500
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
X-List-Received-Date: Sun, 30 Aug 2009 10:57:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (30/08/09 10:54), Phil Blundell wrote:
> On Sun, 2009-08-30 at 02:22 -0700, Khem Raj wrote:
> > based upon your idea in last email. Here is something I put together
> > seems to work. It will need testing ofcourse
> > 
> > What do you think about this one ?
> 
> Thanks for the update.  This looks like generally the right idea, except
> that I still feel it is undesirable for an innocuous-looking change of
> MACHINE to result in far-reaching abi consequences.  So we need to
> figure out a way to deal with that.

I think some machines are incapable of dealing with EABI requirements.
thats why this dependency of machines and sometimes machines also
dictate ABI like e500 pushes you to use gnuspe. So I think ABI is tied
to machine in some ways.

> 
> A few other specific comments about the patch:
> 
> > +python detect_arm_abi () {

yeah the follow up patch was more accurate than this one
there I have made it as you suggest below.

> 
> This doesn't really need to be an OE function.  You can declare it
> directly as Python:
> 
> def detect_arm_abi():
> 
> > +       if bb.data.getVar("TARGET_ARCH", d, 1) in [ 'arm', 'armeb' ]:          
> > +               if bb.data.getVar('MACHINE',d) in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']:
> > +                       return "oabi"
> > +               return "eabi"
> > +       else
> > +               return ""
> 
> Notwithstanding the thing about MACHINE that I mentioned above, this
> logic doesn't really look like it can be correct.  There are only two
> valid ARM ABIs: eabi and oabi, and I would have thought this function
> should always pick one or the other.  In other words, I don't think that
> returning "" should be a valid result.

actually it returns oabi or eabi if architecture is arm otherwise it
returns empty string

> 
> > +       if bb.data.getVar('TARGET_ARCH',d,1) in ['bfin']:
> > +               os_suffix = "uclinux"
> > +       else
> > +               os_suffix = "linux"
> 
> I'm not terribly convinced that this is desirable; TARGET_OS itself has
> always been a primary user configuration variable and I'm not entirely
> comfortable with making it be an auto-guessed thing.  I'm also not very
> keen on doing anything to cement the perception that OE is, somehow,
> only for Linux targets.  But I guess I am open to persuasion on this
> one.

A lot of toolchain configuration depend upon TARGET_OS one can easily
get is wrong. So IMO its better to synthesize it correctly.

For second point, I think we can accomodate non linux os_suffixes but it
will add to complexity for no good reason as of now. The function is
easily extendable when the need comes.

I think using arm-linux-gnu (OABI) arm-linux-gnueabi (EABI) would be
more  logical at present we use arm-linux for OABI that said using
linux-gnu on other arches is also nice thing to do.

Similarily for uclibc/EABI we use arm-linux-uclibcgnueabi probably using
arm-linux-uclibceabi(EABI)  and arm-linux-uclibc(OABI) would be cleaner. 

If this seems acceptable I can roll this change as well.

> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


