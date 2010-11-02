Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PDJyZ-00049A-0K
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 17:44:47 +0100
Received: (qmail 11411 invoked by uid 503); 2 Nov 2010 16:22:39 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 2 Nov 2010 16:22:39 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 2 Nov 2010 18:43:59 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 2 Nov 2010 18:43:57 +0200
Message-ID: <4CD03FCC.6030002@eukrea.com>
Date: Tue, 02 Nov 2010 17:43:56 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288646991-15775-1-git-send-email-eric@eukrea.com>	<AANLkTi=0EsyQ38D1dyBRffGBWEoVo==6=H9+wrtcENyR@mail.gmail.com>	<4CD02461.3020106@eukrea.com>
	<4CD026D8.2030101@mentor.com>
In-Reply-To: <4CD026D8.2030101@mentor.com>
X-Ovh-Tracer-Id: 4597330795632962889
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gdb-cross-sdk: don't reconfigure after making changes in gdb/Makefile
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
X-List-Received-Date: Tue, 02 Nov 2010 16:44:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/11/2010 15:57, Tom Rini a écrit :
> Can we look at NOT doing the dance we're doing here and instead try the normal
> autotools stuff? The "we need to not do ..." stuff looks to be an ancient
> artifact.
>
following the recent changes in this file we have a regression : some libs are 
no more statically linked in gdb and this patch fix this regression.
Can we apply it and then we can think on a better way to rewrite these 
recipes. After a few tries, switching to autotools doesn't work out of the box 
because gdb is waiting for autoconf 2.64 when we have 2.65.

Eric


