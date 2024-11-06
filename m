Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD6ED3E788
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 03:12:22 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.38007.1730862288318262883
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 19:04:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kNVS8Nbq;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e9ba45d67fso57511597b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 19:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730862287; x=1731467087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+TkMjd82+t3e69IOoDrCQcHuRaXW4uV2AvM4MlBpzFM=;
        b=kNVS8NbqGXdpKHRjr+ehbJLscyWhDh8d9wO4tY41XkTM4Y03iNL3jQ5OehCEyKFSwL
         RLmL8cRiQvOYUDypgYc1eTpQvnWXreBzG/JlpnVIn23XdpTrvFavchSshLfncDftSDBD
         hk/HvP5h/hHBaPIJOldl4vEtQPykmZQpYu/aXlffHpiz+2PBAyqyBjzuJRIzYSaCeiVZ
         II8pPwNvkR0HqlkqS9T/JUYeQIoZdAOxzD400qKZq4VGTa6s0oRYy0nlpSf8KUgxb7+G
         DUnFf6CBdpkXpk7fGLDrIiBKMSQj+S2wr9xnWZIsu5xnqs+rt5SxzCJyb8A3lIiRIJ58
         Mqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730862287; x=1731467087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TkMjd82+t3e69IOoDrCQcHuRaXW4uV2AvM4MlBpzFM=;
        b=Ee3ylW/6sKFnDQF76olS0RC0wWMx1+X5hx2+gAATbzOne+r30aE7xF07dWlc5nnRt8
         N6Vazg8qnq2ggmf0QiPllffiyQpt0KfxaGNV24ZhiVHOqNvDRsLw7OxA6xag3DWvGdlk
         ApMDqrr1eBfalQLRO/M60eM9wsmgEF8hM3OmwPQWo2J6XZWFXUJzUmrSYxeEPeZ3+/gm
         CAblKyvVIBYy7VYwTTUT325XPaAic1RL+2/4rmIkbJByr9mTAxpxxtAaDar/yi4oCFuP
         B7kvAtoiDak25eBhIIwZSGvlNPa1sKUZfAMqJxziiUWoJHZYHx8m98EmA8NfaMExK3TD
         NdyQ==
X-Gm-Message-State: AOJu0YySVSh9F4el/FQ7bzflJAT4ntmeq0yzFyzsksMOyD2TGQKRy43v
	tJ3XOTj50QfMusav8k5IDcZIEuZ9TRGeBgOf3TZPYhlwJccOyIqJwvpmr700
X-Google-Smtp-Source: AGHT+IEGvzLe4nArcLnElhPdaQn9gELx1iaidXdR+MBAypJHaMtu2FZ3BuouzqGAF7f5uYN1bA485A==
X-Received: by 2002:a05:690c:b:b0:6e3:fb4:9333 with SMTP id 00721157ae682-6ea3b96aa99mr299425207b3.28.1730862285629;
        Tue, 05 Nov 2024 19:04:45 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d29sm25680687b3.11.2024.11.05.19.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 19:04:45 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] Drop unnecessary SRC_URI md5sum from the recipes in meta-oe.
Date: Tue,  5 Nov 2024 22:04:26 -0500
Message-ID: <20241106030426.26044-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 03:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113685

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb  | 1 -
 meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb                | 1 -
 meta-oe/recipes-benchmark/dbench/dbench_4.0.bb                   | 1 -
 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb             | 1 -
 meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb                | 1 -
 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb                 | 1 -
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb              | 1 -
 meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb       | 1 -
 meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb             | 1 -
 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb             | 1 -
 meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb                   | 1 -
 meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb              | 1 -
 meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb               | 1 -
 meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb             | 1 -
 meta-oe/recipes-connectivity/libev/libev_4.33.bb                 | 1 -
 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb              | 1 -
 meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb           | 1 -
 meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb       | 1 -
 meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb  | 1 -
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb               | 1 -
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb           | 1 -
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb                | 1 -
 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb                   | 1 -
 meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb     | 1 -
 meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb              | 1 -
 meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb                       | 1 -
 .../recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb  | 1 -
 meta-oe/recipes-devtools/cscope/cscope_15.9.bb                   | 1 -
 meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb                | 1 -
 meta-oe/recipes-devtools/glade/glade_3.22.2.bb                   | 1 -
 meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb          | 1 -
 meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb                      | 1 -
 meta-oe/recipes-devtools/memstat/memstat_1.0.bb                  | 1 -
 meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb              | 1 -
 meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb         | 1 -
 meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb        | 1 -
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb                | 1 -
 meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb | 1 -
 meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb             | 1 -
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb             | 1 -
 meta-oe/recipes-extended/enscript/enscript_1.6.6.bb              | 1 -
 meta-oe/recipes-extended/indent/indent_2.2.12.bb                 | 1 -
 meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb            | 1 -
 meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb          | 1 -
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb                | 1 -
 meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb          | 1 -
 meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb    | 1 -
 meta-oe/recipes-extended/lprng/lprng_3.8.C.bb                    | 1 -
 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb                 | 1 -
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb                    | 1 -
 meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb        | 1 -
 meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb       | 1 -
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb                 | 1 -
 .../recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb  | 1 -
 .../recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb  | 1 -
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb          | 1 -
 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb          | 1 -
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb      | 1 -
 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb                 | 1 -
 meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb               | 1 -
 meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb         | 1 -
 meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb              | 1 -
 meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb | 1 -
 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb                    | 1 -
 meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb         | 1 -
 meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb     | 1 -
 meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb              | 1 -
 meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb                 | 1 -
 meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb                  | 1 -
 meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb           | 1 -
 meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb              | 1 -
 meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb             | 1 -
 meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb             | 1 -
 meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb                 | 1 -
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb                      | 1 -
 meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb                | 1 -
 meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb                | 1 -
 meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb        | 1 -
 meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb   | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb            | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb           | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb       | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb   | 1 -
 .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb               | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb         | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb              | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb            | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb           | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb      | 1 -
 .../recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb    | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb      | 1 -
 meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb            | 1 -
 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb                | 1 -
 meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb    | 1 -
 .../recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb | 1 -
 meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb       | 1 -
 .../xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb           | 1 -
 .../recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb    | 1 -
 meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb     | 1 -
 meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb       | 1 -
 meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb   | 1 -
 meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb          | 1 -
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb               | 1 -
 meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb              | 1 -
 meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb        | 1 -
 meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb                | 1 -
 meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb        | 1 -
 meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb          | 1 -
 .../sound-themes/sound-theme-freedesktop_0.8.bb                  | 1 -
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb                  | 1 -
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb                    | 1 -
 meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb       | 1 -
 meta-oe/recipes-support/anthy/anthy_9100h.bb                     | 1 -
 meta-oe/recipes-support/atop/atop_2.4.0.bb                       | 1 -
 meta-oe/recipes-support/augeas/augeas_1.12.0.bb                  | 1 -
 meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb      | 1 -
 meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb      | 1 -
 meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb      | 1 -
 meta-oe/recipes-support/ckermit/ckermit_302.bb                   | 1 -
 meta-oe/recipes-support/daemontools/daemontools_0.76.bb          | 1 -
 meta-oe/recipes-support/dhex/dhex_0.69.bb                        | 1 -
 meta-oe/recipes-support/eject/eject_2.1.5.bb                     | 1 -
 meta-oe/recipes-support/espeak/espeak_1.48.04.bb                 | 1 -
 meta-oe/recipes-support/fbset/fbset_2.1.bb                       | 1 -
 meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb              | 1 -
 meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb            | 1 -
 meta-oe/recipes-support/joe/joe_4.6.bb                           | 1 -
 meta-oe/recipes-support/lcov/lcov_1.16.bb                        | 1 -
 meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb          | 1 -
 meta-oe/recipes-support/libestr/libestr_0.1.11.bb                | 1 -
 meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb            | 1 -
 meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb               | 1 -
 meta-oe/recipes-support/liboop/liboop_1.0.1.bb                   | 1 -
 meta-oe/recipes-support/libraw1394/libraw1394_2.1.2.bb           | 1 -
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb                   | 1 -
 meta-oe/recipes-support/libtar/libtar_1.2.20.bb                  | 1 -
 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb           | 1 -
 meta-oe/recipes-support/log4c/log4c_1.2.4.bb                     | 1 -
 meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb              | 1 -
 meta-oe/recipes-support/minini/minini_1.2.b.bb                   | 1 -
 meta-oe/recipes-support/mscgen/mscgen_0.20.bb                    | 1 -
 meta-oe/recipes-support/openct/openct_0.6.20.bb                  | 1 -
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb                | 1 -
 meta-oe/recipes-support/pidgin/libotr_4.1.1.bb                   | 1 -
 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb               | 1 -
 meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb             | 1 -
 meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb               | 1 -
 meta-oe/recipes-support/procmail/procmail_3.22.bb                | 1 -
 meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb                  | 1 -
 meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb             | 1 -
 meta-oe/recipes-support/sdparm/sdparm_1.12.bb                    | 1 -
 meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb            | 1 -
 meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb                   | 1 -
 .../system-config-keyboard/system-config-keyboard_1.4.0.bb       | 1 -
 meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb      | 1 -
 .../usb-modeswitch/usb-modeswitch-data_20191128.bb               | 1 -
 .../xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb          | 1 -
 meta-oe/recipes-support/zile/zile_2.4.15.bb                      | 1 -
 meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb                   | 1 -
 meta-oe/recipes-test/cunit/cunit_2.1-3.bb                        | 1 -
 meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb                      | 1 -
 161 files changed, 161 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
index 9f8553206..4e0afefde 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 HG_CHANGESET = "98273ce331bb"
 SRC_URI = "https://selenic.com/repo/${BPN}/archive/${HG_CHANGESET}.tar.bz2;downloadfilename=${BP}.tar.bz2 \
            file://0001-smem-fix-support-for-source-option-python3.patch"
-SRC_URI[md5sum] = "51c3989779360f42b42ef46b2831be3a"
 SRC_URI[sha256sum] = "161131c686a6d9962a0e96912526dd46308e022d62e3f8acaed5a56fda8e08ce"
 
 UPSTREAM_CHECK_URI = "https://selenic.com/repo/smem/tags"
diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
index c305aadd0..c70f8a9ef 100644
--- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
 
 SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}_${PV}.tgz \
 "
-SRC_URI[md5sum] = "1414aab86e2db1b4691bd4be82031012"
 SRC_URI[sha256sum] = "507bd2ce5360c7c98b91b0fdc2bed5c9320b5c9699f7d4a3d1c86b256896c15e"
 
 inherit autotools-brokensep
diff --git a/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
index 32f51fee4..d300c40a4 100644
--- a/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
+++ b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
@@ -22,5 +22,4 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 FILES:tbench = "${bindir}/tbench* ${prefix}/share/client.txt"
 
-SRC_URI[md5sum] = "1fe56ff71b9a416f8889d7150ac54da4"
 SRC_URI[sha256sum] = "6001893f34e68a3cfeb5d424e1f2bfef005df96a22d86f35dc770c5bccf3aa8a"
diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
index db4377f53..4cc1999cf 100644
--- a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
@@ -6,7 +6,6 @@ SRC_URI = "http://www.netlib.org/benchmark/dhry-c;downloadfilename=dhry-c.shar \
            file://dhrystone.patch \
            file://dhrystone-c89.patch \
 "
-SRC_URI[md5sum] = "75aa5909c174eed98c134be2f56307da"
 SRC_URI[sha256sum] = "038a7e9169787125c3451a6c941f3aca5db2d2f3863871afcdce154ef17f4e3e"
 
 # Need to override Makefile variables
diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
index 86e5fef53..7b3d23a53 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
@@ -8,7 +8,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.tar.gz \
            file://0001-Detect-bool-definition-considering-stdbool.h-being-p.patch \
 "
 
-SRC_URI[md5sum] = "31ea1c6d5cbf80b16ff3abe4288dad5e"
 SRC_URI[sha256sum] = "c88adec966096a81136dda91b4bd19c27aae06df4d45a7f547a8e50d723778ad"
 
 S = "${WORKDIR}/iperf-${PV}"
diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
index a0327ee15..086f84a70 100644
--- a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM ="file://${UNPACKDIR}/linpacknew.c;beginline=1;endline=23;md5=a
 SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpacknew.c \
            file://0001-linpack-Define-DP-only-when-SP-is-not-defined.patch \
           "
-SRC_URI[md5sum] = "1c5d0b6a31264685d2e651c920e3cdf4"
 SRC_URI[sha256sum] = "a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae3af374d48745e97e"
 
 S = "${WORKDIR}/sources"
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 6729e81fa..2533f6033 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -30,7 +30,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://0001-bench.h-Fix-typo-in-specifying-string.h.patch \
            file://0001-scripts-build-Fix-the-tests-to-build-with-clang15.patch \
            "
-SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lmbench/files/development/"
diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
index b4d55be1b..9e1cedc2d 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
@@ -11,7 +11,6 @@ SRC_URI = "https://fossies.org/linux/misc/old/${BP}.tar.gz \
            file://nbench_32bits.patch \
            file://Makefile-add-more-dependencies-to-pointer.h.patch"
 
-SRC_URI[md5sum] = "285dfab361080759d477ea1fe7d3093a"
 SRC_URI[sha256sum] = "723dd073f80e9969639eb577d2af4b540fc29716b6eafdac488d8f5aed9101ac"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
index 0769715f4..98914836e 100644
--- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
@@ -11,7 +11,6 @@ SRC_URI = "\
     file://0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch \
     file://0001-Specify-printf-formats.patch \
 "
-SRC_URI[md5sum] = "bf485bf820e693c79e6bd2a38702a128"
 SRC_URI[sha256sum] = "8ad011059a35ac70cdb5e3d3999ceee44a8e8e9078926844b0685b7ea9db2bcc"
 
 EXTRA_OEMAKE = "PREFIX=${D}/usr"
diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
index ce28fc732..ea8a43387 100644
--- a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
+++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
@@ -5,7 +5,6 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM ="file://${UNPACKDIR}/whetstone.c;beginline=1;endline=52;md5=c795edc15e7e1d92ca8f88ad718449f5"
 
 SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
-SRC_URI[md5sum] = "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
 SRC_URI[sha256sum] = "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
 
 S = "${WORKDIR}/sources"
diff --git a/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb b/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
index db862c896..2a9ba574e 100644
--- a/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
+++ b/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
@@ -9,7 +9,6 @@ SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.
 
 inherit autotools
 
-SRC_URI[md5sum] = "9e4ec55201be0be71ffbc56d38b42b57"
 SRC_URI[sha256sum] = "004fb6cd43102918b6302cf537a2db7ceadda04aef2e0906ddf230f820dad34f"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/acpitool/files/acpitool/"
diff --git a/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb b/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
index 22bb30a50..d4d76e0e5 100644
--- a/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
+++ b/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
@@ -16,7 +16,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/irda/irda-utils-${PV}.tar.gz \
            file://musl.patch \
            file://init"
 
-SRC_URI[md5sum] = "84dc12aa4c3f61fccb8d8919bf4079bb"
 SRC_URI[sha256sum] = "61980551e46b2eaa9e17ad31cbc1a638074611fc33bff34163d10c7a67a9fdc6"
 
 inherit update-rc.d
diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 2a736716d..0bdd8042f 100644
--- a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -15,7 +15,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/${BP}.tar.xz \
            file://lex_sys_types.patch \
 "
 
-SRC_URI[md5sum] = "885431c3cefb76ffdad8cb985134e996"
 SRC_URI[sha256sum] = "57c27be8f04ef4d535bcfa988567316cc57659fe69068327486dab53791e6558"
 
 inherit pkgconfig
diff --git a/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb b/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb
index 62651bc30..14104ffcc 100644
--- a/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb
+++ b/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb
@@ -12,7 +12,6 @@ SRC_URI = "http://0pointer.de/lennart/projects/ifplugd/ifplugd-${PV}.tar.gz \
 
 SRC_URI:append:libc-musl = " file://Fix-build-with-musl.patch"
 
-SRC_URI[md5sum] = "df6f4bab52f46ffd6eb1f5912d4ccee3"
 SRC_URI[sha256sum] = "474754ac4ab32d738cbf2a4a3e87ee0a2c71b9048a38bdcd7df1e4f9fd6541f0"
 
 inherit autotools update-rc.d pkgconfig
diff --git a/meta-oe/recipes-connectivity/libev/libev_4.33.bb b/meta-oe/recipes-connectivity/libev/libev_4.33.bb
index 346e78b1d..6d29900a4 100644
--- a/meta-oe/recipes-connectivity/libev/libev_4.33.bb
+++ b/meta-oe/recipes-connectivity/libev/libev_4.33.bb
@@ -5,7 +5,6 @@ LICENSE = "BSD-2-Clause | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
 
 SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
-SRC_URI[md5sum] = "a3433f23583167081bf4acdd5b01b34f"
 SRC_URI[sha256sum] = "507eb7b8d1015fbec5b935f34ebed15bf346bed04a11ab82b8eee848c4205aea"
 
 inherit autotools
diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
index 7d373a65c..fecf9b129 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
@@ -12,7 +12,6 @@ DEPENDS:append:class-target = " bluez5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}-Source.tar.gz \
 "
-SRC_URI[md5sum] = "f6e0b6cb7dcfd731460a7e9a91429a3a"
 SRC_URI[sha256sum] = "158860aaea52f0fce0c8e4b64550daaae06df2689e05834697b7e8c7d73dd4fc"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/openobex/files/openobex/"
diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
index 018365907..a9a12f8e0 100644
--- a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://downloads.sourceforge.net/openobex/${BP}-Source.tar.gz \
            file://0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch \
            file://make_fuse_swig_optional.patch \
 "
-SRC_URI[md5sum] = "157a9d1b2ed220203f7084db906de73c"
 SRC_URI[sha256sum] = "d40fb48e0a0eea997b3e582774b29f793919a625d54b87182e31a3f3d1c989a3"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/openobex/files/obexftp/"
diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
index 9e5496863..38dcb395b 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://smstools3.kekekasvi.com/packages/${BP}.tar.gz \
            file://0001-Make-extern-declarations-to-avoid-duplicate-var-defi.patch \
            "
 
-SRC_URI[md5sum] = "6a9f038fb38a49cc3a4f8f14a88fb8af"
 SRC_URI[sha256sum] = "a26ba4c02b16f6cf13177bffca6c9230dc5fefaeba8e3030cd4e4905f6a92084"
 
 
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
index e08303923..56af002d0 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
@@ -5,7 +5,6 @@ DEPENDS = "glib-2.0 dbus hostpython-runtime-native dbus-native dbus-glib libxslt
 LICENSE = "LGPL-2.1-or-later"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BP}.tar.gz"
-SRC_URI[md5sum] = "cbeb0a24acc26e7f095be281c324da69"
 SRC_URI[sha256sum] = "9e0df1d8f857e0270cf0b32e2d1ca5a24aa7282873361785d573f72ad7f7d5eb"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index c1da15a1b..70a4f7c00 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -13,7 +13,6 @@ SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.
            file://typo_pon.wvdial.1.patch \
            file://musl-support.patch \
           "
-SRC_URI[md5sum] = "37e9a2d664effe4efd44c0e1a20136de"
 SRC_URI[sha256sum] = "99906d9560cbdbc97e1855e7b0a7169f1e11983be3ac539140423f09debced82"
 
 # code.google.com/archive page is generated by javascript from JSON and does not
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 3b72e4412..4bb4c11d6 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -25,7 +25,6 @@ SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.
            file://0001-Fix-narrowing-conversion-error.patch \
            "
 
-SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
 SRC_URI[sha256sum] = "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633"
 
 # The code.google.com/archive page is generated using Javascript from a JSON file and does not 
diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index f90b2cab1..33a339f5c 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -6,7 +6,6 @@ DEPENDS = "zeromq"
 
 SRC_URI = "https://github.com/zeromq/czmq/releases/download/v${PV}/czmq-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "471e9ec120fc66a2fe2aae14359e3cfa"
 SRC_URI[sha256sum] = "5d720a204c2a58645d6f7643af15d563a712dad98c9d32c1ed913377daa6ac39"
 
 UPSTREAM_CHECK_URI = "https://github.com/zeromq/${BPN}/releases"
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
index 8940e19f8..e24ebe447 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
+++ b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
@@ -15,7 +15,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/dbus-cplusplus/dbus-c++/${PV}/${BP}.tar
            file://0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch \
            file://0001-pipe.c-Use-a-string-instead-of-char.patch \
            "
-SRC_URI[md5sum] = "e752116f523fa88ef041e63d3dee4de2"
 SRC_URI[sha256sum] = "bc11ac297b3cb010be904c72789695543ee3fdf3d75cdc8225fd371385af4e61"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/dbus-cplusplus/files"
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index 28213f387..58aa3216e 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -9,7 +9,6 @@ PROVIDES = "virtual/libintl"
 SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${BPN}-dev_${PV}_win32.zip \
 "
-SRC_URI[md5sum] = "aef407c2b97ee829383aadd867c61d1e"
 SRC_URI[sha256sum] = "291ac350cc5eb4a01b0d651ca99fae64cee8a1c06b2005277fab5a4356f9ae91"
 
 UPSTREAM_CHECK_REGEX = "${BPN}-dev_(?P<pver>\d+)_win32\.zip"
diff --git a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
index cfa056d71..a04fafba5 100644
--- a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
+++ b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
@@ -6,7 +6,6 @@ DEPENDS = "libtool"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/mcrypt/Libmcrypt/${PV}/libmcrypt-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0821830d930a86a5c69110837c55b7da"
 SRC_URI[sha256sum] = "e4eb6c074bbab168ac47b947c195ff8cef9d51a211cdd18ca9c9ef34d27a373e"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mcrypt/files/Libmcrypt/"
diff --git a/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb b/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
index 732291649..9623ef7f1 100644
--- a/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
+++ b/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
@@ -1,5 +1,4 @@
 require ${PN}.inc
 
 
-SRC_URI[md5sum] = "05e2ceeac4bc85fbe40de8b4b22d9ab3"
 SRC_URI[sha256sum] = "dafb6cdca524c628df832b6dd0bf8fabceb103248edb21762c02d3068fca4503"
diff --git a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
index d0e0446eb..f928ed965 100644
--- a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
+++ b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
@@ -16,7 +16,6 @@ SRC_URI = " \
 "
 
 S = "${WORKDIR}/${BPN}"
-SRC_URI[md5sum] = "9de56d4a161a723228220b0f425dc711"
 SRC_URI[sha256sum] = "f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd791e"
 
 inherit texinfo native
diff --git a/meta-oe/recipes-devtools/cscope/cscope_15.9.bb b/meta-oe/recipes-devtools/cscope/cscope_15.9.bb
index 99f3ba85d..fad885dd4 100644
--- a/meta-oe/recipes-devtools/cscope/cscope_15.9.bb
+++ b/meta-oe/recipes-devtools/cscope/cscope_15.9.bb
@@ -20,5 +20,4 @@ DEPENDS += "ncurses"
 
 SRC_URI = "http://downloads.sourceforge.net/project/cscope/cscope/v${PV}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "16f3cce078b6c0e42299def4028eea6f"
 SRC_URI[sha256sum] = "c5505ae075a871a9cd8d9801859b0ff1c09782075df281c72c23e72115d9f159"
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb b/meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb
index 2f0d8a340..79252f94a 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb
@@ -28,7 +28,6 @@ SRC_URI = "http://dmalloc.com/releases/dmalloc-${PV}.tgz \
            file://0001-undefined-strdup-macro.patch \
 "
 
-SRC_URI[md5sum] = "f92e5606c23a8092f3d5694e8d1c932e"
 SRC_URI[sha256sum] = "d3be5c6eec24950cb3bd67dbfbcdf036f1278fae5fd78655ef8cdf9e911e428a"
 
 ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
index 72c4036be..84ca98a8b 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
@@ -18,7 +18,6 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.22/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
           "
-SRC_URI[md5sum] = "c074fa378c8f1ad80d20133c4ae6f42d"
 SRC_URI[sha256sum] = "edefa6eb24b4d15bd52589121dc109bc08c286157c41288deb74dd9cc3f26a21"
 
 EXTRA_OECONF += "--disable-man-pages"
diff --git a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
index 8e7b0ba5a..991133185 100644
--- a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
+++ b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
@@ -5,7 +5,6 @@ DEPENDS = "gdk-pixbuf popt"
 
 SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Makefile.am-no-examples.patch"
-SRC_URI[md5sum] = "5c5374d4f265b0abe4daef1d03f87104"
 SRC_URI[sha256sum] = "05f0216dd0c25a17859de66357f64da5033375b6fbf5f31ca54867311160b64d"
 
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
index b44c6d666..0c1815732 100644
--- a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
+++ b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
@@ -7,7 +7,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://ice-mcpp.patch \
            file://0001-configure-Fix-checks-for-system-headers.patch \
            file://CVE-2019-14274.patch"
-SRC_URI[md5sum] = "512de48c87ab023a69250edc7a0c7b05"
 SRC_URI[sha256sum] = "3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdbbc2055099fcb8864"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mcpp/files/mcpp/"
diff --git a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
index 7e0ff54dc..502843c0d 100644
--- a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
+++ b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
@@ -16,7 +16,6 @@ SRC_URI = "http://sourceforge.net/projects/memstattool/files/memstat_${PV}.tar.g
            file://0001-Include-limits.h-for-PATH_MAX-definition.patch \
            "
 
-SRC_URI[md5sum] = "2c3acc0c62b2a18f6601b84e54aa7462"
 SRC_URI[sha256sum] = "245d5fc7fb87bcfd14486cd34917cae2856e799559ac568434af12c4852bce94"
 
 do_install:append(){
diff --git a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
index 05220c249..51fb98ccc 100644
--- a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
+++ b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=11;md5=678a3928c85604242
 SECTION = "devel"
 
 SRC_URI = "https://01.org/sites/default/files/downloads/msr-tools/msr-tools-${PV}.zip"
-SRC_URI[md5sum] = "67d18527f64fd707c9b7a79f13d19fd5"
 SRC_URI[sha256sum] = "f9457b5340f5f274da4239a461f0db6b514142b40461559d9c6150f05aab1d1e"
 
 S = "${WORKDIR}/msr-tools-master"
diff --git a/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb b/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
index be9704a31..b77a5c95a 100644
--- a/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
+++ b/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://lib/Parse/Yapp.pm;beginline=508;endline=521;md5=41a45
 
 SRC_URI = "https://www.cpan.org/authors/id/W/WB/WBRASWELL/Parse-Yapp-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "69584d5b0f0304bb2a23cffcd982c5de"
 SRC_URI[sha256sum] = "3810e998308fba2e0f4f26043035032b027ce51ce5c8a52a8b8e340ca65f13e5"
 
 S = "${WORKDIR}/Parse-Yapp-${PV}"
diff --git a/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb b/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
index 11f6a1ad1..4ce31d6fe 100644
--- a/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
+++ b/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
@@ -11,7 +11,6 @@ DEPENDS += "perl"
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/N/NW/NWCLARK/PerlIO-gzip-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0393eae5d0b23df6cf40ed44af7d711c"
 SRC_URI[sha256sum] = "4848679a3f201e3f3b0c5f6f9526e602af52923ffa471a2a3657db786bd3bdc5"
 
 S = "${WORKDIR}/PerlIO-gzip-${PV}"
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 3b8da9144..6df54ee18 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -19,7 +19,6 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://uw-imap-fix-incompatible-pointer-types.patch \
            "
 
-SRC_URI[md5sum] = "2126fd125ea26b73b20f01fcd5940369"
 SRC_URI[sha256sum] = "53e15a2b5c1bc80161d42e9f69792a3fa18332b7b771910131004eb520004a28"
 
 S = "${WORKDIR}/imap-${PV}"
diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
index acd5b1e80..3dc468fe0 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
@@ -22,7 +22,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb843e794feb6890f7697637b461c36e"
 
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
            "
-#SRC_URI[md5sum] = "5df2f85c75efc351ffadebcc11046a98"
 SRC_URI[sha256sum] = "0adcfcf36d47317776ad64331058a4d2e3669683314716ddb885f8a13309f47d"
 
 UPSTREAM_CHECK_URI = "https://github.com/cfengine/masterfiles/releases"
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
index 6fa5d2743..490f735fc 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
@@ -22,7 +22,6 @@ SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BPN}-commu
            file://0001-Fixed-with-libxml2-no-case-in-configure.ac.patch \
            file://set-path-of-default-config-file.patch \
            "
-#SRC_URI[md5sum] = "5318e40702bc66a3ece44ec4ad77712b"
 SRC_URI[sha256sum] = "911778ddb0a4e03a3ddfc8fc0f033136e1551849ea2dcbdb3f0f14359dfe3126"
 
 inherit autotools-brokensep systemd
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index df36b6469..ade688df7 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -16,7 +16,6 @@ SRC_URI = "https://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://0006-libcollectdclient-Fix-string-overflow-errors.patch \
            file://0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch \
            "
-SRC_URI[md5sum] = "2b23a65960bc323d065234776a542e04"
 SRC_URI[sha256sum] = "5bae043042c19c31f77eb8464e56a01a5454e0b39fa07cf7ad0f1bfc9c3a09d6"
 
 inherit autotools python3native update-rc.d pkgconfig systemd
diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
index 9490ee09d..f6400213c 100644
--- a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
+++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
@@ -20,7 +20,6 @@ inherit autotools gettext
 
 EXTRA_OECONF += "PERL='${USRBINPATH}/env perl'"
 
-SRC_URI[md5sum] = "3acc242b829adacabcaf28533f049afd"
 SRC_URI[sha256sum] = "6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb"
 
 RDEPENDS:${PN} = "perl"
diff --git a/meta-oe/recipes-extended/indent/indent_2.2.12.bb b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
index 1a7d61abc..7847b535b 100644
--- a/meta-oe/recipes-extended/indent/indent_2.2.12.bb
+++ b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
@@ -18,7 +18,6 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Fix-builds-with-recent-gettext.patch \
            file://0001-Remove-dead-paren_level-code.patch \
            "
-SRC_URI[md5sum] = "4764b6ac98f6654a35da117b8e5e8e14"
 SRC_URI[sha256sum] = "e77d68c0211515459b8812118d606812e300097cfac0b4e9fb3472664263bb8b"
 
 inherit autotools gettext texinfo
diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
index 638256992..ad030b8f4 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
@@ -14,7 +14,6 @@ UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"
 
 inherit autotools-brokensep pkgconfig
 
-SRC_URI[md5sum] = "15ec701205f91f21b1187f8b61e0d64f"
 SRC_URI[sha256sum] = "545166d6cac037744381d1e9cc5a5405094e7bfad16a411699bcff40bbb31ee7"
 
 PACKAGE_BEFORE_PN = "${PN}++"
diff --git a/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
index d4bad38b7..10e6f3487 100644
--- a/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
+++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
@@ -12,7 +12,6 @@ SRC_URI = "http://distcache.freebsd.org/local-distfiles/itetcu/${BP}.tar.bz2 \
            file://0001-makefile-Fix-build-on-linux.patch \
            file://0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch \
            "
-SRC_URI[md5sum] = "8e9e81c554c1c5d735bc877448e92b91"
 SRC_URI[sha256sum] = "c9a21913e7fdac8ef6b33250b167aa1fc0a7b8a175145e26913a4c19d8a59b1f"
 
 CFLAGS += "-fno-omit-frame-pointer  -D_GNU_SOURCE"
diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
index eb85a07e9..125b7e9a8 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -16,7 +16,6 @@ SRC_URI = "https://bitbucket.org/tagoh/libgxim/downloads/${BPN}-${PV}.tar.bz2 \
            file://0003-Add-format-string-qualifier-to-fix-potential-securit.patch \
            "
 
-SRC_URI[md5sum] = "4bb1fa63d00eb224439d413591c29a6a"
 SRC_URI[sha256sum] = "75e20d1744139644f9951b78ea3910b162d3380302315cb4b3d0640f23694c79"
 
 LICENSE = "LGPL-2.0-or-later"
diff --git a/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb b/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
index 5c1c15159..1b7f95d57 100644
--- a/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
+++ b/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
@@ -12,7 +12,6 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=63fe03535d83726f5655072502bef1bc"
 SRC_URI = "http://download.rsyslog.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f215c7e7ac6cfd1f5dabdba08c522b29"
 SRC_URI[sha256sum] = "338c6174e5c8652eaa34f956be3451f7491a4416ab489aef63151f802b00bf93"
 
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb b/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
index 4190338c1..089d426bb 100644
--- a/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
+++ b/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
@@ -8,5 +8,4 @@ inherit autotools
 
 SRC_URI = "http://sigrok.org/download/source/libserialport/libserialport-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b93f0325a6157198152b5bd7e8182b51"
 SRC_URI[sha256sum] = "4a2af9d9c3ff488e92fb75b4ba38b35bcf9b8a66df04773eba2a7bbf1fa7529d"
diff --git a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
index c1a8aadff..fd20860a0 100644
--- a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
+++ b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c6570d8d699af1883db9d0e733ac9bfb"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-checkpc-Do-not-define-Mail_fd-multiple-times.patch \
           "
-SRC_URI[md5sum] = "5901bed95e61d2bea3ba3056056af432"
 SRC_URI[sha256sum] = "694a1747a96385b89e93f43343bf35cee5c8c73353a83814106911c99f09de10"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lprng/files/lprng/"
diff --git a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
index bf742fa06..d5629b06e 100644
--- a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
+++ b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4a94da2a1f918b217ef5156634fc9e0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch \
            "
-SRC_URI[md5sum] = "9a0b87bbc670c1e738e5b40c7afd184d"
 SRC_URI[sha256sum] = "c4cc33f8838f4523f27c3d7584eedbe59f4c587f0821612f5ac2201adc18b367"
 
 do_compile() {
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 498623cc8..789819a5e 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -14,7 +14,6 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
            file://CVE-2016-9296.patch \
            "
 
-SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
 SRC_URI[sha256sum] = "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f"
 
 UPSTREAM_CHECK_URI = "https://tracker.debian.org/pkg/p7zip"
diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
index e9508b6d4..609d2902c 100644
--- a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
@@ -12,7 +12,6 @@ SRC_URI = "http://sourceforge.net/projects/pamsshagentauth/files/pam_ssh_agent_a
            file://0002-Check-against-the-correct-OPENSSL_VERSION_NUMBER.patch \
            file://0001-configure-Include-stdio.h-for-printf.patch \
            "
-SRC_URI[md5sum] = "8dbe90ab3625e545036333e6f51ccf1d"
 SRC_URI[sha256sum] = "3c53d358d6eaed1b211239df017c27c6f9970995d14102ae67bae16d4f47a763"
 
 DEPENDS += "libpam openssl"
diff --git a/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
index 7768d1741..eeb314fdd 100644
--- a/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
+++ b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=34;endline=37;md5=54fdfac62963b7cece
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/M/MJ/MJP/File-FnMatch-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "22f77c20d0fb5af01a3165e2df2fe34c"
 SRC_URI[sha256sum] = "962454b8e86bea8b132bf8af35757d0c6a8f5d599015bd6a5d68cb7ae7a9e916"
 
 S = "${WORKDIR}/File-FnMatch-${PV}"
diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
index 293431245..2b09b6bca 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
+++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
@@ -10,7 +10,6 @@ network."
 SECTION = "System Environment/Daemons"
 
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.gz/be2a88f8ccddf2a40ac484cb3294fedc/${BP}.tar.gz"
-SRC_URI[md5sum] = "be2a88f8ccddf2a40ac484cb3294fedc"
 SRC_URI[sha256sum] = "4d6145d435a5d8b567b9798620f57f9b0a464078a1deba267958f168fbe776e6"
 
 SRC_URI += "file://0001-rarpd.8-add-man-file.patch \
diff --git a/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb b/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb
index b71ad234e..41cbe4c42 100644
--- a/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb
+++ b/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb
@@ -10,7 +10,6 @@ SECTION = "Development/Libraries"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/sblim/${BP}.tar.bz2 \
            file://sblim-cmpi-devel-2.0.3-docdir.patch"
-SRC_URI[md5sum] = "b934616f88a848f17ca3cf1b9e792cbf"
 SRC_URI[sha256sum] = "1671cabff6b922b6fde897673d9fdafd56c9310f82a7eacc0547d596b9cdfea6"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/sblim/files/development%20pkgs/sblim-cmpi-devel/"
diff --git a/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
index d2bab6ce5..29b01d5bf 100644
--- a/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
+++ b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
@@ -11,7 +11,6 @@ DEPENDS = "cmpi-bindings"
 
 S = "${WORKDIR}/sblim-sfcCommon-${PV}"
 SRC_URI = "http://downloads.sourceforge.net/sblim/sblim-sfcCommon-${PV}.tar.bz2"
-SRC_URI[md5sum] = "8aa2655d97bdea54c4750f220b40990c"
 SRC_URI[sha256sum] = "b9b1037173d6ae0181c3bd5a316ddab5afd6a342ad0dbdc18e940fc0ad2c3297"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/sblim/files/sblim-sfcCommon/"
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 6126a3a38..083cfcb81 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -31,7 +31,6 @@ SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
            file://0001-include-missing-system-headers.patch \
 "
 
-SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
 SRC_URI[sha256sum] = "634a67b2f7ac3b386a79160eb44413d618e33e4e7fc74ae68b0240484af149dd"
 
 CVE_STATUS[CVE-2012-3381] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
index 4eb1c2f25..4aa3668e2 100644
--- a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
@@ -8,7 +8,6 @@ SRC_URI = "http://netcologne.dl.sourceforge.net/project/sblim/${BPN}/${BPN}-${PV
            file://0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch \
            "
 
-SRC_URI[md5sum] = "0bac0dec19f17ec065b6c332a56d7bae"
 SRC_URI[sha256sum] = "1b8f187583bc6c6b0a63aae0165ca37892a2a3bd4bb0682cd76b56268b42c3d6"
 
 UPSTREAM_CHECK_URI="https://sourceforge.net/projects/sblim/files/sblim-sfcc/"
diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index c9a5bd1f9..ccd2f90c3 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -14,7 +14,6 @@ SRC_URI = "http://prdownloads.sourceforge.net/scsirastools/scsirastools-${PV}.ta
            file://mdadm.patch;apply=no \
            file://print-format.patch \
 "
-SRC_URI[md5sum] = "6271a61b2ce40aaf33ef61775148cda1"
 SRC_URI[sha256sum] = "e7b997e75decb06a650c42c35cd63d0c94c34e39cf133c723337b0eeabbfdf6a"
 
 inherit autotools update-rc.d
diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
index 9b25745ed..98e22f116 100644
--- a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
+++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
@@ -6,7 +6,6 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BPN}-1.2-0.10-src.ta
            file://Makefile-error-fix.patch \
            file://0001-makefile-Add-LDFLAGS-to-linking-rule.patch \
            "
-SRC_URI[md5sum] = "a417bf68da4e9bd79a4664c11d7debd1"
 SRC_URI[sha256sum] = "9bf8c42acaa247efd9321bdb1fc2390022f0c554d77fbbd4a7363d990fc0270b"
 
 S = "${WORKDIR}/${BPN}"
diff --git a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
index 1e5ffdd85..1e63179e8 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
+++ b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
@@ -19,7 +19,6 @@ inherit autotools pkgconfig mime
 
 SRC_URI = "http://sigrok.org/download/source/libsigrok/libsigrok-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "e258d471b6d5eaa58daf927a0dc3ba67"
 SRC_URI[sha256sum] = "4d341f90b6220d3e8cb251dacf726c41165285612248f2c52d15df4590a1ce3c"
 
 FILES:${PN} += "${datadir}/*"
diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
index 24091bcf9..4ea2287e4 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
@@ -13,5 +13,4 @@ SRC_URI = "http://sigrok.org/download/source/libsigrokdecode/libsigrokdecode-${P
            file://0001-configure.ac-add-py-3.10-support.patch \
            "
 
-SRC_URI[md5sum] = "7ba4ed4ef1f06ae96979751e096c2821"
 SRC_URI[sha256sum] = "c50814aa6743cd8c4e88c84a0cdd8889d883c3be122289be90c63d7d67883fc0"
diff --git a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb
index 48f96cc43..f9da51fe6 100644
--- a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb
+++ b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb
@@ -13,7 +13,6 @@ PACKAGECONFIG ??= "decode"
 inherit autotools pkgconfig mime-xdg
 
 SRC_URI = "http://sigrok.org/download/source/sigrok-cli/sigrok-cli-${PV}.tar.gz"
-SRC_URI[md5sum] = "856fd496cd99d1091aa128405c522a36"
 SRC_URI[sha256sum] = "71d0443f36897bf565732dec206830dbea0f2789b6601cf10536b286d1140ab8"
 
 FILES:${PN} += "${datadir}/icons/hicolor"
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index 93daafbeb..09797124c 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://downloads.sourceforge.net/project/user-mode-linux/tools/1/uml_
            file://0001-cow.c-Replace-stat64-with-stat.patch \
            file://0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch \
            "
-SRC_URI[md5sum] = "2c1ccd9efacbfb39e42d482b89b2550a"
 SRC_URI[sha256sum] = "4f179b1db021ef15ac7e9b2eed57c525db127a754c574f591c367460cded9f41"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/user-mode-linux/files/tools/1/"
diff --git a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
index 948d8a281..8f9f87b37 100644
--- a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
+++ b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
@@ -16,7 +16,6 @@ SRC_URI = "${GENTOO_MIRROR}/37/${BP}.tar.gz \
        file://vlock_pam \
        "
 
-SRC_URI[md5sum] = "378175c7692a8f288e65fd4dbf8a38eb"
 SRC_URI[sha256sum] = "85aa5aed1ae49351378a0bd527a013078f0f969372a63164b1944174ae1a5e39"
 
 inherit autotools-brokensep update-alternatives
diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
index cc03ab4fe..92a9bbb49 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://releases.pagure.org/volume_key/volume_key-${PV}.tar.xz \
 "
-SRC_URI[md5sum] = "200591290173c3ea71528411838f9080"
 SRC_URI[sha256sum] = "6ca3748fc1dad22c450bbf6601d4e706cb11c5e662d11bb4aeb473a9cd77309b"
 
 SRCNAME = "volume_key"
diff --git a/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
index 398e33948..de91d027e 100644
--- a/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
+++ b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
@@ -18,5 +18,4 @@ S = "${WORKDIR}/DirectFB-examples-${PV}"
 
 inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "8b60c867af295481c32a8c7fc5802307"
 SRC_URI[sha256sum] = "9a2104cc4da8123c8371813551b66b943198979f745cbebc034bb5e10844122a"
diff --git a/meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb b/meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb
index c6c070eda..15f22697c 100644
--- a/meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb
+++ b/meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb
@@ -4,5 +4,4 @@ RV = "1.7-7"
 
 LEAD_SONAME = "libdirectfb-1.7.so.0"
 
-SRC_URI[md5sum] = "152cf1863b1a3a28aa1370e9053440bf"
 SRC_URI[sha256sum] = "b785c638dc31b8fe3a7c81be1475c89b2255ab3d67b777c747d3fbc52f8027a3"
diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
index a5c8de8f6..16ab6d6fd 100644
--- a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://prdownloads.sourceforge.net/${BPN}/${BPN}_${PV}.tar.gz \
            file://0001-main.c-Define-prototype-for-setup_appdata.patch \
            "
 
-SRC_URI[md5sum] = "4331dde4bb83865e15482885fcb0cc53"
 SRC_URI[sha256sum] = "9704344e732038eecbd007dd996a56293a6b027b5b76f3f036273a3fae1ab27b"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gtkperf/files/gtkperf/"
diff --git a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
index f9d3496d9..c92696b8b 100644
--- a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
+++ b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
@@ -10,7 +10,6 @@ DEPENDS = "zlib"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "7e9a12ba2a99dff7e736902ea07383d4"
 SRC_URI[sha256sum] = "cf112a1fb02f5b1c0fce5cab11ea8243852c139e669c44014125874b14b7dfaa"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libmng/files/libmng-devel/"
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb b/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
index a470ee81d..35f278c89 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
@@ -8,7 +8,6 @@ SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-${PV}.tar.
            file://configure.patch \
 "
 
-SRC_URI[md5sum] = "e03ff73d77a55e3572ad0217131dc4a1"
 SRC_URI[sha256sum] = "1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f86992a"
 
 S = "${WORKDIR}/SDL_mixer-${PV}"
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb b/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
index 49b1ef287..93466872a 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
@@ -16,5 +16,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/SDL_net-${PV}"
 
-SRC_URI[md5sum] = "20e64e61d65662db66c379034f11f718"
 SRC_URI[sha256sum] = "5f4a7a8bb884f793c278ac3f3713be41980c5eedccecff0260411347714facb4"
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb b/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
index 797c38d8e..c10444431 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=22800d1b3701377aae0b61ee36f5c303"
 SRC_URI = "http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-${PV}.tar.gz \
            file://use.pkg-config.for.freetype2.patch \
 "
-SRC_URI[md5sum] = "61e29bd9da8d245bc2471d1b2ce591aa"
 SRC_URI[sha256sum] = "724cd895ecf4da319a3ef164892b72078bd92632a5d812111261cde248ebcdb7"
 
 S = "${WORKDIR}/SDL_ttf-${PV}"
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
index 35369e873..d1f890576 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
@@ -12,7 +12,6 @@ inherit autotools pkgconfig
 
 DEPENDS = "libsdl2"
 
-SRC_URI[md5sum] = "5c1d9d1cfa63301b141cb5c0de2ea7c4"
 SRC_URI[sha256sum] = "15ce8a7e5a23dafe8177c8df6e6c79b6749a03fff1e8196742d3571657609d21"
 
 do_configure:prepend() {
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 1f436c6d7..2ccedae3e 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -33,7 +33,6 @@ UPSTREAM_CHECK_REGEX = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
 
 S = "${WORKDIR}/SDL-${PV}"
 
-SRC_URI[md5sum] = "9d96df8417572a2afb781a7c4c811a85"
 SRC_URI[sha256sum] = "d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00"
 
 BINCONFIG = "${bindir}/sdl-config"
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index ae4525829..4fc916f4b 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -21,7 +21,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.
            file://0001-systemd-lxdm.service-remove-plymouth-quit-conflicts.patch \
            file://0001-Initialize-msghdr-struct-in-a-portable-way.patch \
            "
-SRC_URI[md5sum] = "061caae432634e6db38bbdc84bc6ffa0"
 SRC_URI[sha256sum] = "4891efee81c72a400cc6703e40aa76f3f3853833d048b72ec805da0f93567f2f"
 
 PE = "1"
diff --git a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
index 0d53c78f3..beebbd566 100644
--- a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
+++ b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
@@ -7,7 +7,6 @@ DEPENDS = "virtual/libx11 libxtst"
 
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/numlockx/numlockx-${PV}.tar.gz/be9109370447eae23f6f3f8527bb1a67/numlockx-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "be9109370447eae23f6f3f8527bb1a67"
 SRC_URI[sha256sum] = "e468eb9121c94c9089dc6a287eeb347e900ce04a14be37da29d7696cbce772e4"
 
 inherit autotools features_check
diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
index 50231602d..5b62b9b2a 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -11,7 +11,6 @@ SRC_URI = " \
     file://0001-Fix-list-traversal-issue-in-client_calc_layer.patch \
 "
 
-SRC_URI[md5sum] = "b72794996c6a3ad94634727b95f9d204"
 SRC_URI[sha256sum] = "8b4ac0760018c77c0044fab06a4f0c510ba87eae934d9983b10878483bde7ef7"
 
 UPSTREAM_CHECK_URI = "https://github.com/Mikachu/openbox/tags"
diff --git a/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb b/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
index f2ffee64f..b70859dc1 100644
--- a/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
+++ b/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
@@ -8,7 +8,6 @@ DEPENDS = "virtual/libx11"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "ae95dbbacc2620e032acea8abab8c9ef"
 SRC_URI[sha256sum] = "36548a588b2d466913423245dda6ffb6313132cd0cec635a117d37b3dab5fd4c"
 
 UPSTREAM_CHECK_REGEX = "files/v(?P<pver>\d+(\.\d+)+)"
diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
index 1fabe2e29..4cfbde535 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
@@ -12,7 +12,6 @@ DEPENDS = "hostperl-runtime-native gzip-native bdftopcf-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
           file://use-no-name-option-for-gzip.patch \
           "
-SRC_URI[md5sum] = "1b6acbd221957e33c8a792ebfaf3a659"
 SRC_URI[sha256sum] = "d961c1b781627bf417f9b340693d64fc219e0113ad3a3af1a3424c7aa373ef79"
 
 inherit allarch fontcache
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
index 54aeb318a..90a11ca4d 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
@@ -44,7 +44,6 @@ FILES:${PN}-serif-condensed = "${datadir}/fonts/truetype/DejaVuSerifCondensed*.t
 FILES:${PN}-mathtexgyre     = "${datadir}/fonts/truetype/DejaVuMathTeXGyre.ttf"
 FILES:${PN}-common          = "${sysconfdir}"
 
-SRC_URI[md5sum] = "d0efec10b9f110a32e9b8f796e21782c"
 SRC_URI[sha256sum] = "fa9ca4d13871dd122f61258a80d01751d603b4d3ee14095d65453b4e846e17d7"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
index 2439766ad..84cd30d3c 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
@@ -32,5 +32,4 @@ FILES:${PN} = "${datadir}/fonts/truetype/GenI*.ttf \
                ${datadir}/fonts/truetype/GenR*.ttf \
                ${datadir}/doc/ttf-gentium/*"
 
-SRC_URI[md5sum] = "4c3e6ae586be277537ebb68f2a45b883"
 SRC_URI[sha256sum] = "4746c04c9a4ad9e0788a38e0a2f81919a630d8070ceabc89f156b6d41d8ceb37"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
index 8a75fe38b..8101c7d7a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
@@ -15,5 +15,4 @@ FONT_PACKAGES = "ttf-hunky-sans ttf-hunky-serif"
 FILES:ttf-hunky-sans = "${datadir}/fonts/truetype/HunkySans*.ttf"
 FILES:ttf-hunky-serif = "${datadir}/fonts/truetype/HunkySerif*.ttf"
 
-SRC_URI[md5sum] = "b933312967842e5737b5415fa22d682a"
 SRC_URI[sha256sum] = "3fc528737ccd12ec3c09c4a91447d241d3c5bceeeb4d24b7f2c29b15c9735328"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
index 43b4614f0..85a64000e 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
@@ -23,5 +23,4 @@ do_install:append() {
     install -m 0644 ${UNPACKDIR}/OFL.txt ${D}${datadir}/doc/ttf-inconsolata/
 }
 
-SRC_URI[md5sum] = "0fbe014c1f0fb5e3c71140ff0dc63edf"
 SRC_URI[sha256sum] = "1561e616c414a1b82d6e6dfbd18e5726fd65028913ade191e5fa38b6ec375a1a"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
index a0fb7b6a7..ab7308e73 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
@@ -13,7 +13,6 @@ SRC_URI = "https://releases.pagure.org/liberation-fonts/liberation-fonts-ttf-${P
            file://30-0-liberation-sans-narrow.conf \
 "
 
-SRC_URI[md5sum] = "134d8262145fc793c6af494dcace3e71"
 SRC_URI[sha256sum] = "61a7e2b6742a43c73e8762cdfeaf6dfcf9abdd2cfa0b099a9854d69bc4cfee5c"
 
 S = "${WORKDIR}/liberation-fonts-ttf-${PV}"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
index 6d7ba11e7..188064c37 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
@@ -18,5 +18,4 @@ FILES:ttf-liberation-mono  = "${datadir}/fonts/truetype/*Mono*"
 FILES:ttf-liberation-sans  = "${datadir}/fonts/truetype/*Sans*"
 FILES:ttf-liberation-serif = "${datadir}/fonts/truetype/*Serif*"
 
-SRC_URI[md5sum] = "77728078a17e39f7c242b42c3bf6feb8"
 SRC_URI[sha256sum] = "174cf27c57612971434ec8cc4a52bfd37bad8408e9b9219539c6d5113df6ff8f"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index a3babe90a..4adada04f 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -22,5 +22,4 @@ do_install() {
     install -m 0644 *.ttf ${D}${datadir}/fonts/ttf-mplus/
 }
 
-SRC_URI[md5sum] = "d1400184b51b3871e8d2fca6c50e18ae"
 SRC_URI[sha256sum] = "a20b9b9b03c2a6fb1e2137d29e8a6ce06406ba1e008906ea3c474dc048dc06a6"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
index fce76418f..3c3207c67 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
@@ -13,7 +13,6 @@ inherit allarch fontcache
 # and causes hash build failures
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/paratype-pt-sans-fonts/PTSans.zip/c3f5a0e20a75cf628387510a720924a7/PTSans.zip"
 
-SRC_URI[md5sum] = "c3f5a0e20a75cf628387510a720924a7"
 SRC_URI[sha256sum] = "0164f824e03c32c99e8a225853ec168893a04a09ade132e93a674e85ae033b2e"
 
 S = "${UNPACKDIR}"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
index 3752ec39b..25ce8e930 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
@@ -6,7 +6,6 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRC_URI = "https://github.com/google/roboto/releases/download/v${PV}/roboto-android.zip"
-SRC_URI[md5sum] = "3b43a5cb33196ec25e44d5fcb40219e1"
 SRC_URI[sha256sum] = "c825453253f590cfe62557733e7173f9a421fff103b00f57d33c4ad28ae53baf"
 
 S = "${WORKDIR}/sources"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index a4ad91fc7..76016c57b 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -29,5 +29,4 @@ do_install:append() {
     install -m 0644 ${S}/README ${D}${datadir}/doc/ttf-sazanami-mincho
 }
 
-SRC_URI[md5sum] = "ceef10579a75c92483171f3bd7f77df2"
 SRC_URI[sha256sum] = "3467ce2f70a9a3fbbf8d4d97355a2f334a6351baa6722251403637a8cbebf6b7"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
index 0c29a20cd..8512b1fd1 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
@@ -10,7 +10,6 @@ SHA1SUM = "0cef8205"
 SRC_URI = "https://assets.ubuntu.com/v1/${SHA1SUM}-ubuntu-font-family-${PV}.zip"
 
 
-SRC_URI[md5sum] = "c5a5059d6856b4ddf79d824dcaf5ad32"
 SRC_URI[sha256sum] = "61a2b342526fd552f19fef438bb9211a8212de19ad96e32a1209c039f1d68ecf"
 
 UPSTREAM_CHECK_URI = "https://repology.org/project/fonts:ubuntu/packages"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
index e2925b6c9..dc85617a9 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
@@ -6,7 +6,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf540fc7d35b5777e36051280b3a911c"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wqy/wqy-zenhei-${PV}.tar.gz"
-SRC_URI[md5sum] = "4c6c3f4e902dd5ee0a121e8c41d040bd"
 SRC_URI[sha256sum] = "e4b7e306475bf9427d1757578f0e4528930c84c44eaa3f167d4c42f110ee75d6"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/wqy/files/wqy-zenhei/"
diff --git a/meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb b/meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb
index 0c316edf9..5076b5a94 100644
--- a/meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb
+++ b/meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb
@@ -12,7 +12,6 @@ inherit features_check autotools
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://www.nongnu.org/xbindkeys/xbindkeys-${PV}.tar.gz"
-SRC_URI[md5sum] = "b5e1a9668ba13ff8673836d1d965d951"
 SRC_URI[sha256sum] = "a29b86a8ec91d4abc83b420e547da27470847d0efe808aa6e75147aa0adb82f2"
 
 EXTRA_OECONF = "--disable-guile"
diff --git a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb
index 9116b5f74..53e09fd86 100644
--- a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb
+++ b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb
@@ -7,7 +7,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f9a35333adf75edd1eaef84bca65a490"
 DEPENDS = "libxfont"
 
-SRC_URI[md5sum] = "2a455d3c02390597feb9cefb3fe97a45"
 SRC_URI[sha256sum] = "4b4df05fc53f1e98993638d6f7e178d95b31745c4568cee407e167491fd311a2"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
index 36f05b727..52d5892c1 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
@@ -16,5 +16,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "1347c3031b74c9e91dc4dfa53b12f143"
 SRC_URI[sha256sum] = "b2c08433eab5cb202470aa9f779efefce8d9cab2534f34f3aa4a31d05671c054"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
index 8b83ba378..7c43767d2 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
@@ -16,5 +16,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "66fb6de561648a6dce2755621d6aea17"
 SRC_URI[sha256sum] = "d16f5e3f227cc6dd07a160a71f443559682dbc35f1c056a5385085aaec4fada5"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
index 5d321acc6..fd8f16dca 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
@@ -16,5 +16,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "9f11ade089d689b9d59e0f47d26f39cd"
 SRC_URI[sha256sum] = "23c07162708e4b79eb33095c8bfa62c783717a9431254bbf44863734ea239481"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
index 557eeb17b..a1a6d43e0 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
@@ -16,5 +16,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "c8b73a53dcefe3e8d3907d3500e484a9"
 SRC_URI[sha256sum] = "62a83363c2536095fda49d260d21e0847675676e4e3415054064cbdffa641fbb"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
index b280a3260..def7357e3 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
@@ -16,5 +16,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "6b223a54b15ecbd5a1bc52312ad790d8"
 SRC_URI[sha256sum] = "ebe0d7444e3d7c8da7642055ac2206f0190ee060700d99cd876f8fc9964cb6ce"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
index ba4575bc2..787541d3b 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
@@ -13,5 +13,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "3e0069d4f178a399cffe56daa95c2b63"
 SRC_URI[sha256sum] = "17363eb35eece2e08144da5f060c70103b59d0972b4f4d77fd84c9a7a2dba635"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
index 852f93602..ed314ab3c 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
@@ -13,5 +13,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "c88eb44b3b903d79fb44b860a213e623"
 SRC_URI[sha256sum] = "b8e77940e4e1769dc47ef1805918d8c9be37c708735832a07204258bacc11794"
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 3f577bfa0..5cd3d3ce0 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -8,7 +8,6 @@ inherit features_check gpe
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "82f2f84cd96610e8f7b92c700cd31c14"
 SRC_URI[sha256sum] = "cd04c33418f776b1e13fcc7af3d6bd0c7cccd03fbabd7dbcd97f88166cc34210"
 
 SRC_URI:append = " \
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index a09f84381..d7181e7b5 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -14,7 +14,6 @@ SRC_URI = " \
     file://0002-fix-build-on-gcc6.patch \
     file://0003-fix-CVE-2015-7747.patch \
 "
-SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
 
 inherit autotools lib_package pkgconfig
diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 225bc8ecb..4b57957cf 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -18,7 +18,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
 SRC_URI:append:class-nativesdk = " \
            file://0001-install-netscsid-to-bin-for-nativesdk.patch \
 "
-SRC_URI[md5sum] = "efe08e2f3ca478486037b053acd512e9"
 SRC_URI[sha256sum] = "d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da"
 
 inherit cmake
diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
index 8562462cb..d986f90d7 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
@@ -9,7 +9,6 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch \
            "
 
-SRC_URI[md5sum] = "aa7629e8f73662a762f64c444b901055"
 SRC_URI[sha256sum] = "8550e9589dbd594bfac93b81ecf129b1dc9d0d51e90f9696f1b2f9b2af32712b"
 
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index 850918d31..82db2f159 100644
--- a/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -19,7 +19,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mad/files/libid3tag/"
 UPSTREAM_CHECK_REGEX = "/projects/mad/files/libid3tag/(?P<pver>.*)/$"
 
-SRC_URI[md5sum] = "e5808ad997ba32c498803822078748c3"
 SRC_URI[sha256sum] = "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151"
 
 S = "${WORKDIR}/libid3tag-${PV}"
diff --git a/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb b/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb
index 62c20c612..9fcb8a1dc 100644
--- a/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb
+++ b/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb
@@ -6,7 +6,6 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "d6b665b335a6360e000976e770da7691"
 SRC_URI[sha256sum] = "3c05e05aebcbfcc044d9e8c2d4646cd8359be39a3f0ba8ce4e72a9094bee704f"
 
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb b/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
index 151530ab8..6d941ae5d 100644
--- a/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
+++ b/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
@@ -12,7 +12,6 @@ UPSTREAM_CHECK_URI = "https://github.com/xiph/libopusenc/tags"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 
 SRC_URI = "https://ftp.osuosl.org/pub/xiph/releases/opus/libopusenc-${PV}.tar.gz"
-SRC_URI[md5sum] = "f038ea0f4168d184c76b42d293697c57"
 SRC_URI[sha256sum] = "8298db61a8d3d63e41c1a80705baa8ce9ff3f50452ea7ec1c19a564fe106cbb9"
 
 S = "${WORKDIR}/libopusenc-${PV}"
diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
index e0712ba93..d7a2820a7 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
@@ -8,7 +8,6 @@ DEPENDS = "alsa-lib texinfo"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "f69d7dd06d307e888f466fc27f4f680b"
 SRC_URI[sha256sum] = "ad9d64dfc8f83684876419ea7cd4ff4a41d8bcd8c23ef37ecb3a200a16b46d19"
 
 inherit autotools binconfig lib_package
diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
index 508519e4f..ed9f561a5 100644
--- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
@@ -12,5 +12,4 @@ inherit autotools gettext
 DEPENDS += "glib-2.0-native"
 
 SRC_URI = "https://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "d7387912cfd275282d1ec94483cb2f62"
 SRC_URI[sha256sum] = "cb518b20eef05ec2e82dda1fa89a292c1760dc023aba91b8aa69bafac85e8a14"
diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
index f900aca2d..f6d6bebc5 100644
--- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
+++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
@@ -16,5 +16,4 @@ REQUIRED_DISTRO_FEATURES = "x11"
 # Remove runtime dependency on empty package ${PN}
 RDEPENDS:${PN}-dev = ""
 
-SRC_URI[md5sum] = "1b0cb67b6f2bd7c4abef17648b062896"
 SRC_URI[sha256sum] = "a3b06f5188fd9effd0799ae31352b3cd65cb913b964e2c1a923ffa9d3c08abbe"
diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
index 32f7bae0d..437e346fd 100644
--- a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
+++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
@@ -11,7 +11,6 @@ inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "2a0d8d02228d4cbd28b6e07bb7c17cf5"
 SRC_URI[sha256sum] = "8b722b952b64841d996c70c3278499886c81bb5012991beed5f66f4158418f59"
 
 CVE_STATUS[CVE-2006-2658] = "cpe-incorrect: The recipe used in the `meta-openembedded` is a different xsp package compared to the one which has the CVE issue."
diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
index a6703ecf8..1f4b4bf73 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -81,7 +81,6 @@ SYSTEMD_PACKAGES = "${PN}-bin"
 SYSTEMD_SERVICE:${PN}-bin = "saslauthd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-SRC_URI[md5sum] = "a7f4e5e559a0e37b3ffc438c9456e425"
 SRC_URI[sha256sum] = "8fbc5136512b59bb793657f36fadda6359cae3b08f01fd16b3d406f1345b7bc3"
 
 PACKAGES =+ "${PN}-bin"
diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb b/meta-oe/recipes-support/anthy/anthy_9100h.bb
index ed87b3de4..e9f8464e0 100644
--- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
+++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
@@ -14,7 +14,6 @@ SRC_URI = "http://osdn.dl.sourceforge.jp/anthy/37536/anthy-9100h.tar.gz \
 SRC_URI:append:class-target = " file://target-helpers.patch"
 SRC_URI:append:class-native = " file://native-helpers.patch"
 
-SRC_URI[md5sum] = "1f558ff7ed296787b55bb1c6cf131108"
 SRC_URI[sha256sum] = "d256f075f018b4a3cb0d165ed6151fda4ba7db1621727e0eb54569b6e2275547"
 
 UPSTREAM_CHECK_URI = "https://osdn.net/projects/anthy/releases/"
diff --git a/meta-oe/recipes-support/atop/atop_2.4.0.bb b/meta-oe/recipes-support/atop/atop_2.4.0.bb
index df45eede2..2ff5a4d74 100644
--- a/meta-oe/recipes-support/atop/atop_2.4.0.bb
+++ b/meta-oe/recipes-support/atop/atop_2.4.0.bb
@@ -21,7 +21,6 @@ SRC_URI = "http://www.atoptool.nl/download/${BP}.tar.gz \
            file://sysvinit-implement-status.patch \
            file://0001-atop.daily-atop.init-atop-pm.sh-Avoid-using-bash.patch \
            "
-SRC_URI[md5sum] = "1077da884ed94f2bc3c81ac3ab970436"
 SRC_URI[sha256sum] = "be1c010a77086b7d98376fce96514afcd73c3f20a8d1fe01520899ff69a73d69"
 
 UPSTREAM_CHECK_URI = "https://atoptool.nl/downloadatop.php"
diff --git a/meta-oe/recipes-support/augeas/augeas_1.12.0.bb b/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
index 2c6d4cdc8..14e818253 100644
--- a/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
+++ b/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
@@ -9,7 +9,6 @@ SRC_URI = "http://download.augeas.net/${BP}.tar.gz \
            file://sepbuildfix.patch \
            file://0001-src-internal-Use-__GLIBC__-to-check-for-GNU-extentio.patch \
           "
-SRC_URI[md5sum] = "74f1c7b8550f4e728486091f6b907175"
 SRC_URI[sha256sum] = "321942c9cc32185e2e9cb72d0a70eea106635b50269075aca6714e3ec282cb87"
 
 DEPENDS = "readline libxml2"
diff --git a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
index bf62e8416..9d905cc22 100644
--- a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
@@ -17,7 +17,6 @@ SRC_URI = "https://launchpad.net/${BPN}/trunk/v${PV}/+download/${BPN}-${PV}.tar.
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/frame/trunk"
 
-SRC_URI[md5sum] = "02baa941091c5d198cd1623b3ad36e68"
 SRC_URI[sha256sum] = "cfb9ab52cdccd926f1822a457264d0014c7eb9f4600a72626063dd073b26256f"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index 139649b97..2ac535d25 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -27,7 +27,6 @@ SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.x
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/geis/trunk"
 
-SRC_URI[md5sum] = "2ff9d76a3ea5794516bb02c9d1924faf"
 SRC_URI[sha256sum] = "8a60f5683852094038904e690d23cc5a90a980fc52da67f0f28890baa25c70eb"
 
 EXTRA_OECONF = "--disable-integration-tests"
diff --git a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
index 067052c03..1a5900b78 100644
--- a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
@@ -16,7 +16,6 @@ SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.b
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/grail/trunk"
 
-SRC_URI[md5sum] = "0df1b3ec6167920f310e2effe6e2ad44"
 SRC_URI[sha256sum] = "5eed1f650f042481daa3a2de5e7d43261fe343b2a1b1e240f3b7fc26572c9df3"
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
diff --git a/meta-oe/recipes-support/ckermit/ckermit_302.bb b/meta-oe/recipes-support/ckermit/ckermit_302.bb
index e32aba93c..898a4eeb4 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_302.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_302.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=932ca542d6c6cb8a59a0bcd76ab67cc3"
 SRC_URI = "http://www.kermitproject.org/ftp/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV} \
            file://0001-Fix-function-prototype-errors.patch \
            "
-SRC_URI[md5sum] = "eac4dbf18b45775e4cdee5a7c74762b0"
 SRC_URI[sha256sum] = "0d5f2cd12bdab9401b4c836854ebbf241675051875557783c332a6a40dac0711"
 
 UPSTREAM_CHECK_URI = "https://www.kermitproject.org/ck90.html"
diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index 6561a4ae0..7f7739028 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -26,7 +26,6 @@ SRC_URI = "http://cr.yp.to/daemontools/${BPN}-${PV}.tar.gz \
     file://0001-Fix-signature-of-main-function.patch \
 "
 
-SRC_URI[md5sum] = "1871af2453d6e464034968a0fbcb2bfc"
 SRC_URI[sha256sum] = "a55535012b2be7a52dcd9eccabb9a198b13be50d0384143bd3b32b8710df4c1f"
 
 UPSTREAM_CHECK_URI = "http://cr.yp.to/daemontools/install.html"
diff --git a/meta-oe/recipes-support/dhex/dhex_0.69.bb b/meta-oe/recipes-support/dhex/dhex_0.69.bb
index 3cc870481..e0026f92d 100644
--- a/meta-oe/recipes-support/dhex/dhex_0.69.bb
+++ b/meta-oe/recipes-support/dhex/dhex_0.69.bb
@@ -8,7 +8,6 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://README.txt;beginline=229;endline=241;md5=6f252a421b65bcecf624382ba3c899da"
 
 SRC_URI = "http://www.dettus.net/dhex/dhex_0.69.tar.gz"
-SRC_URI[md5sum] = "64d557437fe110c19f23ed3e9bbcdd54"
 SRC_URI[sha256sum] = "52730bcd1cf16bd4dae0de42531be9a4057535ec61ca38c0804eb8246ea6c41b"
 
 S = "${WORKDIR}/dhex_${PV}"
diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index dd5489e7d..5ba93488a 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -13,7 +13,6 @@ SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz \
            file://0001-eject-Include-sys-sysmacros.h-for-major-minor.patch \
            "
 
-SRC_URI[md5sum] = "b96a6d4263122f1711db12701d79f738"
 SRC_URI[sha256sum] = "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e2ffe55"
 
 S = "${WORKDIR}/${BPN}"
diff --git a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
index 147a8069f..b4812d59d 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
@@ -8,7 +8,6 @@ SRC_URI = "http://downloads.sourceforge.net/espeak/espeak-1.48.04-source.zip \
            file://0002-tr_languages-cast-string_ordinal-init-values.patch \
            file://0001-Drop-using-register-keyword-for-storage-classifier.patch \
 "
-SRC_URI[md5sum] = "cadd7482eaafe9239546bdc09fa244c3"
 SRC_URI[sha256sum] = "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b207f0659"
 
 S = "${WORKDIR}/espeak-${PV}-source"
diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes-support/fbset/fbset_2.1.bb
index 690fee0df..e6f357fd4 100644
--- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
+++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
@@ -33,5 +33,4 @@ ALTERNATIVE_LINK_NAME[fbset] = "${sbindir}/fbset"
 ALTERNATIVE_TARGET[fbset] = "${sbindir}/fbset.real"
 ALTERNATIVE_PRIORITY[fbset] = "55"
 
-SRC_URI[md5sum] = "40ed9608f46d787bfb65fd1269f7f459"
 SRC_URI[sha256sum] = "517fa062d7b2d367f931a1c6ebb2bef84907077f0ce3f0c899e34490bbea9338"
diff --git a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
index 4d97b1a41..2057caff7 100644
--- a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
+++ b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ff95bfe019feaf92f524b73dd79e76eb"
 
 SRC_URI = "${GNU_MIRROR}/gengetopt/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "ea165d618640dbdecb42ae4491337965"
 SRC_URI[sha256sum] = "b941aec9011864978dd7fdeb052b1943535824169d2aa2b0e7eae9ab807584ac"
 
 inherit autotools texinfo
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
index 75feccb87..5930a8c95 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
@@ -15,7 +15,6 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
            file://init \
 "
 
-SRC_URI[md5sum] = "8b829339e1ae9df701684ec239021bb8"
 SRC_URI[sha256sum] = "618541584054093d53be8a2d9e81c97174f30f00af91cb8700a97e442d79ef5b"
 
 LIC_FILES_CHKSUM = "file://GPL-2;md5=eb723b61539feef013de476e68b5c50a"
diff --git a/meta-oe/recipes-support/joe/joe_4.6.bb b/meta-oe/recipes-support/joe/joe_4.6.bb
index ed0bf337b..510d8f849 100644
--- a/meta-oe/recipes-support/joe/joe_4.6.bb
+++ b/meta-oe/recipes-support/joe/joe_4.6.bb
@@ -11,5 +11,4 @@ PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,ncurses-termin
 
 inherit autotools-brokensep mime-xdg
 
-SRC_URI[md5sum] = "9017484e6116830d846678b625ea5c43"
 SRC_URI[sha256sum] = "495a0a61f26404070fe8a719d80406dc7f337623788e445b92a9f6de512ab9de"
diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb b/meta-oe/recipes-support/lcov/lcov_1.16.bb
index 4f35eff90..11440ce49 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.16.bb
@@ -47,7 +47,6 @@ RDEPENDS:${PN}:append:class-target = " \
     gcov-symlinks \
 "
 SRC_URI = "https://github.com/linux-test-project/lcov/releases/download/v${PV}/lcov-${PV}.tar.gz"
-SRC_URI[md5sum] = "bfee0cef50d7b7bd1df03bfadf68dcef"
 SRC_URI[sha256sum] = "987031ad5528c8a746d4b52b380bc1bffe412de1f2b9c2ba5224995668e3240b"
 
 UPSTREAM_CHECK_URI = "https://github.com/linux-test-project/lcov/releases"
diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
index 95c947958..b6165c4fc 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
@@ -14,7 +14,6 @@ SRC_URI = " \
     file://0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch \
     file://0001-remove-dropped-templates.patch \
 "
-SRC_URI[md5sum] = "34cb7e4430afaf6f447c4ebdb9b42072"
 SRC_URI[sha256sum] = "c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37004bf48c601afa72"
 
 EXTRA_OECONF = "\
diff --git a/meta-oe/recipes-support/libestr/libestr_0.1.11.bb b/meta-oe/recipes-support/libestr/libestr_0.1.11.bb
index 2ebf2757d..e8e786fa1 100644
--- a/meta-oe/recipes-support/libestr/libestr_0.1.11.bb
+++ b/meta-oe/recipes-support/libestr/libestr_0.1.11.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9d6c993486c18262afba4ca5bcb894d0"
 
 SRC_URI = "http://libestr.adiscon.com/files/download/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "1f25a2332750d4bfacfb314235fedff0"
 SRC_URI[sha256sum] = "46632b2785ff4a231dcf241eeb0dcb5fc0c7d4da8ee49cf5687722cdbe8b2024"
 
 UPSTREAM_CHECK_URI = "http://libestr.adiscon.com/download/"
diff --git a/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb b/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
index e639ce59d..3889b17a3 100644
--- a/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
+++ b/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
@@ -4,7 +4,6 @@ LICENSE = "GPL-2.0-only & MIT & AFL-2.1"
 LIC_FILES_CHKSUM = "file://MIT-LICENSE.txt;md5=e43aa437a6a1ba421653bd5034333bf9"
 
 SRC_URI = "http://kr.archive.ubuntu.com/ubuntu/pool/universe/s/sizzle/sizzle_1.10.18.orig.tar.gz"
-SRC_URI[md5sum] = "91477c1edeef9f8100ffd6c4d31725b5"
 SRC_URI[sha256sum] = "8e04ab84bb74b2e338dffc63cd2e52b007f1d8af01b3d25da4d2e07f2b5890f8"
 
 S = "${WORKDIR}/sizzle-${PV}"
diff --git a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
index d4b817087..3e3f9137c 100644
--- a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
+++ b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
@@ -12,7 +12,6 @@ DEPENDS = "curl openssl"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}.tar.gz \
            file://0001-Support-OpenSSL-1.1.0.patch \
            "
-SRC_URI[md5sum] = "689b46c2b3ab1a39735ac33f714c4f7f"
 SRC_URI[sha256sum] = "0df60157b052f0e774ade8a8bac59d6e8d4b464058cc55f9208d72e41156811f"
 
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
index 7ad88b740..ba3fbf242 100644
--- a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
+++ b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
@@ -7,7 +7,6 @@ SRC_URI = "http://ftp.lysator.liu.se/pub/liboop/liboop-${PV}.tar.gz \
            file://tcl_dev.patch \
 "
 
-SRC_URI[md5sum] = "f2b3dff17355fd9a6e2229caca8993f0"
 SRC_URI[sha256sum] = "56af16ad65e7397dadc8268e37ff6f67431db390c60c75e21a33e12b0e0d17e0"
 
 PACKAGECONFIG ?= ""
diff --git a/meta-oe/recipes-support/libraw1394/libraw1394_2.1.2.bb b/meta-oe/recipes-support/libraw1394/libraw1394_2.1.2.bb
index 15e1ee243..97eb105d4 100644
--- a/meta-oe/recipes-support/libraw1394/libraw1394_2.1.2.bb
+++ b/meta-oe/recipes-support/libraw1394/libraw1394_2.1.2.bb
@@ -5,7 +5,6 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 SRC_URI = "https://www.kernel.org/pub/linux/libs/ieee1394/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "45031ab15ca93e50c19886a38bc1814a"
 SRC_URI[sha256sum] = "ddc4e32721cdfe680d964aaede68ac606a20cd17dd2ba70e2d7e0692086ab57c"
 
 inherit autotools
diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 0dda756dd..4c397bdf9 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -11,7 +11,6 @@ SRC_URI = "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.tar.gz \
            file://0001-parser-yang-Define-_DEFAULT_SOURCE.patch \
           "
 
-SRC_URI[md5sum] = "4bf47483c06c9f07d1b10fbc74eddf11"
 SRC_URI[sha256sum] = "f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3"
 
 UPSTREAM_CHECK_URI = "https://repology.org/project/libsmi/information"
diff --git a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
index c7501ac68..9be560196 100644
--- a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
+++ b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
@@ -24,7 +24,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz \
 
 S = "${WORKDIR}/${BPN}"
 
-SRC_URI[md5sum] = "6ced95ab3a4b33fbfe2dfb231d156cdb"
 SRC_URI[sha256sum] = "50f24c857a7ef1cb092e6508758b86d06f1188508f897f3e6b40c573e8879109"
 
 inherit autotools-brokensep
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index 6fbdd071e..f2d3b6364 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -10,7 +10,6 @@ SECTION = "libs"
 SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.tar.gz \
            file://enforce-use-stl.patch \
            file://entity-encoding.patch"
-SRC_URI[md5sum] = "c1b864c96804a10526540c664ade67f0"
 SRC_URI[sha256sum] = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
 
 S = "${WORKDIR}/tinyxml"
diff --git a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
index 7d9b9d50f..a0bd40b03 100644
--- a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
+++ b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
@@ -8,7 +8,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Use-the-API-properly-in-the-example-format-security-.patch \
           "
 
-SRC_URI[md5sum] = "0d94919136e1d16b68427562e74cb3dd"
 SRC_URI[sha256sum] = "5991020192f52cc40fa852fbf6bbf5bd5db5d5d00aa9905c67f6f0eadeed48ea"
 
 PACKAGECONFIG ??= "expat"
diff --git a/meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb b/meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb
index d0e7e3920..01e7645ef 100644
--- a/meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb
+++ b/meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb
@@ -10,7 +10,6 @@ SRC_URI = " \
 
 UPSTREAM_CHECK_URI = "http://www.maier-komor.de/mbuffer.html"
 
-SRC_URI[md5sum] = "9937d7f666c19a2e6b2499b04dbecc44"
 SRC_URI[sha256sum] = "ab90b6fdce16db2bf08bcda0bc5d2bfb053a9a163d2a24f95fbf246460549b99"
 
 inherit autotools
diff --git a/meta-oe/recipes-support/minini/minini_1.2.b.bb b/meta-oe/recipes-support/minini/minini_1.2.b.bb
index 4a73f1212..582f18393 100644
--- a/meta-oe/recipes-support/minini/minini_1.2.b.bb
+++ b/meta-oe/recipes-support/minini/minini_1.2.b.bb
@@ -16,7 +16,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb21481ad45c5578ae8c8d37b8c8d76d"
 
 SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/minini/minIni_12b.zip;subdir=${BP}"
 
-SRC_URI[md5sum] = "32740621098e3f0a321c7c23f4bcbc5d"
 SRC_URI[sha256sum] = "b08839af74acb36061fb76e1123bf56711bc5cf7a08b32e189b0ad78a2e888e2"
 
 do_configure[noexec] = "1"
diff --git a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
index b503506a2..8b674db92 100644
--- a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
+++ b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b1e6a340187c1cf716513439d07c1d79"
 
 SRC_URI = "http://www.mcternan.me.uk/mscgen/software/${BPN}-src-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "65c90fb5150d7176b65b793f0faa7377"
 SRC_URI[sha256sum] = "3c3481ae0599e1c2d30b7ed54ab45249127533ab2f20e768a0ae58d8551ddc23"
 
 UPSTREAM_CHECK_URI = "https://www.mcternan.me.uk//mscgen/"
diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index bcff90c86..73cf9d077 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -21,7 +21,6 @@ SRC_URI = " \
     file://0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch \
 "
 
-SRC_URI[md5sum] = "a1da3358ab798f1cb9232f1dbababc21"
 SRC_URI[sha256sum] = "6cd3e2933d29eb1f875c838ee58b8071fd61f0ec8ed5922a86c01c805d181a68"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/opensc/files/openct/"
diff --git a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
index 1c5a18e86..2d87f1356 100644
--- a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
+++ b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
@@ -8,7 +8,6 @@ DEPENDS = "expat"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libwbxml/libwbxml-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f5031e9f730ffd9dc6a2d1ded585e1d1"
 SRC_URI[sha256sum] = "a057daa098f12838eb4e635bb28413027f1b73819872c3fbf64e3207790a3f7d"
 
 S = "${WORKDIR}/libwbxml-${PV}"
diff --git a/meta-oe/recipes-support/pidgin/libotr_4.1.1.bb b/meta-oe/recipes-support/pidgin/libotr_4.1.1.bb
index 115a6968e..b4f462de8 100644
--- a/meta-oe/recipes-support/pidgin/libotr_4.1.1.bb
+++ b/meta-oe/recipes-support/pidgin/libotr_4.1.1.bb
@@ -10,7 +10,6 @@ SRC_URI = "http://www.cypherpunks.ca/otr/${BP}.tar.gz \
            file://0001-tests-Include-missing-sys-socket.h-header.patch \
 "
 
-SRC_URI[md5sum] = "dac5a8778a35f674c046ddf5d97e4d81"
 SRC_URI[sha256sum] = "8b3b182424251067a952fb4e6c7b95a21e644fbb27fbd5f8af2b2ed87ca419f5"
 
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb
index 326c5bfc5..f4c9020de 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb
@@ -7,7 +7,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://otr.cypherpunks.ca/${BP}.tar.gz \
 "
-SRC_URI[md5sum] = "7ef14e1334a4bc80e5d530f9a3cfc626"
 SRC_URI[sha256sum] = "f4b59eef4a94b1d29dbe0c106dd00cdc630e47f18619fc754e5afbf5724ebac4"
 
 FILES:${PN} = "${libdir}/pidgin/*"
diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
index e96e11861..5fd927bc6 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
@@ -14,7 +14,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
            file://0001-Migrate-to-use-g_memdup2.patch \
 "
 
-SRC_URI[md5sum] = "0e742f021dc8c3f17435aea05c3e0314"
 SRC_URI[sha256sum] = "738b121b11f2b3f1744150c00cb381222eb6cf67161a7742797eb4f03e64a2ba"
 
 PACKAGECONFIG ??= "nss krb5"
diff --git a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
index 9cd27a2e6..3bd2f414d 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
+++ b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
@@ -10,7 +10,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/png-mng/${BPN}/${PV}/${BPN}-${PV}.tar.g
            file://0001-make-Respect-variables-from-environement.patch \
            "
 
-SRC_URI[md5sum] = "980bd6d9a3830fdce746d7fe3c9166ee"
 SRC_URI[sha256sum] = "77f0a039ac64df55fbd06af6f872fdbad4f639d009bbb5cd5cbe4db25690f35f"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/png-mng/files/pngcheck/"
diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index abb87f993..3623bd777 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -13,7 +13,6 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
     file://from-debian-to-modify-parameters.patch \
     file://from-debian-to-fix-man-file.patch \
     file://man-file-mailstat.1-from-debian.patch"
-SRC_URI[md5sum] = "1678ea99b973eb77eda4ecf6acae53f1"
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
 
 LICENSE = "GPL-2.0-only & Artistic-1.0"
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
index 09534c44f..bdbe6e73b 100644
--- a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
+++ b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
@@ -21,5 +21,4 @@ do_install() {
     install -m 0755 pxaregs ${D}${sbindir}/
 }
 
-SRC_URI[md5sum] = "a43baa88842cd5926dbffb6fb87624f6"
 SRC_URI[sha256sum] = "f339b91cd8ab348052c36b36d20033e4bffc3666bc836ff72d5704f025e1c057"
diff --git a/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
index 28da51a21..5ea0fb852 100644
--- a/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
+++ b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
@@ -12,7 +12,6 @@ SRC_URI = "http://polypux.org/projects/read-edid/read-edid-${PV}.tar.gz \
            file://0001-Do-not-install-license-file.patch \
            file://0001-get-edid-define-quiet-once.patch \
 	   "
-SRC_URI[md5sum] = "016546e438bf6c98739ff74061df9854"
 SRC_URI[sha256sum] = "c7c6d8440f5b90f98e276829271ccea5b2ff5a3413df8a0f87ec09f834af186f"
 
 EXTRA_OECMAKE = "-DCLASSICBUILD=OFF"
diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.12.bb b/meta-oe/recipes-support/sdparm/sdparm_1.12.bb
index a5f98e672..dcb264c50 100644
--- a/meta-oe/recipes-support/sdparm/sdparm_1.12.bb
+++ b/meta-oe/recipes-support/sdparm/sdparm_1.12.bb
@@ -17,7 +17,6 @@ UPSTREAM_CHECK_REGEX = "sdparm-(?P<pver>\d+(\.\d+)+)\.tgz"
 PACKAGES =+ "${PN}-scripts"
 RDEPENDS:${PN}-scripts += "bash ${PN}"
 
-SRC_URI[md5sum] = "2902fd29e6834fd62c16bb5d1ac53c7e"
 SRC_URI[sha256sum] = "e7f84247069da9a0c293963948d8aba8e5897a13e35e5476c8258acb7ca3a124"
 
 inherit autotools
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
index 7a506d034..3f87fb789 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -15,7 +15,6 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-configure.ac-Check-and-define-intmax_t-type.patch \
            file://0001-libopts.m4-accept-POSIX_SHELL-from-the-environment-d.patch \
            "
-SRC_URI[md5sum] = "32a51b23e25ad5e6af4b89f228be1800"
 SRC_URI[sha256sum] = "ee336e68549664e7a19b117adf02edfdeac6307f22e5ba78baca457116914637"
 
 EXTRA_OECONF = "POSIX_SHELL=${base_bindir}/sh"
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
index bf9de31f8..6a6c184e3 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
+++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
@@ -22,7 +22,6 @@ SRC_URI = "http://sourceforge.net/projects/irstessi/files/${BPN}.${PV}.tgz \
            file://0004-include-limits.h.patch \
            file://0001-Include-libgen.h.patch \
            "
-SRC_URI[md5sum] = "d06c9b426437a7697d77266e9835b520"
 SRC_URI[sha256sum] = "59daab29363d6e9f07c524029c4239653cfbbee6b0e57fd75df62499728dad8a"
 
 S ="${WORKDIR}/${BPN}.${PV}"
diff --git a/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb b/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
index db4c395c5..71578e71d 100644
--- a/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
+++ b/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
@@ -3,7 +3,6 @@ change the default keyboard of the system"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://fedorahosted.org/releases/s/y/${BPN}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "c267db0ee7a2131ba418399dc17f9e72"
 SRC_URI[sha256sum] = "218c883e4e2bfcc82bfe07e785707b5c2ece28df772f2155fd044b9bb1614284"
 
 inherit python3-dir gettext
diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
index ae00ff4e5..75f68ab5f 100644
--- a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -20,7 +20,6 @@ SRC_URI = "http://fallabs.com/tokyocabinet/${BP}.tar.gz \
            file://0001-configure-Fix-check-functions-for-AC_CHECK_LIB-test.patch \
 "
 
-SRC_URI[md5sum] = "fd03df6965f8f56dd5b8518ca43b4f5e"
 SRC_URI[sha256sum] = "a003f47c39a91e22d76bc4fe68b9b3de0f38851b160bbb1ca07a4f6441de1f90"
 
 DEPENDS = "bzip2 zlib"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
index 351fe44d7..2dfcd886c 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
@@ -7,7 +7,6 @@ inherit allarch
 DEPENDS += "tcl-native"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "e8fce7eb949cbe16c61fb71bade4cc17"
 SRC_URI[sha256sum] = "3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9"
 
 do_install() {
diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
index 76aea6f41..e672701ae 100644
--- a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
+++ b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
@@ -8,7 +8,6 @@ DEPENDS += "pixman-native xorgproto-native libxrandr-native"
 XORG_PN = "xorg-server"
 
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "8cf8bd1f33e3736bc8dd279b20a32399"
 SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
diff --git a/meta-oe/recipes-support/zile/zile_2.4.15.bb b/meta-oe/recipes-support/zile/zile_2.4.15.bb
index e86b3f82d..d7973ab86 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.15.bb
+++ b/meta-oe/recipes-support/zile/zile_2.4.15.bb
@@ -9,7 +9,6 @@ SRC_URI = "${GNU_MIRROR}/zile/${BP}.tar.gz \
            file://remove-help2man.patch \
 "
 
-SRC_URI[md5sum] = "05efa90dfee1821ca018b0b2ef8f50a8"
 SRC_URI[sha256sum] = "39c300a34f78c37ba67793cf74685935a15568e14237a3a66fda8fcf40e3035e"
 
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb b/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb
index be8112565..193bfc000 100644
--- a/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb
+++ b/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb
@@ -8,7 +8,6 @@ SRC_URI = " \
     http://dev-www.libreoffice.org/src/cppunit-${PV}.tar.gz \
     file://0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch \
 "
-SRC_URI[md5sum] = "9dc669e6145cadd9674873e24943e6dd"
 SRC_URI[sha256sum] = "89c5c6665337f56fd2db36bc3805a5619709d51fb136e51937072f63fcc717a7"
 
 inherit autotools
diff --git a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
index 252ef60de..b68f0edb3 100644
--- a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
+++ b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
@@ -10,7 +10,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2 \
            file://fixup-install-docdir.patch \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "b5f1a9f6093869c070c6e4a9450cc10c"
 SRC_URI[sha256sum] = "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/cunit/files/releases"
diff --git a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
index 8c8fb6098..4eb4e8ecb 100644
--- a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
+++ b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
@@ -5,7 +5,6 @@ LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "http://downloads.sourceforge.net/project/cxxtest/cxxtest/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "c3cc3355e2ac64e34c215f28e44cfcec"
 SRC_URI[sha256sum] = "1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b007dc7f4895cf7d8"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/p/cxxtest/activity/"
-- 
2.43.0


