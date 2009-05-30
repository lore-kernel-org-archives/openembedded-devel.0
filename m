Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MAW6a-0004VY-Dk
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 23:28:40 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MAVyF-0002vw-37
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 21:20:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 21:20:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 21:20:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 30 May 2009 23:15:49 +0200
Message-ID: <gvs7m5$3ha$4@ger.gmane.org>
References: <1243535013-10090-1-git-send-email-msmith@cbnco.com>	<20090528193604.GB2625@denix.org>	<4A1EF22E.2040500@balister.org>
	<4A1EF581.30503@cbnco.com>
	<loom.20090530T193103-897@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <loom.20090530T193103-897@post.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 1/2] tcpdump: fix mix of tabs and spaces in do_configure()
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
X-List-Received-Date: Sat, 30 May 2009 21:28:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30-05-09 21:44, Michael Smith wrote:
> Michael Smith<msmith<at>  cbnco.com>  writes:
>
>> Philip Balister wrote:
>>> It doesn't look like Michael has commit access. I did try applying it,
>>> and git-am said there was a mix of tabs and spaces.
>
>> Yes, the SRC_URI lines were lined up with spaces. It looked nice enough
>> that I didn't fix it;
>
> Hi Philip,
>
> How can I get git am to warn about the mixing? I tried git am
> --whitespace=error-all on the mbox file from patchwork, but it doesn't seem to
> find a mix; actually, in the patch files there are no added lines with spaces,
> only removed lines and a context line.

Ignore git-am "errors" about whitespace. If I add a patch to a recipe 
and do git format-patch in that commit (so you get a patch in a patch) 
git-am will scream bloody murder for something that has no actual 
whitespace errors.
I suspect that the only time you can trust git output is when your name 
is Linus and work on kernel code.

regards,

Koen



