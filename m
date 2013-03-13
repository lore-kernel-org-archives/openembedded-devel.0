Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amy.fong@windriver.com>) id 1UFmKq-0002m3-Bs
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 15:07:27 +0100
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2DDoX5s027467
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 06:50:34 -0700 (PDT)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>) id 1UFm4f-0008En-EQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 09:50:33 -0400
Date: Wed, 13 Mar 2013 09:50:33 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313135033.GA31648@windriver.com>
References: <20130312211938.GA11498@windriver.com>
	<4C920E00-4E5F-47FF-9DB5-FCE7AE02E08B@gmail.com>
	<20130313031343.GA18570@windriver.com>
	<CF5E1B15-C4C2-454C-82E1-A5214320C4CA@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CF5E1B15-C4C2-454C-82E1-A5214320C4CA@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: question on App bitsize - need the same as the kernel (multilib situation)
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
X-List-Received-Date: Wed, 13 Mar 2013 14:07:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 12, 2013 at 08:25:55PM -0700, Khem Raj wrote:
> 
> On Mar 12, 2013, at 8:13 PM, Amy Fong <amy.fong@windriver.com> wrote:
> 
> > It may be a combination of kernel ppc64 + userspace ppc (32);
> > or kernel x86-64 + userspace x86-32.
> 
> 
> I think you to ship ppc64 C runtime at least and same is true for x86_64
> and by bit size you mean machine word length right ? like sizeof(long)

Uhhhh no, what I mean is, 

e.g.

For userspace, if 32bit:
root@localhost:~# file /bin/bash
/bin/bash: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.34, stripped

For kernel, if 64bit:
(in kernel config)
CONFIG_64BIT=y
# CONFIG_X86_32 is not set
CONFIG_X86_64=y
CONFIG_X86=y

Take for example, I want to run crash to do some kernel debugging, in this case,
I would want crash to be 64bits.

> > On Tue, Mar 12, 2013 at 03:41:29PM -0700, Khem Raj wrote:
> >> 
> >> On Mar 12, 2013, at 2:19 PM, Amy Fong <amy.fong@windriver.com> wrote:
> >> 
> >>> I need to build an application that has the same bitsize as the kernel. But in
> >>> my multilib configuration, the default usersapce bitsize is not the same as 
> >>> the kernel's bitsize. How do you do this?
> >> 
> >> which arch is this ?
> >> since generally we have one in multilib combo that matches kernel bit size
> >> but you might have left it out. 
> >> 
> >>> 
> >>> Thanks!
> >>> Amy
> >>> 
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >> 
> >> 
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


