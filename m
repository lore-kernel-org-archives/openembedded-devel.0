Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PVBAK-0006OB-RI
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 23:58:44 +0100
Received: by wyb40 with SMTP id 40so4543648wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 14:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=mQ8FhClJtrhFgaLbMhbvIfL9HzX7WKbZP79ko2x/9jw=;
	b=A3N5MHqHkfjVwIuClVmHqkdRx+wf/9HOauVRDmdisMir2LvN8kqOZhBLgDwEW4kv+J
	1x8hpSl/pyYHd0BxcwpcNkAktmsCiAqf5FEXu+R+Qz6pNn8Jipygneof4Clqsvptgt3L
	oMDpjUR+AKYXE8PJ8RIbdhYzlTq45vXDB8RXA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HwnlGfDtoLXnfXek4eKjmCxXC/2l2rH7QIUTuTb53GY98m2V+lidh5MyoB+WzH7Vno
	wUDhf0We72cnqXmXDEIP8gYb1y0eXH+Ib9Mng+tjjd47EYLGOqaDT5biSyxp67A00Ak1
	oGZc/6lVbnPM8TDOLdjusAQXwFJ515v9nfHvk=
MIME-Version: 1.0
Received: by 10.227.129.69 with SMTP id n5mr3724060wbs.136.1292972313976; Tue,
	21 Dec 2010 14:58:33 -0800 (PST)
Received: by 10.227.155.208 with HTTP; Tue, 21 Dec 2010 14:58:33 -0800 (PST)
In-Reply-To: <4D109471.6010202@ge.com>
References: <AANLkTim=weStfsykRNc7_bAZG6KExZt9sS_O15WH9F5=@mail.gmail.com>
	<AANLkTikSuqFKS=1j-KWm3XY75J=qhe+towHjdfanW1JG@mail.gmail.com>
	<20101206204753.GC29253@denix.org> <4D109471.6010202@ge.com>
Date: Wed, 22 Dec 2010 09:28:33 +1030
Message-ID: <AANLkTin=CKQTx0ybBNnequq1vFzm0re8yAY3Z5QsyTLo@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 21 Dec 2010 22:58:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 21 December 2010 22:20, Martyn Welch <martyn.welch@ge.com> wrote:
> On 06/12/10 20:47, Denys Dmytriyenko wrote:
>> On Fri, Dec 03, 2010 at 11:44:14AM -0800, Khem Raj wrote:
>>> On Fri, Dec 3, 2010 at 7:36 AM, Frans Meulenbroeks
>>> <fransmeulenbroeks@gmail.com> wrote:
>>>> Not sure if this is reproducible or a race but when building console-image
>>>> for minimal for calamari I got:
>>>>
>>>> ERROR: Function staging_packager failed
>>>> NOTE: Task failed: ('function staging_packager failed',
>>>> '/home/hudson/jobs/FM_TEST/workspace/tmp/work/calamari-oe-linux-gnuspe/linux-2.6.30-r6/temp/log.staging_packager.27026')
>>>> ERROR: Task 601
>>>> (/home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/linux/linux_2.6.30.bb,
>>>> do_package_stage) failed with 256
>>>> NOTE: oestats: task failed, see
>>>> http://tinderbox.openembedded.net/packages/1176040/
>>>> ERROR: Logfile of failure stored in:
>>>> /home/hudson/jobs/FM_TEST/workspace/tmp/work/calamari-oe-linux-gnuspe/linux-2.6.30-r6/temp/log.staging_packager.27026
>>>> Log data follows:
>>>> | tar: .: file changed as we read it
>>>>
>>>> NOTE: package linux-2.6.30-r6: task do_package_stage: Failed
>>>>
>>>> Didn't have time to dig into this. Sry.
>>>
>>> yes this happens time to time. Its some sort of race condition. I get
>>> it sometimes in different packages but never went in deep to fix it.
>>
>> I can confirm that this is a long standing race condition, presumably in
>> packaged staging - there were several attempts at fixing it w/o much success.
>>
>
> I recently repeatedly hit this. I'm in the process of setting up some
> automated testing which made this particularly annoying. I had
> BB_NUMBER_THREADS and PARALLEL_MAKE setup in my local.conf. I think this is
> arises when BB_NUMBER_THREADS is set. I've removed it and taken the hit in
> build time instead (preferable in my situation). This seems to have stop it
> being an issue, but I need to do quite a few more runs to make sure.
>
> Martyn
>

If you have a good way to reproduce any race, please provide instructions.

I have PARALLEL_MAKE = "-j 12" and BB_NUMBER_THREADS = "12" in my
local.conf and have never seen this race.

-Graham


