Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PESM4-0002JL-M0
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 20:53:45 +0100
Received: by gyf3 with SMTP id 3so2583508gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 12:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=jJMv/cuw8Z9hFVxyULQ7suiOmx/3lIo/8g+tlx0esU8=;
	b=dHnfB6sLHtr7XGLF33qpDuNz7EvPio1s4Xf+Nllj/bLrn7MjpEW7jxwGNFlNyqnpjP
	kI/f4MVfyYVDtb1D2kdlKieWf0WWq/dI4roP+dRr6acKamxvGcrW9jhSn/PB5Se77iF+
	P97pxQ2COj/7PrBuvUAuYca75OmfH6VdqBHHM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=G2XI6aefA3Kmn9L6b2bNiamqB/vdXNQwbLSXNCGOwGbwty1SdLpjaQzqel2aMGuWHq
	ofDMibOZ9IxLF/QqaSpgrXbnP/64qOn8gw5xV/M61/K1MPpxoqYX0fhoRRlO8AWevQVu
	6vfmTTU7GizShjTk03tkMlplIEegdLWNVau7Y=
Received: by 10.91.153.10 with SMTP id f10mr1783183ago.172.1288986770376; Fri,
	05 Nov 2010 12:52:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 5 Nov 2010 12:52:30 -0700 (PDT)
In-Reply-To: <AANLkTikq2i7xmVfdrbDRzO=SqHBXxmKN8zQw4+u_anDk@mail.gmail.com>
References: <4CD43116.5020304@lambsys.com>
	<AANLkTincNJZVqfZKkHfHRTu9R9bN+_DL_5bfHvfQXRiR@mail.gmail.com>
	<AANLkTikq2i7xmVfdrbDRzO=SqHBXxmKN8zQw4+u_anDk@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Nov 2010 12:52:30 -0700
Message-ID: <AANLkTinVuDMO7=00ZFccXKZAtQj+VaLMdV=Decg6+rtb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Random problems with building locales
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
X-List-Received-Date: Fri, 05 Nov 2010 19:53:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 5, 2010 at 12:29 PM, J. L. <vwyodapink@gmail.com> wrote:
> On Fri, Nov 5, 2010 at 12:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Nov 5, 2010 at 9:30 AM, David Lambert <dave@lambsys.com> wrote:
>>> I am getting apparent random failures when attempting to build OpenEmbe=
dded
>>> with bitbake 1.10.0. =C2=A0It seems that localedef is randomly failing =
as shown
>>> below. The first time it failed compiling UTF-8 es_NI, the second UTF-8
>>> gv_GB, third UTF-8 es_NI again, and finally UTF-8 xh_ZA.
>>> Initially I suspected a problem with my machine, but I ran diagnostics
>>> overnight with no failures. Has anyone else experienced this type of
>>> failure? Could you help guide me where else to look?
>>>
>>
>> I think its because qemu-arm is dying on you. there is 0.13 release
>> that happens few weeks back
>> I am still working on getting that into OE. Once I have that in may be
>> it will get fixed I am not sure yet
>> remain tuned
>>
>> -Khem
>>
>>>
>>> Thanks in advance for any help.
>>>
>>> Best regards,
>>>
>>> Dave.
>>>
>>>
>>> NOTE: Task failed: localedef returned an error (command was
>>> PATH=3D"/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/armv5te/bin=
:/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/dlambert/oe=
/build/tmp/sysroots/i686-linux/usr/bin:/home/dlambert/oe/build/tmp/sysroots=
/i686-linux/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux//bin:/home=
/dlambert/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:=
/usr/games:/usr/local/armelf/bin"
>
>
>
> I am running into the same similar issue on my 64bit machine. Where
> its not building the correct places randomly. For me its libtool
> aclocal aclocal-1.11
>
>

your problems are different. Can you use openemebedded master branch
and see if you still see the issue. I am not able to reproduce your
libtool problems here.


