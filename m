Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MaWrM-0002Dg-Fd for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 17:32:29 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MaWbf-0006wu-Dc for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 15:16:15 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 15:16:15 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 15:16:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 10 Aug 2009 17:16:02 +0200
Message-ID: <h5pdjj$1sp$1@ger.gmane.org>
References: <200908101645.25246.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090716 Shredder/3.0b4pre
In-Reply-To: <200908101645.25246.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Mon, 10 Aug 2009 15:32:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10-08-09 16:45, Marcin Juszkiewicz wrote:
>
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
>     that on my system x86-64 libraries/headers are used nevermind for
>     which target I try to build. Result is disaster.
>
> Any ideas how to solve that? I gave up.

One could try to teach perl-native to support sysroot.....




