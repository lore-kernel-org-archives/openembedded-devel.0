Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rizwancodes@gmail.com>) id 1RcxEb-0003nj-Si
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 11:47:50 +0100
Received: by wgbds11 with SMTP id ds11so10374296wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 02:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QobDEWMFeAO2uOiD4Usq5XwygT3PKF3w9B2voFhH920=;
	b=dZB6kNKyeMqsRCn9SJiccyMf6a80inM66LxLQq/8yhsVlgZ6jHZgQOLsskdCcleGi0
	ulHY7vV0ADWUzHwdshf4qevjd5W8Bd4usKpns7vjPfbdjg1OVuAAIgpjbLCDkiCwEiJ4
	2FNePwp41AvRHbmY7XtCcGXcYuG1LR7/jj/Ag=
MIME-Version: 1.0
Received: by 10.216.137.31 with SMTP id x31mr8253157wei.40.1324377640777; Tue,
	20 Dec 2011 02:40:40 -0800 (PST)
Received: by 10.216.176.199 with HTTP; Tue, 20 Dec 2011 02:40:40 -0800 (PST)
In-Reply-To: <mailman.1350.1324348724.26642.openembedded-devel@lists.openembedded.org>
References: <mailman.1350.1324348724.26642.openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Dec 2011 16:10:40 +0530
Message-ID: <CAPdp9mzRJhnf9ZPxdJM=z+pbUeuuLw=NAAsNgfFcnya5XNhACw@mail.gmail.com>
From: Rizwan Shaik <rizwancodes@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Openembedded-devel Digest, Vol 65, Issue 72
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
X-List-Received-Date: Tue, 20 Dec 2011 10:47:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

I am getting the following error with the rosetta package .. that
rosetta_cvs.bb failed to do fetch...Please help me.
I am try to build the desktop image for the pxa300 ARM processor.

Thanks in advance

---------- Forwarded message ----------
From: <openembedded-devel-request@lists.openembedded.org>
Date: Tue, Dec 20, 2011 at 8:08 AM
Subject: Openembedded-devel Digest, Vol 65, Issue 72
To: openembedded-devel@lists.openembedded.org


Send Openembedded-devel mailing list submissions to
       openembedded-devel@lists.openembedded.org

To subscribe or unsubscribe via the World Wide Web, visit

http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

or, via email, send a message with subject or body 'help' to
       openembedded-devel-request@lists.openembedded.org

You can reach the person managing the list at
       openembedded-devel-owner@lists.openembedded.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of Openembedded-devel digest..."


Today's Topics:

  1. Re: [oe-commits] Scott Garman : Add missing SUMMARY fields to
     various recipes (Scott Garman)
  2. Re: [2011.03-maintenance 0/5] pull request 20111214 (Tom Rini)
  3. Re: [[meta-oe]] vlc: re-add dropped depends as they are
     available now and add libxpm as dependency as current vlc's
     config depends on it. (Koen Kooi)
  4. Re: [PATCH meta-oe 5/9] nerperf: add (Khem Raj)
  5. Re: [PATCH meta-oe 5/9] nerperf: add (Flanagan, Elizabeth)
  6. Re: [PATCH meta-oe 5/9] nerperf: add (Luo Zhenhua-B19537)


----------------------------------------------------------------------

Message: 1
Date: Mon, 19 Dec 2011 08:28:07 -0800
From: Scott Garman <sgarman@zenlinux.com>
Subject: Re: [oe] [oe-commits] Scott Garman : Add missing SUMMARY
       fields to various recipes
To: openembedded-devel@lists.openembedded.org
Message-ID: <4EEF6617.3070004@zenlinux.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed

On 12/19/2011 01:54 AM, Andreas M?ller wrote:
> On Monday, December 19, 2011 10:34:47 AM git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: e8c194a627e091ef9da3b7fa83ea3897bd283d9e
>> URL:
>>
http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=e8c194a627
>> e091ef9da3b7fa83ea3897bd283d9e
>>
>> Author: Scott Garman<scott.a.garman@intel.com>
>> Date:   Sun Dec 18 15:06:57 2011 -0800
>>
>> Add missing SUMMARY fields to various recipes
>>
>> This adds the SUMMARY field to the following recipes which were
>> missing it:
>>
>> * dosfstools
>> * grep
>> * icu
>> * libevent
>> * libnfsidmap
>> * qemu-helper-nativesdk
>>
>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   .../nfs-utils/libnfsidmap_0.24.bb                  |    3 ++-
>>   .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    2 +-
>>   .../qemu/qemu-helper-nativesdk_1.0.bb              |    3 ++-
>>   meta/recipes-extended/grep/grep_2.9.bb             |    1 +
>>   meta/recipes-support/icu/icu-3.6.inc               |    1 +
>>   meta/recipes-support/libevent/libevent_1.4.14b.bb  |    3 ++-
>>   6 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>> b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb index
>> 101ecab..eff75ec 100644
>> --- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>> +++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>> @@ -1,4 +1,5 @@
>> -DESCRIPTION = "nfs idmapping library"
>> +SUMMARY = "NFS id mapping library"
>> +DESCRIPTION = "NFS id mapping library"
>>   HOMEPAGE = "http://www.citi.umich.edu/projects/nfsv4/linux/"
>>   SECTION = "libs"
>>
>> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>> b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb index
>> ec75ac9..eca54f1 100644
>> --- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>> +++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>> @@ -1,7 +1,7 @@
>>   # dosfstools OE build file
>>   # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights
>> Reserved # Released under the MIT license (see packages/COPYING)
>> -
>> +SUMMARY = "DOS FAT Filesystem Utilities"
>>   DESCRIPTION = "DOS FAT Filesystem Utilities"
>>
>>   SECTION = "base"
>> diff --git a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>> b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb index
>> a3dca3d..df0cae0 100644
>> --- a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>> +++ b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>> @@ -1,4 +1,5 @@
>> -DESCRIPTION = "Qemu helper scripts from Poky"
>> +SUMMARY = "Qemu helper scripts"
>> +DESCRIPTION = "Qemu helper scripts"
>>   LICENSE = "GPLv2"
>>   RDEPENDS_${PN} = "qemu-nativesdk"
>>   PR = "r9"
>> diff --git a/meta/recipes-extended/grep/grep_2.9.bb
>> b/meta/recipes-extended/grep/grep_2.9.bb index 08ac527..9099bed 100644
>> --- a/meta/recipes-extended/grep/grep_2.9.bb
>> +++ b/meta/recipes-extended/grep/grep_2.9.bb
>> @@ -1,3 +1,4 @@
>> +SUMMARY = "GNU grep utility"
>>   DESCRIPTION = "GNU grep utility"
>>   HOMEPAGE = "http://savannah.gnu.org/projects/grep/"
>>   BUGTRACKER = "http://savannah.gnu.org/bugs/?group=grep"
>> diff --git a/meta/recipes-support/icu/icu-3.6.inc
>> b/meta/recipes-support/icu/icu-3.6.inc index 8fadc92..e3f9dd2 100644
>> --- a/meta/recipes-support/icu/icu-3.6.inc
>> +++ b/meta/recipes-support/icu/icu-3.6.inc
>> @@ -1,3 +1,4 @@
>> +SUMMARY = "International Component for Unicode libraries"
>>   DESCRIPTION = "The International Component for Unicode (ICU) is a
mature,
>> portable set of C/C++ and Java libraries for Unicode support, software
>> internationalization (I18N) and globalization (G11N), giving applications
>> the same results on all platforms." HOMEPAGE =
>> "http://www-01.ibm.com/software/globalization/icu/index.jsp"
>>
>> diff --git a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>> b/meta/recipes-support/libevent/libevent_1.4.14b.bb index
1a369b5..36468dc
>> 100644
>> --- a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>> +++ b/meta/recipes-support/libevent/libevent_1.4.14b.bb
>> @@ -1,4 +1,5 @@
>> -DESCRIPTION = "an asynchronous event notification library"
>> +SUMMARY = "An asynchronous event notification library"
>> +DESCRIPTION = "An asynchronous event notification library"
>>   HOMEPAGE = "http://www.monkey.org/~provos/libevent/"
>>   SECTION = "libs"
>>
> What is the value in creating redundancies by copying DESRCIPTION to
SUMMARY?

Hi Andreas,

I did this because SUMMARY is a required field by the HOB UI. This was
requested by Shane Wang on the oe-core ML:

http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014600.html

For recipes which have short descriptions, there was little sense in
summarizing them further, so I duplicated the DESCRIPTION field. Above
you can also see an example (in the icu recipe) were I did summarize a
long DESCRIPTION field.

Mark Hatle replied to this thread explaining why we previously allowed
SUMMARY to be an optional field and how it automatically inherited from
DESCRIPTION.

Let me know if you have further questions.

Regards,

Scott




------------------------------

Message: 2
Date: Mon, 19 Dec 2011 10:40:59 -0700
From: Tom Rini <tom.rini@gmail.com>
Subject: Re: [oe] [2011.03-maintenance 0/5] pull request 20111214
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Message-ID:
       <CA+M6bXmi_v8eG0gFooZ2JyOpVfk1XzXSH4RCQyBm3LtJjvKdqQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 19, 2011 at 9:32 AM, Steffen Sledz <sledz@dresearch-fe.de>
wrote:
> On 19.12.2011 16:28, Tom Rini wrote:
>> On Mon, Dec 19, 2011 at 8:22 AM, Steffen Sledz <sledz@dresearch-fe.de>
wrote:
>>> On 19.12.2011 15:39, Tom Rini wrote:
>>>> On Mon, Dec 19, 2011 at 12:17 AM, Steffen Sledz <sledz@dresearch-fe.de>
wrote:
>>>>> On 15.12.2011 07:37, Steffen Sledz wrote:
>>>>>> Am 14.12.2011 19:07, schrieb Tom Rini:
>>>>>>> On Wed, Dec 14, 2011 at 4:40 AM, Steffen Sledz <
sledz@dresearch-fe.de> wrote:
>>>>>>>> Hi Tom,
>>>>>>>>
>>>>>>>> please pull these 5 commits cherry-picked from oe.dev.
>>>>>>>> All of them are bugfixes and tested in our own environment.
>>>>>>>>
>>>>>>>> Thx,
>>>>>>>> Steffen
>>>>>>>>
>>>>>>>> The following changes since commit
9826895e30baa597a5ec433cc0ebd52f5f6c8796:
>>>>>>>>
>>>>>>>> ?Merge remote-tracking branch 'upstream/2011.03-maintenance' into
sledz/maintenance (2011-12-09 14:06:08 +0100)
>>>>>>>>
>>>>>>>> are available in the git repository at:
>>>>>>>>
>>>>>>>> ?git://git.openembedded.org/openembedded sledz/maintenance
>>>>>>>> ?
http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=sledz/maintenance
>>>>>>>>
>>>>>>>> Stefan Schmidt (2):
>>>>>>>> ?llvm2.7_2.7: Add patch for build errors on newer gcc / glibc
>>>>>>>> ? ?combinations
>>>>>>>> ?llvm2.7_2.7.bb: Update patch to use c++ include style.
>>>>>>>>
>>>>>>>> Steffen Sledz (3):
>>>>>>>> ?live555: replace version 20110314 with 20111120
>>>>>>>> ?icedtea6-native: fix problem on build hosts with linux kernel 3.x
>>>>>>>> ?openjdk: fix problem on build hosts with linux kernel 3.x
>>>>>>>
>>>>>>> Only 1 2 and 3 made it to the ML.
>>>>>>
>>>>>> Please have a second look. They all should be there.
>>>>>>
>>>>>>> 1 and 2 are fine. ?For 3, we should
>>>>>>> grab the old file (someone must have a copy) and stick that on
>>>>>>> sources.openembedded.org.
>>>>>>
>>>>>> The version replacement is not just for the well known live555
download problem. It fixes some other problems too. Also the version
introduced by this patch is already uploaded to
sources.openembedded.organd the angstrom mirrors.
>>>>>
>>>>> Ping!
>>>>
>>>> Sorry for the delay. ?Especially since I'm now going to ask you to
>>>> rebase the branch. ?Here's what I get after merging your request:
>>>> $ git log --oneline origin..
>>>> b6cc3be87 Merge branch 'sledz/maintenance' of git://
git.openembedded.org/openemb
>>>> eda1aaf openjdk: fix problem on build hosts with linux kernel 3.x
>>>> 4500148 icedtea6-native: fix problem on build hosts with linux kernel
3.x
>>>> cb5b2fb live555: replace version 20110314 with 20111120
>>>> 3904feb llvm2.7_2.7.bb: Update patch to use c++ include style.
>>>> a992bc4 llvm2.7_2.7: Add patch for build errors on newer gcc / glibc
combination
>>>> 9826895 Merge remote-tracking branch 'upstream/2011.03-maintenance'
into sledz/m
>>>> ebb70fd gypsy: update to latest upstream version 0.8, and remove
version 0.7
>>>> 69186cf gypsy: move generic SRC_URI part to gypsy.inc
>>>> 7f9e803 gypsy: fix packaging of DBus starter script
>>>> 45b8af8 rsyslog: change path for config includes to /etc/rsyslog.d
>>>> 77a5200 Revert "gypsy: fix packaging of DBus starter script"
>>>> 105f8ae Revert "gypsy: move generic SRC_URI part to gypsy.inc"
>>>> 701d1cb Revert "gypsy: update to latest upstream version 0.8, and
remove version
>>>> 593bb51 Revert "rsyslog: change path for config includes to
/etc/rsyslog.d"
>>>> de3065d gypsy: update to latest upstream version 0.8, and remove
version 0.7
>>>> dbb8899 gypsy: move generic SRC_URI part to gypsy.inc
>>>> 9bef377 gypsy: fix packaging of DBus starter script
>>>> 772286e Merge remote-tracking branch 'upstream/2011.03-maintenance'
into sledz/m
>>>> ef52795 rsyslog: change path for config includes to /etc/rsyslog.d
>>>>
>>>> I'm sure it's all unintentional.
>>>
>>> The pull request contains the last five commits only ("The following
changes since commit 9826895e30baa597a5ec433cc0ebd52f5f6c8796").
>>>
>>> Maybe i need some help in using git here. How should i prepare my
branch to fulfil your requirements?
>>
>> Are others using your branch? ?If not, git push <name of your writable
>> OE remote> :sledz/maintenance to delete your current branch, git
>> rebase -i origin/2011.03-maintenance (and remove the commits you no
>> longer want) then git push <name of writeable OE remote>
>> local-branch:sledz/maintenance.
>
> Sorry, but i need some more guidance here. Everytime i think i made it
another problem drives me crazy. :(
>
> Assuming i've a fresh local clone created with
>
> ?git clone git@git.openembedded.org:openembedded
>
> What are the exact next stepts?
>
> I tried
>
> ?git checkout sledz/maintenance
> ?git rebase -i origin/2011.03-maintenance ? ?# unwanted commits removed
> ?git push origin sledz/maintenance
>
> The last results in
>
> ?To git@git.openembedded.org:openembedded
> ? ! [rejected] ? ? ? ?sledz/maintenance -> sledz/maintenance
(non-fast-forward)
> ?error: failed to push some refs to 'git@git.openembedded.org:
openembedded'
> ?To prevent you from losing history, non-fast-forward updates were
rejected
> ?Merge the remote changes (e.g. 'git pull') before pushing again. ?See the
> ?'Note about fast-forwards' section of 'git push --help' for details.

You either need to do the git push
git@git.openembedded.org:openembedded :sledz/maintenance (to delete
the old one) and if that fails (it used to be that only admins could
delete branches, just push instead to sledz/pull-request-19dec2011 or
so :)

--
Tom



------------------------------

Message: 3
Date: Mon, 19 Dec 2011 19:35:27 +0100
From: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [oe] [[meta-oe]] vlc: re-add dropped depends as they are
       available now and add libxpm as dependency as current vlc's config
       depends on it.
To: openembedded-devel@lists.openembedded.org
Message-ID: <jco05e$tt9$1@dough.gmane.org>
Content-Type: text/plain; charset=UTF-8

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-12-11 17:28, Sylvain 'GarthPS' Par? schreef:
> Signed-off-by: Sylvain 'GarthPS' Par? <sylvain.pare@gmail.com> ---
> meta-oe/recipes-multimedia/vlc/vlc.inc |    5 ++--- 1 files changed, 2
> insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc
> b/meta-oe/recipes-multimedia/vlc/vlc.inc index aecfb3a..375e42e 100644
> --- a/meta-oe/recipes-multimedia/vlc/vlc.inc +++
> b/meta-oe/recipes-multimedia/vlc/vlc.inc @@ -4,8 +4,7 @@ LICENSE =
> "GPLv2" SECTION = "multimedia"
>
> DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl
> qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \ -" -#
> ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag
> liba52 mpeg2dec', d)}" +
> ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag
> liba52 mpeg2dec', d)}"
>
> SRC_URI =
> "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
>
> @@ -13,7 +12,7 @@ inherit autotools gettext
>
> ARM_INSTRUCTION_SET = "arm"
>
> -DEPENDS += "libdvdcss libdvdread lua5.1-native lua5.1" +DEPENDS +=
> "libdvdcss libdvdread lua5.1-native lua5.1 libxpm"
>
> LEAD_SONAME = "libvlc.so.5"
>

Missing PR bump
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7vg+8ACgkQMkyGM64RGpFwmACgsufoFQDWp5Z6G+WUzWBeY8Yo
Z9EAn0JPLjlqRnmiFcH/mGy40iU+JyjR
=I5gy
-----END PGP SIGNATURE-----




------------------------------

Message: 4
Date: Mon, 19 Dec 2011 11:20:00 -0800
From: Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe] [PATCH meta-oe 5/9] nerperf: add
To: Luo Zhenhua-B19537 <B19537@freescale.com>
Cc: "openembedded-devel@lists.openembedded.org"
       <openembedded-devel@lists.openembedded.org>
Message-ID:
       <CAMKF1sq+5vPUE=10OXQ2agDH=jsvaQ+3DZ5PYx38JPQ42K+G+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2011 at 1:52 AM, Luo Zhenhua-B19537
<B19537@freescale.com> wrote:
>> it says "for non-commercial purposes only"
> [Luo Zhenhua-B19537] Does this message mean netperf can't be included in
meta-oe?

INAL however I think if its being added for commercial use then
probably not. But ark the legal folks.



------------------------------

Message: 5
Date: Mon, 19 Dec 2011 14:31:46 -0800
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Subject: Re: [oe] [PATCH meta-oe 5/9] nerperf: add
To: openembedded-devel@lists.openembedded.org,  Luo Zhenhua-B19537
       <B19537@freescale.com>
Message-ID:
       <CAPhnLPDSpXjAi+V9gjJCsrdoYez5CJWzv-+ejmDqm8P5mFu_Kw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 16, 2011 at 1:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On (16/12/11 10:22), Koen Kooi wrote:
>>
>> Op 16 dec. 2011, om 10:19 heeft Luo Zhenhua-B19537 het volgende
geschreven:
>>
>> > Hello Koen,
>> >
>> >> -----Original Message-----
>> >> From: openembedded-devel-bounces@lists.openembedded.org [mailto:
openembedded-
>> >> devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
>> >> Sent: Friday, December 16, 2011 3:52 PM
>> >>
>> >>> +++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb @@ -0,0
+1,47
>> >>> @@ +DESCRIPTION="Network performance benchmark including tests for
>> >>> TCP, UDP, sockets, ATM and more." +SECTION = "console/network"
>> >>> +HOMEPAGE = "http://www.netperf.org/" +LICENSE = "netperf"
>> >>
>> >> Can you include a comment on what type of license netperf is? MIT
like, BSD like,
>> >> GPL like?
>> > [Luo Zhenhua-B19537] May I know which license type should be with
following COPYING content?
>>
>> That looks like a BSD or MIT derivative, maybe Beth can give us some
guidance on what to use as LICENSE
>
> it says "for non-commercial purposes only"

Yeah.... in this case, I would do one of two things (and I have a
feeling one will be more valid that the other):

1. Email the author and see if we can use BSD-4-Clause. My guess is no.
2. We'll need to add a Netperf license to common-licenses and set
LICENSE = "Netperf"

I've checked the openSuSE Build Service and they have this as an
"Other" license, so, check with the author first, but be prepared to
add Netperf to the common-licenses directory.

And yes, Koen is right. I wouldn't use BSD or MIT for this,
specifically because of the non-commercial clause in (ii).

-b

>
>>
>> regards,
>>
>> Koen
>>
>>
>> >
>> > ? ? ? ? ? ? ?Copyright (C) 1993 Hewlett-Packard Company
>> > ? ? ? ? ? ? ? ? ? ? ? ? ALL RIGHTS RESERVED.
>> >
>> > ?The enclosed software and documentation includes copyrighted works
>> > ?of Hewlett-Packard Co. For as long as you comply with the following
>> > ?limitations, you are hereby authorized to (i) use, reproduce, and
>> > ?modify the software and documentation, and to (ii) distribute the
>> > ?software and documentation, including modifications, for
>> > ?non-commercial purposes only.
>> >
>> > ?1. ?The enclosed software and documentation is made available at no
>> > ? ? ?charge in order to advance the general development of
>> > ? ? ?high-performance networking products.
>> >
>> > ?2. ?You may not delete any copyright notices contained in the
>> > ? ? ?software or documentation. All hard copies, and copies in
>> > ? ? ?source code or object code form, of the software or
>> > ? ? ?documentation (including modifications) must contain at least
>> > ? ? ?one of the copyright notices.
>> >
>> > ?3. ?The enclosed software and documentation has not been subjected
>> > ? ? ?to testing and quality control and is not a Hewlett-Packard Co.
>> > ? ? ?product. At a future time, Hewlett-Packard Co. may or may not
>> > ? ? ?offer a version of the software and documentation as a product.
>> >
>> > ?4. ?THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
>> > ? ? ?HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
>> > ? ? ?REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
>> > ? ? ?DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
>> > ? ? ?PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
>> > ? ? ?DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
>> > ? ? ?EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
>> > ? ? ?DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
>> > ? ? ?MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
>> >
>> > ?5. ?HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR ANY
>> > ? ? ?DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
>> > ? ? ?(INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
>> > ? ? ?MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.
>> >
>> >
>> > Best Regards,
>> >
>> > Zhenhua
>> >
>>
>
>
>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> --
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--
Elizabeth Flanagan
Yocto Project
Build and Release



------------------------------

Message: 6
Date: Tue, 20 Dec 2011 02:31:37 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [oe] [PATCH meta-oe 5/9] nerperf: add
To: "openembedded-devel@lists.openembedded.org"
       <openembedded-devel@lists.openembedded.org>
Message-ID:
       <
CA452391058F6D4E9715FB2C29D9312A010B966C@039-SN2MPN1-023.039d.mgd.msft.net>

Content-Type: text/plain; charset="iso-8859-1"

Thanks for the feedback.

I saw netperf is licensed under "netperf" in oe
http://cgit.openembedded.org/openembedded/plain/recipes/netperf/netperf_2.4.4.bb
.

Anyway, I will send an email to the author to query about the license type.


Best Regards,

Zhenhua

> -----Original Message-----
> From: Flanagan, Elizabeth [mailto:elizabeth.flanagan@intel.com]
> Sent: Tuesday, December 20, 2011 6:32 AM
> To: openembedded-devel@lists.openembedded.org; Luo Zhenhua-B19537
> Subject: Re: [oe] [PATCH meta-oe 5/9] nerperf: add
>
> On Fri, Dec 16, 2011 at 1:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On (16/12/11 10:22), Koen Kooi wrote:
> >>
> >> Op 16 dec. 2011, om 10:19 heeft Luo Zhenhua-B19537 het volgende
geschreven:
> >>
> >> > Hello Koen,
> >> >
> >> >> -----Original Message-----
> >> >> From: openembedded-devel-bounces@lists.openembedded.org
> >> >> [mailto:openembedded- devel-bounces@lists.openembedded.org] On
> >> >> Behalf Of Koen Kooi
> >> >> Sent: Friday, December 16, 2011 3:52 PM
> >> >>
> >> >>> +++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb @@ -0,0
> >> >>> +++ +1,47
> >> >>> @@ +DESCRIPTION="Network performance benchmark including tests
> >> >>> for TCP, UDP, sockets, ATM and more." +SECTION = "console/network"
> >> >>> +HOMEPAGE = "http://www.netperf.org/" +LICENSE = "netperf"
> >> >>
> >> >> Can you include a comment on what type of license netperf is? MIT
> >> >> like, BSD like, GPL like?
> >> > [Luo Zhenhua-B19537] May I know which license type should be with
following
> COPYING content?
> >>
> >> That looks like a BSD or MIT derivative, maybe Beth can give us some
> >> guidance on what to use as LICENSE
> >
> > it says "for non-commercial purposes only"
>
> Yeah.... in this case, I would do one of two things (and I have a feeling
one
> will be more valid that the other):
>
> 1. Email the author and see if we can use BSD-4-Clause. My guess is no.
> 2. We'll need to add a Netperf license to common-licenses and set LICENSE
=
> "Netperf"
>
> I've checked the openSuSE Build Service and they have this as an "Other"
license,
> so, check with the author first, but be prepared to add Netperf to the
common-
> licenses directory.
>
> And yes, Koen is right. I wouldn't use BSD or MIT for this, specifically
because
> of the non-commercial clause in (ii).
>
> -b
>
> >
> >>
> >> regards,
> >>
> >> Koen
> >>
> >>
> >> >
> >> > ? ? ? ? ? ? ?Copyright (C) 1993 Hewlett-Packard Company
> >> > ? ? ? ? ? ? ? ? ? ? ? ? ALL RIGHTS RESERVED.
> >> >
> >> > ?The enclosed software and documentation includes copyrighted works
> >> > ?of Hewlett-Packard Co. For as long as you comply with the
> >> > following
> >> > ?limitations, you are hereby authorized to (i) use, reproduce, and
> >> > ?modify the software and documentation, and to (ii) distribute the
> >> > ?software and documentation, including modifications, for
> >> > ?non-commercial purposes only.
> >> >
> >> > ?1. ?The enclosed software and documentation is made available at
> >> > no
> >> > ? ? ?charge in order to advance the general development of
> >> > ? ? ?high-performance networking products.
> >> >
> >> > ?2. ?You may not delete any copyright notices contained in the
> >> > ? ? ?software or documentation. All hard copies, and copies in
> >> > ? ? ?source code or object code form, of the software or
> >> > ? ? ?documentation (including modifications) must contain at least
> >> > ? ? ?one of the copyright notices.
> >> >
> >> > ?3. ?The enclosed software and documentation has not been subjected
> >> > ? ? ?to testing and quality control and is not a Hewlett-Packard Co.
> >> > ? ? ?product. At a future time, Hewlett-Packard Co. may or may not
> >> > ? ? ?offer a version of the software and documentation as a product.
> >> >
> >> > ?4. ?THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
> >> > ? ? ?HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
> >> > ? ? ?REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
> >> > ? ? ?DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
> >> > ? ? ?PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
> >> > ? ? ?DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
> >> > ? ? ?EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
> >> > ? ? ?DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
> >> > ? ? ?MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> >> >
> >> > ?5. ?HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR
> >> > ANY
> >> > ? ? ?DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
> >> > ? ? ?(INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
> >> > ? ? ?MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.
> >> >
> >> >
> >> > Best Regards,
> >> >
> >> > Zhenhua
> >> >
> >>
> >
> >
> >
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve
> >> l
> >
> >
> > --
> > -Khem
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> --
> Elizabeth Flanagan
> Yocto Project
> Build and Release





------------------------------

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


End of Openembedded-devel Digest, Vol 65, Issue 72
**************************************************

