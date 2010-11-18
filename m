Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PJ8yt-0001c5-8E
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 19:13:11 +0100
Received: (qmail 5860 invoked by uid 503); 18 Nov 2010 18:34:51 -0000
Received: from 63.mail-out.ovh.net (91.121.185.56)
	by 68.mail-out.ovh.net with SMTP; 18 Nov 2010 18:34:51 -0000
Received: (qmail 25647 invoked by uid 503); 18 Nov 2010 18:43:34 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 18 Nov 2010 18:43:34 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 18 Nov 2010 20:12:05 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 18 Nov 2010 20:12:04 +0200
Message-ID: <4CE56C6B.1050009@eukrea.com>
Date: Thu, 18 Nov 2010 19:11:55 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290002140-17255-1-git-send-email-eric@eukrea.com>
	<20101118180346.GA18493@denix.org>
In-Reply-To: <20101118180346.GA18493@denix.org>
X-Ovh-Tracer-Id: 7814871254224579913
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Ovh-Tracer-Id: 8199647546941680969
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] amend.bbclass: handle PACKAGE_ARCH change in	an amend.inc
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
X-List-Received-Date: Thu, 18 Nov 2010 18:13:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2010 19:03, Denys Dmytriyenko wrote:
> On Wed, Nov 17, 2010 at 02:55:40PM +0100, Eric B??nard wrote:
>> * setting PACKAGE_ARCH = "${MACHINE_ARCH}" in and amend.inc actually
>> leads to a packaga with the correct machine arch but the
>> work/stage/stamp dirs are not correct because MULTIMACH_ARCH is not
>> updated after amend.inc is parsed.
>>
>> * this patch updates MULTIMACH_ARCH if PACKAGE_ARCH is changed in
>> amend.inc
>>
>> Signed-off-by: Eric B??nard<eric@eukrea.com>
>
> Thanks! We have faced this issue before.
>
> Acked-by: Denys Dmytriyenko<denis@denix.org>

I'm working on an update version after discussion with Kergoth on IRC. I hope 
to send it for review by tomorrow.

Eric


