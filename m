Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OyXpM-00015m-Ba
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 00:30:12 +0200
Received: (qmail 17489 invoked by uid 503); 22 Sep 2010 22:54:32 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 22 Sep 2010 22:54:32 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Sep 2010 00:30:08 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 23 Sep 2010 00:30:07 +0200
Message-ID: <4C9A836D.6000706@eukrea.com>
Date: Thu, 23 Sep 2010 00:30:05 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285189329-32344-1-git-send-email-raj.khem@gmail.com>
	<AANLkTikRBF+0hY2ZLT7d1DZe4FF4UE+9aVopECrpROqr@mail.gmail.com>
In-Reply-To: <AANLkTikRBF+0hY2ZLT7d1DZe4FF4UE+9aVopECrpROqr@mail.gmail.com>
X-Ovh-Tracer-Id: 9470788543206567241
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] oe/patch.py: Remove series file during Clean()
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
X-List-Received-Date: Wed, 22 Sep 2010 22:30:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 22/09/2010 23:36, Chris Larson a écrit :
> On Wed, Sep 22, 2010 at 2:02 PM, Khem Raj<raj.khem@gmail.com>  wrote:
>
>> Currently if there is a failed do_patch the series files get appended
>> so if there were two patches
>>
>> a.patch
>> b.patch
>> and b.patch failed during next run it would append a.patch again
>> a.patch
>> b.patch
>> a.patch
>>
>> and this would keep growing.
>>
>> We can remove series file in Clean() because we populate it in Import()
>> anyway
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>
>
> Acked-by: Chris Larson <chris_larson@mentor.com>

Acked-by: Eric Bénard <eric@eukrea.com>


