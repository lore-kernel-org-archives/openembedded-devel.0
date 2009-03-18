Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1LjoZa-00012T-12
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 06:44:16 +0100
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id n2I5c5rW027390
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 22:38:08 -0700 (PDT)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 18 Mar 2009 06:43:02 +0100
Received: from aeglos ([172.24.48.134]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 18 Mar 2009 06:43:01 +0100
Message-ID: <6537EE7D4FA94E6DAD52C3961BAD4ECE@aeglos>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>
References: <000001c9a60e$28fd4650$753018ac@GLAMDRING><9B414415A7024345895304717D1B3CCF@aeglos>
	<20090317200653.GD15734@denix.org>
Date: Wed, 18 Mar 2009 06:31:35 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-OriginalArrivalTime: 18 Mar 2009 05:43:02.0142 (UTC)
	FILETIME=[66F5E1E0:01C9A78C]
X-MIME-Autoconverted: from 8bit to quoted-printable by bagnes.atmel.com id
	n2I5c5rW027390
X-SA-Exim-Connect-IP: 195.65.72.27
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	STOX_REPLY_TYPE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Wed, 18 Mar 2009 05:44:17 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: quoted-printable


Best Regards
Ulf Samuelsson                ulf@atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv=E4gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57



> On Tue, Mar 17, 2009 at 05:28:27PM +0100, Ulf Samuelsson wrote:
>>> Yes, I know,
>>> Maybe it is a good idea if the result of a build is published somewhe=
re,
>>> so that others do not have to go through this process.
>>>
>>> Right now, openembedded does not even build for me,
>>> since the native perl build fails :-(
>>>
>>>> [1] http://en.wikipedia.org/wiki/Hyper-threading
>>
>> I now managed to build the Angstrom image for the AT91SAM9263 by apply=
ing
>> a few fixes present in the ulf/linux branch.
>> (Did not load on H/W yet though)
>>
>> perl-native was "fixed" by not building the library which crashed.
>> libtheora was fixd, not to use docs/examples.
>> busybox updated to 1.13.3
>
> Any specific changes between 1.13.2 and 1.13.3 you need? Would be nice =
to
> cherry-pick into .dev branch...

The reason I did this was that I had an error on downloading one
of the patches for 1.13.2. (md5 Checksum was not the same as in recipe)
I did not investigate further.
Just generally thought it to be a good idea to use the latest.

>
>> u-boot, gpsd was set to PARALLEL_MAKE =3D ""
>> u-boot updated to 2009.01
>> linux-2.6.28
>> at91bootstrap-2.10
>>
>> Building with PARALLEL_MAKE & Multiple threads was not smooth.
>> The build crashed several times, due to erros
>> caused by parallellism. "gettext", "gpsd" and "u-boot" were culprits.
>
> Would be nice to fix those. Tom Rini was working on fixing some of thos=
e
> issues.
>
>> u-boot is NOT built cleanly, even after PARALLEL_MAKE was set to "".
>> The actual compile completes and generates an u-boot.bin
>> but this is not deployed to the result directory.
>> There are logs for different stages, but after the compile, they exist=
,=20
>> but
>> are empty.
>>
>> If I remove all the stamps and "bitbake -b <u-boot>" afterwards
>> then the build completes correctly, and there is an
>> u-boot-at91sam9263ek.bin
>> in the result directory.
>>
>> Can it be so, that a stage is started, before the previous stage has b=
een
>> completed???
>
> If there are no dependencies between packages, their stage tasks can ru=
n=20
> in
> parallel.

I know that, but the u-boot problem seems to be that a stage
is started before an earlier stage is completed.
I have not verified this, but doing bitbake gpe-image
will cause the u-boot-2009.01 (in my branch) to fail.
The u-boot.bin is not copied to the result.
while doing "bitbake -b <u-boot-2009.01>.bb" will work.

The remainder of the stages will run, when I do bitbake gpe-image
but the log is empty in the first case.


>
>> ---------------------
>> BTW: The total buildtime was around 2 hours. There is some overhead
>> since the build was restarted 3-4 times, and local.conf was changed on=
ce.
>> I started the build with PARALLEL_MAKE =3D "-j2" and BB_NUMBER_THREADS=
=3D8.
>>
>> I noticed that having a lot of threads helps most of the time,
>> since the CPUs were executing at max frequency.
>>
>> When the cross compiler, was built,it was different,
>> most of the cores were not used with this configuration.
>> 2-3 max while compiling gcc.
>
> Since gcc/cross is quite a big package and lots of other packages depen=
d=20
> on
> it, it is being built for you only using 2 cores, as specified by
> PARALLEL_MAKE. Everything else is waiting for it to finish.

Yes, I realize that so I have to increase PARALLEL_MAKE
to speed up the  build of the tools,
but I would also like to have a large number of threads otherwise.
But I do not want to have a large number of threads and
and a large number of make jobs at the same time
if I want to run at optimum speed throughout the build.



>
>> Maybe the best approach is to build the Angstrom in several stages
>> with different settings for parallelism.
>
> --=20
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20




