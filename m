Received: from [74.125.78.149] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MaXse-0003ua-9R
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 18:37:52 +0200
Received: by ey-out-1920.google.com with SMTP id 3so768417eyh.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 09:21:40 -0700 (PDT)
Received: by 10.210.129.20 with SMTP id b20mr2993909ebd.83.1249921300038;
	Mon, 10 Aug 2009 09:21:40 -0700 (PDT)
Received: from ?192.168.1.64? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 24sm539940eyx.23.2009.08.10.09.21.35
	(version=SSLv3 cipher=RC4-MD5); Mon, 10 Aug 2009 09:21:39 -0700 (PDT)
Message-ID: <4A804907.4090504@xora.org.uk>
Date: Mon, 10 Aug 2009 17:21:27 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200908101645.25246.marcin@juszkiewicz.com.pl>
In-Reply-To: <200908101645.25246.marcin@juszkiewicz.com.pl>
Subject: Re: State of Perl in OpenEmbedded
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
X-List-Received-Date: Mon, 10 Aug 2009 16:37:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> Hi
>
> It is over 2 years since we got Perl 5.8.8 from Jamie Lenehan. We are 
> able to cross-compile Perl, we can build CPAN modules but thats all.
>
> I wanted to run irssi on sheevaplug (under Angstrom). But this IRC 
> client is more usable when compiled with Perl support. It is not 
> possible at all with OpenEmbedded. Why?
>
> 1. We do not stage libperl at all. Fix is simple but see next point.
> 2. Software checks for perl cflags/ldflags by calling Perl. This means 
>    that on my system x86-64 libraries/headers are used nevermind for
>    which target I try to build. Result is disaster.
>
> Any ideas how to solve that? I gave up.
>
> Regards, 
>   
Doesnt emacs have the same problem and ends up using qemu to do the tests?

Graeme



