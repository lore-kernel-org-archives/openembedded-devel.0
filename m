Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GT46m-00060m-8X for openembedded-devel@lists.openembedded.org;
	Fri, 29 Sep 2006 00:11:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 0FC2EB0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2006 00:06:54 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 18751-10 for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2006 00:06:49 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 9562AB0A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2006 00:06:49 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20060928213929.GA6160@twibble.org>
References: <E1GStq9-0003dN-FU@linuxtogo.org>
	<20060928132713.GA32288@twibble.org>
	<1159458235.6791.27.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<20060928213929.GA6160@twibble.org>
Organization: VanilleMedia
Date: Fri, 29 Sep 2006 00:06:49 +0200
Message-Id: <1159481209.6791.32.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: [oe-commits] org.oe.dev glibc 2.4: Apply recently	added	patches only fo x86.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Sep 2006 22:11:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Freitag, den 29.09.2006, 07:39 +1000 schrieb Jamie Lenehan:
> Hmm, maybe it's those new linux-libc-headers that I see went in a few
> days ago - they might now be exporting those *at functions when they
> weren't before and therefore glibc is now picking them up. I'm still
> using the 2.6.15.99 headers. I'll test with those newer ones now.

Right. A couple of days ago, glibc-intermediate stopped building for me
wanting linux headers >= 2.6.17. I built the new 2.6.18 kernel-based
headers then
(which are still DEF_PREF=-1).

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




