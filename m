Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PqSTo-0006tz-Ra
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 16:42:48 +0100
Received: (qmail 20511 invoked by uid 503); 18 Feb 2011 15:19:19 -0000
Received: from b6.ovh.net (HELO mail240.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 18 Feb 2011 15:19:19 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 18 Feb 2011 17:41:36 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 18 Feb 2011 17:41:36 +0200
Message-ID: <4D5E932F.1000907@eukrea.com>
Date: Fri, 18 Feb 2011 16:41:35 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298026721-16036-1-git-send-email-eric@eukrea.com>
	<AANLkTimXo8+3vOcq79Ttn7=Cf7i3wcepNHNJotU1+jLw@mail.gmail.com>
In-Reply-To: <AANLkTimXo8+3vOcq79Ttn7=Cf7i3wcepNHNJotU1+jLw@mail.gmail.com>
X-Ovh-Tracer-Id: 10605977123745803593
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH v2] oestats-client: only send report when task has failed
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
X-List-Received-Date: Fri, 18 Feb 2011 15:42:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

On 18/02/2011 16:35, Khem Raj wrote:
> On Fri, Feb 18, 2011 at 2:58 AM, Eric Bénard<eric@eukrea.com>  wrote:
>> actual behaviour is to send a report for *each* task runned by bitbake
>> this is ok for one personnal oestat server but doesn't scale well when
>> dozen of peoples are running test builders which all send reports to
>> the OE's infrastructure.
>>
>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>> ---
>> v2: cleaner way to handle the problem as per pb&  Jay2 suggestion
>>
>>   classes/oestats-client.bbclass |    6 ++++--
>>   1 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/classes/oestats-client.bbclass b/classes/oestats-client.bbclass
>> index 4233d4a..f9ac88f 100644
>> --- a/classes/oestats-client.bbclass
>> +++ b/classes/oestats-client.bbclass
>> @@ -202,8 +202,10 @@ python oestats_eventhandler () {
>>                 oestats_stop(server, e.data, e.getFailures())
>>         elif getName(e) == 'TaskStarted':
>>                 bb.data.setVar('OESTATS_STAMP', repr(time.time()), e.data)
>> -       elif getName(e) == 'TaskSucceeded':
>> -               oestats_task(server, e.data, e.task, 'Succeeded')
>> +       # Temporary disable sending sucess report as this generates to much trafic
>> +       # for the oestat server
>> +       # elif getName(e) == 'TaskSucceeded':
>> +       #       oestats_task(server, e.data, e.task, 'Succeeded')
>>         elif getName(e) == 'TaskFailed':
>>                 oestats_task(server, e.data, e.task, 'Failed')
>>   }
>
>
> will this mean that only failed packages show up on tinderbox ?

exactly. this is a temporary solution and I think this is better than no more 
having tinderbox running.

Eric


