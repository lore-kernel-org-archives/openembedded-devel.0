Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PA6Ow-00025H-N4
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 21:38:43 +0200
Received: (qmail 22867 invoked by uid 503); 24 Oct 2010 20:06:26 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 24 Oct 2010 20:06:26 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 24 Oct 2010 21:38:04 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 24 Oct 2010 21:38:03 +0200
Message-ID: <4CC48B1B.6010405@eukrea.com>
Date: Sun, 24 Oct 2010 21:38:03 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.11) Gecko/20101013 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287927378-11971-1-git-send-email-eric@eukrea.com>
	<AANLkTinU5a-o28y1CsAG2Yw_EpU3_SP-Pfe1ixcL7msC@mail.gmail.com>
In-Reply-To: <AANLkTinU5a-o28y1CsAG2Yw_EpU3_SP-Pfe1ixcL7msC@mail.gmail.com>
X-Ovh-Tracer-Id: 10023605396738583881
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] shadow: Switch to getting libtool from PATH
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
X-List-Received-Date: Sun, 24 Oct 2010 19:38:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

Le 24/10/2010 20:28, Khem Raj a écrit :
> 2010/10/24 Eric Bénard<eric@eukrea.com>:
>> * with PAM enabled, shadow's libtool sets lt_sysroot to the machine's
>> sysroot and not the arch's sysroot, thus it can't find libpam.
>> * by using libtool from PATH, this patch fix the problem.
>> * tested using angstrom-2010.x for an arvm5te target
>>
>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>
> I have fixed it in autotools class. Basically it should have takes
> care of setting
> the sysroot correctly for arch and machine recipes equally. Should be fixed now
> please pull and retest.
>
you patch fixe the problem. Thanks

Eric


