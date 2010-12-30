Received: from 31.mail-out.ovh.net ([213.186.62.10])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PYFzF-0005yS-FB
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 11:44:01 +0100
Received: (qmail 14124 invoked by uid 503); 30 Dec 2010 11:15:44 -0000
Received: from b7.ovh.net (HELO mail91.ha.ovh.net) (213.186.33.57)
	by 31.mail-out.ovh.net with SMTP; 30 Dec 2010 11:15:44 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 Dec 2010 12:43:37 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 30 Dec 2010 12:43:34 +0200
Message-ID: <4D1C6256.6030100@eukrea.com>
Date: Thu, 30 Dec 2010 11:43:34 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293699334-4159-1-git-send-email-eric@eukrea.com>
	<1293704431.5436.5.camel@mattotaupa>
In-Reply-To: <1293704431.5436.5.camel@mattotaupa>
X-Ovh-Tracer-Id: 7085851065853390153
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH] gnome-power-manager: fix compilation
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
X-List-Received-Date: Thu, 30 Dec 2010 10:44:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Paul,

On 30/12/2010 11:20, Paul Menzel wrote:
> Am Donnerstag, den 30.12.2010, 09:55 +0100 schrieb Eric Bénard:
>
> I would prefer if the error message `libtool: Command not found` (if it
> is that short) is noted in the commit summary.
>
> 	gnome-power-manager: fix compilation: `libtool: Command not found`
>
OK fixed and pushed.

>> * libtool is hardcoded in src/Makefile and leads to
>> libtool: Command not found
>>
>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>> ---
>>   recipes/gnome/gnome-power-manager_2.30.0.bb |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/gnome/gnome-power-manager_2.30.0.bb b/recipes/gnome/gnome-power-manager_2.30.0.bb
>> index a752852..0c7bcb5 100644
>> --- a/recipes/gnome/gnome-power-manager_2.30.0.bb
>> +++ b/recipes/gnome/gnome-power-manager_2.30.0.bb
>> @@ -27,6 +27,7 @@ do_configure_append() {
>>           for i in $(find ${S} -name "Makefile") ; do
>>               sed -i -e s:-Werror::g $i
>>           done
>> +		sed -e "s/libtool --/${TARGET_SYS}-libtool --/" -i ${S}/src/Makefile
>>   }
>>
>>   PACKAGES =+ "${PN}-applets"
>
> Acked-by: Paul Menzel<paulepanter@users.sourceforge.net>
>
> What is the proper patch to send upstream? Is `${TARGET_SYS}` always
> defined? But »-« would still make problems, wouldn’t it? Is there a
> program implementing this correctly in `Makefile`?
>
- TARGET_SYS is OE specific.
- The "--" is here to only replace the 2 or 3 instances of libtool concerned 
by the workaround.
- I don't know what would be the proper patch to send upstream (and don't have 
time to check for this now). I've just seen there are several new release of 
gnome-power-manager so the problem may already be fixed, will see when I have 
some time.

Eric


