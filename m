Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8nx4-00026C-Nz
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 05:40:06 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8nvm-000742-AC for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 23:38:44 -0500
Date: Thu, 12 Nov 2009 23:38:01 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4AFC854D.8040302@balister.org>
Message-ID: <alpine.LFD.2.00.0911122330370.24167@localhost>
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<200911120656.41249.holger+oe@freyther.de>
	<200911120722.09166.holger+oe@freyther.de>
	<alpine.LFD.2.00.0911120125380.1977@localhost>
	<ac9c93b10911120015j5b8cbc07j30f57f2dc68987ca@mail.gmail.com>
	<alpine.LFD.2.00.0911120727540.7268@localhost>
	<ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>
	<4AFC58B0.3080000@mwester.net>
	<1258062144.13299.1.camel@gnutoo-desktop>
	<4AFC854D.8040302@balister.org>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Fri, 13 Nov 2009 04:40:06 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 12 Nov 2009, Philip Balister wrote:

> On 11/12/2009 04:42 PM, GNUtoo wrote:
> > > Is it practical?  I think the answer is no.  In my experience,
> > > tools like selinux have a tendency to require inordinate amounts
> > > of administrative burden that just isn't practical in a
> > > development environment.  I think requiring that selinux be
> > > disabled on build hosts is a reasonable requirement, and will
> > > avoid wasting a lot of cycles that should be spent on OE, and
> > > not on administration (or sending lots of emails).

> > What about supporting only the unconfined user selinux
> > type(unconfined_u),in targeted mode?
>
> I'm running default Selinux on F11, I don't think we can just say OE
> must have SELinux turned off.

  at the very least, selinux needs to be configured to allow
/proc/sys/vm/mmap_min_addr = 0.  here's the corresponding selinux
diagnostic you get because of that:

Summary:

SELinux is preventing
/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/bin/qemu-arm
"mmap_zero" access on <Unknown>.

Detailed Description:

[SELinux is in permissive mode. This access was not denied.]

SELinux denied access requested by qemu-arm. The current boolean
settings do not allow this access. If you have not setup qemu-arm to
require this access this may signal an intrusion attempt. If you do
intend this access you need to change the booleans on this system to
allow the access.

Allowing Access:

Confined processes can be configured to run requiring different
access, SELinux provides booleans to allow you to turn on/off access
as needed. The boolean mmap_low_allowed is set incorrectly. Boolean
Description: Allow certain domains to map low memory in the kernel

Fix Command:

# setsebool -P mmap_low_allowed 1

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


