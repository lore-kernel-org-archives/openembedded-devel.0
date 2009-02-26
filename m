Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LcjOi-0008V9-Bt
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 17:47:48 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LcjLU-0000Hs-Vd
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 16:44:24 +0000
Received: from p030043.dynamic.ppp.asahi-net.or.jp ([221.113.30.43])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 26 Feb 2009 16:44:24 +0000
Received: from no2spam by p030043.dynamic.ppp.asahi-net.or.jp with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Feb 2009 16:44:24 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 27 Feb 2009 01:44:14 +0900
Message-ID: <go6gt0$5hp$1@ger.gmane.org>
References: <go498c$bqq$1@ger.gmane.org>	<200902261144.46548.openembedded@haerwu.biz>
	<49A69217.3070705@opensimpad.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p030043.dynamic.ppp.asahi-net.or.jp
User-Agent: Thunderbird 2.0.0.19 (X11/20090103)
In-Reply-To: <49A69217.3070705@opensimpad.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Thu, 26 Feb 2009 16:48:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Bernhard Guillon wrote:
>> mkdir recipes-broken
>> git add  recipes-broken
>> git mv recipes/obsolete recipes-broken/obsolete
>> git mv recipes/nonworking recipes-broken/nonworking

+1

> I like this idea. But we should add a description file to the recipe on 
> which arch it is broken or why it is obsolete.

Oh no, please no.  Not yet another file which people will ignore ;-) 
That is what the commit message and "git log 
recipes/obsolete/$somepackage" is for.



