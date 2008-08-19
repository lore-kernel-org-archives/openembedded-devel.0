Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KVYTw-0003px-Ln
	for openembedded-devel@openembedded.org; Tue, 19 Aug 2008 23:11:12 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1KVYSp-0007JE-3p
	for openembedded-devel@openembedded.org; Tue, 19 Aug 2008 21:10:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 19 Aug 2008 21:10:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 19 Aug 2008 21:10:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 19 Aug 2008 23:05:29 +0200
Message-ID: <g8fcip$p2j$2@ger.gmane.org>
References: <1219122247.7224.337.camel@dfarning.desktop.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080700)
In-Reply-To: <1219122247.7224.337.camel@dfarning.desktop.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Sugar Desktop
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
X-List-Received-Date: Tue, 19 Aug 2008 21:11:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

David Farning wrote:
> I am wondering if there is interest in creating OE packages for the
> Sugar desktop [1].  Development of Sugar, which was originally designed
> for the One Laptop Per Child, has been spun off to Sugar Labs.
>
> We are interest in expanding the number of devices which run Sugar.  Our
> goals of running on inexpensive, low power machines aligns nicely with
> those of embedded devices.

Great! I've started on adding sugar stuff (sugar-toolkit and sugar are 
already in), but then I stumbled across the usual wrong assumptions in 
buildsystems:

sugar-artwork-0.82.0/cursor/cursorthemegen/.libs/lt-cursorthemegen: 
cannot execute binary file

My opterons can't execute ARM code. Could you *please* fix those issues 
upstream so that every sucrose part cross-compiles cleanly?

regards,

Koen



