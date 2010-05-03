Received: from 29.mail-out.ovh.net ([87.98.216.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O8sbZ-00026E-4O
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 12:10:26 +0200
Received: (qmail 20762 invoked by uid 503); 3 May 2010 10:01:51 -0000
Received: from b6.ovh.net (HELO mail96.ha.ovh.net) (213.186.33.56)
	by 29.mail-out.ovh.net with SMTP; 3 May 2010 10:01:50 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 3 May 2010 10:00:00 -0000
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 3 May 2010 09:59:58 -0000
Message-ID: <4BDE9E9D.9020003@eukrea.com>
Date: Mon, 03 May 2010 11:59:57 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1272879651-27000-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1272879651-27000-1-git-send-email-Martin.Jansa@gmail.com>
X-Ovh-Tracer-Id: 11429572906346065225
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 87.98.216.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] klibc: cleanup all version
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
X-List-Received-Date: Mon, 03 May 2010 10:10:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Martin,

Le 03/05/2010 11:40, Martin Jansa a écrit :
> * I've prepared 1.5.18, but needs more love as few patches doesn't apply and I would like to
>    convert all to new staging (don't know how to install to cross with native install).
>    And please comment about Kbuild/all_headers staging and include/asm link.
>
I sent updated patches for 1.5.17 :
http://patchwork.openembedded.org/patch/1968/

> * 1.5.15+1.5.16:
>    #still needs Kbuild files and all headers (ie include/drm, include/mtd were missing)
>    #work-arround by hand (just to show what needs to be solved):

this patch should solve this problem :
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b2f6d8d0200974b8b98f1bb9b10d46fb06e14b15

Eric


