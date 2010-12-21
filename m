Received: from exprod5og104.obsmtp.com ([64.18.0.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martyn.welch@ge.com>) id 1PV4HG-0004pI-QF
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 16:37:28 +0100
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob104.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTRDJsONXpioPoQ7JLUTx6zA0xpdVDxxV@postini.com;
	Tue, 21 Dec 2010 07:37:22 PST
Received: from unknown (HELO cinmlef09.e2k.ad.ge.com) ([3.159.213.56])
	by Alpmlip06.e2k.ad.ge.com with ESMTP; 21 Dec 2010 06:50:11 -0500
Received: from [3.138.54.92] ([3.138.54.92]) by cinmlef09.e2k.ad.ge.com with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 21 Dec 2010 06:50:11 -0500
Message-ID: <4D109471.6010202@ge.com>
Date: Tue, 21 Dec 2010 11:50:09 +0000
From: Martyn Welch <martyn.welch@ge.com>
Organization: GE Intelligent Platforms
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTim=weStfsykRNc7_bAZG6KExZt9sS_O15WH9F5=@mail.gmail.com>	<AANLkTikSuqFKS=1j-KWm3XY75J=qhe+towHjdfanW1JG@mail.gmail.com>
	<20101206204753.GC29253@denix.org>
In-Reply-To: <20101206204753.GC29253@denix.org>
X-Enigmail-Version: 1.1.2
X-OriginalArrivalTime: 21 Dec 2010 11:50:11.0164 (UTC)
	FILETIME=[38E521C0:01CBA105]
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
X-List-Received-Date: Tue, 21 Dec 2010 15:37:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/12/10 20:47, Denys Dmytriyenko wrote:
> On Fri, Dec 03, 2010 at 11:44:14AM -0800, Khem Raj wrote:
>> On Fri, Dec 3, 2010 at 7:36 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> Not sure if this is reproducible or a race but when building console-image
>>> for minimal for calamari I got:
>>>
>>> ERROR: Function staging_packager failed
>>> NOTE: Task failed: ('function staging_packager failed',
>>> '/home/hudson/jobs/FM_TEST/workspace/tmp/work/calamari-oe-linux-gnuspe/linux-2.6.30-r6/temp/log.staging_packager.27026')
>>> ERROR: Task 601
>>> (/home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/linux/linux_2.6.30.bb,
>>> do_package_stage) failed with 256
>>> NOTE: oestats: task failed, see
>>> http://tinderbox.openembedded.net/packages/1176040/
>>> ERROR: Logfile of failure stored in:
>>> /home/hudson/jobs/FM_TEST/workspace/tmp/work/calamari-oe-linux-gnuspe/linux-2.6.30-r6/temp/log.staging_packager.27026
>>> Log data follows:
>>> | tar: .: file changed as we read it
>>>
>>> NOTE: package linux-2.6.30-r6: task do_package_stage: Failed
>>>
>>> Didn't have time to dig into this. Sry.
>>
>> yes this happens time to time. Its some sort of race condition. I get
>> it sometimes in different packages but never went in deep to fix it.
> 
> I can confirm that this is a long standing race condition, presumably in 
> packaged staging - there were several attempts at fixing it w/o much success.
> 

I recently repeatedly hit this. I'm in the process of setting up some
automated testing which made this particularly annoying. I had
BB_NUMBER_THREADS and PARALLEL_MAKE setup in my local.conf. I think this is
arises when BB_NUMBER_THREADS is set. I've removed it and taken the hit in
build time instead (preferable in my situation). This seems to have stop it
being an issue, but I need to do quite a few more runs to make sure.

Martyn


-- 
Martyn Welch (Principal Software Engineer) | Registered in England and
GE Intelligent Platforms                   | Wales (3828642) at 100
T +44(0)127322748                          | Barbirolli Square, Manchester,
E martyn.welch@ge.com                      | M2 3AB  VAT:GB 927559189


