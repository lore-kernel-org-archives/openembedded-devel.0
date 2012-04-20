Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SLB9x-0007bA-7j for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 12:33:49 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SLB0n-0004lp-Ap for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 12:24:21 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 12:24:21 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 12:24:21 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 Apr 2012 12:24:14 +0200
Message-ID: <jmrdgc$cq4$1@dough.gmane.org>
References: <CAGiJk9c8ThXrLqsrgYQb03hShObTJynt+fxsRxG9VzYOkOsyUg@mail.gmail.com>
	<jmmst9$r5o$1@dough.gmane.org>
	<CAGiJk9e4vZoO1d1cCbh8Lq26m6h3M5rrOOe40CS1ov2VHqh9eQ@mail.gmail.com>
	<jmomha$co7$1@dough.gmane.org>
	<CAGiJk9fy3p550fUxadQUYmahhx4DVRYeEt_GDYgjBhMVpHzBMw@mail.gmail.com>
	<jmpg5o$52s$1@dough.gmane.org> <jmqsdv$ic7$1@dough.gmane.org>
	<CAGiJk9eh0KqA-qE96uc5BwHOu9n7VmGuZzgWcAisa+HhjGagzQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <CAGiJk9eh0KqA-qE96uc5BwHOu9n7VmGuZzgWcAisa+HhjGagzQ@mail.gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: [meta-kde] Test images (was: Re: [OE-core] RFC: Porting KDE Plasma Active (WIP))
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
X-List-Received-Date: Fri, 20 Apr 2012 10:33:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-04-12 09:59, Samuel Stirtzel schreef:
> 2012/4/20 Koen Kooi <koen@dominion.thruhere.net>: Op 19-04-12 18:57, Koen
> Kooi schreef:
>>>> Op 19-04-12 16:03, Samuel Stirtzel schreef:
>>>>> 2012/4/19 Koen Kooi <koen@dominion.thruhere.net>: Op 19-04-12
>>>>> 11:09, Samuel Stirtzel schreef:
>>>>>>>>>> Feel free to comment on the images.
>>>>>>>>> 
>>>>>>>>> Giving them a spin now :)
>>>>>>>> 
>>>>>>>> Thanks.
>>>>>>>> 
>>>>>>>> Just to let you know: Yesterday I accidentally added
>>>>>>>> "inherit allarch" to kde-wallpapers, this will produce an
>>>>>>>> error, I want to push my patch for this but Gitorious seems
>>>>>>>> to be down.
>>>> 
>>>>> Gitorious is down a lot, which is (partly) why I switched away
>>>>> from it.
>>>> 
>>>>>>>> Removing allarch from kde-wallpapers will do the trick.
>>>> 
>>>>> I'll update the repo in a minute. Some other things I ran into:
>>>> 
>>>>> * rasqal needs PARALLEL_MAKE = ""
>>>> 
>>>>>> Done, committed it to master. 
>>>>>> (68edc1551c703bd83a60aa05edb898a7bdfa9ff9 if anyone wants to 
>>>>>> cherry-pick)
>>>> 
>>>>> * soprano-native is needed for the onto2something binary, I did
>>>>> 'yum install soprano' instead
>>>> 
>>>>>> Which recipe is failing with the soprano-native error? The 
>>>>>> kdelibs4-native recipe should only optionally depend on it.
>>>> 
>>>> I forgot which recipe, sorry. I do managed to build the images
>>>> after a few tries. There were some more PARALLEL_MAKE and/or
>>>> missing DEPENDS related problems, but rerunning the build a few
>>>> times made those go away. The buildhistory output: 
>>>> https://github.com/Angstrom-distribution/buildhistory/commit/c4790bbe1534c8c536f6cacf509d93b14cf6050c
>
>>>> 
>> The diff from my buildhistory installed-packages.txt looks good. 
>> Although it seems like I have "some" strange kernel module installed
>> [1].
> 
>> The "+kde-wallpapers" and other shows that you have it installed in the
>> image while I installed it as package when I noticed it was missing, so
>> it is alright.
> 
> 
> The
>>>> 
> binaries don't run, lots of missing symbols to SessionManagement, do I 
> need to build qt4-x11 differently (apart from the GLES changes I
> forgot)?
> 
>> The qt4-x11-free_4.8.0.bbappend [2] should have done that. I can look
>> into it if you provide the log.do_configure for kdelibs4.
> 
>> At the first glance it looks like the .bbappend needs a PRINC, you 
>> could verify that with grep "-no-accessibility -no-sm" in your 
>> qt4-x11-free logfile dir.

That probably it, I had already built qt4.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPkTk+AAoJEHZqAkdh1vT6RnUP/R1wl42kEc22DXqCRycCOnvO
9C6dH8nvs3uL+SF7k23JGrA+jK7Z2Y9CScWOJzhl2pWn/j0kZPDJXSh5qOOVch/6
aNmy1NlRRM4fSUOrX4321mznWcH9OIXS5fRmOWh5psZoRwHocRlv3OoeY04Qilc8
RKg6wTqKKyn+PdNAx1A3PCytcBS0Tqe8kcgrpkMa3gdLci4tOvXieoFibfmjUPo/
IceElFDCz7zGorxw1ZP/M6GoFNH1hrDlU3m1+K9DptJdZPf2YefY1tVZ4FzqvnoJ
yTAU/gQj5phQP1Nf+Y3ntiqslP9W4UKj4SpzHcSQVSr2VOVqxMpuFuz1CmAFb+z4
n16MnFWwmrtIgu6Y189HjII7YBiSTaNto86axj/Wwg1Df5gX9vcfpl77Al8TPi1d
p4glMKi4BlhjPB/mCPfrCmByvpw7vABe1V8TYkknzk2wiISArRCnRjDVPk5+ZlDo
uT08EbhLU+ULBsmuQ2AherjWCHswkiqOOM69GiaFgvTW+xeFiFwTlTajmZYPRD1i
t12GC1zm1dDv0kzGMMpdhWoz0Kr96wAtIpXk/mntwiLvpSzpEB5KYCxd3Zn7zwmT
oTXUJuuX0y+puRM+mCqnl4saO3xdGSQddZ0HZZc4OKFzDKSdmddqe+VAfDf123x4
yGYTkxO0zuKSmtQ5hxFv
=510i
-----END PGP SIGNATURE-----



