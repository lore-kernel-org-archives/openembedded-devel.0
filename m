Received: from mailrelay04.sunrise.ch ([194.158.229.47]
	helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1OVgFl-0000ir-60
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jul 2010 09:38:09 +0200
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	o657NqBo003035; Mon, 5 Jul 2010 09:23:53 +0200
Message-ID: <4C3188C4.2080402@vollmann.ch>
Date: Mon, 05 Jul 2010 09:24:52 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTilva4t_1fBYfzHthbUInh43adY9VYbU9EjgZL7V@mail.gmail.com>
	<1278021694.30247.438.camel@rex> <4C3093B0.5090603@vollmann.ch>
	<AANLkTilFDDCYu-dFabnPFc34UwJGTIlwuMy1WcxPlUA_@mail.gmail.com>
In-Reply-To: <AANLkTilFDDCYu-dFabnPFc34UwJGTIlwuMy1WcxPlUA_@mail.gmail.com>
X-SA-Exim-Connect-IP: 194.158.229.47
X-SA-Exim-Mail-From: dv@vollmann.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} Disable multilib in gcc recipes
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
X-List-Received-Date: Mon, 05 Jul 2010 07:38:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/10 19:52, Khem Raj wrote:
> On Sun, Jul 4, 2010 at 6:59 AM, Detlef Vollmann <dv@vollmann.ch> wrote:
>> But what you need to keep in mind if you actually drop multilib support
>> is that you need to rename the prefix for the SDK toolchains.
>> It would be bad if PowerPC 32-bit and 64-bit toolchains were both named
>> powerpc-angstrom-linux-
> 
> I think that does not happen. toolchain prefix is generally ${TARGET_ARCH}-x-x
> for 64 bit powerpc TARGET_ARCH = "powerpc64"
But TARGET_ARCH typically doesn't include what typ of floating point
you have.

   Detlef



