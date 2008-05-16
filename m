Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jx7S6-0005QV-5U
	for openembedded-devel@openembedded.org; Fri, 16 May 2008 23:26:58 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jx7QH-0003qX-9I
	for openembedded-devel@openembedded.org; Fri, 16 May 2008 21:25:05 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 16 May 2008 21:25:05 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 16 May 2008 21:25:05 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 16 May 2008 23:24:54 +0200
Message-ID: <g0ku37$m4g$1@ger.gmane.org>
References: <200805161611.50480.geoffrey@pager.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008050803)
In-Reply-To: <200805161611.50480.geoffrey@pager.net>
Sender: news <news@ger.gmane.org>
Subject: Re: AVR32 segfaults / Disablng virtual/libintl?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 16 May 2008 21:26:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Geoffrey Wossum wrote:
> Hi all,
>
> I've had some odd segfaults on my AVR32 system, mostly involving avahi (always
> on startup) and the occasional Xfbdev crash.  I didn't bother looking into it
> until now, because aplay was always crashing before it even got to main(),
> which was making difficult to test my sound CODEC.
>
> I found that both avahi-daemon and aplay were both crashing before they got to
> main(), and they both crashed due to infinite recursion calling the function
> _pthread_cleanup_push_defer().
>
> Due to the crash being in a thread related function, I focused my initial
> attention there, but now I think the problem is related to gettext.  If I
> hand compile aplay and keep it from linking against libintl, it doesn't
> crash.  Haven't tried the same thing on avahi, but I suspect libintl/gettext
> is also the problem there since they were crashing exactly the same way.
>
> I don't need any i18n any these types of applications.  As a workaround, can I
> keep gettext from being built and use the libintl stubs provided by uClibc?
> How do I do this?  PREFERRED_PROVIDER_virtual/libintl = ""?
> PREFERRED_PROVIDER_virtual/libintl = "uclibc"?

That should work as long as you have wchar and intl stubs in uclibc. I 
would *very* much like to use the uclibc ones instead of the gettext 
ones, if only to get cleaner builds :)

regards,

Koen

>
> TIA,
> ---
> Geoffrey




