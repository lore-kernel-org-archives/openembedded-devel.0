Return-Path: <max.oss.09@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id BBE5572C22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 15:21:12 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id dc16so28587144qab.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 07:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Wt255vJXDNbV5NVqBDksexAUS0vOmgihKIcxOtJIcvs=;
	b=KM5o8J+Fg7EW2V9QpbEKPFEuBHCl0i0J1MfsbUHWbJ9BCVeBGg+LULDKhqckHXCss1
	ocZ4BmZA7k2Cs3EOuAe7q/jcp9UDSuBzxoJbq07pf3OC1KNg86ssqtwzoY9gcV3/IpYJ
	qwPxOXEi9vDu+AVbtNolOXhrxnvRDr/IEgbI/8RaHxca55jytmDtB0QHMIXtk5FzSU8Y
	1WiyJKT+y84WEL+iF+oYHLMDZ11ai0etqmI49UfisSGEYLq8rWF1gtw6Xc65HeWy38sp
	R1SwYsEC+MWNnP5bXsMCMfH2IW3gv5hQ6V8ObssIj9+9j/m3047IFSfKwoUCjw5az24g
	GybA==
MIME-Version: 1.0
X-Received: by 10.224.66.200 with SMTP id o8mr59101381qai.13.1421767272801;
	Tue, 20 Jan 2015 07:21:12 -0800 (PST)
Received: by 10.140.30.229 with HTTP; Tue, 20 Jan 2015 07:21:12 -0800 (PST)
In-Reply-To: <CAP9ODKrmQ2hLL-NFUqrB_sa24wB+WyzTPsdkssYgkknFKNO65A@mail.gmail.com>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
	<loom.20150113T130012-516@post.gmane.org>
	<20150113132422.GJ18240@mail.itconsulting-heinold.de>
	<CAP9ODKocqaD+cXFba28jxXyd75aRmWnpwNY3NNx1wVY4Q3wVuA@mail.gmail.com>
	<loom.20150115T002923-253@post.gmane.org>
	<CAP9ODKpZzfTV41SDZjacbMi9=_BKkA7AoTgU+az4+7oUDreB3Q@mail.gmail.com>
	<CAEHkU3WoztGsMLVriJWqFCSuYboaQAFf8G_y1EtYHiyrh3i0UQ@mail.gmail.com>
	<CAEHkU3VmOOfi+nmyB2gERxghmb7n0uNXaNhiQ1zbaYtH33vAaw@mail.gmail.com>
	<CAEHkU3UwSPmDXcXVeZpTWWjxvQ3DxJts7_Ci964f=Lrv8xNH0Q@mail.gmail.com>
	<CAP9ODKrmQ2hLL-NFUqrB_sa24wB+WyzTPsdkssYgkknFKNO65A@mail.gmail.com>
Date: Tue, 20 Jan 2015 16:21:12 +0100
Message-ID: <CAEHkU3V4mVvdRf5WvyrzpQkK2f9yV9AwXoTsCN4eEJ7MZKnkYg@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Henning Heinold <heinold@inf.fu-berlin.de>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Alex de Cabo <alejandro.de-cabo-garcia@congatec.com>
Subject: Re: Query on meta-java layer openjdk-7-jre build
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
X-List-Received-Date: Tue, 20 Jan 2015 15:21:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello

2015-01-19 13:41 GMT+01:00 Otavio Salvador <otavio@ossystems.com.br>:
> Hello Max,
>
> On Mon, Jan 19, 2015 at 9:56 AM, Max Krummenacher <max.oss.09@gmail.com> wrote:
>> I made some progress.
>> We seem to be discussing two issues
>>
>> 1)
>> qemu stops with a segmentation fault.
>> When DEFAULTTUNE is "armv7ahf" or "armv7athf" and a binary is compiled
>> with "-static" and the gold linker is used, then the resulting binary
>> does not run on qemu or on real hardware.
>> The Angstrom distribution by default uses gold, so the issue presents
>> itself when using Angstrom. On the fsl-arm setup with poky gold is not
>> even built so one will not trigger the bug.
>> The solution for this is to change all compiler calls used for qemu
>> run binaries to include -fuse-ld=bfd.
>>
>> 2)
>> qemu runs indefinitely.
>> While hunting the above mentioned bug I found that when using qemu
>> with the sysroot, i.e. using the -L <path-to-sysroot> parameter qemu
>> executes and never returns.
>> On my machine free shows increasingly used RAM but I was to impatient
>> to ever see an OOM kill of qemu but maybe this is also what Colin
>> experiences and probably also why Alex does have issues with the "-L"
>> change.
>
> Awesome analysis; I've been looking for some free time to debug this
> for a while do a HUGE thanks for all your work on this :-)
Welcome

>
>> An strace qemu .... run shows that qemu runs in circles of recursive
>> symlink in /usr/lib/udev/ptest/.... files.
>> Using the fsl-arm setup with poky enables ptest. When udev has been
>> compiled in this setup those testfiles have been staged and qemu
>> chokes on them..
>> http://lists.openembedded.org/pipermail/openembedded-core/2014-September/097098.html
>>
>> a) One way to go would be to fix udev in oe-core, e.g.
>> index 0f8e9b6..a93b58d 100644
>> --- a/meta/recipes-core/udev/udev/add-install-ptest.patch
>> +++ b/meta/recipes-core/udev/udev/add-install-ptest.patch
>> @@ -21,7 +21,7 @@ Upstream-Status: Pending
>>  +    sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
>>  +    $(MKDIR_P) $(DESTDIR)/test
>>  +    (cd $(top_srcdir) && install $(TESTS) $(DESTDIR)/test)
>> -+    tar -C $(DESTDIR)/test/ -xJf $(top_srcdir)/test/sys.tar.xz
>> ++    cp  $(top_srcdir)/test/sys.tar.xz $(DESTDIR)/test/
>>  --- a/test/udev-test.pl    2012-03-18 16:43:36.000000000 +0100
>>  +++ b/test/udev-test.pl    2013-02-18 10:31:29.706357321 +0100
>>  @@ -1459,11 +1459,13 @@
>> diff --git a/meta/recipes-core/udev/udev/run-ptest
>> b/meta/recipes-core/udev/udev/run-ptest
>> index c6961ce..0e39806 100644
>> --- a/meta/recipes-core/udev/udev/run-ptest
>> +++ b/meta/recipes-core/udev/udev/run-ptest
>> @@ -1,3 +1,5 @@
>>  #!/bin/sh
>>
>> +tar -C test/ -xJf test/sys.tar.xz
>>  make -k check-TESTS
>> +make test-sys-distclean
>> --
>> 1.8.4.5
>
> It'd be great if you could prepare a patch to address this in OE-Core;
> once it proves stable we can ask for it to be backported for Dizzy.
I have a look how to test this patch, i.e. if those unit tests still execute as
expected. So that will take a few days.

>
>> b) The quick fix would be to revert passing qemu the sysroot and make
>> sure that all binaries qemu executes are linked statically. As issue
>> 1) now can be addressed without linking dynamically I don't see real
>> disadvantages.
>> revert http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=ab51e51d9a9a51bedd19de09bcba4ce830dfc5e7
>
> Agreed; we should do this.
>
>> c) The even quicker fix is to delete the testdata, i.e.
>> rm  -rf <target-sysroot>/usr/lib/udev/ptest/test/sys
>>
>>
>> I will create/send a patch to address issues 1) and 2) solution b).
>
> As said above, please do a proper patch for OE-Core as well; so we
> solve the root cause of qemu failure. This allow us to use it later if
> we want to.
>
> Another thing, please add a link for this discussion in the commit
> log; when looking similar issues in future this can reduce a lot the
> research time :)
The patches to meta-java are done:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-January/099895.html

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

Regards
Max

