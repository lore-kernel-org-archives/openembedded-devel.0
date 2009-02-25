Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LcQp2-0006tc-GV
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 21:57:40 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LcQls-0000eE-Jv
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 20:54:24 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 20:54:24 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 20:54:24 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 25 Feb 2009 21:54:14 +0100
Message-ID: <go4b5m$imv$1@ger.gmane.org>
References: <go498c$bqq$1@ger.gmane.org> <20090225204137.GA25095@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090219 Shredder/3.0b3pre
In-Reply-To: <20090225204137.GA25095@denix.org>
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
X-List-Received-Date: Wed, 25 Feb 2009 20:57:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-02-09 21:41, Denys Dmytriyenko wrote:

> Speaking of TMP and outside of it - does it make sense to have DEPLOY outside
> of TMP by default in OE? I do it in Arago, but I had to make a small fix in
> base.bbclass though - see bug #4580.

That's exactly what I'm talking about :) I was thinking of a structure 
like this:

/OE/org.openembedded.dev # metadate
/OE/conf # local.conf, auto.conf, site.conf
/OE/tmp # work/ stamps/ cache/ rootfs/
/OE/target # ipk,deb,rpm/ images/
/OE/build # staging, cross, pstage packages
/OE/downloads # DL_DIR

That just leaves finding a place for sdk output and things like 
sourcepkg and source_distribute.

This isn't an RFC yet, since I haven't worked it all out yet, but don't 
let that stop you from sending in an RFC :)

regards,

Koen





