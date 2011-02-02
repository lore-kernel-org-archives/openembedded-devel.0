Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PkcJn-00080H-Er
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 14:00:19 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 828F6491283
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 13:59:25 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 2 Feb 2011 13:59:25 +0100
Message-ID: <4D49552D.3010705@dresearch.de>
Date: Wed, 02 Feb 2011 13:59:25 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D4929CB.6040009@dresearch.de>
In-Reply-To: <4D4929CB.6040009@dresearch.de>
X-OriginalArrivalTime: 02 Feb 2011 12:59:25.0572 (UTC)
	FILETIME=[04E0BC40:01CBC2D9]
Subject: Re: profiling howto?
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
X-List-Received-Date: Wed, 02 Feb 2011 13:00:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 02.02.2011 10:54, schrieb Steffen Sledz:
> Has anybody some instructions/hints how to enable profiling
> support for selected libs and/or binaries in OE?

The local.conf.sample does contain this section:

# Uncomment these to build a package such that you can use gprof to profile it.
# NOTE: This will only work with 'linux' targets, not
# 'linux-uclibc', as uClibc doesn't provide the necessary
# object files.  Also, don't build glibc itself with these
# flags, or it'll fail to build.
#
# PROFILE_OPTIMIZATION = "-pg"
# SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
# LDFLAGS =+ "-pg"

This seems to do the work for the complete image.

But is it possible to enable profiling for selected libs and/or binaries only?

Steffen




