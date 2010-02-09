Received: from fmmailgate03.web.de ([217.72.192.234])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1NenAC-0006Eb-FL
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 11:17:51 +0100
Received: from smtp07.web.de (fmsmtp07.dlan.cinetic.de [172.20.5.215])
	by fmmailgate03.web.de (Postfix) with ESMTP id 0B79E13D5A444
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2010 10:51:26 +0100 (CET)
Received: from [79.215.2.96] (helo=merkur.sol.de)
	by smtp07.web.de with asmtp (TLSv1:AES256-SHA:256)
	(WEB.DE 4.110 #314) id 1Nemkf-0006pA-00
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 10:51:25 +0100
Received: from jens by merkur.sol.de with local (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1NemXg-0002Nm-MO
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 10:38:01 +0100
Date: Tue, 9 Feb 2010 10:38:00 +0100
From: Jens Seidel <jensseidel@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100209093757.GB9094@merkur.sol.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: tux-master@web.de
X-Sender: tux-master@web.de
X-Provags-ID: V01U2FsdGVkX196eZQ6WNVK5O0Uh4zxN1XaFeQ2dAC4buKVDcgR
	8RHdKSRdjSzn+yVhLHyeV+4o+2W0E6Vf6w6apmKcpArOttqE6F Z/zHwF7QA=
X-SA-Exim-Connect-IP: 217.72.192.234
X-SA-Exim-Mail-From: tux-master@web.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 02/12] some more !getopt_long fixes
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
X-List-Received-Date: Tue, 09 Feb 2010 10:17:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 08, 2010 at 10:14:23PM +0100, Bernhard Reutner-Fischer wrote:
> -                if [ "$VERBOSE" != no ]
> +                if [ "$VERBOSE" != "no" ]

I don't see any need for this change. Why doesn't the commit message does
not explain why it was done?

I assume it is a stylistic change only and should that's why committed
separately (with a different commit log), right?

Jens


