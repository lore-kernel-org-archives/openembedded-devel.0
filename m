Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.3737.1625562817564781706
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 02:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aGKmNSBY;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id j11so27015162edq.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 02:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nleoq1bkHRJv/0Czk5KKjhJcBSOUWEWrp+LNBnuCgMA=;
        b=aGKmNSBY/OtYy3nbvZ2UmmS1Elu/MzBwN+p+HFvI0kZmPVBFMN+y0uozB7WKqt/kUj
         NBUe9RHWrhyynC//TjrPeBf92j56K2H62d8zJ9qUQxQWZEFfBgVvyUls0p/Kf4W6l7le
         EBo242bkAczQszusUcMlSx6qjsgyu/yS+7NjJ3rawJg6D8aiOLWb80ryrICJcPNBABqt
         Hc3+lvcHcjW8Ai5dlG6O9E3wHtbiD3RBiQ5TCiM7Y+2kCOyXwhvTdjafG38sS2d0ASnT
         WGsOiDmHr+C19IoJCfuF8KeHXwd4Jb3OSD5bEOYFkz4C1AtFRYK3+Iv+T78hqapt+ULA
         p1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nleoq1bkHRJv/0Czk5KKjhJcBSOUWEWrp+LNBnuCgMA=;
        b=a5DNhF5YgVyvSBuG/BTeHIow9DHyhKxc0CJbD4jDDGb/HixYErOVlc6pm4H5feZZI1
         PHbmVAQ4z20KXXrM3w0vUEYBPj+xeuFShoqbZ3V/EybFyOyXVR0M2kuXCAaBb/Q475NT
         O1WxEUmQ+KTZelKzIQRz3iU8hwRiCBip+C2fN9P1vlSK0VNbRVVh9y4e8WyhRhTsKlwP
         cnOSa2hiNIIWeWv5YWRocrrnoSUm6NaPDv3/kikDhhwp3U7bd95KXdlD/JeLwBx4k6/K
         msxfu1klsYje4YGntrRcQLTP41GtRCBdgE50X7LiLpyaB4RAUAyi0ynKM9ytOf79uA1S
         MDoA==
X-Gm-Message-State: AOAM53376bJ9en+n82XZRpyvv2F8zxw7L1DqxfvDNs31vJKJw1ir2aZL
	GzlMbFAVX7tT+bUSbqeVPJuDaHcCw4g=
X-Google-Smtp-Source: ABdhPJyx/d4Nu2j95CulP89ZJVLluxomsvDBy+jp7E1JLVhayMVyBR82zBrm3PsbHD0wYF8rqn8JqQ==
X-Received: by 2002:aa7:dd93:: with SMTP id g19mr21824719edv.35.1625562816159;
        Tue, 06 Jul 2021 02:13:36 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3d4039af027e3874c3f08b.dip0.t-ipconnect.de. [2003:f0:7f3d:4039:af02:7e38:74c3:f08b])
        by smtp.gmail.com with ESMTPSA id p5sm5358273ejm.115.2021.07.06.02.13.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 02:13:35 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/9] pipewire: upgrade 0.3.30 -> 0-3-31
Date: Tue,  6 Jul 2021 11:13:20 +0200
Message-Id: <20210706091327.1513939-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706091327.1513939-1-schnitzeltony@gmail.com>
References: <20210706091327.1513939-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a bugfix release that is API and ABI compatible
with previous 0.3.x releases.

  - Fixes for alsa-lib 1.2.5
  - New pulseaudio modules: module-avahi-zeroconf,
    module-pipe-source, module-roc-sink, module-roc-source.
  - JACK has seen massive stability improvements. Locking
    and correctness wrt to callbacks has been reworked. Also
    thread priorities have improved.
  - Handle various crashes and lockups when running out of file
    descriptors.
  - Bluetooth now uses a hardware database to disable
    non-working features on listed devices.
  - Scheduling quantum and rate can now be changed dynamically
    with pw-metadata.
  - Many bugfixes and improvements.
  - Improve cleanup of context in error cases.
  - There is now a pw-test framework for improved unit tests.
  - Improve property serialization to valid JSON.
  - Fix some macros to work with better with coverity.
  - Metadata permissions are checked now. Clients need the
    M permission on an object to be able to set metadata for
    it.
  - The core metadata object will now remove metadata for
    removed objects, the implementor does not need to worry
    about that anymore.
  - Audioadapter will now follow the rate of the graph with
    the resampler adjusting itself dynamically.
  - Core now has a metadata implementation helper. A context
    will expose a metadata with settings that can be changed
    at runtime. This can be used to change the loglevel or
    graph quantum and samplerate on the fly.
  - An infinite loop was fixed in the audio converter.
  - Handle out-of-fds more gracefully. Handle truncated
    control data by dropping the client connection.
  - Fix profiler crash with many streams.
  - Improve latency handling in pw-filter. There is now a
    default handler and a ProcessLatency parameter to simplify
    latency reporting.
  - Latency reporting was improved in devices and streams.
  - And example sink/source was added.
  - hardware mute and volume are now properties on the
    Route param to make things easier.
  - More fixes for alsa-ucm 1.2.5.
  - spa-json-dump now properly encodes string and keys.
  - pw-dump now shows the correct subject of the metadata.
  - Ensure the node.description is set, some applications
    crash otherwise (TeamSpeak).
  - Module loading and unloading was improved.
  - module-avahi-zeroconf was implemented.
  - module-pipe-source was implemented
  - module-roc-sink and module-roc-source was implemented.
  - The maximum amount of connections has been limited to 64,
    like pulseaudio.
  - Handle out-of-fds more gracefully.
  - Fix overflow of read/write pointers.
  - Source and sink state are now decoupled from the monitor
    state and will report IDLE when not playing anything.
  - Port switching should now happen to/from the port that
    actually changed.
  - The locking was reviewed. All callbacks are now emited
    from the PipeWire thread with the lock released and
    the process function will be disabled for the duration
    of the callback. This ensures that no two callbacks are
    called at the same time.
  - Improve internal consistency and try to never call callbacks
    with invalid objects.
  - Monitor port can now be accessed with system:monitor_%d
  - client threads are now created with SCHED_FIFO and module-rt
    is used to create the other RT threads. This should avoid
    SIGKILL from RTKit in some cases.
  - Various bugfixes to improve connections to devices.
  - Handle delayed UUID connection.
  - There is now a hardware database that can disable features
    in listed devices.
  - Use libusb to detect availability of mSBC.
  - The virtual device name can now also contain a media role.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../pipewire/{pipewire_0.3.30.bb => pipewire_0.3.31.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.30.bb => pipewire_0.3.31.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.30.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.30.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
index 956fbc367..3e8792118 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.30.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
@@ -11,7 +11,7 @@ SECTION = "multimedia"
 
 DEPENDS = "dbus"
 
-SRCREV = "e857856be7b64d562cdcc01c43933218a68b225e"
+SRCREV = "c43dabcc96e2e072cdf08e5f094bb677d9017c6b"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.31.1

