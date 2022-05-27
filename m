Return-Path: <mail@oripessach.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B210C433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 07:16:17 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.893.1653635769861036458
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 00:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oripessach-com.20210112.gappssmtp.com header.s=20210112
 header.b=DQOsFsP7;
 spf=none, err=permanent DNS error (domain: oripessach.com,
 ip: 209.85.128.174, mailfrom: mail@oripessach.com)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-2ef5380669cso38272977b3.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 00:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oripessach-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=RwZo6sv35MNggfgXX0nJssyyIZc5/lM6I23VTaw/mYM=;
        b=DQOsFsP7orZYEZFGGwwZyZZSlkZZ7zNmyl+YA1bZv17jtUh6UEKhGiQTSCd3VcTEad
         b8k4WKk/alUSb2cgo2IDwO1m7JqtMI2VnY5IogiRX/PqxUT1YCJx4BGrqB8aV2dRPbRp
         ZsuZ2b8gFZcqH7Al3yDeMBL9hvqOawUZ2IthBTKlMfiL9VYq66/yOycDS89kMYEMcwhD
         A7/5PNIAeEIy9HC9d4n57zgbUy/aw26eP7yVmg9cUYzfTV4QLXFTL9Pt6OTrlKY0W94V
         QM491qTTYsLR3hU3B2BTN1U37tZwXLutW0pVbpdy5i24JKI2XghdpyzMsrmzC078nISN
         i37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=RwZo6sv35MNggfgXX0nJssyyIZc5/lM6I23VTaw/mYM=;
        b=TZ4jZ2UOO6jtwAjSbW03jY1cT4i0oQ/iu+zj6HFEQ1lXu1ihzW+b1n1zqGG02vh1D5
         DK6ILWpuVPeUPxD3KTkZPXZlMYK8Et1Gla9pcj2vn/6xiZlul1Urm23WtmPJzH7OJjos
         CEC+TQfeXgk3atDXbuGr1noZvDlJI4v6d8zScmEtb7tZSmCWKGAA+Yqoc5cAMWa058Tb
         gEThuVdG8wrP3oEK/tK1yMJYGU3SfhvPQTSV5Zegoh43ZBxFr38AkcDRfOFlFFzy3vHl
         nCvWIn9EDlErfzTrp6LtliJAY8RHlE/LYWVvy3nfh+gL0yA4MjNf2C33ClwBT/brSHR3
         v1hQ==
X-Gm-Message-State: AOAM531eSCutNyieBWG0fRhhdjXY1jtxn66P9NVsvxuYSzMgsyHilU28
	cbnBPhdwWe4SP7BFcj+LhfkFhWW+gFetA0HDVBovqKw1lzHM1pfk
X-Google-Smtp-Source: 
 ABdhPJy/XD2vJTp49YlS65wELx2Zu4cN69xPEySQsiOtt+b0UIJhWl5eVHdu1F0BlY5IgQWcvFdfcKprf/tN0pBLUUY=
X-Received: by 2002:a81:91ca:0:b0:2fe:ceb6:fc2d with SMTP id
 i193-20020a8191ca000000b002feceb6fc2dmr41634375ywg.183.1653635768871; Fri, 27
 May 2022 00:16:08 -0700 (PDT)
MIME-Version: 1.0
From: Ori Pessach <mail@oripessach.com>
Date: Fri, 27 May 2022 01:15:43 -0600
Message-ID: 
 <CAJekvNRX_L-Noh5iq5qYJbqpJPLoYUqg+7BO93JLc7msPQzXvQ@mail.gmail.com>
Subject: Problems with live555 as a dependency of VLC
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000977c1305dff91454"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 07:16:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97306

--000000000000977c1305dff91454
Content-Type: text/plain; charset="UTF-8"

What's the correct way to compile add VLC with RTSP support to an image?
VLC seems to want live555 as a runtime dependency, but the live555 recipe
doesn't seem to package anything named live555 - only live555-openrtsp,
etc. so I get this error:


ERROR: core-image-sato-1.0-r0 do_rootfs: Could not invoke dnf. Command
'/mnt/data/vlc-build/tmp/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/recipe-sysroot-native/usr/bin/dnf
-v --rpmverbosity=info -y -c
/mnt/data/vlc-build/tmp/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/etc/dnf/dnf.conf
--setopt=reposdir=/mnt/data/vlc-build/tmp/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/etc/yum.repos.d
--installroot=/mnt/data/vlc-build/tmp/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs
--setopt=logdir=/mnt/data/vlc-build/tmp/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/temp
--repofrompath=oe-repo,/mnt/data/vlc-build/tmp/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/oe-rootfs-repo
--nogpgcheck install apache2 backend base-passwd cronie dnf ffmpeg frontend
grub-bootconf gstreamer1.0 gstreamer1.0-plugins-bad
gstreamer1.0-plugins-base gstreamer1.0-plugins-good
gstreamer1.0-plugins-ugly gstreamer1.0-vaapi intel-media-driver
intel-mediasdk intel-vaapi-driver kexec-tools libdrm libgl libva live555
makedumpfile mod-wsgi net-snmp-libs net-snmp-mibs net-snmp-server ntp
packagegroup-base-extended packagegroup-core-boot
packagegroup-core-ssh-dropbear packagegroup-core-x11
packagegroup-core-x11-base packagegroup-core-x11-sato psplash python3
python3-dateutil python3-simplejson qtbase qtbase-plugins qtbase-tools
qtserialport qtx11extras rpm run-postinsts shadow system-init tcpdump
videomon vlc watchdog x11vnc locale-base-en-us locale-base-en-gb' returned
1:
DNF version: 4.8.0
cachedir:
/mnt/data/vlc-build/tmp/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/var/cache/dnf
Added oe-repo repo from
/mnt/data/vlc-build/tmp/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/oe-rootfs-repo
User-Agent: falling back to 'libdnf': could not detect OS or basearch
repo: using cache for: oe-repo
oe-repo: using metadata from Fri 27 May 2022 06:53:45 AM UTC.
Last metadata expiration check: 0:00:01 ago on Fri 27 May 2022 06:53:45 AM
UTC.
No match for argument: live555
Error: Unable to find a match: live555

But vlc seems to depend on live555 somehow.

So, how do I figure out the dependency chain that results in live555 being
included in the image?

And how do I add live555 as a dependency of VLC so that it would actually
build?

Thanks,

Ori Pessach

--000000000000977c1305dff91454
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-family:monospace"><span style=3D"=
font-family:arial,sans-serif">What&#39;s
 the correct way to compile add VLC with RTSP support to an image? VLC=20
seems to want live555 as a runtime dependency, but the live555 recipe=20
doesn&#39;t seem to package anything named live555 - only live555-openrtsp,=
=20
etc. so I get this error:</span></span></div><div><span style=3D"font-famil=
y:monospace"><span style=3D"font-family:arial,sans-serif"><br></span></span=
></div><div><span style=3D"font-family:monospace"><br></span></div><div><sp=
an style=3D"font-family:monospace">ERROR: core-image-sato-1.0-r0 do_rootfs:=
 Could not invoke dnf. Command &#39;/mnt/data/vlc-build/tmp/work/intel_core=
i7_64-poky-linux/core-image-sato/1.0-r0/recipe-sysroot-native/usr/bin/dnf -=
v --rpmverbosity=3Dinfo -y -c /mnt/data/vlc-build/tmp/work/intel_corei7_64-=
poky-linux/core-image-sato/1.0-r0/rootfs/etc/dnf/dnf.conf --setopt=3Dreposd=
ir=3D/mnt/data/vlc-build/tmp/work/intel_corei7_64-poky-linux/core-image-sat=
o/1.0-r0/rootfs/etc/yum.repos.d --installroot=3D/mnt/data/vlc-build/tmp/wor=
k/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs --setopt=3Dlogdi=
r=3D/mnt/data/vlc-build/tmp/work/intel_corei7_64-poky-linux/core-image-sato=
/1.0-r0/temp --repofrompath=3Doe-repo,/mnt/data/vlc-build/tmp/work/intel_co=
rei7_64-poky-linux/core-image-sato/1.0-r0/oe-rootfs-repo
 --nogpgcheck install apache2 backend base-passwd cronie dnf ffmpeg=20
frontend grub-bootconf gstreamer1.0 gstreamer1.0-plugins-bad=20
gstreamer1.0-plugins-base gstreamer1.0-plugins-good=20
gstreamer1.0-plugins-ugly gstreamer1.0-vaapi intel-media-driver=20
intel-mediasdk intel-vaapi-driver kexec-tools libdrm libgl libva live555
 makedumpfile mod-wsgi net-snmp-libs net-snmp-mibs net-snmp-server ntp=20
packagegroup-base-extended packagegroup-core-boot=20
packagegroup-core-ssh-dropbear packagegroup-core-x11=20
packagegroup-core-x11-base packagegroup-core-x11-sato psplash python3=20
python3-dateutil python3-simplejson qtbase qtbase-plugins qtbase-tools=20
qtserialport qtx11extras rpm run-postinsts shadow system-init tcpdump=20
videomon vlc watchdog x11vnc locale-base-en-us locale-base-en-gb&#39;=20
returned 1:</span></div><div><span style=3D"font-family:monospace"></span><=
/div><span style=3D"font-family:monospace">DNF version: 4.8.0<br>cachedir: =
/mnt/data/vlc-build/tmp/work/intel_corei7_64-poky-linux/core-image-sato/1.0=
-r0/rootfs/var/cache/dnf<br>Added oe-repo repo from /mnt/data/vlc-build/tmp=
/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/oe-rootfs-repo<br>U=
ser-Agent: falling back to &#39;libdnf&#39;: could not detect OS or basearc=
h<br>repo: using cache for: oe-repo<br>oe-repo: using metadata from Fri 27 =
May 2022 06:53:45 AM UTC.<br>Last metadata expiration check: 0:00:01 ago on=
 Fri 27 May 2022 06:53:45 AM UTC.<br>No match for argument: live555<br></sp=
an><div><span style=3D"font-family:monospace">Error: Unable to find a match=
: live555<br></span></div><div><br></div><div>But vlc seems to depend on li=
ve555 somehow.</div><div><br></div><div>So, how do I figure out the depende=
ncy chain that results in live555 being included in the image? <br></div><d=
iv><br></div><div>And how do I add live555 as a dependency of VLC so that i=
t would actually build?</div><div><br></div><div>Thanks,</div><div><br></di=
v><div>Ori Pessach<div class=3D"gmail-yj6qo"></div><div class=3D"gmail-adL"=
></div><div class=3D"gmail-adL"></div><div class=3D"gmail-adL"><br><br></di=
v></div></div>

--000000000000977c1305dff91454--

