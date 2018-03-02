Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7B73C7886C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 11:15:59 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id n128so1758283ith.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 03:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BZcmz+3pCEpMjxEflG+2lQWogJfhZVJIlFaxK2tLOJI=;
	b=VeBKRE8QY/DWQdWz2cvwao8v8LdgIYmx2jY/J0bsUZTRlbpixu7ZvNuqG7tSmBI0hm
	wvdBOE3CMF5GgwhTn0t3HVn6TMh3pB4RrU1DYkgOPdGfaHOjlKZqPiwzvfYKpGXsZoLi
	PpS8J87kzDyumcdKTpzKi0tcB/jnb9ORABrzBWM2KKmjhZFYm1hj6TIyaq3L0c9X0RPQ
	+8PC89MI9R+jblUxG8+V6f9WiDJZI4IZEy40oUhk/TEtAHOKWamwasRyTAwXM4Jcxwc1
	8GnuBPAvKDWbEG7gzLCNWjGM/RVB+cxqf6gyNPRk4YO9NG8ppbn3VaQwe6O3pVs+xb1e
	yr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BZcmz+3pCEpMjxEflG+2lQWogJfhZVJIlFaxK2tLOJI=;
	b=ibzD2H7ePUGej2CTaLwOIx2CSiXP60Yi0y90DR/hYz846egbfu3nOo6La9m3hftlQE
	aXc6KHeC8ya+lSrqT2H2VDQKtYJye1YWBO7dwi48NEqEjuFWIDGxvGUFD0q1mGoyiN5P
	jOtLGF3Tbv9iIVvv5tGmhkmEM2hzMnABve2gd4XCk6v29hbIR+0x0swpSfz31n5Jlb4r
	S0xGS3X4fI0f0FrZdTPxv8JmPXiUn9VWujHAtdDOaoe3QMv4VEWqWR+i0UMaXLTlFe+Z
	Vx44jDEnsr0atfjqiQY2XIxlVcrLvCw01hkQTRIIiYGUQ914tEkPm8Ly8KLQQD1fnu/Y
	fiVw==
X-Gm-Message-State: AElRT7FCJ2k/kUhh0lq3Y+RdEBPmGs46mIt9ajSRrbCn10CvIePrq1lK
	7GeLMydqzzBLKMsgYpaMSGS82wdRFjfm10LBgym8CQ==
X-Google-Smtp-Source: AG47ELtmB2e0z6yX2Uggxl0hZN8S3wz1SA9JyPuwxagexqe5bdpxB3v1Coz8dOHaDejvdmw/Vv3Rd4c6X+nOB1hhFIg=
X-Received: by 10.36.77.21 with SMTP id l21mr1366629itb.121.1519989360348;
	Fri, 02 Mar 2018 03:16:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.167.10 with HTTP; Fri, 2 Mar 2018 03:15:59 -0800 (PST)
In-Reply-To: <69c46783-bcb6-d9a6-533e-e9fb22a164a5@thecshore.com>
References: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
	<69c46783-bcb6-d9a6-533e-e9fb22a164a5@thecshore.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Fri, 2 Mar 2018 16:45:59 +0530
Message-ID: <CAD3vsf4qVhOVZ8H0qCK7C+Ev1tYuJsO2GgP-oozGJgro0wVkrQ@mail.gmail.com>
To: Daniel Dickinson <cshore@thecshore.com>, Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openwrt][PATCH 1/5] openwrt-lua: remove hardcoded 'lib' string to a generic value CMAKE_INSTALL_LIBDIR
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2018 11:15:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

The github pull request can be found at
https://github.com/kraj/meta-openwrt/pull/70

Hi Daniel,

Thanks for offering the help, after doing some readings I have created the
above pull request.

Regards,
Jagadeesh

On Fri, Mar 2, 2018 at 1:48 PM, Daniel Dickinson <cshore@thecshore.com>
wrote:

> Hi!
>
> Great to see someone else interested in meta-openwrt!  I'll try and look
> at these this weekend.  I noticed Khem asked for a PR on GitHub.  If you'=
re
> not comfortable with that I can help, otherwise look forward to seeing yo=
ur
> PR on github!
>
> Regards,
>
> Daniel
>
>
> On 2018-03-01 08:35 AM, Jagadeesh Krishnanjanappa wrote:
>
>> This solves a bunch of below errors and warnings when the libdir is
>> /usr/lib64 for
>> 64bit machine or in multilib environment:
>>
>> The libubox warning:
>> -- snip --
>> WARNING: libubox-2.0.0+gitAUTOINC+96305a3caf-r0 do_package: QA Issue:
>> libubox: Files/directories were installed but not shipped in any package=
:
>> /usr/lib/lua/5.1/uloop.so
>> Please set FILES such that these items are packaged. Alternatively if
>> they are unneeded, avoid installing them or delete them within do_instal=
l.
>> libubox: 1 installed and not shipped files. [installed-vs-shipped]
>> -- snip --
>>
>> The ubox recipe fails with below errors:
>>
>> -- snip --
>> .../ubox/git-r0/recipe-sysroot-native/usr/bin/x86_64-montavi
>> sta-linux/../../libexec/x86_64-montavista-linux/gcc/x86_64-montavista-li=
nux/7.2.0/ld:
>> cannot find -lubus collect2: error: ld returned 1 exit status
>> -- snip --
>>
>> -- snip --
>> | ../ubox/git-r0/recipe-sysroot-native/usr/bin/x86_64-montavis
>> ta-linux/../../libexec/x86_64-montavista-linux/gcc/x86_64-montavista-lin=
ux/7.2.0/ld:
>> cannot find -luci
>> | collect2: error: ld returned 1 exit status
>> -- snip --
>>
>> -- snip --
>> WARNING: ubox-git-r0 do_package: QA Issue: ubox: Files/directories were
>> installed but not shipped in any package: /usr/lib/libvalidate.so
>> Please set FILES such that these items are packaged. Alternatively if
>> they are unneeded, avoid installing them or
>> delete them within do_install.
>> ubox: 1 installed and not shipped files. [installed-vs-shipped]
>> ERROR: ubox-git-r0 do_package_qa: QA Issue: /usr/sbin/validate_data
>> contained in package ubox requires libvalidate.so()(64bit), but no
>> providers found in RDEPENDS_ubox? [file-rdeps]
>> WARNING: ubox-git-r0 do_package_qa: QA Issue: ubox-dbg: found library in
>> wrong location: /usr/lib/.debug/libvalidate.so [libdir]
>> ERROR: ubox-git-r0 do_package_qa: QA run found fatal errors. Please
>> consider fixing them.
>> ERROR: ubox-git-r0 do_package_qa: Function failed: do_package_qa
>> -- snip --
>>
>> The ubus build fails with below error:
>> -- snip --
>> ERROR: ubus-git-r0 do_package_qa: QA Issue: /usr/bin/ubus contained in
>> package ubus requires libubus.so()(64bit), but no providers found in
>> RDEPENDS_ubus? [file-rdeps]
>> WARNING: ubus-git-r0 do_package_qa: QA Issue: ubus-dbg: found library in
>> wrong location: /usr/lib/.debug/libubus.so [libdir]
>> ERROR: ubus-git-r0 do_package_qa: QA run found fatal errors. Please
>> consider fixing them.
>> ERROR: ubus-git-r0 do_package_qa: Function failed: do_package_qa
>> -- snip --
>>
>> -- snip --
>> WARNING: ubus-git-r0 do_package: QA Issue: ubus: Files/directories were
>> installed but not shipped in any package: /usr/lib/lua/5.1/ubus.so
>> Please set FILES such that these items are packaged. Alternatively if
>> they are unneeded, avoid installing them or delete them within do_instal=
l.
>> ubus: 1 installed and not shipped files. [installed-vs-shipped]
>> -- snip --
>>
>> The netifd recipe fails with below error:
>>
>> -- snip --
>> | cp: target =E2=80=98.../tmp_new/work/corei7-64-montavista-linux/netifd=
/git-r0/image/lib64/netifd/=E2=80=99
>> is not a directory
>> | WARNING: .../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/tem=
p/run.do_install.27647:1
>> exit 1 from 'cp -dR --preserve=3Dmode,links .../tmp_new/work/corei7-64-m=
on
>> tavista-linux/netifd/git-r0/git/scripts/* .../tmp_new/work/corei7-64-mon
>> tavista-linux/netifd/git-r0/image/lib64/netifd/'
>> -- snip --
>>
>> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
>> ---
>>   classes/openwrt-lua.bbclass | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/classes/openwrt-lua.bbclass b/classes/openwrt-lua.bbclass
>> index 793f363..d67ff58 100644
>> --- a/classes/openwrt-lua.bbclass
>> +++ b/classes/openwrt-lua.bbclass
>> @@ -4,7 +4,7 @@
>>   # for the terms.
>>     OECMAKE_C_FLAGS +=3D "-DLUA_COMPAT_5_1"
>> -EXTRA_OECMAKE +=3D "-DLUAPATH=3D/usr/lib/lua/5.1"
>> +EXTRA_OECMAKE +=3D "-DLUAPATH=3D${libdir}/lua/5.1"
>>     FILES_${PN}  +=3D "${libdir}/* ${datadir}/lua/5.*/"
>>   FILES_${PN}-dbg  +=3D "${libdir}/lua/5.*/.debug"
>> @@ -12,3 +12,12 @@ FILES_${PN}-dbg  +=3D "${libdir}/lua/5.*/.debug"
>>   DEPENDS +=3D "lua5.1-native"
>>   OECMAKE_C_FLAGS +=3D "-I${STAGING_INCDIR}/lua5.1"
>>   CFLAGS +=3D "-I${STAGING_INCDIR}/lua5.1"
>> +
>> +do_configure_prepend () {
>> +    if [ -e "${S}/CMakeLists.txt" ] ; then
>> +        sed -i -e \
>> +       "s:ARCHIVE DESTINATION lib:ARCHIVE DESTINATION
>> \${CMAKE_INSTALL_LIBDIR}:g" \
>> +       -e "s:LIBRARY DESTINATION lib:LIBRARY DESTINATION
>> \${CMAKE_INSTALL_LIBDIR}:g" \
>> +       ${S}/CMakeLists.txt
>> +    fi
>> +}
>>
>>
>

