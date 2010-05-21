Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <top.grzechu@gmail.com>) id 1OFPfz-00044z-UJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 12:42:00 +0200
Received: by fxm8 with SMTP id 8so705353fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 03:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=UZOXdXfzyxKS38RLKWF3kITP7ciGo+ZtmO4Gfa0ujMM=;
	b=nwe/K2ffniK4rkk5SzCnkO6mMz3Av6JbKsUP2sZroaQrWvqtkgqVyolZ5nW6+OHoHE
	ZZtih6yoz3bGXmPf+hip6NHVr83v2aiOogSzSsEJBqdJpOSIp/kKlYK38bHciYT74bsG
	4KjMurIZtsuVA0j2lGtwZyAeKUhIk18v7MHRY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=VthAjX3gNFVC6m/xxXfujFyIun3ZFyq5UVC2lXsduIsd4i/b7joR1MfT/owh2y6MYk
	nQpcQ8Jun1hqmO5ADY5y1EoT2LlulMbKJvYm22zRPuR7BSRuNiz7t7zvseK/HFSlZ4JG
	KBY1Q3NNB/vpmz1zrk7tGOnRByiOn1atc330I=
MIME-Version: 1.0
Received: by 10.204.137.89 with SMTP id v25mr10136bkt.13.1274438277066; Fri, 
	21 May 2010 03:37:57 -0700 (PDT)
Received: by 10.204.76.131 with HTTP; Fri, 21 May 2010 03:37:26 -0700 (PDT)
Date: Fri, 21 May 2010 12:37:26 +0200
Message-ID: <AANLkTinLm-qzDz71WT2ji8DrZvWNlsAs2q0VqQa9UGVL@mail.gmail.com>
From: Grzegorz Toporek <top.grzechu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: top.grzechu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Old system on Colibri - new cross-compilers from Angstrom, shall it 	works?
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
X-List-Received-Date: Fri, 21 May 2010 10:42:00 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

I have one important question.

On Colibri I have an old system already installed (Linux version 2.6.24.7,
gcc 4.2.2). When I'll build my own one for angstrom, thus getting
cross-compilers, can I just simply run programs compiled for angstrom  on
Colibri board?

Lets say I will cross compile sth using cross-compilers from directory
/tmp/cross/bin and then upload it on my board. Shall this work for me?
Should I change gcc version in /conf/distro/angstrom-2008.1.conf to 4.2.2?

Looking forward to your reply.


Kind Regards,
Grzegorz


W dniu 21 maja 2010 12:08 u=BFytkownik Grzegorz Toporek <top.grzechu@gmail.=
com
> napisa=B3:

> Thanks, I'll do as you recommend.
>
> And do not get flooded by Wis=B3a :D
>>
>
> Luckily I am far away from it...
>
>
> 2010/5/21 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
>
> Dnia pi=B1tek, 21 maja 2010 o 11:48:24 Grzegorz Toporek napisa=B3(a):
>>
>> > I would love to work with angstrom, however I'm using Colibri evaluati=
on
>> > board with Intel(R) PXA270 Processor (this is a students project and I
>> can't
>> > change it). Is it possible to run system built for angstrom on my boar=
d
>> or
>> > I just miss something?!
>>
>> Angstrom supports nearly every board which OpenEmbedded supports. Colibr=
i
>> is
>> just another device. Build Angstrom for it, use it and you will soon fin=
d
>> out
>> how much work you do not have to do due to feeds with already built
>> software.
>>
>> Making own distribution and then properly maintain it is lot of work and=
 I
>> would never suggest that for someone who just started with OpenEmbedded.
>>
>> Also one thing: do not use tune-iwmmxt for Colibri. This does not give a=
ny
>> special improvements for system. Add "iwmmxt" to MACHINE_FEATURES like i=
t
>> is
>> in few machines already - this will give you optimized versions of those
>> packages where it is really worth to enable that.
>>
>> And do not get flooded by Wis=B3a :D
>>
>> Regards,
>> --
>> JID:      hrw@jabber.org
>> Website:  http://marcin.juszkiewicz.com.pl/
>> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>

