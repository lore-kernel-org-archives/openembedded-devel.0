Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 024906ABF7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2015 19:57:32 +0000 (UTC)
Received: by widdi4 with SMTP id di4so35368431wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2015 12:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=zgwmAjBlg/kLilKjb/OVXs9kBQ1xZduRM7mTPFhujdY=;
	b=vQa6APJY88ww1feZS4rtdsAlrnoJK5YzBju2U3TKAEicEvXn+nCtk1h+rZt9Rb3iAY
	4a+7u5ZGn7LesnPaN9r8GQ+q+sNPBPalOKu1ccRVIzGMNWyYr1UVsC/qhn0j87M8zR8T
	EL9XY92Ggu12Ox4KTkhZ1UX17x/4kDzWh8s95fis6/MhedY8259zvspqqbMOJGTWtRjv
	+85x8jztNJdFyICTAS2Gz0NyzatnXc3YMxEbCqUpdls/gQ6XPfgba9zApGWyQ3enWIC1
	iR8BQftLfKKm5XTKMozKMzJOul8niAkFFgp2raWZQWv1HTXbHFDVqN9UEPAtHaJ5LLSc
	r1Aw==
X-Received: by 10.194.93.195 with SMTP id cw3mr11734615wjb.150.1429041453270; 
	Tue, 14 Apr 2015 12:57:33 -0700 (PDT)
Received: from [192.168.50.199] (ip-84-119-99-153.unity-media.net.
	[84.119.99.153])
	by mx.google.com with ESMTPSA id l3sm4151502wik.16.2015.04.14.12.57.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Apr 2015 12:57:32 -0700 (PDT)
Message-ID: <552D7132.6020006@gmail.com>
Date: Tue, 14 Apr 2015 21:57:38 +0200
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
	<CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>
	<551C4F35.7020001@gmail.com>
	<CAEHkU3Xg=NSPw2gc1rmPLy3RD68BRNK5hczmS5e6tTE9gEBk+A@mail.gmail.com>
	<551DA5BA.3050505@gmail.com>
	<CAP9ODKqazzhOMQtsdKaGhA-1pNQOHNRQ2vvp_uXDtq+gce2gqg@mail.gmail.com>
	<551E4A44.7050708@gmail.com>
	<CAP9ODKr4Xz8_OLD+DKqZ1wxx4c0Rc6bdSDwqLecFnhZa2x5kVg@mail.gmail.com>
	<CAD0=qk+2f1qORQLQzD_r8p_VaF0+mAkVu+E=yz5-zzipf7RHXQ@mail.gmail.com>
	<CAP9ODKqgAQqCxNg=fWMC6iW1Ks3HDd4c-YroMVOgJ=doTmsWLQ@mail.gmail.com>
	<CAD0=qkKX-6afKD8H+sD+MrVp3LRspmuieJC8T=R57ktcnJauxw@mail.gmail.com>
	<CAP9ODKq_yN=M8-+Hbjk_NHyTGQ=oVEs=tEEQwkGWghR_LBHLfA@mail.gmail.com>
	<CAD0=qkJNOMx5Ubn25Ugrn3fg02cq3kLjNbeV5ZBKsfWtuUXbgA@mail.gmail.com>
	<CAP9ODKpSHPyybmcGgm36-d_s88_vuzPzWqErrLknPEFFw2Mu_w@mail.gmail.com>
	<F0B85CB3-E0B0-40B8-9F1C-66DD05C826D6@gmail.com>
In-Reply-To: <F0B85CB3-E0B0-40B8-9F1C-66DD05C826D6@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Trying to update openjdk-7 to icedtea 2.5.4 and jdk75b13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Apr 2015 19:57:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Khem,

Am 14.04.2015 um 05:46 schrieb Khem Raj:
> 
>> On Apr 13, 2015, at 8:27 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>
>> Hello Sven,
>>
>> I really appreciate your work. Thanks for all the hard work on this :)
>>
>> On Mon, Apr 13, 2015 at 4:38 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
>>> After a week of testing these recipes, I fixed some issues in the new
>>> recipes. Therefore I just submitted new versions of the patchset.
>>> I removed the patches for uclibc as I'm unable to test it at the
>>> moment. While trying to build it with uclibc, I always got errors with
>>> compiling curl. Unfortunately I don't have the time to fix these

Sry, it was not curl, it was cups that leads to errors.

>>> errors at the moment as we use glibc. If one uses uclibc, it may not
>>> work atm.
>>
>> Khem, I have put those patches into master-next branch. Is it possible
>> for you to take a look on the uClibC thing?
>>
> 
> I don’t have uclibc setup either right now. post your errors in detail and may be there can be help

I've tried to build java-test-image for qemuarm machine and get the
following error during do_compile of cups:

|
/home/esven/openembedded/oe-core/build-java/tmp-uclibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-uclibceabi/gcc/arm-oe-linux-uclibceabi/4.9.2/ld:
process.o: undefined reference to symbol 'posix_spawn_file_actions_addopen'
|
/home/esven/openembedded/oe-core/build-java/tmp-uclibc/sysroots/qemuarm/lib/librt.so.0:
error adding symbols: DSO missing from command line
| collect2: error: ld returned 1 exit status
| make[1]: *** [cupsd] Error 1
| make[1]: *** Waiting for unfinished jobs....
|
/home/esven/openembedded/oe-core/build-java/tmp-uclibc/sysroots/qemuarm/usr/lib/libssp.so:
warning: the 'gets' function is dangerous and should not be used.
| ../cups/libcups.so: warning: gethostbyname is obsolescent, use
getnameinfo() instead.
| make: *** [all] Error 1
| ERROR: oe_runmake failed
| WARNING:
/home/esven/openembedded/oe-core/build-java/tmp-uclibc/work/armv5e-oe-linux-uclibceabi/cups/2.0.2-r0/temp/run.do_compile.16053:1
exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at
/home/esven/openembedded/oe-core/build-java/tmp-uclibc/work/armv5e-oe-linux-uclibceabi/cups/2.0.2-r0/temp/log.do_compile.16053)
ERROR: Task 1001
(/home/esven/openembedded/oe-core/meta/recipes-extended/cups/cups_2.0.2.bb,
do_compile) failed with exit code '1'

Do you have any idea what is causing this issue?

