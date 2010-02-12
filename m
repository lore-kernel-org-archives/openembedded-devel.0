Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NfxDb-0008IP-8u
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 16:14:10 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 24C6C491284
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 16:11:34 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 12 Feb 2010 16:12:38 +0100
Message-ID: <4B756FA7.2080800@dresearch.de>
Date: Fri, 12 Feb 2010 16:11:35 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <22B019BE-6BD8-4748-A263-54A1CB919CA4@vanille-media.de>	<1265903466-22758-1-git-send-email-sledz@dresearch.de>	<1265903466-22758-2-git-send-email-sledz@dresearch.de>
	<20100211160724.GB5364@jama>
In-Reply-To: <20100211160724.GB5364@jama>
X-OriginalArrivalTime: 12 Feb 2010 15:12:38.0788 (UTC)
	FILETIME=[D08F7440:01CAABF5]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] vala-dbus-binding-tool: relocate native recipe from freesmartphone subdir
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
X-List-Received-Date: Fri, 12 Feb 2010 15:14:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Martin Jansa wrote:
>>  .../vala-dbus-binding-tool-native_git.bb           |   10 ----------
>>  .../vala-dbus-binding-tool-native_git.bb           |   10 ++++++++++
>>  2 files changed, 10 insertions(+), 10 deletions(-)
>>  delete mode 100644 recipes/freesmartphone/vala-dbus-binding-tool-native_git.bb
>>  create mode 100644 recipes/vala-dbus-binding-tool/vala-dbus-binding-tool-native_git.bb
> 
> Why not use that non-native package or at least that new .inc file or
> ideally BBCLASSEXTENDS?

Hmmm? I'm not really familiar with BBCLASSEXTENDS.

I believe sharing recipe stuff between non-native and native
packages i could realize like in recipes/vala/. But i've
no idea how to bring the numbered version we need (0.1.3)
together with the git version the freesmartphone guys use.

Anyone an example for this?

Steffen




