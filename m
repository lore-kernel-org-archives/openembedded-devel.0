Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id C5AE2780C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 14:53:15 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id d4so4825550lfj.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 07:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=51B8Q7jDKtICqrP3hNtHv5GRfyt9PlX9Y3vm1lgTSBU=;
	b=QIwDbE0FOsD+TcmLtLfKvoYJ/gRMlf0LfEneSRGTcEIJBF+FfyATxJ/gb3ZZuQRHwJ
	kx+PJJPDxpNp9dno4cozQ+laof13Sto1+aGzX4BlKcz3NPWmaXBbSElqapqjb0Ky6plU
	TSei1vFpsXvv23CYzzHW8EAJkT074rccC/PeYUawKf12aBJZdsaI5fC3pUO2YyK0Ofnh
	XnmTFph6nyJAC9FzLaTLW1XHpoO/LIPt+/UeShU9XI4YVrw9hmRfwhzNop2KVYJe/aBe
	1RLd8FihbbpXgmKKY7gJp8Er+bhZ+UQ/4tIbbRSbxaWqLOslSDg406B8cXgwtvLG3NbC
	XvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=51B8Q7jDKtICqrP3hNtHv5GRfyt9PlX9Y3vm1lgTSBU=;
	b=dGXZsk5uXBnDHh13RVzhTpUgR4XtQ6BzQ2q0f6KNaQiX5iyRZkYWdxR7xh02o+nDF5
	UakZ6F4Ig3I8mNaYhy3CrJ8qbhPMd7AeNx8wGZiXCZLwxds6+eyTz+WfUla6YDMNZ/8Q
	RhfbRIDoXJdVP9/v0q00ls/RtuMtb72ZAOpwnd03gC/BxeEykijRrrp+JU7G6S6/xiql
	igDYhpxSGf7puU1PgAkoM90F4/8C2d40RfVC7SeeJTl18aQEwJyAX7pRqeWLQkHy6rIC
	y+yAD4R2IRj5CSSfBwiqvpXCUyComXjxFG+FG0wAm0TAXAU7UjT9InCepYtt1T+jvGH5
	+X9g==
X-Gm-Message-State: AHPjjUgHpvVvBBQGT7efEIKlyZRaDGsdrQqBsKC6fpW5wtwcc0oPUBdE
	FRwfogA36cmEaoCqhAWzKLj4sUEa5RIdysnmfTHWVozz
X-Google-Smtp-Source: AOwi7QAQFKVFPl1mItAQ9bXq0PeFtkh/1gR890aykYY2NkTPytJRjC4i4r3IthPbHxWqq2JELU84OA2Eb38nrHTu838=
X-Received: by 10.25.90.93 with SMTP id o90mr2643846lfb.163.1506437596428;
	Tue, 26 Sep 2017 07:53:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.83.83 with HTTP; Tue, 26 Sep 2017 07:52:55 -0700 (PDT)
In-Reply-To: <20170926145245.GA35702@mbabyjoh-desk.ger.corp.intel.com>
References: <20170907085136.20862-1-ricardo.ribalda@gmail.com>
	<20170907085136.20862-2-ricardo.ribalda@gmail.com>
	<CAPybu_08S-izqY3pUTisRRbX5MQSDcAskZpK209Kt5cC5jv48Q@mail.gmail.com>
	<20170926145245.GA35702@mbabyjoh-desk.ger.corp.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 26 Sep 2017 16:52:55 +0200
Message-ID: <CAPybu_0gBmVy8ctD2+BDKYuMUR0wbHRD3USb+3b+5xakPCDrUw@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 2/2] openjdk-8-native: Fix sigsegv with gcc7
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
X-List-Received-Date: Tue, 26 Sep 2017 14:53:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 26, 2017 at 4:52 PM, Maxin B. John <maxin.john@intel.com> wrote:
> Hi,
>
> On Tue, Sep 26, 2017 at 01:26:22PM +0200, Ricardo Ribalda Delgado wrote:
>> Ping?
>
> Pushed these 3 patches to master-next. Sorry for the delay.

No worries :) Just wanted to make sure the patches were not lost in the wind.

Best regards!

>
> Best Regards,
> Maxin
>
>> On Thu, Sep 7, 2017 at 10:51 AM, Ricardo Ribalda Delgado
>> <ricardo.ribalda@gmail.com> wrote:
>> > OpenJDK does not build properly with GCC7. Add the same workaround that
>> > we have for GCC6.
>> >
>> > Without this patch:
>> >
>> > | #
>> > | # A fatal error has been detected by the Java Runtime Environment:
>> > | #
>> > | #  SIGSEGV (0xb) at pc=0x00007fcad0efcd5b, pid=17206, tid=0x00007fcab264c700
>> > | #
>> > | # JRE version: OpenJDK Runtime Environment (8.0_102-b14) (build 1.8.0_102-internal-b14)
>> > | # Java VM: OpenJDK 64-Bit Server VM (25.102-b14 mixed mode linux-amd64 compressed oops)
>> > | # Problematic frame:
>> > | # V  [libjvm.so+0x78bd5b]  Node::Node(unsigned int)+0x2b
>> > | #
>> > | # Failed to write core dump. Core dumps have been disabled. To enable core dumping, try "ulimit -c unlimited" before starting Java again
>> > | #
>> > | # An error report file with more information is saved as:
>> > | # /home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/openjdk-8-native/102b14-r0/build/hs_err_pid17206.log
>> > | [thread 140508549912320 also had an error]
>> > |
>> > | [error occurred during error reporting , id 0xb]
>> > |
>> > | #
>> > | # If you would like to submit a bug report, please visit:
>> > | #   http://bugreport.java.com/bugreport/crash.jsp
>> > | #
>> >
>> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> > ---
>> >  recipes-core/openjdk/openjdk-8-common.inc | 7 ++++---
>> >  1 file changed, 4 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
>> > index def779db4d59..0c5c2c3e3d2f 100644
>> > --- a/recipes-core/openjdk/openjdk-8-common.inc
>> > +++ b/recipes-core/openjdk/openjdk-8-common.inc
>> > @@ -218,10 +218,11 @@ EXTRA_OECONF_append = "\
>> >          --with-update-version=${OPENJDK_UPDATE_VERSION} \
>> >  "
>> >
>> > -# GCC 6 sets the default C++ standard to C++14 and introduces dead store
>> > -# elimination by default. OpenJDK 8 is not ready for either of these
>> > -# changes.
>> > +# Since v6, GCC sets the default C++ standard to C++14 and introduces
>> > +# dead store elimination by default. OpenJDK 8 is not ready for either
>> > +# of these changes.
>> >  FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>> > +FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>> >
>> >  # All supported cross compilers support the compiler flags that were
>> >  # added to make compilation with gcc6 work. But the host compiler for
>> > --
>> > 2.14.1
>> >
>>
>>
>>
>> --
>> Ricardo Ribalda
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Ricardo Ribalda

