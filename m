Received: from mailrelay04.sunrise.ch ([194.158.229.47]
	helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@vollmann.ch>) id 1Qj4ey-0004G5-Ln
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jul 2011 09:24:04 +0200
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	p6J7KFwT016522; Tue, 19 Jul 2011 09:20:15 +0200
Message-ID: <4E253020.4050001@vollmann.ch>
Date: Tue, 19 Jul 2011 09:20:00 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E248688.1030902@vollmann.ch> <4E249F56.8030907@vollmann.ch>
	<CABcZANnmZwTK147Vwgv8j9omd7xNQQK5EKT99_UEctC2itw3Jw@mail.gmail.com>
In-Reply-To: <CABcZANnmZwTK147Vwgv8j9omd7xNQQK5EKT99_UEctC2itw3Jw@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Jul 2011 07:24:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/11 23:05, Chris Larson wrote:
> On Mon, Jul 18, 2011 at 2:02 PM, Detlef Vollmann<dv@vollmann.ch>  wrote:
>> Ok, I found the problem: PREFERRED_VERSION refers to PV inside
>> the recipe, not to the part of the filename after '_'.
>> As I tinker with PV inside the recipe, bitbake is actually correct
>> that a PV 'githead' is not available for linux-taurus.
>
> All variables which are typically set by the filename can be
> overridden. Those are simply defaults. See the definitions of PN, PV,
> and PR in bitbake.conf.
Yes, I knew that (I actually wrote the line changing the PV myself).
What surprised me (though it makes sense) that PREFERRED_VERSION
refers to PV, and not directly to a part of the filename.
It's probably still too much of 'make' history in my brain...

   Detlef


