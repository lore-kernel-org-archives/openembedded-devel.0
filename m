Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UPXEL-0000gn-0p
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 14:01:05 +0200
Received: from [10.1.14.186] (83-64-248-68.inzersdorf.xdsl-line.inode.at
	[83.64.248.68]) by ptmx.org (Postfix) with ESMTPSA id 1AABA200E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2013 13:43:35 +0200 (CEST)
Message-ID: <5163FEE6.4010401@pseudoterminal.org>
Date: Tue, 09 Apr 2013 13:43:34 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1365463467-5893-1-git-send-email-dv@pseudoterminal.org>
	<kk0d9f$qip$1@ger.gmane.org> <5163E52F.9000206@pseudoterminal.org>
	<CAJTo0LY+3C3kEJYS_FAtKvz9Pw-oJhfM90brVwfFngO-_6gyGg@mail.gmail.com>
In-Reply-To: <CAJTo0LY+3C3kEJYS_FAtKvz9Pw-oJhfM90brVwfFngO-_6gyGg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2] add recipe for mpg123, a decoder for MPEG-1 layer 1, 2, and 3
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
X-List-Received-Date: Tue, 09 Apr 2013 12:01:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2013 12:03 PM, Burton, Ross wrote:
> On 9 April 2013 10:53, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
>> Hmm, perhaps I should change it. mpg123 tries to autodetect the machine then
>> anyway. I just added these options to ensure it picks the right ones without
>> having to autodetect anything.
> How does it detect?  Traditional "what am I running on?" tests won't
> work as it's being cross-compiled...
>
> Ross
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

In configure.ac it looks at the $host variable and matches it against 
patterns , for example x86_64-*-linux* . Manual cross compilation showed 
that it correctly detects the host this way.

Carlos


