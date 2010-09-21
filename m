Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Oy6qK-0004j5-C0
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 19:41:25 +0200
Received: (qmail 23328 invoked by uid 503); 21 Sep 2010 17:54:46 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 21 Sep 2010 17:54:46 -0000
Received: (qmail 10736 invoked by uid 503); 21 Sep 2010 17:24:10 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 21 Sep 2010 17:24:10 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2010 19:41:22 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Sep 2010 19:41:21 +0200
Message-ID: <4C98EE40.50205@eukrea.com>
Date: Tue, 21 Sep 2010 19:41:20 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285077403-21171-1-git-send-email-eric@eukrea.com>	<1285077403-21171-2-git-send-email-eric@eukrea.com>	<1285077403-21171-3-git-send-email-eric@eukrea.com>	<1285077403-21171-4-git-send-email-eric@eukrea.com>	<1285077403-21171-5-git-send-email-eric@eukrea.com>
	<4C98ED51.8040707@freyther.de>
In-Reply-To: <4C98ED51.8040707@freyther.de>
X-Ovh-Tracer-Id: 17168003255976242505
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 5/7] gdb-cross-sdk: add RDEPENDS
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
X-List-Received-Date: Tue, 21 Sep 2010 17:41:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/09/2010 19:37, Holger Freyther a écrit :
> On 09/21/2010 09:56 PM, Eric Bénard wrote:
>> * actually we get :
>> ./arm-angstrom-linux-gnueabi-gdb: error while loading shared libraries:
>> libtinfo.so.5: cannot open shared object file: No such file or directory
>> * adding these RDEPENDS will install ncurses-sdk and zlib-sdk into the SDK
>>
>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>
> Is shlib stuff supposed to work for the -sdk packages? E.g. should something
> autodetect and install these libraries? The answer somehow feels like, yes it
> should.
>
actually this seems to fail.
>
>>
>>   DEPENDS = "ncurses-sdk zlib-sdk flex-native"
>> +RDEPENDS = "ncurses-sdk zlib-sdk"
>> \ No newline at end of file
>
> this will also install the -dev packages?
>
I don't understand, do you need the -dev packages for gdb-cross is the SDK ?

Eric


