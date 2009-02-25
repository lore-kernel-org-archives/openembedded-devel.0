Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LcFw5-00075S-0e
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 10:20:15 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LcFt1-0002Bn-Ob
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 09:17:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 09:17:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 09:17:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 25 Feb 2009 10:16:54 +0100
Message-ID: <go32a7$p53$1@ger.gmane.org>
References: <200902131728.08634.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <200902131728.08634.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: checksums situation
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
X-List-Received-Date: Wed, 25 Feb 2009 09:20:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-02-09 17:28, Marcin Juszkiewicz wrote:
> Hi
>
> It is nearly two years since conf/checksums.ini was introduced. We
> populated it with over 6000 entries during that time (mostly by
> automatic fetching of all source on CELF and EWI machines). But there
> are problems with it's format.

I think most issues people have with it can be solved (or worked around) 
by setting

OE_STRICT_CHECKSUMS = ""

in either local.conf or bitbake.conf. It will make the checker still 
abort if the sums changed, but missing sums aren't fatal and get 
reported to the user[1] with a bb.note (as well as being put into 
TMP/checksums.ini).

Another nice fix would be to check only the leafname, not the complete 
uri. Collision isn't a problem since we put all files in a single dir 
after downloading anyway.

regards,

Koen

[1] with bitbake 1.8.x, bitbake 1.9.x hides bb.note



