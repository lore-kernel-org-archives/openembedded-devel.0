Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MiVcG-0008Jo-9I
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Sep 2009 17:49:52 +0200
Received: by bwz6 with SMTP id 6so54567bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2009 08:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=C3f1buaNvhtiheJqNY1sZDoPvibK/5T4vf4RZK4DAnM=;
	b=UF7oEjEk8B03pPrnp5Wxk+37NoQglFwQDBFt7eVe/ft0hGq0XC1TU9fepjaEIEMCdx
	u2z32sOIyzhVaa+3r2xkaIzmvb0UHc0tloCinJ7qV37hFTgaZJybW7kdVUIWJfEHnPaF
	lQb+VQCJioYoU4yR30OzgqDe6fBeg1W5IqZDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=aKsb6F7+CwErlU+XMozb/wgoNx32M8+5iMFMpH6nIYpLf3YNtw/WXZKZDysdd0qYzK
	WEtkBVPBbLOkYuytwRoLSeoM/InDpkgXhu4DzmRmjyDl+E8PaqfIWM9MEYxhwmWBH78n
	aTfDSiPgiJa5tuO0hRMX/H+Pbb0V1K2JyuU2A=
Received: by 10.103.84.32 with SMTP id m32mr2987125mul.33.1251819072041;
	Tue, 01 Sep 2009 08:31:12 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id j10sm4380864muh.56.2009.09.01.08.31.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Sep 2009 08:31:11 -0700 (PDT)
Date: Tue, 1 Sep 2009 08:31:02 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090901153102.GA12420@gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830094809.GB26823@gmail.com>
	<200908311333.20189.marcin@juszkiewicz.com.pl>
	<20090901055731.GA22534@gmail.com>
	<57768.87.139.24.177.1251793302.squirrel@home.opfer.tk>
MIME-Version: 1.0
In-Reply-To: <57768.87.139.24.177.1251793302.squirrel@home.opfer.tk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Tue, 01 Sep 2009 15:49:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/09/09 10:21), Dirk Opfer wrote:
> >
> > Attached implementation is based on this suggestion. I have not done
> > wholesale change to distro confs only for micro and minimal.
> >
> > I tested this patch with
> >
> >
> > for targ in `ls openembedded/conf/machine/*.conf|cut -d '/' -f 4|cut -d
> > '.' -f 1`; do echo -n "$targ "; MACHINE=$targ DISTRO=minimal bitbake -e
> > |grep TARGET_OS=\"; done
> >
> > and all machine confs were giving correct values for TARGET_OS
> > also I repeated same test with DISTRO=minimal-uclibc
> >
> > Comments ?
> 
> e300 doesn't implement the signal processing engine (SPE).
> Only e500v1 and e500v2 supports these instructions.

yes thats right. Thanks for pointing it out.
-Khem


