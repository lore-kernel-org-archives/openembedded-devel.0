Received: from exprod5og104.obsmtp.com ([64.18.0.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martyn.welch@ge.com>) id 1PVOnT-0004jm-RT
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 14:32:04 +0100
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob104.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTRH9zI80B+/8M3x6A6iQmMW+b91I42Xm@postini.com;
	Wed, 22 Dec 2010 05:31:58 PST
Received: from unknown (HELO alpmlef08.e2k.ad.ge.com) ([3.159.18.17])
	by Cinmlip05.e2k.ad.ge.com with ESMTP; 22 Dec 2010 08:26:50 -0500
Received: from [3.138.54.92] ([3.138.54.92]) by alpmlef08.e2k.ad.ge.com with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 22 Dec 2010 08:26:49 -0500
Message-ID: <4D11FC99.9040609@ge.com>
Date: Wed, 22 Dec 2010 13:26:49 +0000
From: Martyn Welch <martyn.welch@ge.com>
Organization: GE Intelligent Platforms
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTim=weStfsykRNc7_bAZG6KExZt9sS_O15WH9F5=@mail.gmail.com>	<AANLkTikSuqFKS=1j-KWm3XY75J=qhe+towHjdfanW1JG@mail.gmail.com>	<20101206204753.GC29253@denix.org>
	<4D109471.6010202@ge.com>
	<AANLkTin=CKQTx0ybBNnequq1vFzm0re8yAY3Z5QsyTLo@mail.gmail.com>
In-Reply-To: <AANLkTin=CKQTx0ybBNnequq1vFzm0re8yAY3Z5QsyTLo@mail.gmail.com>
X-Enigmail-Version: 1.1.2
X-OriginalArrivalTime: 22 Dec 2010 13:26:49.0925 (UTC)
	FILETIME=[E3A39750:01CBA1DB]
Subject: Re: release 2010-12: tar error
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
X-List-Received-Date: Wed, 22 Dec 2010 13:32:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 21/12/10 22:58, Graham Gower wrote:
> On 21 December 2010 22:20, Martyn Welch <martyn.welch@ge.com> wrote:
>> On 06/12/10 20:47, Denys Dmytriyenko wrote:
>>> On Fri, Dec 03, 2010 at 11:44:14AM -0800, Khem Raj wrote:
>>>> On Fri, Dec 3, 2010 at 7:36 AM, Frans Meulenbroeks
>>>> <fransmeulenbroeks@gmail.com> wrote:
>>>>> Not sure if this is reproducible or a race but when building console-image
>>>>> for minimal for calamari I got:
>>>>>
>>>>> ERROR: Function staging_packager failed
>>>>> NOTE: Task failed: ('function staging_packager failed',
>>>>> '/home/hudson/jobs/FM_TEST/workspace/tmp/work/calamari-oe-linux-gnuspe/linux-2.6.30-r6/temp/log.staging_packager.27026')
>>>>> ERROR: Task 601
>>>>> (/home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/linux/linux_2.6.30.bb,
>>>>> do_package_stage) failed with 256
>>>>> NOTE: oestats: task failed, see
>>>>> http://tinderbox.openembedded.net/packages/1176040/
>>>>> ERROR: Logfile of failure stored in:
>>>>> /home/hudson/jobs/FM_TEST/workspace/tmp/work/calamari-oe-linux-gnuspe/linux-2.6.30-r6/temp/log.staging_packager.27026
>>>>> Log data follows:
>>>>> | tar: .: file changed as we read it
>>>>>
>>>>> NOTE: package linux-2.6.30-r6: task do_package_stage: Failed
>>>>>
>>>>> Didn't have time to dig into this. Sry.
>>>>
>>>> yes this happens time to time. Its some sort of race condition. I get
>>>> it sometimes in different packages but never went in deep to fix it.
>>>
>>> I can confirm that this is a long standing race condition, presumably in
>>> packaged staging - there were several attempts at fixing it w/o much success.
>>>
>>
>> I recently repeatedly hit this. I'm in the process of setting up some
>> automated testing which made this particularly annoying. I had
>> BB_NUMBER_THREADS and PARALLEL_MAKE setup in my local.conf. I think this is
>> arises when BB_NUMBER_THREADS is set. I've removed it and taken the hit in
>> build time instead (preferable in my situation). This seems to have stop it
>> being an issue, but I need to do quite a few more runs to make sure.
>>
>> Martyn
>>
> 
> If you have a good way to reproduce any race, please provide instructions.
> 
> I have PARALLEL_MAKE = "-j 12" and BB_NUMBER_THREADS = "12" in my
> local.conf and have never seen this race.
> 
> -Graham
> 

I really wish I could say I had. I believe I have had PARALLEL_MAKE = "-j 2"
and BB_NUMBER_THREADS = "2" in my configuration for quite a while now and
didn't see this problem until I started to script some of our testing.

Martyn

-- 
Martyn Welch (Principal Software Engineer) | Registered in England and
GE Intelligent Platforms                   | Wales (3828642) at 100
T +44(0)127322748                          | Barbirolli Square, Manchester,
E martyn.welch@ge.com                      | M2 3AB  VAT:GB 927559189


