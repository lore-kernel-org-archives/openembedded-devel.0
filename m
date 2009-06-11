Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MEbAJ-0004eJ-95
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 05:41:23 +0200
Received: from [0.0.0.0] (asshur.mvista.com [10.0.0.11])
	by hermes.mvista.com (Postfix) with ESMTP id 83DE318076
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2009 20:31:35 -0700 (PDT)
Message-ID: <4A307A97.8030804@mvista.com>
Date: Wed, 10 Jun 2009 20:31:35 -0700
From: Christopher Larson <clarson@mvista.com>
User-Agent: Thunderbird 2.0.0.21 (Windows/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <87k53jiiqe.wl%peter@chubb.wattle.id.au>
	<4A307A57.2040908@mvista.com>
In-Reply-To: <4A307A57.2040908@mvista.com>
Subject: Re: How do I modifly kernel config?
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
X-List-Received-Date: Thu, 11 Jun 2009 03:41:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Christopher Larson wrote:
> Peter Chubb wrote:
>> Hi,
>>    Is there an easy way to make a recipe that builds a kernel with a
>> different .config ?  I know I can copy an entire recipe with my own
>> file://defconfig --- but is that the best way to proceed?
>
> FILESPATHBASE =. "${TOPDIR}/files"

Erm, make that FILESPATHBASE =. "${TOPDIR}/files:".  It's colon separated.


