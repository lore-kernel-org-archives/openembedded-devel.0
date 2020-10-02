Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web11.1364.1601661513301342147
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2020 10:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=ZGNlryK2;
 spf=pass (domain: google.com, ip: 209.85.219.196, mailfrom: maxims@google.com)
Received: by mail-yb1-f196.google.com with SMTP id c3so1667485ybl.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2020 10:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=6ov+8H/+lCimEHzBGx+xNYMOZGBt7biqwTEcV4/NcR8=;
        b=ZGNlryK2H2E+bo6R4q13j+ny6fcUHbGCq/LR+74Fywus4QxRaIMbTnYyNEnJI3FYh8
         674sFLU4I8yxXVUAGF3B8gZ5aIYL30VD96ldL4X3Brd1y5ibCQhcJ2r1wDKWQeWbs9iw
         R7mgaWF504RqoIS5E7ftIfP7JJh4fLyOYCLnFU+p5rS/q9Z0zvbWyeWGTUGzHTsm8kKJ
         fTSFEpFRGhVW2SV/siLVa9hYtpdHf6oRuq9rjtAWTGBHH9P96rln20iLr7gUOHcfc6R1
         vfTiFcqqFR+3UfBHvfeeF1Gi9vWHbU3pgPpR9426/so3K8hPWeNqbZXJeh00wqXIbM/5
         RGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=6ov+8H/+lCimEHzBGx+xNYMOZGBt7biqwTEcV4/NcR8=;
        b=C1DxkTnAYybtTcYUf2kX2F0iqdOXcmjKJF0TEHqNQ3c90woe4DQloPjLKmz3Wteqvu
         9hsxwfrQVHJ8oJtTe5ktj1QxAv0CjGTL25nHUPeVdYzqSOj3apkJkK8a/BFYDlqebE2N
         8oNLvHp1pQ/G5mQyWf6cUrV/NIpMtLA1ClejYGv/X1Svvn0/wY44YOyQ8ERULBqSJ84A
         4OWa6yNrCSsmCrImaZ0Y8TzcKPd0NoIOkxXGRZsiLT2V5qWmDunNZPFAdpcgw42LOedp
         xAJ2rsjP43KzKHQp/yXYRdXo0CS3NxC0VnMNdHcbGF9OQtHpJuvyIEBpzy8mCsRDm346
         adzQ==
X-Gm-Message-State: AOAM532O9+HyG6A5LaHLVmzuC4XxVMpDvz/fm4XWl/6uFtSX9fC23tgl
	OmPGmn49L1yNhg0o668TC39M/L+M/DT32OcZGvtVsNeKkZ/Hog==
X-Google-Smtp-Source: ABdhPJwOPbY6q1W+ScljXsZ0g94hcuBhljiTdWaAoWSDZZX7Likw1fczsbq1zMiGtjYJnnR/PFjHU3tPlrbXaVWuFnI=
X-Received: by 2002:a25:3b96:: with SMTP id i144mr4242089yba.220.1601661511927;
 Fri, 02 Oct 2020 10:58:31 -0700 (PDT)
MIME-Version: 1.0
From: "Maxim Sloyko" <maxims@google.com>
Date: Fri, 2 Oct 2020 10:58:21 -0700
Message-ID: <CAFR_W8q+7wJegtG-CNAxur=+EMi2jXKoP80=KuyqBY-zMkbLTQ@mail.gmail.com>
Subject: Tracking dependencies on kernel configration
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

I hope this is the right mailing list for my question.

Short version: my recipe (not kernel) depends on a certain option(s)
being set in the kernel built and certain devices enabled in the
device tree. Is there a way to make this dependency explicit and make
my recipe fail, if the kernel does not have this option set.

Slightly longer version.
I have a recipe that builds a program that creates USB ECM gadget. For
that program to work properly, the kernel must have support for USB
Device (SoC specific driver) and ECM and the devices need to be
enabled in the Device Tree. Right now this dependency is not codified
anywhere, this is just something one needs to know. I would like to
codify it somehow, so that the recipe will fail, if the options are
not enabled in the kernel or if the devices are disabled in the device
tree.

I've been thinking about creating a special class
kernel-dependency.class, which would check the kernel's final .config
file for the options specified in the variable and to the same for
device tree (maybe using dtc?). Before I do this, I want to check if
there are existing solutions for this problem.

For USB Device (or gadget) specifically I found the usbgadget
MACHINE_FEATURE, but it looks like all it does is it recommends some
kernel modules. Maybe I'm missing something.

Thanks for your help.


-- 
-MS
