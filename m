Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MTJMk-00088X-MT
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 19:43:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 0F4DA518105
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2009 13:28:59 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04191-06 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 21 Jul 2009 13:28:58 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id DB6C15180F8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2009 13:28:58 -0400 (EDT)
Message-ID: <4A65FADA.4070604@cbnco.com>
Date: Tue, 21 Jul 2009 13:28:58 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A65F5D8.6060503@atmel.com>
In-Reply-To: <4A65F5D8.6060503@atmel.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [RFC] Fix native perl so it builds on x64 OpenSuSE 11.1
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
X-List-Received-Date: Tue, 21 Jul 2009 17:43:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ulf Samuelsson wrote:
> The native perl build  fails on my x64  OpenSuSE 11.1 machine.
> People suggest that disabling ODBM_File will fix this problem.
> It works for me...

Yeah, this looks like it would fix it.

The problem is SuSE 11's gdbm-devel 1.8.3 installs some hacked-up 
include file in /usr/include/dbm.h (it's not the one from stock gdbm 
1.8.3), and Perl looks there. Meanwhile, gdbm-native 1.8.3 in OE doesn't 
stage dbm.h, so even if perl-native looked in the right place, the 
module wouldn't build. So both perl-native and gdbm-native need a fix, 
or this (afaik unused) module can just be disabled.

Mike


