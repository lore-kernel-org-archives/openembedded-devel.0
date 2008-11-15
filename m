Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L1J0n-0001mb-7u
	for openembedded-devel@openembedded.org; Sat, 15 Nov 2008 12:08:21 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L1Iyg-0006Rj-12
	for openembedded-devel@openembedded.org; Sat, 15 Nov 2008 11:06:10 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 15 Nov 2008 11:06:10 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 15 Nov 2008 11:06:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 15 Nov 2008 12:06:02 +0100
Message-ID: <gfmaeq$mr9$1@ger.gmane.org>
References: <200811150004.50508.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081113 Shredder/3.0b1pre
In-Reply-To: <200811150004.50508.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [gstreamer] Enabling binary cache (instead of the xml one)
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
X-List-Received-Date: Sat, 15 Nov 2008 11:08:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-11-08 00:04, Holger Freyther wrote:
> Hey Guys,
>
> I wonder if we have ever considered in using the experimental gstreamer
> feature to build it with "--enable-binary-registry".
>
> This is not changing the way the registry is working, the result is simply
> stored in binary and not xml. This avoids parsing on start.
>
> For devices like the neo (with incredible slow flash speed) avoiding stating
> all plugins would (changing the way the registry is working) would be a lot
> better...
>
> what do you think? Risk and use an experimental feature (it is using mmap so
> the risk of SIGBUS is there)

Is it using read-only mmap or read-write mmap? If it's the latter then 
people using jffs2 are out of luck :(

regards,

Koen

>
> 	z.
>
>
>
> Results of micro benchmark on my neo:
>
> Binary cache:
>
> # Building cache
> Total count: 119 plugins, 351 features
> real    0m 12.36s
> user    0m 5.71s
> sys 0m 5.72s
>
> # Cached
> Total count: 119 plugins, 351 features
> real    0m 1.74s
> user    0m 1.03s
> sys 0m 0.35s
>
>
> XML Cache:
> # Building cache
> Total count: 119 plugins, 351 features
> real    0m 16.42s
> user    0m 6.94s
> sys 0m 9.19s
>
>
> # Cached
> Total count: 119 plugins, 351 features
> real    0m 1.87s
> user    0m 1.28s
> sys 0m 0.41s
> root@om-gta02:~#




