Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MgZUC-0007EX-3d
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 09:33:52 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MgZCh-0008Pf-L4
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 08:15:27 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A962EA9.8010908@xora.org.uk>
References: <E1MgPr6-0006GQ-GT@melo.openembedded.org>
	<4A962EA9.8010908@xora.org.uk>
Date: Thu, 27 Aug 2009 08:15:25 +0100
Message-Id: <1251357326.4215.577.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [oe-commits] Stanislav Brabec : glibc: Install	ld.so.conf, so ldconfig does not complain .
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
X-List-Received-Date: Thu, 27 Aug 2009 07:34:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-08-27 at 07:58 +0100, Graeme Gregory wrote:
> git version control wrote:
> > Module: openembedded.git
> > Branch: org.openembedded.dev
> > Commit: 056a67f6070c5ea561acb65049b551e24f3b7eb6
> > URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=056a67f6070c5ea561acb65049b551e24f3b7eb6
> >
> > Author: Stanislav Brabec <utx@penguin.cz>
> > Date:   Wed Aug 26 21:05:59 2009 +0000
> >
> > glibc: Install ld.so.conf, so ldconfig does not complain.
> >
> >   
> I have the feeling this is the reversal of a previous decision to remove 
> ld.so.conf from rootfs.
> 
> Also its a core change and I don't see any Acked-By:

Agreed, that change seems wrong.  If a particular DISTRO wants to ship
ld.so.conf in glibc then that's fine, but it shouldn't be standard and
definitely not without a USE_LDCONFIG conditional.

p.




