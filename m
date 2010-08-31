Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OqYhA-0006jT-DT
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 23:48:47 +0200
Received: by wyg36 with SMTP id 36so7821525wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 14:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HxLX/TJA6ZMHHoD8MdVQZIv3fWgkxj6UN1PZ7f0hcYo=;
	b=AbRUfpdORMvU5zYggkrj9ES1O9NA1+buroO8z0FqTS/9HGXB9SSz+MpFZZ1g4fbEQF
	d1YlPxEAF6lFotChbsvYQCU8GPX1/H599l1dQclpiEY2o3n/U1KcVa8vXPmtAZDR14ii
	Rk9+OKtGJVLf9RvglIqK//yshxM128HfPB9oU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=j7dXNttN2HpN/ANYWezQEBJh2nbXimNKhC5LIbJaStmqGoqBeOkNzkAVs6aFcUW4Dn
	4NF1LlfGFbK3G4h5cS8SCH1ZPulmuD1O/3gmS2hcN8CBvs9vXd4UHfquSzAcz8k26WnX
	GCaPkgobX2cApHQ6Fn4+zZix+zoAbO80Q47Gk=
MIME-Version: 1.0
Received: by 10.227.128.79 with SMTP id j15mr7266162wbs.88.1283291291077; Tue,
	31 Aug 2010 14:48:11 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Tue, 31 Aug 2010 14:48:11 -0700 (PDT)
In-Reply-To: <AANLkTim39-M7sS3WhWLsAE2tDUGvJRLhebuBHkRHSKPy@mail.gmail.com>
References: <AANLkTimq+M2qtGzz1keuPBXFfYi-Qw9fPz2v4XXCd0JT@mail.gmail.com>
	<4C7D6411.6030407@soundmetrics.com>
	<AANLkTim39-M7sS3WhWLsAE2tDUGvJRLhebuBHkRHSKPy@mail.gmail.com>
Date: Tue, 31 Aug 2010 14:48:11 -0700
Message-ID: <AANLkTimUwTqTPWq07gvMxOAyNsTW0Yfa6LM3M_FdXA67@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Boost 1.41 seems to have build issues
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
X-List-Received-Date: Tue, 31 Aug 2010 21:48:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Going over more of the output on this build I am seeing a bunch of
these messages "NOTE: Couldn't find shared library provider for
libgcc_s.so.1" I have noticed at least just this libgcc file mentioned
in 5 other program builds.

Since the build does not stop does that mean there are no real issues there=
 or?

Thanks



On Tue, Aug 31, 2010 at 1:55 PM, J. L. <vwyodapink@gmail.com> wrote:
> overo fire with the psp kernel is what I am building
>
>
> On Tue, Aug 31, 2010 at 1:20 PM, John Faith <jfaith@soundmetrics.com> wro=
te:
>> J. L. wrote:
>>>
>>> When I bummed boost to the 1.41 version I noticed during building it
>>> did not build in the normal manner and displayed a bunch of warning
>>> though did not fail to build. Seems like it should not have so many
>>> errors or inability to find libraries. Could be my inexperience
>>> talking. Hope someone can explain why this isnt bad if it isnt but to
>>> me an error is an error, and would cause other issues once used on the
>>> image possibly. This is not the full message just a clip of it:
>>>
>>> NOTE: =A0 /usr/lib/Boost.cmake
>>> NOTE: =A0 /usr/share/boost-1.41.0/cmake/BoostConfig.cmake
>>> NOTE: =A0 /usr/share/boost-1.41.0/cmake/BoostConfigVersion.cmake
>>> NOTE: Multiple libraries (libboost_date_time-mt-d.so.1.41.0,
>>> libboost_date_time-mt.so.1.41.0) found and LEAD_SONAME not defined
>>> NOTE: Multiple libraries (libboost_filesystem-mt.so.1.41.0,
>>> libboost_filesystem-mt-d.so.1.41.0) found and LEAD_SONAME not defined
>>> NOTE: Multiple libraries (libboost_graph-mt.so.1.41.0,
>>> libboost_graph-mt-d.so.1.41.0) found and LEAD_SONAME not defined
>>> NOTE: Multiple libraries (libboost_iostreams-mt-d.so.1.41.0,
>>> libboost_iostreams-mt.so.1.41.0) found and LEAD_SONAME not defined
>>> NOTE: Multiple libraries (libboost_program_options-mt.so.1.41.0,
>>> libboost_program_options-mt-d.so.1.41.0) found and LEAD_SONAME not
>>> defined
>>> NOTE: Multiple libraries (libboost_python-mt-d.so.1.41.0,
>>> libboost_python-mt.so.1.41.0) found and LEAD_SONAME not defined
>>> NOTE: Multiple libraries (libboost_regex-mt-d.so.1.41.0,
>>> libboost_regex-mt.so.1.41.0) found and LEAD_SONAME not defined
>>> NOTE: Multiple libraries (libboost_wserialization-mt-d.so.1.41.0,
>>> libboost_serialization-mt-d.so.1.41.0,
>>> libboost_wserialization-mt.so.1.41.0,
>>> libboost_serialization-mt.so.1.41.0) found and LEAD_SONAME not defined
>>> NOTE: Multiple libraries (libboost_signals-mt-d.so.1.41.0,
>>> libboost_signals-mt.so.1.41.0) found and LEAD_SONAME not defined
>>> NOTE: Multiple libraries (libboost_system-mt-d.so.1.41.0,
>>> libboost_system-mt.so.1.41.0) found and LEAD_SONAME not defined
>>> NOTE: Multiple libraries (libboost_unit_test_framework-mt-d.so.1.41.0,
>>> libboost_unit_test_framework-mt.so.1.41.0) found and LEAD_SONAME not
>>> defined
>>> NOTE: Multiple libraries (libboost_thread-mt.so.1.41.0,
>>> libboost_thread-mt-d.so.1.41.0) found and LEAD_SONAME not defined
>>> NOTE: Multiple libraries (libboost_prg_exec_monitor-mt-d.so.1.41.0,
>>> libboost_wave-mt-d.so.1.41.0, libboost_prg_exec_monitor-mt.so.1.41.0,
>>> libboost_wave-mt.so.1.41.0) found and LEAD_SONAME not defined
>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>
>>>
>>
>> <snip>
>>>
>>> ERROR: QA Issue with boost-date-time: non -dev package contains
>>> symlink .so: boost-date-time path
>>>
>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/b=
oost-date-time/usr/lib/libboost_date_time-mt.so'
>>> ERROR: QA Issue with boost-date-time: non -dev package contains
>>> symlink .so: boost-date-time path
>>>
>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/b=
oost-date-time/usr/lib/libboost_date_time-mt-d.so'
>>>
>>>
>>
>> <snip>
>>
>>
>> Which machine are you building for?
>>
>> Not sure about the errors you saw, but when I tried to build for omap3ev=
m, I
>> hit a completely different problem:
>>
>> cd
>> /home/jfaith/oe/arago-tmp/work/armv7a-none-linux-gnueabi/boost-1.41.0-r8=
.1/boost-1.41.0.cmake0/libs/date_time/src
>> && /home/jfaith/oe/arago-tmp/sysroots/i686-linux/usr/bin/cmake -E
>> cmake_link_script CMakeFiles/boost_date_time-mt-static.dir/link.txt
>> --verbose=3D1
>> CMAKE_AR-NOTFOUND cr ../../../lib/libboost_date_time-mt.a
>> =A0CMakeFiles/boost_date_time-mt-static.dir/gregorian/greg_month.cpp.o
>> CMakeFiles/boost_date_time-mt-static.dir/gregorian/greg_weekday.cpp.o
>> CMakeFiles/boost_date_time-mt-static.dir/gregorian/date_generators.cpp.o
>> Error running link command: No such file or directory
>> make[2]: *** [lib/libboost_date_time-mt.a] Error 2
>>
>> ,
>> John
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>


