Received: from mailrelay04.sunrise.ch ([194.158.229.47]
	helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@vollmann.ch>) id 1Qiv1A-0006Mh-LO
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 23:06:20 +0200
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	p6IL2Sem006137; Mon, 18 Jul 2011 23:02:28 +0200
Message-ID: <4E249F56.8030907@vollmann.ch>
Date: Mon, 18 Jul 2011 23:02:14 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E248688.1030902@vollmann.ch>
In-Reply-To: <4E248688.1030902@vollmann.ch>
Subject: Re: preferred version not available
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
X-List-Received-Date: Mon, 18 Jul 2011 21:06:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/11 21:16, Detlef Vollmann wrote:
> NOTE: preferred version githead of linux-taurus not available (for item
> linux-taurus)

> What really drives me nuts is the last line: it clearly parsed
> linux-taurus_githead.bb before, doesn't give me any error on it,
> but then tells me 'preferred version githead of linux-taurus not
> available'. It's clearly there, so why is it not available?
Ok, I found the problem: PREFERRED_VERSION refers to PV inside
the recipe, not to the part of the filename after '_'.
As I tinker with PV inside the recipe, bitbake is actually correct
that a PV 'githead' is not available for linux-taurus.

   Detlef


