Received: from [85.10.209.111] (helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <u.luckas@road.de>) id 1J1fpT-0005Ca-0A
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2007 11:25:39 +0100
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id BCBED390001;
	Mon, 10 Dec 2007 11:21:30 +0100 (CET)
Received: from [192.168.116.44] (ulitu.handy-pc.constin.de [192.168.116.44])
	by slimfast.dyndns.org (Postfix) with ESMTP id 9ABDFAD400B;
	Mon, 10 Dec 2007 11:21:30 +0100 (CET)
Message-ID: <475D132A.6040400@road.de>
Date: Mon, 10 Dec 2007 10:21:30 +0000
From: Uli Luckas <u.luckas@road.de>
User-Agent: Mozilla-Thunderbird 2.0.0.4 (X11/20070828)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200711121044.32094.u.luckas@road.de>	<200711121102.51877.u.luckas@road.de>	<a7f8874a0712051306i3cebae60sfd0a10987612afd0@mail.gmail.com>	<4759292B.3060300@road.de>	<1197027528.4661.12.camel@localhost.localdomain>
	<a7f8874a0712070818h1e0192d1h6c9e91cf48c0c85c@mail.gmail.com>
In-Reply-To: <a7f8874a0712070818h1e0192d1h6c9e91cf48c0c85c@mail.gmail.com>
Subject: Re: [PATHC] ATAG export for the linux kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2007 10:25:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On Friday, 7. December 2007, Hans Henry von Tresckow wrote:
 > I updated http://bugs.openembedded.org/show_bug.cgi?id=3397 with a new
 > patch to filter out the Sharp command line (for poodle at least). Let me
 > know if that approach makes more sense.
 >
Hans Henry,
this patch still contains patch 80-kexec-atags.patch which should be 
obsoleted
by my patch.
The basic idea is that the kexec mechanism already in place moves the 
ATAGs to
the expected location. That's why it does not need any modifications to
arch/arm/kernel/relocate_kernel.S.
Could you please test again with 80-kexec-atags.patch _not_ applied?

Thanks
Uli


-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit



