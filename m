Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F6ECF885B
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 19:29:50 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.36.1728061130364261654
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Oct 2024 09:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rtq/prxj;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: kamalgmbh32@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5398d171fa2so2912996e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728061128; x=1728665928; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+61mCQ8nvRb3IFEfw11kzeI+CmQ+7MMiSRCa5tbadOo=;
        b=Rtq/prxjAqgceBfBDTd1YyHUUQRIKDyjyLocVHv/+FJE5lzZmSxG58JQDF+HNBYPiH
         IF+WX4cYHOQaymuW9AC2ngqas2LSieQUcNcQlg6yvjOJdr5dtSxLq1g57sf65kmER8gI
         kRMdxRGYztY7IhTmwjEbtXV7bwT8TTrgBRZhfHHT1DwR0mnhcGS/1WtDKiNLFJt7UHpq
         OUSnO2ZreZA1RX8trHum5s6PJD+e87DABEQNvy5iT03rbkM2RvZWyMxYEgcLF0U6G1Lx
         OCz7gKtv2k/MEXhnVhn3AtQvhunG8hOpjXRDNDmz0UmNjXSsRoeCQRbnAW3HdYwS1ZIp
         YY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728061128; x=1728665928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+61mCQ8nvRb3IFEfw11kzeI+CmQ+7MMiSRCa5tbadOo=;
        b=cQxlXXWlG8ZpavunQIztlfkrGDeHRpCY/Jqu8QHhg8guMFdZRq1/HgJdT660Lt+iuL
         3tOYA/plunZaTyjVM21ZNPF6Cd0oTIohEZTKDn++0jro8c4AE61H1X8CAMfHOaZ6FG3Y
         6F7gmCT7OSy0IOn8p0BowE6hNp/roNKl8SOFYp/CgBtWngj5uTZQvFFEiJfL/ubWe4Wx
         uvSS77daL7Ug4bfo2jjQNMSuqtvlLEaoLQObMFeUB+3+8D+m+Z3gnGUcCXYVXxLB5mNZ
         uEgaahMBAXivwv4WGO8UtpuDv7PJHjgl+qhnSWhZjdj5GzBzy/W7tr4EsBPSPSVwtHe/
         0+0g==
X-Gm-Message-State: AOJu0Yw/KhWQy4SpWG2IH/onT4qvfVox0WnzYugMsoBTGopJc8DLX9Nk
	SemlbCxdMEaCXscVwX+qrAxyI8SLtdD7CGgoGFayAfHLDpVnDSAqPjzI6nNsTeyDKyn5BvSnDo9
	tsPfygtUQzXlqaCQHCUdkUNMIlYg=
X-Google-Smtp-Source: AGHT+IGYIjwlQd47h0Ev75DHqC1FUY361v6Qsq6IjsbPOdTkpo3UTpE3zEExJ6ZHNQArJg4vGuqqFqwFkkoqo7FHULM=
X-Received: by 2002:a05:6512:1091:b0:52c:e170:9d38 with SMTP id
 2adb3069b0e04-539ab88afd8mr2246646e87.31.1728061127833; Fri, 04 Oct 2024
 09:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <CA+u1R=QDJdsJXHpU-3AHaeF6-V20RZdLufjBupCOY6Nv0zeNig@mail.gmail.com>
 <CAMKF1sromogM_ArSgp1fa18dnMVXMvhkdQZhv-c8cWbHv43arQ@mail.gmail.com>
In-Reply-To: <CAMKF1sromogM_ArSgp1fa18dnMVXMvhkdQZhv-c8cWbHv43arQ@mail.gmail.com>
From: "Kamal GMBH" <kamalgmbh32@gmail.com>
Date: Fri, 4 Oct 2024 22:28:36 +0530
Message-ID: <CA+u1R=T_MRemJ56H1uM_=h9m+Va-s3svp7Af=a=JtKKVRryWFA@mail.gmail.com>
Subject: Re: [oe] Need support: Turbostat is not compiling in 6.8 custom kernel!
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/mixed; boundary="000000000000acf3b30623a9958e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 19:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112666

--000000000000acf3b30623a9958e
Content-Type: multipart/alternative; boundary="000000000000acf3b20623a9958c"

--000000000000acf3b20623a9958c
Content-Type: text/plain; charset="UTF-8"

>
>
>> Hello,
>
>
Please find attached turbostat recipe i am using.

kamal@yocto-server-2:/media/nvme1/umesha/kamal/
*poky-amd-scarthgap/meta-openembedded/meta-oe/recipes-kernel*$
agent-proxy           crash               kernel-selftest  libtracefs
 oprofile     *turbostat*
bpftool               intel-speed-select  kpatch           linux
pm-graph     usbip-tools
broadcom-bt-firmware  ipmitool            libbpf           makedumpfile
 spidev-test
cpupower              ipmiutil            libpfm           minicoredumper
 trace-cmd


*origin  git://git.openembedded.org/meta-openembedded
<http://git.openembedded.org/meta-openembedded> (fetch)origin
 git://git.openembedded.org/meta-openembedded
<http://git.openembedded.org/meta-openembedded> (push)*
kamal@yocto-server-2:/media/nvme1/kamal/kamal/poky-amd-scar



Regards,
Kamal

--000000000000acf3b20623a9958c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><br>Hello,</blockquote></div></blockquote><div><br></d=
iv><div>Please find attached=C2=A0turbostat recipe i am using.</div><div><b=
r></div>kamal@yocto-server-2:/media/nvme1/umesha/kamal/<b>poky-amd-scarthga=
p/meta-openembedded/meta-oe/recipes-kernel</b>$ <br>agent-proxy =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 crash =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 kernel-selftest =C2=A0libtracefs =C2=A0 =C2=A0 =C2=A0oprofile =C2=A0=
 =C2=A0 <b>turbostat</b><br>bpftool =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 intel-speed-select =C2=A0kpatch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 linux =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pm-graph =C2=A0 =C2=A0 usbip-t=
ools<br>broadcom-bt-firmware =C2=A0ipmitool =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0libbpf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 makedumpfile =C2=A0 =C2=
=A0spidev-test<br>cpupower =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
ipmiutil =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libpfm =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 minicoredumper =C2=A0trace-cmd<br><br></div><div class=3D=
"gmail_quote"><b>origin =C2=A0git://<a href=3D"http://git.openembedded.org/=
meta-openembedded">git.openembedded.org/meta-openembedded</a> (fetch)<br>or=
igin =C2=A0git://<a href=3D"http://git.openembedded.org/meta-openembedded">=
git.openembedded.org/meta-openembedded</a> (push)</b><br>kamal@yocto-server=
-2:/media/nvme1/kamal/kamal/poky-amd-scar<br><div><br></div><div><br></div>=
<div><br></div><div>Regards,</div><div>Kamal</div><div>=C2=A0</div></div></=
div>

--000000000000acf3b20623a9958c--

--000000000000acf3b30623a9958e
Content-Type: application/zip; name="turbostat.zip"
Content-Disposition: attachment; filename="turbostat.zip"
Content-Transfer-Encoding: base64
Content-ID: <f_m1uyx2bw1>
X-Attachment-Id: f_m1uyx2bw1

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

--000000000000acf3b30623a9958e--

