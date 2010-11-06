Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1PEhoE-00074p-Bt
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 13:23:52 +0100
Received: by eya28 with SMTP id 28so2239081eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 05:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:reply-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=uROfxvdJ9xR2iRRk+BgECnRGi5ddQNVB/+9kOr94y9M=;
	b=AvmLp031TZtOQI4caiACWLKKj8e4vOijz+hrdZ+oW2AyDmUE0ysffbPe31rSRR+sV9
	4atzEdqfuArds9nv66+zWn3tMiQfmXix6t7kaa7bBIaFwwmOBDCGVsd3d/SWBH+tmzda
	B+xkkDn6wfMRY3AJX+WvHWYhYiUuunm55Jr5I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=EfxuuQbO2iIMDB+IlBCCibjrA/KUOiaYEvv0/LwGjpQFJ5utyyM6z+iSpWRCxlcMmn
	/knuToQL3Qhr2iWCbzR6Ytj9VUHu0QQM/KRL4tG4/SKOhIiX2lpEicmq8Cxhpmxa0k2h
	E9fasdqaXhr2go4Ej8QoW6Me6zYbYQKHU9MxA=
Received: by 10.14.48.5 with SMTP id u5mr1778447eeb.25.1289046177931;
	Sat, 06 Nov 2010 05:22:57 -0700 (PDT)
Received: from localhost (c-e3dee555.010-30-6c6b7012.cust.bredbandsbolaget.se
	[85.229.222.227])
	by mx.google.com with ESMTPS id x54sm2085895eeh.5.2010.11.06.05.22.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 06 Nov 2010 05:22:57 -0700 (PDT)
Date: Sat, 6 Nov 2010 13:22:52 +0100
From: Kristoffer Ericson <kristoffer.ericson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101106122252.GC1314@boggieman.bredbandsbolaget.se>
References: <20101105235600.GA3671@boggieman.bredbandsbolaget.se>
	<AANLkTin_S+1w109vBADYQPaG=8onZzMK7t87dFO4WDPc@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTin_S+1w109vBADYQPaG=8onZzMK7t87dFO4WDPc@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kristoffer.ericson@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ARMv4 not working with latest gcc,eglibc
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
X-List-Received-Date: Sat, 06 Nov 2010 12:23:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Nov 06, 2010 at 02:28:12AM -0700, Khem Raj wrote:
> On Fri, Nov 5, 2010 at 4:56 PM, Kristoffer Ericson
> <kristoffer.ericson@gmail.com> wrote:
> > Hi,
> >
> > Khems addition of gcc 4.5 patch effectivly removed the thumb 'bx' instruction from
> > the binaries, but Im getting the exact same issue as before (kernel panic at init time).
> >
> 
> what is your kernel version ?
> I would suggest to try a different one. There are reports og gcc 4.5
> miscompiling 2.6.35
> 

Alright, the previous kernel didnt have EABI active in kernel config. So now it works (with your added patch).
Big thanks for help

> > Filip zyzniewski had the combination of gcc 4.4.2 + eglibc 2.12 working well on his machine,
> > I also know another person with an ARMv4t which used gcc 4.5 + eglibc 2.12 without any issues (with same distro file).
> > Therefore I still believe its an compiler/thumb issue.
> > Im currently trying to reproduce filips environment to make sure, once I do it should be confirmed.
> >
> > Best wishes
> > Kristoffer Ericson
> > http://www.jlime.com
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


