Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LiDNi-0001Pm-7K
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 20:49:22 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGG00HYFN0NBR9A@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	13 Mar 2009 14:48:29 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 49D4E6B83B5; Fri,
	13 Mar 2009 15:48:23 -0400 (EDT)
Date: Fri, 13 Mar 2009 15:48:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090313194823.GC26615@denix.org>
References: <000801c99992$45c23440$d1469cc0$@com>
	<87myc57vz3.fsf@neumann.lab.ossystems.com.br>
	<000401c99f26$ddb43c00$991cb400$@com>
	<be7a9f3d0903090954m72f9cafbw8f03af0906bf74ca@mail.gmail.com>
	<001401c9a335$eec4f850$cc4ee8f0$@com> <20090312185731.GB1109@denix.org>
	<000501c9a410$c7f03510$57d09f30$@com>
MIME-version: 1.0
In-reply-to: <000501c9a410$c7f03510$57d09f30$@com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] Added new recipe for a newer version of the	Asterisk Soft-PBX
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
X-List-Received-Date: Fri, 13 Mar 2009 19:49:22 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 13, 2009 at 08:20:30PM +0100, Christian P?ssinger wrote:
> Denys Dmytriyenko on March 12, 2009 7:58 PM wrote:
> > 
> > The checksums.ini patch is not correct:
> > 1. the closing square bracket is misplaced
> > 2. the entry is not sorted (use contrib/source-checker/oe-checksums-
> > sorter.py)
> > 
> 
> Hopefully this is now my last attempt.
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 9d578c1..463c58b 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -1754,6 +1754,10 @@
> sha256=85331e63c90370c305121f134358e76cbb06846a12c04a7825d5869f331ee00d
>  md5=3b416557d2c395a36b97a819812e99b0
>  sha256=2bcc5d5620f8533eb4300ba1b48c9d2a00092ce04588e32f7074cf2aadc34259
> 
> +[http://downloads.digium.com/pub/asterisk/releases/asterisk-1.4.23.1.tar.gz
> ]

^^^

> +md5=4788954a93f5fbf78e55e2aa6e03329f
> +sha256=03e2cf43ffe9935d56fa0ea3663fc9bd23ce9720682c79d6269e78a9a1629d63
> +
>  
> [http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sou
> nds-en-alaw-1.4.8.tar.gz]

^^^

>  md5=e708a5510a61217725b6ad663287dfa0
>  sha256=5d5c305079eb9918d271fad28ac73248a7d2962347dbd80d16aac66fe35e2729

It would be better to attach the patch, as your MUA damages it with 
word-wrapping - see highlights above, and there were more damaged long lines 
in the rest of the patch...

-- 
Denys


