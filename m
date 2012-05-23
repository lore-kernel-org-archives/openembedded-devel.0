Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SX7f6-00067s-0Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 May 2012 11:15:20 +0200
Received: by ghbz2 with SMTP id z2so1143684ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2012 02:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=xI5sIn/X4Yp8IeWq2R8eUrQi1nYBMYU8KwH3A5FPEHw=;
	b=aOSYx4nQoZTEiSV8u6T9KbC6DDr8COEUo+2vfF1SX5DmgcT0ZEfAUcAFC5s8+iDk2X
	f2EgOjkAE0xj5mRdYWAPukXPbVUE2FZZPk+pnLM8bHK8TNtorLL6L8Bo8s53kGks1L/a
	fmTvoBBq7cHbIM5Zqm1tHQKgKNszqG+MMFPPQ0eCWBBPqiMIH0mL8ZFDqUAJrM3tDO+F
	CvehJHjJjCy1j60OCs0umAsGCQdpse00QKJK0o/kcRgSUM5rNzFcpEYlbTGx+oYMZ21V
	HDzJc6L/e/QIaqiVHDKtQWDAsxu0oGQoL+f+pKelCXCx41CjdMKsjgDkk7Zb7OW4YlOP
	2w4A==
Received: by 10.50.46.195 with SMTP id x3mr499664igm.54.1337763909206; Wed, 23
	May 2012 02:05:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.28.147 with HTTP; Wed, 23 May 2012 02:04:49 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CAK18fxG4tFYKDHsa-KBW-yLJNZugV4G=5gK8dm+3zsAd9M0PkA@mail.gmail.com>
References: <4FBBA7CD.4080805@windenergy.com>
	<CAK18fxG4tFYKDHsa-KBW-yLJNZugV4G=5gK8dm+3zsAd9M0PkA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 23 May 2012 12:04:49 +0300
Message-ID: <CAK18fxEi2MFFbQsG3_0WGnHMcytTt8f_1Vv174zvWYMRYRMVCQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlTnd5alLOKJPEa3NuN60fR6yLSNFAiIqfGiw+fIqN2yE8qAtGVyFa7IDVgIJzum8J+D/OE
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: bitbake recipes with wildcards fail
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
X-List-Received-Date: Wed, 23 May 2012 09:15:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

After checking latest commits i could see that this is fixed already.

commit 33c4bf2096effc850720009564e3d1adbda24452
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Tue May 22 12:18:11 2012 +0100


@g

On Wed, May 23, 2012 at 10:38 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> I will fix this today. I know where the problem is.
> On May 23, 2012 9:51 AM, "Craig Swank" <craig.swank@windenergy.com> wrote:
>
>> I was trying to build a console-image for a beaglebone and the build
>> failed at libpam and again at systemd-compat-units.  The problem seems to
>> be with bitbake recipes that have a wildcard in "file://" declarations like:
>>
>> file://*.service
>>
>> or
>>
>> file://pam.d/*
>>
>> I was able to fix libpam by changing .bb (here is a patch):
>>
>> diff --git a/meta/recipes-extended/pam/li**bpam_1.1.5.bb<http://libpam_1.1.5.bb>b/meta/recipes-extended/pam/
>> li**bpam_1.1.5.bb <http://libpam_1.1.5.bb>
>> index 08ce1d1..48da73d 100644
>> --- a/meta/recipes-extended/pam/li**bpam_1.1.5.bb<http://libpam_1.1.5.bb>
>> +++ b/meta/recipes-extended/pam/li**bpam_1.1.5.bb<http://libpam_1.1.5.bb>
>> @@ -13,7 +13,12 @@ PR = "r3"
>>
>>  SRC_URI = "https://fedorahosted.org/**releases/l/i/linux-pam/Linux-**
>> PAM-${PV}.tar.bz2<https://fedorahosted.org/releases/l/i/linux-pam/Linux-PAM-$%7BPV%7D.tar.bz2>\
>>            file://99_pam \
>> -           file://pam.d/* \
>> +           file://pam.d/common-account \
>> +           file://pam.d/common-auth \
>> +           file://pam.d/common-password \
>> +           file://pam.d/common-session \
>> +           file://pam.d/common-session-**noninteractive \
>> +           file://pam.d/other \
>>            file://libpam-xtests.patch"
>>
>>  SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch"
>>
>>
>> I fixed the other problem with this:
>>
>> tuco% git diff
>> diff --git a/meta-oe/recipes-core/**systemd/systemd-compat-units.**bb<http://systemd-compat-units.bb>b/meta-oe/recipes-core/
>> **systemd/systemd-compat-units.**bb <http://systemd-compat-units.bb>
>> index c9a6b67..b14862e 100644
>> --- a/meta-oe/recipes-core/**systemd/systemd-compat-units.**bb<http://systemd-compat-units.bb>
>> +++ b/meta-oe/recipes-core/**systemd/systemd-compat-units.**bb<http://systemd-compat-units.bb>
>> @@ -7,7 +7,8 @@ PR = "r15"
>>
>>  inherit allarch
>>
>> -SRC_URI = "file://*.service"
>> +SRC_URI = "file://machineid.service \
>> +           file://run-postinsts.service"
>>
>>  do_install() {
>>        install -d ${D}${systemd_unitdir}/system/**basic.target.wants
>>
>>
>> I installed openembedded on Ubuntu 12.04 (and confirmed the problem on
>> Ubuntu 11.10) using the oebb.sh setup script and following the directions
>> at:
>>
>> http://www.angstrom-**distribution.org/building-**angstrom<http://www.angstrom-distribution.org/building-angstrom>
>>
>>
>> Error for libpam:
>> ERROR: Error executing a python function in /home/craig/Angstrom/setup-**
>> scripts/sources/openembedded-**core/meta/recipes-extended/**pam/
>> libpam_1.1.5.bb:
>> IOError: [Errno 2] No such file or directory: '/home/craig/Angstrom/setup-
>> **scripts/sources/openembedded-**core/meta/recipes-extended/**
>> pam/libpam/./pam.d/*'
>>
>> ERROR: The stack trace of python calls that resulted in this
>> exception/failure was:
>> ERROR:   File "base_do_fetch", line 18, in <module>
>> ERROR:
>> ERROR:   File "base_do_fetch", line 13, in base_do_fetch
>> ERROR:
>> ERROR:   File "/home/craig/Angstrom/setup-**scripts/sources/bitbake/lib/*
>> *bb/fetch2/__init__.py", line 1006, in download
>> ERROR:     update_stamp(u, ud, self.d)
>> ERROR:
>> ERROR:   File "/home/craig/Angstrom/setup-**scripts/sources/bitbake/lib/*
>> *bb/fetch2/__init__.py", line 335, in update_stamp
>> ERROR:     verify_checksum(u, ud, d)
>> ERROR:
>> ERROR:   File "/home/craig/Angstrom/setup-**scripts/sources/bitbake/lib/*
>> *bb/fetch2/__init__.py", line 277, in verify_checksum
>> ERROR:     md5data = bb.utils.md5_file(ud.**localpath)
>> ERROR:
>> ERROR:   File "/home/craig/Angstrom/setup-**scripts/sources/bitbake/lib/*
>> *bb/utils.py", line 362, in md5_file
>> ERROR:     for line in open(filename):
>> ERROR:
>> ERROR: The code that was being executed was:
>> ERROR:      0014:        except bb.fetch2.BBFetchException, e:
>> ERROR:      0015:            raise bb.build.FuncFailed(e)
>> ERROR:      0016:
>> ERROR:      0017:
>> ERROR:  *** 0018:base_do_fetch(d)
>> ERROR:      0019:
>> ERROR: (file: 'base_do_fetch', lineno: 18, function: <module>)
>> ERROR:      0009:    bb.data.update_data(localdata)
>> ERROR:      0010:
>> ERROR:      0011:        try:
>> ERROR:      0012:            fetcher = bb.fetch2.Fetch(src_uri, localdata)
>> ERROR:  *** 0013:            fetcher.download()
>> ERROR:      0014:        except bb.fetch2.BBFetchException, e:
>> ERROR:      0015:            raise bb.build.FuncFailed(e)
>> ERROR:      0016:
>> ERROR:      0017:
>> ERROR: (file: 'base_do_fetch', lineno: 13, function: base_do_fetch)
>> ERROR: Function failed: base_do_fetch
>> ERROR: Logfile of failure stored in: /home/craig/Angstrom/setup-**
>> scripts/build/tmp-angstrom_**v2012_05-eglibc/work/armv7a-**
>> angstrom-linux-gnueabi/libpam-**1.1.5-r3/temp/log.do_fetch.**24464
>> NOTE: package libpam-1.1.5-r3: task do_fetch: Failed
>> NOTE: package shadow-4.1.4.3-r8: task do_fetch: Started
>> NOTE: package shadow-4.1.4.3-r8: task do_fetch: Succeeded
>> ERROR: Task 1087 (/home/craig/Angstrom/setup-**
>> scripts/sources/openembedded-**core/meta/recipes-extended/**pam/
>> libpam_1.1.5.bb, do_fetch) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 1109 tasks of which 1107 didn't need to be
>> rerun and 1 failed.
>>
>> Summary: 1 task failed:
>>  /home/craig/Angstrom/setup-**scripts/sources/openembedded-**
>> core/meta/recipes-extended/**pam/libpam_1.1.5.bb, do_fetch
>> Summary: There were 37 ERROR messages shown, returning a non-zero exit
>> code.
>>
>>
>>
>>
>> And the error for systemd-compat-units.bb:
>>
>> ROR: Error executing a python function in /home/craig/Angstrom/setup-**
>> scripts/sources/meta-**openembedded/meta-oe/recipes-**core/systemd/
>> systemd-compat-**units.bb <http://systemd-compat-units.bb>:
>> IOError: [Errno 2] No such file or directory: '/home/craig/Angstrom/setup-
>> **scripts/sources/meta-**openembedded/meta-oe/recipes-**
>> core/systemd/systemd-compat-**units/./*.service'
>>
>> NOTE: Running task 3142 of 3440 (ID: 1617, /home/craig/Angstrom/setup-**
>> scripts/sources/meta-**openembedded/meta-oe/recipes-**connectivity/iw/
>> iw_3.2.bb, do_patch)
>> ERROR: The stack trace of python calls that resulted in this
>> exception/failure was:
>> ERROR:   File "base_do_fetch", line 18, in <module>
>> ERROR:
>> ERROR:   File "base_do_fetch", line 13, in base_do_fetch
>> ERROR:
>> ERROR:   File "/home/craig/Angstrom/setup-**scripts/sources/bitbake/lib/*
>> *bb/fetch2/__init__.py", line 1006, in download
>> ERROR:     update_stamp(u, ud, self.d)
>> ERROR:
>> ERROR:   File "/home/craig/Angstrom/setup-**scripts/sources/bitbake/lib/*
>> *bb/fetch2/__init__.py", line 335, in update_stamp
>> ERROR:     verify_checksum(u, ud, d)
>> ERROR:
>> ERROR:   File "/home/craig/Angstrom/setup-**scripts/sources/bitbake/lib/*
>> *bb/fetch2/__init__.py", line 277, in verify_checksum
>> ERROR:     md5data = bb.utils.md5_file(ud.**localpath)
>> ERROR:
>> ERROR:   File "/home/craig/Angstrom/setup-**scripts/sources/bitbake/lib/*
>> *bb/utils.py", line 362, in md5_file
>> ERROR:     for line in open(filename):
>> ERROR:
>> ERROR: The code that was being executed was:
>> ERROR:      0014:        except bb.fetch2.BBFetchException, e:
>> ERROR:      0015:            raise bb.build.FuncFailed(e)
>> ERROR:      0016:
>> ERROR:      0017:
>> ERROR:  *** 0018:base_do_fetch(d)
>> ERROR:      0019:
>> ERROR: (file: 'base_do_fetch', lineno: 18, function: <module>)
>> ERROR:      0009:    bb.data.update_data(localdata)
>> ERROR:      0010:
>> ERROR:      0011:        try:
>> ERROR:      0012:            fetcher = bb.fetch2.Fetch(src_uri, localdata)
>> ERROR:  *** 0013:            fetcher.download()
>> ERROR:      0014:        except bb.fetch2.BBFetchException, e:
>> ERROR:      0015:            raise bb.build.FuncFailed(e)
>> ERROR:      0016:
>> ERROR:      0017:
>> ERROR: (file: 'base_do_fetch', lineno: 13, function: base_do_fetch)
>> ERROR: Function failed: base_do_fetch
>> ERROR: Logfile of failure stored in: /home/craig/Angstrom/setup-**
>> scripts/build/tmp-angstrom_**v2012_05-eglibc/work/all-**
>> angstrom-linux/systemd-compat-**units-1.0-r15/temp/log.do_**fetch.24135
>> NOTE: package systemd-compat-units-1.0-r15: task do_fetch: Failed
>> ERROR: Task 1607 (/home/craig/Angstrom/setup-**scripts/sources/meta-**
>> openembedded/meta-oe/recipes-**core/systemd/systemd-compat-**units.bb<http://systemd-compat-units.bb>,
>> do_fetch) failed with exit code '1'
>> NOTE: package iw-3.2-r1: task do_patch: Started
>> Waiting for 1 running tasks to finish:
>> 0: iw-3.2-r1 do_patch (pid 24140)
>> NOTE: package iw-3.2-r1: task do_patch: Succeeded
>> NOTE: Tasks Summary: Attempted 3142 tasks of which 1568 didn't need to be
>> rerun and 1 failed.
>>
>>
>>
>> --
>> Craig Swank
>> Data Engineer
>> Southwest Windpower
>> 100 Technology Drive,
>> Suite 315-325,
>> Broomfield, CO 80021
>> craig.swank@windenergy.com
>> www.windenergy.com
>>
>>
>> This electronic message transmission contains information that may be
>> confidential or privileged. The information is intended to be only for the
>> use of the individual or entity named above. If you are not the intended
>> recipient, be aware that any disclosure, copying, distribution or use of
>> the contents of this formation is prohibited, unless expressly authorized
>> in an advanced writing. If you have received this electronic transmission
>> in error, please notify the sender immediately. Any Intellectual Property
>> contained in this electronic message transmission, or any attachments to
>> it, are confidential or privileged and shall not be forwarded, shared,
>> used, disclosed, copied, or distributed in any form without the prior
>> written consent.
>>
>> ______________________________**_________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>> openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>
>

