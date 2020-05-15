Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web12.8226.1589523011800227949
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2020 23:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OoQ+y0W1;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id 17so1333458ilj.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2020 23:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X9Pb6gG6aBlPPLw9AVPnT8Au0ftMVTlSMojnMGU5JX0=;
        b=OoQ+y0W1pCZQJBGItJkhj1eZuRrmLRoQiY+TkPoXwC3cpalTZOTilunkR2ZwpN9AJ2
         YzqRJQDJ00MnutTmhXksiTltXTzLzeNIImKSuuZ1VEafxTaHnEAnL+vTwjz+b4RQPbSB
         ubzfP+b5ys5W9ZLnV+PSTssdwTa7aXxxAGbWjINGslnNLXTcI4YtyRzVnKu1eXFGp4QS
         OZxvpKFSWVQPup5J5juwEiI09Q7aVyLtzSN00/GwlW7/SAnMSUOn5XkkUL+W5916teQn
         JPSoAnJCjlyGGFtrz2IAqDiR6RU1/PJcm54m51vvkPn7bKOVu/w5b+SEotycbmyFE4lK
         KLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X9Pb6gG6aBlPPLw9AVPnT8Au0ftMVTlSMojnMGU5JX0=;
        b=ZKh1y4D92AapGbV/vNiliiCij9vl12OoG6Sv2HPWhyKe+MbgZk7NqAc5SOEGCbLKQC
         64fGWp+VcwmjYwcsxEfzkTpgS6Q4GhKFu04Mciu88xVoG0Qact3Du4AQ585m2NJzgA++
         W/FlBoR8FJwhoL/UiqHEWxa4zxMa2mPNVamteTjtflFU+3JskpXSN+LiPVbWIRWbuMU6
         YIaG9vGNCOxVsVdnPh5uP0XRfpqWVW834GVNpXvdmQiVuGPgLZQLlWiTrVm+xY0PyAyZ
         G5IV7IxHPb36fSP/v4jllCfja4nGR3ycPuN6VJGABmWSer3qUrzRZaCWt8hLMbQygPn0
         rtlw==
X-Gm-Message-State: AOAM533dvOw/ILlDsc0G4TpMoR72vcRMGGH96+V/xirj+lnSeGCFvYpz
	yfF7N4NjDyljP7Cq+mmfjpp13Zjy3bbI4yeA+8cOufUszUU=
X-Google-Smtp-Source: ABdhPJxjLu/RV2kX5wAtBpdKCEmDBbOiPUKYBLziMFePht1SkpqqcZfO0/gRHOJiKTiDinz781HSieb57f4qwNqmFGM=
X-Received: by 2002:a92:ad09:: with SMTP id w9mr1850299ilh.177.1589523011058;
 Thu, 14 May 2020 23:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200511174505.2128564-1-sean@geanix.com>
In-Reply-To: <20200511174505.2128564-1-sean@geanix.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Thu, 14 May 2020 23:09:45 -0700
Message-ID: <CAKmqyKMtHjKwYpykOEAOCNp8YRqTsGQyKFfSv+ZnR+juxFfnww@mail.gmail.com>
Subject: Re: [[oe] [meta-oe] [PATCH]] gpsd: Upgrade 3.19 -> 3.20
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 11, 2020 at 10:46 AM Sean Nyekjaer <sean@geanix.com> wrote:
>
> Revert "SConstruct: Add test for sizeof(time_t), result in SIZEOF_TIME_T."
> Do not cross-compile a small for it to be executed on the host.
>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>

This causes gpsd to fail to build when cross compiling for Aarch64
with this error:

| aarch64-oe-linux-ld
--sysroot=/home/alistair/oe-master/build/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot
-o libgps.so.25.0.0 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
--sysroot=/home/alistair/oe-master/build/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot
-pthread -shared -Wl,-Bsymbolic -Wl,-soname=libgps.so.25 ais_json.os
bits.os gpsdclient.os gps_maskdump.os gpsutils.os hex.os json.os
libgps_core.os libgps_dbus.os libgps_json.os libgps_shm.os
libgps_sock.os netlib.os os_compat.os rtcm2_json.os rtcm3_json.os
shared_json.os timespec_str.os libgpsmm.os -L.
-L/home/alistair/oe-master/build/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot/usr/lib
-lrt -lm -ldbus-1 -lbluetooth -ldbus-1 -lrt
| aarch64-oe-linux-ld: unrecognized option '-Wl,-O1'
| aarch64-oe-linux-ld: use the --help option for usage information
| scons: *** [libgps.so.25.0.0] Error 1
| scons: building terminated because of errors.

Reverting this patch fixes the issue.

Alistair
