Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OpiuM-0006e1-Ma
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 16:30:55 +0200
Received: (qmail 13860 invoked by uid 503); 29 Aug 2010 14:51:45 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 29 Aug 2010 14:51:44 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Aug 2010 16:30:23 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 29 Aug 2010 16:30:21 +0200
Message-ID: <4C7A6EFD.5010803@eukrea.com>
Date: Sun, 29 Aug 2010 16:30:21 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.8) Gecko/20100802 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283078750-25729-1-git-send-email-eric@eukrea.com>	<1283080970-2494-1-git-send-email-eric@eukrea.com>
	<lywrr95ys7.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lywrr95ys7.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Ovh-Tracer-Id: 7997548513833626953
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
Subject: Re: [PATCH v2] ncurses-5.7 : fix sdk build + add libtermcap link
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
X-List-Received-Date: Sun, 29 Aug 2010 14:30:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Enrico,

thanks for the review,

Le 29/08/2010 15:33, Enrico Scholz a écrit :
> Eric Bénard<eric@eukrea.com>  writes:
>
>> -        'narrowc --with-ticlib' \
>> -        'widec   --enable-widec --without-progs'; do
>> +        'narrowc  --with-ticlib' \
>> +        'widec    --with-ticlib --enable-widec --without-progs'; do
>
> can you place this in a separate patch please?
>
I'm not fully sure of this change, do you think this is needed or is 
this a mistake ?
>
>> +	cd ${D}${libdir}
>> +	ln -sf libncurses.so libtermcap.so
>> +	ln -sf libncurses.a libtermcap.a
>
> This part is wrong; libtermcap functionality is provided by libtinfo and
> does not need whole libncurses.
>
that's the way it's done on ubuntu so I thought this could be ok -but it 
seems there is no libtinfo on ubuntu which may explain this point), I 
will switch the link to libtinfo and test asterisk build.

>> +	ln -sf libncurses.so.5 libtermcap.so.5
>
> This is not needed; DL_NEEDED will be libtinfo.so.X both if you create a
> symlink or use the linkerscript.  There is nothing with a libtermcap.so.5
> SONAME either.
>
yes this was a test, I forget to remove this line sorry.

Eric


