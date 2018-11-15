Return-Path: <theknoppix@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8AA476C184
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2018 04:53:06 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 124-v6so17576132wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 20:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=KoN6ahaugh6PwF90O1XctlJbEpCLi71NlGh9vYWFBu0=;
	b=Q6/yBLFMnSMQdCCqoJr19YWUUj5wuvy7qSNuUpr5Z3jRcnRoB8RzDXq3mdcEVY75Fl
	KlZIPCSq93QtilrZIFUvCzIaNtpRLUzXg37PnV9HjEf6bznwT+eI7qn0480LHTUiuqM+
	c1nHuawBIo/xdccKKkPdR0bNtnuSXdnhX2Z1A45MgNmemdKfphVBlm80paMtgu30Edj1
	yBO5GkYr9mEVy87EM2KbC0MOym69QAJs2dtttdshEVyMPIaAYCwPmLKHX/GH7xYqOyZ5
	8Bys4MlO5izu4Cidry2nX6Ls9VAqqfMcNZiDh4qLWB/GiL26ZoKgxT4lU01WkuMIRuP2
	sFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=KoN6ahaugh6PwF90O1XctlJbEpCLi71NlGh9vYWFBu0=;
	b=SH2EtOwVPcSW25yWAVbqrp91lo7RdX+B/tmEa4aLshSN/V6gsxid6LUWhrNgvSIoQY
	4c7X3zggtBzz3uEjnpzxWo5yr3giJODGX5gf4/qkxHtLBkEA2ugnvbsEkntUqvpqaNDh
	ifjf8sfws0tV9+n8gGpBLmvmQPJSLJ6yiFUL1wMkpVAL0Nygy+v+AGIdRjNN681KMDRk
	mlvtGNIZkWXcgGHsYv/tdCLQYitaJ4UgyxCTEtkPiERkOa5dzV8jiYYhvVH6bHtI2v9f
	Dy2K+Kak+Uf2Gzc1+uIRSbQoGIb9cAFyxFrrymRZNhUDp5OwV8Ra5gbiE2vaT0Ng3+d9
	2AhQ==
X-Gm-Message-State: AGRZ1gJRMo/YITLFz8MxUI8C4RpjRw0G60RoWN9a9Xmdo/+AzyH317cE
	o8nYRjjMA5e9yedrJtuVPVXeFl9VCtFOH1hcqlMF1CMa
X-Google-Smtp-Source: AJdET5csvrnczwbzs5VrglYZt9RoFoxq8W85yXZpPJG/sRHpeO//lqGnLqnXGa8DyY3d6LVzzLextJ0dVqdJPA+jyUo=
X-Received: by 2002:a1c:9c85:: with SMTP id
	f127-v6mr3800029wme.73.1542257586827; 
	Wed, 14 Nov 2018 20:53:06 -0800 (PST)
MIME-Version: 1.0
From: Knoppix <theknoppix@gmail.com>
Date: Thu, 15 Nov 2018 07:52:55 +0300
Message-ID: <CAD9sEJujbJNS4Kw6eMgFk+z6HAXgnLq2a21enUuDDTkwNSy0yg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: multiarch for spesific recipe/task/bootefi
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
X-List-Received-Date: Thu, 15 Nov 2018 04:53:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yocto: 2.5.1/sumo
kernel=3Dlinux-yocto-4.15.18
machine=3Dintel-corei7-64
distro=3Dpoky
image=3Dcore-image-x11

I Searched this question on google, stackoverflow but I did not find.

The machine which I want to install image, doesn=E2=80=99t allow bootx64 bu=
t it
works when I install x32 efi.
I checked this (I copied first bootia32.efi and then bootx64.efi) and as I
understand my machine has x64 arch but only support x32-efi.

So how is it possible to build an image which is intel-corei7-64 but has
EFI 32 bit?
Would you advice me please to *what should I read to accomplish and learn *
this?

(Excuse me for my english, I am not native. And I hope, sent this mail to
correct mail-list.)

*".. The vast majority of EFI-based x86-64 computers use 64-bit EFIs and
therefore use a bootx64.efi default boot loader file. A handful of early
Macs and some Atom-based tablets have 64-bit CPUs but 32-bit EFIs ..."
http://www.rodsbooks.com/efi-bootloaders/principles.html
<http://www.rodsbooks.com/efi-bootloaders/principles.html>*

