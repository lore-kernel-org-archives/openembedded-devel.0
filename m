Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LyYJl-0002Kb-2y
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 23:24:49 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LyYEp-0006t7-4w
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 21:19:43 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 21:19:43 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 21:19:43 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 27 Apr 2009 23:19:30 +0200
Message-ID: <gt57h3$8cv$1@ger.gmane.org>
References: <c384c5ea0904271240p7450829fn26a7a7f6bf6752c3@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090421 Shredder/3.0b3pre
In-Reply-To: <c384c5ea0904271240p7450829fn26a7a7f6bf6752c3@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: TARGET_CC_ARCH += "${LDFLAGS}" ??
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
X-List-Received-Date: Mon, 27 Apr 2009 21:24:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-04-09 21:40, Leon Woestenberg wrote:
> Hello,
>
> I just came across this fix:
>
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=413cc98aa563c9e6104d1104d5b24987ab9d12f8
>
> which does:
>
> +TARGET_CC_ARCH += "${LDFLAGS}"
>
> to fix LDFLAGS QA(GNU-hash).
>
> but doesn't this approach abuse TARGET_CC_ARCH?

It is, but the alternative is to patch each and every 
(c)makefile/sconscript/bjam for the project, which is very time 
consuming. If you have the time, patch the buildsystem, but realize that 
you will need to maintain those patches for every release if you don't 
get them upstream.

regards,

Koen



