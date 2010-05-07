Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OAPDk-0005EF-HG
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 17:12:09 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 3716649127F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 May 2010 17:08:21 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 7 May 2010 17:09:27 +0200
Message-ID: <4BE42D03.2070800@dresearch.de>
Date: Fri, 07 May 2010 17:08:51 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE41DF5.7040805@dresearch.de>	<1273242036-7529-1-git-send-email-sledz@dresearch.de>
	<20100507145850.GJ3204@jama>
In-Reply-To: <20100507145850.GJ3204@jama>
X-OriginalArrivalTime: 07 May 2010 15:09:27.0230 (UTC)
	FILETIME=[491505E0:01CAEDF7]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox/syslogs: use update-alternatives for syslog selection
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
X-List-Received-Date: Fri, 07 May 2010 15:12:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 07.05.2010 16:58, Martin Jansa wrote:
> One more issue with this part, partialy explaining what went wrong in
> that log. You're not creating syslog.busybox, so real /etc/init.d/syslog
> is not packaged and after u-a /etc/init.d/syslog points to non-existing
> /etc/init.d/syslog.busybox and that's why update-rc.d says it doesn't
> exist.

Forgot a little modification in do_install. Will be fixed in the
next patch version.

Thanx,
Steffen



