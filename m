Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.8163.1587828564088823139
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 08:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c6is5vwG;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 20so13423534qkl.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2020 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/VdipbpQ6BoSPZaUSsJFulyYdO7MsMDel/GkOAHhpWo=;
        b=c6is5vwG1i2YagB7Gjp6tKultnEY//cQdTrItR7hS+aoN6l/OFUwttT3VaaLdaRx4a
         1idXj8p0T9ScG0srlazOVmelibRJmJ7FjuwGeIvVE40VYdrLDovcIn1BFiO8KsV2q/t4
         1nQR87znQPMHex9sN1LKF7nRzlOqrMFyKPz6EVTXi905+mIyd4KhlzhBGUDJlWDA0U0W
         v2o0f8FiIVklul2qi5HOZcYs8AOLxc6ToSdsv3WUlyXR4a1/mGrynzMgllBe3fJYPgGi
         xD9XuDJuelxmb5CEtC3Oc8jh6ulc6adiGjVSyL/A7XhU9b9A1uiHmvJuz3HBoBi23ayu
         whlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/VdipbpQ6BoSPZaUSsJFulyYdO7MsMDel/GkOAHhpWo=;
        b=O+av3TMLTPO+qfQdGJHgvhe9ba7fC1RNlEwVxLb1Y5uxUqLHJibeAEurwRh2jlwkhJ
         6pHT9cdoROPWoQ6+6HLOcqxeab72U0U3XS+/ixeEPGpAICYGubp723etUY8vE/vdb94b
         +RGDnZ7XFfae3LkOxaU2yNX8tZ1KYV0MsGGx0tLTYXrZACE+PBldvzzcCQ9VGw/XxBM7
         dT+erNHI8Vo0toGbtsKKroQDnTEjk3Axqd5Sat5RE+2f7IDZgEDJDInLqV7lWAjZ9v1n
         tOZc+k3UVijjMjh0kLIqWpP9JSEC1cT/v1QH/b/h97kRZL37LYbbLU2bqrOR5vaJW+ny
         panQ==
X-Gm-Message-State: AGi0Pub9TZtqtwIlVlxSFvjoBRHMw7leYFTFgH6L/byetljVZ3XRrIZY
	w34MemidC0tqOwlbGgPmNgORhC1JRKwZYoDRLyM=
X-Google-Smtp-Source: APiQypJOXSfnm1XaYw+FWph5h6DWJ7NHZV1hg8oXwh2kGfuyKF+z3l/cWVFYMccq+z+wtP1OytZdgpnNTwSVQdpRR9A=
X-Received: by 2002:a05:620a:4f0:: with SMTP id b16mr2859120qkh.165.1587828563037;
 Sat, 25 Apr 2020 08:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200424011328.191909-1-changqing.li@windriver.com>
 <bac9fe56-5f04-1cd4-6cc8-10c77ccfc4c8@gmail.com> <CANx9H-D81iMF76hRqrnPJEjNvkSq_JyTqqu9q+r-ZYqGUb-8Rw@mail.gmail.com>
In-Reply-To: <CANx9H-D81iMF76hRqrnPJEjNvkSq_JyTqqu9q+r-ZYqGUb-8Rw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 25 Apr 2020 08:28:57 -0700
Message-ID: <CAMKF1srwjV4oUdGfq=vFBV78Swy1bw9u=LkrVWEuRnhwNe6U9g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pexpect: change shebang to python3
To: Tim Orling <ticotimo@gmail.com>
Cc: Changqing Li <changqing.li@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 24, 2020 at 10:00 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> meta-python2 has zero connection the meta-python. So it will not depend on any inc files.
>

Thanks, perhaps this patch is ok then, merging inc and bb can be a
different one.

> On Fri, Apr 24, 2020 at 6:57 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 4/23/20 6:13 PM, Changqing Li wrote:
>> > From: Changqing Li <changqing.li@windriver.com>
>> >
>> > we have offcially dropped python2, so it is possible
>> > that our code run on python3 only host, so change
>> > shebang to python3 to avoid error like:
>> > python: command not found
>> >
>> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> > ---
>> >  .../python/python-pexpect.inc                 |  2 ++
>> >  ...hange-shebang-from-python-to-python3.patch | 25 +++++++++++++++++++
>> >  2 files changed, 27 insertions(+)
>> >  create mode 100644 meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-python3.patch
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/meta-python/recipes-devtools/python/python-pexpect.inc
>> > index f02aa994e..c6230b2b5 100644
>> > --- a/meta-python/recipes-devtools/python/python-pexpect.inc
>> > +++ b/meta-python/recipes-devtools/python/python-pexpect.inc
>> > @@ -4,6 +4,8 @@ SECTION = "devel/python"
>> >  LICENSE = "ISC"
>> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
>> >
>> > +SRC_URI += "file://0001-FSM.py-change-shebang-from-python-to-python3.patch"
>> > +
>>
>> This .inc file should be merged into .bb, as well, also check if
>> meta-python2 depends on this .inc file, if it does then the patching
>> should happen inside py3 version of bb file and not .inc
>>
>> >  SRC_URI[md5sum] = "153eb25184249d6a85fde9acf4804085"
>> >  SRC_URI[sha256sum] = "fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c"
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-python3.patch b/meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-python3.patch
>> > new file mode 100644
>> > index 000000000..bee772da6
>> > --- /dev/null
>> > +++ b/meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-python3.patch
>> > @@ -0,0 +1,25 @@
>> > +From 35462d7b778eea32fd0cc0bbc79d6e6f53d942b4 Mon Sep 17 00:00:00 2001
>> > +From: Changqing Li <changqing.li@windriver.com>
>> > +Date: Thu, 23 Apr 2020 08:01:42 +0000
>> > +Subject: [PATCH] FSM.py: change shebang from python to python3
>> > +
>> > +Upstream-Status: Pending
>> > +
>> > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> > +---
>> > + pexpect/FSM.py | 2 +-
>> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>> > +
>> > +diff --git a/pexpect/FSM.py b/pexpect/FSM.py
>> > +index 46b392e..4e77654 100644
>> > +--- a/pexpect/FSM.py
>> > ++++ b/pexpect/FSM.py
>> > +@@ -1,4 +1,4 @@
>> > +-#!/usr/bin/env python
>> > ++#!/usr/bin/env python3
>> > +
>> > + '''This module implements a Finite State Machine (FSM). In addition to state
>> > + this FSM also maintains a user defined "memory". So this FSM can be used as a
>> > +--
>> > +2.24.1
>> > +
>> >
>> >
>> >
>> >
>>
>> 
