Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OrxT7-0003XK-W6
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Sep 2010 20:28:19 +0200
Received: by wwi14 with SMTP id 14so1973891wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Sep 2010 11:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=hKES/jUuh1yhi0QuCtzutVOa0kMWWi5tCs+tNytkWiQ=;
	b=eXATAdgOKaJKYcFqgUQIvmjUBOIKa9QRplMPJw3gt7f4qhDv5KtN039+Lh+RtKYqcI
	xff44PZ57fLZ9wkuWxtFwsY0K5f/9Fmy28tqwAXlk1YPECA6cfJfF5KwUwj+6952ugP2
	ax0L/oG6oVRolj9UXVqnAkXF5V8xsw/PdMKdQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FjR3uovm5X1uxQGR9JSJT0eqwHUnWA/xm1Bn7S6P4eJKlqG0kUiojdBnfKA5SE14Ib
	bMFqpsIPk2lttAeh32Kl4q7kTbY+F4hAsxcTq0J/ULSlJjMPVAut/K2KoBRK/aHDlTcu
	HeNf4MRmhj74fjdqzeDBL6aCSOMPLEM7eVjzw=
MIME-Version: 1.0
Received: by 10.216.235.104 with SMTP id t82mr957886weq.103.1283624841651;
	Sat, 04 Sep 2010 11:27:21 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Sat, 4 Sep 2010 11:27:21 -0700 (PDT)
In-Reply-To: <AANLkTin3okevekurJ3AbBJ-zCQHmKcQXRRWqY_1EXcJq@mail.gmail.com>
References: <AANLkTimq+M2qtGzz1keuPBXFfYi-Qw9fPz2v4XXCd0JT@mail.gmail.com>
	<4C7DAEDA.1090904@alexthegeek.com>
	<AANLkTinWnzzdtZ+zmX7VtZDKAfLsyf0xbhnyS6KvSqQE@mail.gmail.com>
	<AANLkTin3okevekurJ3AbBJ-zCQHmKcQXRRWqY_1EXcJq@mail.gmail.com>
Date: Sat, 4 Sep 2010 11:27:21 -0700
Message-ID: <AANLkTinKUsVF8GiuAZxKQF+-=Kr=0e39zKh5M29-OP=P@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>, 
	openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Gumstix-users] Boost 1.41 seems to have build issues
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
X-List-Received-Date: Sat, 04 Sep 2010 18:29:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Final verdict at this point for me is the 1.41 adds issues into the
build with not finding libraries and seems to cause other programs to
not build right. With 1.33.1 no errors and the image completed. In
case any one is still reading this one.

branch:overo
build machine: ubuntu 10.04
git: up to date


On Fri, Sep 3, 2010 at 9:14 PM, J. L. <vwyodapink@gmail.com> wrote:
> On Thu, Sep 2, 2010 at 12:00 AM, J. L. <vwyodapink@gmail.com> wrote:
>> Now the closer my image gets to being built since bumping this package
>> to 1.41 its seems to me roughly half the programs and dependencies
>> build with one or both of these notes in them "NOTE: Couldn't find
>> shared library provider for libstdc++.so.6
>> NOTE: Couldn't find shared library provider for libgcc_s.so.1" as it
>> did with this package. just wanted to post my other observations on
>> this as well..
>>
>>
>> On Tue, Aug 31, 2010 at 6:39 PM, Alex Gibson <alxx@alexthegeek.com> wrot=
e:
>>>
>>> Getting exactly the same messages
>>>
>>> Alex
>>>
>>>
>>> On 1/09/2010 5:27 AM, J. L. wrote:
>>>> When I bummed boost to the 1.41 version I noticed during building it
>>>> did not build in the normal manner and displayed a bunch of warning
>>>> though did not fail to build. Seems like it should not have so many
>>>> errors or inability to find libraries. Could be my inexperience
>>>> talking. Hope someone can explain why this isnt bad if it isnt but to
>>>> me an error is an error, and would cause other issues once used on the
>>>> image possibly. This is not the full message just a clip of it:
>>>>
>>>> NOTE: =A0 /usr/lib/Boost.cmake
>>>> NOTE: =A0 /usr/share/boost-1.41.0/cmake/BoostConfig.cmake
>>>> NOTE: =A0 /usr/share/boost-1.41.0/cmake/BoostConfigVersion.cmake
>>>> NOTE: Multiple libraries (libboost_date_time-mt-d.so.1.41.0,
>>>> libboost_date_time-mt.so.1.41.0) found and LEAD_SONAME not defined
>>>> NOTE: Multiple libraries (libboost_filesystem-mt.so.1.41.0,
>>>> libboost_filesystem-mt-d.so.1.41.0) found and LEAD_SONAME not defined
>>>> NOTE: Multiple libraries (libboost_graph-mt.so.1.41.0,
>>>> libboost_graph-mt-d.so.1.41.0) found and LEAD_SONAME not defined
>>>> NOTE: Multiple libraries (libboost_iostreams-mt-d.so.1.41.0,
>>>> libboost_iostreams-mt.so.1.41.0) found and LEAD_SONAME not defined
>>>> NOTE: Multiple libraries (libboost_program_options-mt.so.1.41.0,
>>>> libboost_program_options-mt-d.so.1.41.0) found and LEAD_SONAME not
>>>> defined
>>>> NOTE: Multiple libraries (libboost_python-mt-d.so.1.41.0,
>>>> libboost_python-mt.so.1.41.0) found and LEAD_SONAME not defined
>>>> NOTE: Multiple libraries (libboost_regex-mt-d.so.1.41.0,
>>>> libboost_regex-mt.so.1.41.0) found and LEAD_SONAME not defined
>>>> NOTE: Multiple libraries (libboost_wserialization-mt-d.so.1.41.0,
>>>> libboost_serialization-mt-d.so.1.41.0,
>>>> libboost_wserialization-mt.so.1.41.0,
>>>> libboost_serialization-mt.so.1.41.0) found and LEAD_SONAME not defined
>>>> NOTE: Multiple libraries (libboost_signals-mt-d.so.1.41.0,
>>>> libboost_signals-mt.so.1.41.0) found and LEAD_SONAME not defined
>>>> NOTE: Multiple libraries (libboost_system-mt-d.so.1.41.0,
>>>> libboost_system-mt.so.1.41.0) found and LEAD_SONAME not defined
>>>> NOTE: Multiple libraries (libboost_unit_test_framework-mt-d.so.1.41.0,
>>>> libboost_unit_test_framework-mt.so.1.41.0) found and LEAD_SONAME not
>>>> defined
>>>> NOTE: Multiple libraries (libboost_thread-mt.so.1.41.0,
>>>> libboost_thread-mt-d.so.1.41.0) found and LEAD_SONAME not defined
>>>> NOTE: Multiple libraries (libboost_prg_exec_monitor-mt-d.so.1.41.0,
>>>> libboost_wave-mt-d.so.1.41.0, libboost_prg_exec_monitor-mt.so.1.41.0,
>>>> libboost_wave-mt.so.1.41.0) found and LEAD_SONAME not defined
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> NOTE: Couldn't find shared library provider for libstdc++.so.6
>>>> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>>>> ERROR: QA Issue with boost-date-time: non -dev package contains
>>>> symlink .so: boost-date-time path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-date-time/usr/lib/libboost_date_time-mt.so'
>>>> ERROR: QA Issue with boost-date-time: non -dev package contains
>>>> symlink .so: boost-date-time path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-date-time/usr/lib/libboost_date_time-mt-d.so'
>>>> ERROR: QA Issue with boost-filesystem: non -dev package contains
>>>> symlink .so: boost-filesystem path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-filesystem/usr/lib/libboost_filesystem-mt-d.so'
>>>> ERROR: QA Issue with boost-filesystem: non -dev package contains
>>>> symlink .so: boost-filesystem path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-filesystem/usr/lib/libboost_filesystem-mt.so'
>>>> ERROR: QA Issue with boost-graph: non -dev package contains symlink
>>>> .so: boost-graph path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-graph/usr/lib/libboost_graph-mt.so'
>>>> ERROR: QA Issue with boost-graph: non -dev package contains symlink
>>>> .so: boost-graph path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-graph/usr/lib/libboost_graph-mt-d.so'
>>>> ERROR: QA Issue with boost-iostreams: non -dev package contains
>>>> symlink .so: boost-iostreams path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-iostreams/usr/lib/libboost_iostreams-mt-d.so'
>>>> ERROR: QA Issue with boost-iostreams: non -dev package contains
>>>> symlink .so: boost-iostreams path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-iostreams/usr/lib/libboost_iostreams-mt.so'
>>>> ERROR: QA Issue with boost-program-options: non -dev package contains
>>>> symlink .so: boost-program-options path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-program-options/usr/lib/libboost_program_options-mt.so'
>>>> ERROR: QA Issue with boost-program-options: non -dev package contains
>>>> symlink .so: boost-program-options path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-program-options/usr/lib/libboost_program_options-mt-d.so'
>>>> ERROR: QA Issue with boost-python: non -dev package contains symlink
>>>> .so: boost-python path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-python/usr/lib/libboost_python-mt-d.so'
>>>> ERROR: QA Issue with boost-python: non -dev package contains symlink
>>>> .so: boost-python path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-python/usr/lib/libboost_python-mt.so'
>>>> ERROR: QA Issue with boost-regex: non -dev package contains symlink
>>>> .so: boost-regex path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-regex/usr/lib/libboost_regex-mt-d.so'
>>>> ERROR: QA Issue with boost-regex: non -dev package contains symlink
>>>> .so: boost-regex path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-regex/usr/lib/libboost_regex-mt.so'
>>>> ERROR: QA Issue with boost-serialization: non -dev package contains
>>>> symlink .so: boost-serialization path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-serialization/usr/lib/libboost_wserialization-mt-d.so'
>>>> ERROR: QA Issue with boost-serialization: non -dev package contains
>>>> symlink .so: boost-serialization path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-serialization/usr/lib/libboost_serialization-mt-d.so'
>>>> ERROR: QA Issue with boost-serialization: non -dev package contains
>>>> symlink .so: boost-serialization path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-serialization/usr/lib/libboost_wserialization-mt.so'
>>>> ERROR: QA Issue with boost-serialization: non -dev package contains
>>>> symlink .so: boost-serialization path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-serialization/usr/lib/libboost_serialization-mt.so'
>>>> ERROR: QA Issue with boost-signals: non -dev package contains symlink
>>>> .so: boost-signals path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-signals/usr/lib/libboost_signals-mt-d.so'
>>>> ERROR: QA Issue with boost-signals: non -dev package contains symlink
>>>> .so: boost-signals path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-signals/usr/lib/libboost_signals-mt.so'
>>>> ERROR: QA Issue with boost-system: non -dev package contains symlink
>>>> .so: boost-system path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-system/usr/lib/libboost_system-mt.so'
>>>> ERROR: QA Issue with boost-system: non -dev package contains symlink
>>>> .so: boost-system path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-system/usr/lib/libboost_system-mt-d.so'
>>>> ERROR: QA Issue with boost-test: non -dev package contains symlink
>>>> .so: boost-test path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-test/usr/lib/libboost_unit_test_framework-mt-d.so'
>>>> ERROR: QA Issue with boost-test: non -dev package contains symlink
>>>> .so: boost-test path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-test/usr/lib/libboost_prg_exec_monitor-mt.so'
>>>> ERROR: QA Issue with boost-test: non -dev package contains symlink
>>>> .so: boost-test path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-test/usr/lib/libboost_prg_exec_monitor-mt-d.so'
>>>> ERROR: QA Issue with boost-test: non -dev package contains symlink
>>>> .so: boost-test path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-test/usr/lib/libboost_unit_test_framework-mt.so'
>>>> ERROR: QA Issue with boost-thread: non -dev package contains symlink
>>>> .so: boost-thread path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-thread/usr/lib/libboost_thread-mt.so'
>>>> ERROR: QA Issue with boost-thread: non -dev package contains symlink
>>>> .so: boost-thread path
>>>> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/=
boost-thread/usr/lib/libboost_thread-mt-d.so'
>>>>
>>>> ----------------------------------------------------------------------=
--------
>>>> This SF.net Dev2Dev email is sponsored by:
>>>>
>>>> Show off your parallel programming skills.
>>>> Enter the Intel(R) Threading Challenge 2010.
>>>> http://p.sf.net/sfu/intel-thread-sfd
>>>> _______________________________________________
>>>> gumstix-users mailing list
>>>> gumstix-users@lists.sourceforge.net
>>>> https://lists.sourceforge.net/lists/listinfo/gumstix-users
>>>
>>>
>>> --
>>> UTS CRICOS Provider Code: =A000099F
>>> DISCLAIMER: This email message and any accompanying attachments may con=
tain
>>> confidential information. =A0If you are not the intended recipient, do =
not
>>> read, use, disseminate, distribute or copy this message or attachments.=
 =A0If
>>> you have received this message in error, please notify the sender
>>> immediately and delete this message. Any views expressed in this messag=
e
>>> are those of the individual sender, except where the sender expressly, =
and
>>> with authority, states them to be the views the University of Technolog=
y,
>>> Sydney. Before opening any attachments, please check them for viruses a=
nd
>>> defects.
>>>
>>> -----------------------------------------------------------------------=
-------
>>> This SF.net Dev2Dev email is sponsored by:
>>>
>>> Show off your parallel programming skills.
>>> Enter the Intel(R) Threading Challenge 2010.
>>> http://p.sf.net/sfu/intel-thread-sfd
>>> _______________________________________________
>>> gumstix-users mailing list
>>> gumstix-users@lists.sourceforge.net
>>> https://lists.sourceforge.net/lists/listinfo/gumstix-users
>>>
>>
>
> Now after upgrading to 10.04 and going back to the boost version
> before this I am not seeing all the libgcc and libstdc warnings I was
> before. So far so good on build as well even other packages that were
> not building before are now. Not sure if it was the move back down on
> boost or the upgrade but I would think more it being the downgrading
> of boost
>


