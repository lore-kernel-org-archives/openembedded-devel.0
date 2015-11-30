Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id C608F601D4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 14:05:09 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1a3P4i-0000J2-Ca for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2015 15:05:04 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 15:05:04 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 15:05:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 30 Nov 2015 15:00:49 +0100
Message-ID: <n3hkqh$fv0$1@ger.gmane.org>
References: <1448440079-4533-1-git-send-email-jackie.huang@windriver.com>
	<1448440079-4533-2-git-send-email-jackie.huang@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
In-Reply-To: <1448440079-4533-2-git-send-email-jackie.huang@windriver.com>
Subject: Re: [PATCH 2/2] iscsitarget: skip the arch test for kernel modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Nov 2015 14:05:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 25-11-15 om 09:27 schreef jackie.huang@windriver.com:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> Kernel modules may not have the same architecture as user space.

LOL

> So we tell INSANE_SKIP to skip checking the arch for the modules.
> This is consistent with other kernel modules and the kernel recipe.

Split this recipe in 2: one recipe for userspace, the other for kernel space.



