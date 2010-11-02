Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PDI9L-0005EY-Gw
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 15:47:52 +0100
Received: (qmail 28307 invoked by uid 503); 2 Nov 2010 14:25:40 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 2 Nov 2010 14:25:39 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 2 Nov 2010 16:46:59 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 2 Nov 2010 16:46:57 +0200
Message-ID: <4CD02461.3020106@eukrea.com>
Date: Tue, 02 Nov 2010 15:46:57 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288646991-15775-1-git-send-email-eric@eukrea.com>
	<AANLkTi=0EsyQ38D1dyBRffGBWEoVo==6=H9+wrtcENyR@mail.gmail.com>
In-Reply-To: <AANLkTi=0EsyQ38D1dyBRffGBWEoVo==6=H9+wrtcENyR@mail.gmail.com>
X-Ovh-Tracer-Id: 2621376458632179017
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
X-List-Received-Date: Tue, 02 Nov 2010 14:47:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/11/2010 05:41, Khem Raj a écrit :
> On Mon, Nov 1, 2010 at 2:29 PM, Eric Bénard<eric@eukrea.com>  wrote:
>> else we don't statically link libncurses, libtinfo and libz which leads
>> to :
>> /usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-gdb:
>> error while loading shared libraries: libtinfo.so.5:
>> cannot open shared object file: No such file or directory
>>
>> when trying to use the toolchain.
>
> could you run oe_runconf and then do the Makefile editing ? that way
> it will work as expected.
> we sort of need oe_runconf
>
the makefile we hack with sed is not created after oe_runconf, it's generated 
by oe_runmake configure-host
So what should work is :
oe_runconf
oe_runmake
then sed

Eric

>>
>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>> ---
>>   recipes/gdb/gdb-cross-sdk.inc |    1 -
>>   1 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/gdb/gdb-cross-sdk.inc b/recipes/gdb/gdb-cross-sdk.inc
>> index 6a708ca..d32111f 100644
>> --- a/recipes/gdb/gdb-cross-sdk.inc
>> +++ b/recipes/gdb/gdb-cross-sdk.inc
>> @@ -16,5 +16,4 @@ do_configure_append () {
>>         for SIM in ${B}/sim/*/Makefile; do
>>                 [ -f $SIM ]&&  sed -e 's,-lz, ${STAGING_LIBDIR_NATIVE}/libz.a ,g' -i $SIM
>>         done
>> -       oe_runconf
>>   }
>> --
>> 1.6.3.3
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



