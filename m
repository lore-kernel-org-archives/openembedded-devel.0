Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MMGgs-0001dt-V1
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jul 2009 09:26:42 +0200
Received: from tamarin.localnet (unknown [92.117.201.117])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id D9C191B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jul 2009 07:14:24 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
Date: Thu, 2 Jul 2009 09:14:04 +0200
MIME-Version: 1.0
Message-Id: <200907020914.04919.holger+oe@freyther.de>
Subject: uclibc questions and impressions
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
X-List-Received-Date: Thu, 02 Jul 2009 07:26:43 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hey,

I'm currently attempting a uclibc/x86 build and have stumbled across some 
issues and I wonder what other people think about it and how they want to fix 
it.


1.) uClibc.machine mess...

A uClibc.machine needs to include KERNEL_HEADERS, if not it will default to 
/usr/include... which will create all sorts of issues. It can included 
anything as we will fix it...

Proposal: put KERNEL_HEADERS in the default uClibc.machine...



TARGET_ARCH and arch floating point must be set...

Proposals:
  a) Error when a uClibc.machine is missing
  b) Split uClibc.machine further into uClibc.arch and uClibc.machine?
      Reasoning: Do we really need uClibc.machine for qemux86, x86,
      x86-foo...?
  c) ???


2.) libc-uclibc unawareness...

What:
conf/distro/include/uclibc.inc at least sets the OVERRIDES .= ":libc-uclibc" 
but is only included by angstrom and not minimal-uclibc, micro-uclibc...

Proposal:
Kill linux-uclibc and linux-uclibcgnueabi in favor for the libc-uclibc 
override, make micro-uclibc and minimal-uclibc include the uclibc.inc as well?



does this sound reasonable?
	z.


