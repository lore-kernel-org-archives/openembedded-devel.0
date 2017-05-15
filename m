Return-Path: <tharvey@gateworks.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id D7BB371D79
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 18:00:14 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b84so95012087wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 11:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gateworks-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=gWO5siGq0tr2y6gE/MYExLgi1nEwiPMO8c6h+pX0Wqc=;
	b=netGIuvKLbBNsmTQZjXe8wPdbPMyqxAew7nM7i4UvhHh2uiuf6m4DFC5pHPN0i/y5Z
	1KbK8I4lB6eYniZ50olx2VBo009CZDYk++GxrOAeR1lJ+avxvxHMO2+bH7aNN5Cu6qaW
	9swQYhBQYTjukatUHx3nJ9Emw2N7xIRlzD0aMFLFYrud0qfhk2/MNqRWp1RTjWkz5aQ6
	R2/kMSk7q2DgF8qhOuWtdSSqHAZ6ckHbmydBazDOsaqc69y2G2h9DQjNNWMji+Jo99A1
	Sv6fgEcOcfnrSp6zB2YHAOPWW/Seg2otzr4IIRtZbDnvnvBhI2v6Yx20Mj2mkwISHp23
	Npww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=gWO5siGq0tr2y6gE/MYExLgi1nEwiPMO8c6h+pX0Wqc=;
	b=rydjizIP3lSkBKABpD6hmcvG2aVznXa5fs4UUWKFqLD48v2hGAiJcDTnYMn2t45yMN
	wLhVK5i7q58aBzjQhEP0F5T9xGbgoBOJ4gM2oiNI9HJhmAhGaNPQXxWTeBgC1IjUAxUR
	Y+gsWSmk6vs62YVzG10lDUn8bcqkSbyPcWGx8Zt9ZWCmKGEE2t5GfHNia8+cwXgoGCIk
	KU/U9cetnjfdT13Cp/edRdlfLhguRPidedIVFv82K8UHQoU87lLDn02oliB82eP7Vt2i
	cdFqWgwIeFQEkMNdChsYcw/GCUv2AVQbkkiGRh6jAvxjZ0MyzVPNbe/pL1aoajabzFjd
	ZG2w==
X-Gm-Message-State: AODbwcB8R3kGhQycMrAz/BTQdBhFtcp3ZELT+uM3dLV6KLHX6vbQILxL
	2oh1nORA2MTbPo/BRXvKuVrzT4S7Jtig574=
X-Received: by 10.28.137.201 with SMTP id l192mr4479613wmd.27.1494871214958;
	Mon, 15 May 2017 11:00:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.212.21 with HTTP; Mon, 15 May 2017 11:00:14 -0700 (PDT)
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 15 May 2017 11:00:14 -0700
Message-ID: <CAJ+vNU25j=OtN+vvzO1_kbFOKRYWaaJA-yfKB8pJ8cdxu5fw=g@mail.gmail.com>
To: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>, 
	openembedded-devel@lists.openembedded.org
Subject: kernel modules failing to load because of missing symbols
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
X-List-Received-Date: Mon, 15 May 2017 18:00:15 -0000
Content-Type: text/plain; charset="UTF-8"

Greetings,

I've got a kernel recipe that builds several kernel modules which get
build and packaged as kernel-module-<modname>. I'm finding that while
most of these modules appear to load properly into the kernel at
runtime, several of them do not because of missing symbols:

# modprobe bluetooth
[  782.848396] bluetooth: no symbol version for sock_register
[  782.854315] bluetooth: Unknown symbol sock_register (err -22)
# modprobe ip_tables
[  893.675147] ip_tables: no symbol version for ns_capable
[  893.680385] ip_tables: Unknown symbol ns_capable (err -22)
modprobe: ERROR: could not insert 'ip_tables': Invalid argument

The symbols do appear to be in the kernel's System.map:
# grep " ns_capable" /boot/System.map*
80033cfc T ns_capable
# grep sock_register /boot/System.map*
805337a8 T sock_register
8084fb0c R __ksymtab_sock_register
8085ab64 r __kcrctab_sock_register
8087abaf r __kstrtab_sock_register

I'm seeing this on Yocto master, Yocto pyro 2.3, Yocto morty 2.2 but
surprisingly not on Yocto krogoth 2.1.

Any ideas what could be going on here or how best to troubleshoot this?

Best Regards,

Tim

Tim Harvey - Principal Software Engineer
Gateworks Corporation - http://www.gateworks.com/
3026 S. Higuera St. San Luis Obispo CA 93401
805-781-2000

