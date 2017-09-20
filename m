Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id D963471A18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 17:43:43 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id w94so5296190ioi.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 10:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=K76/9m61wfSbDlHGL+FDztRUIqQ6/AD2tQJXReAX9VY=;
	b=c+ANvNoTwQ2dBPMTPUWOo6yNq+WJmLGYgEexY/K6Tk2daHPgOfufKnuZSxZBZq2bTs
	iyZ59c49ssW/pRIZnnnyzVzCIopaJYvq+LtApnnJHqUpcK0qTqAEXC3BmnJue0EvnmRc
	taLOkeuidMAQpayY7QT/On/sahGukxpsSRujINlGdQ/wiJwjd/AGL71DB1xDFdpbzERi
	ujqednCFawIzUdsnNJg15QWwLSoLdFIxPyOu2MkR3lPlWJebTD+nEQv+rLqmqmkiJGxO
	EdUNyIu8cakNQnCpN6MTm+pgDK4YaW1ASmKtDZCyQX2pUolZfFaoajcB3a8PfPN59ltC
	k9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=K76/9m61wfSbDlHGL+FDztRUIqQ6/AD2tQJXReAX9VY=;
	b=MBr/yQJVKOcEDbo6TZ3AO2tQf4CPGdsamX17uJTEwmAbE9n5paTtawlOnO34/+SNWc
	J8w/r/Ti5VkoVeRIrosmMDlF9CWKbMHQTO0rwueeIqZWntQio+goaHPLGtdLcSizi5X2
	jDO10epLap1LQLp//AVmCvcB95io9nixkIBX2PK/ga8JG1NDiRwVsIXJh/gNrfTnud1H
	5A0uhU/At2JxrBz85udMP+Ru8BAFfroiu9QUAkY9RK+p6OfoaEAFZ4Yn0rFqusePz9BW
	79EzOLCJGvJY9R7p5ZNnpzmjd2OU59PynmK83OyVyHfZw5708kbHfvz572oEEwedUecT
	s5wA==
X-Gm-Message-State: AHPjjUjDg8P8Jry4mxcpDIjkD58QqYBsnI2h9p51oE6xhYn7Sf+laWgM
	/StB+XsxoxOqe1ouWHq1iFU=
X-Google-Smtp-Source: AOwi7QCQPeriGDQie/N2j0XT4FjhuBF+nHpDSsy4pTCmGFlo1SzywlYbiMbfZ9+yyongRXX2GOoxLA==
X-Received: by 10.107.53.89 with SMTP id c86mr7250389ioa.34.1505929424633;
	Wed, 20 Sep 2017 10:43:44 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	f68sm1181153iod.40.2017.09.20.10.43.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 10:43:43 -0700 (PDT)
Date: Wed, 20 Sep 2017 13:43:37 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Message-ID: <20170920174336.GA19156@linux-uys3>
References: <CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
	<8d04fa9f-3049-45cf-4255-bd0159b84751@gmail.com>
	<87r2wcajh6.fsf@rkubodac-desk.ger.corp.intel.com>
	<CALbNGRS1ywFbSNAoY976cPgJ4STQLqUEqzwq34XGaMH_CYhAaw@mail.gmail.com>
	<20170816160609.GA29490@linux-uys3>
	<87tvzylpvy.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <87tvzylpvy.fsf@rkubodac-desk.ger.corp.intel.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Wed, 20 Sep 2017 17:43:44 -0000
X-Groupsio-MsgNum: 68953
Content-Type: multipart/mixed; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

When I compile chromium61 with pyro, I get a strange error. Every time the
python wrapper (gcc_link_wrapper.py) is called for a native compile (g++), I
get:

	[13241/30107] python "../../build/toolchain/gcc_link_wrapper.py" --output=
=3D"yocto_native/flatc" -- g++  -Wl,--fatal-warnings -Wl,--build-id=3Dsha1 =
-fPIC -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-ne=
eded -lpthread -Wl,--as-needed -fuse-ld=3Dgold -B -m64 -Wl,-O1 -Wl,--gc-sec=
tions -Wl,-rpath-link=3Dyocto_native -Wl,--disable-new-dtags -L/z/2.3-build=
-pyro/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.9=
1-r0/recipe-sysroot-native/usr/lib -L/z/2.3-build-pyro/crosswalk/build/tmp-=
glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-native=
/lib -Wl,-rpath-link,/z/2.3-build-pyro/crosswalk/build/tmp-glibc/work/core2=
-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-native/usr/lib -Wl,-rp=
ath-link,/z/2.3-build-pyro/crosswalk/build/tmp-glibc/work/core2-64-oe-linux=
/chromium/61.0.3163.91-r0/recipe-sysroot-native/lib -Wl,-rpath,/z/2.3-build=
-pyro/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.9=
1-r0/recipe-sysroot-native/usr/lib -Wl,-rpath,/z/2.3-build-pyro/crosswalk/b=
uild/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysro=
ot-native/lib -Wl,-O1 -o "yocto_native/flatc" -Wl,--start-group @"yocto_nat=
ive/flatc.rsp"  -Wl,--end-group   -ldl -lpthread -lrt=20
	FAILED: yocto_native/flatc
	python "../../build/toolchain/gcc_link_wrapper.py" --output=3D"yocto_nativ=
e/flatc" -- g++  -Wl,--fatal-warnings -Wl,--build-id=3Dsha1 -fPIC -Wl,-z,no=
execstack -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-needed -lpthread =
-Wl,--as-needed -fuse-ld=3Dgold -B -m64 -Wl,-O1 -Wl,--gc-sections -Wl,-rpat=
h-link=3Dyocto_native -Wl,--disable-new-dtags -L/z/2.3-build-pyro/crosswalk=
/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sys=
root-native/usr/lib -L/z/2.3-build-pyro/crosswalk/build/tmp-glibc/work/core=
2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-native/lib -Wl,-rpath=
-link,/z/2.3-build-pyro/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/ch=
romium/61.0.3163.91-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link,/z/2.3=
-build-pyro/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.=
3163.91-r0/recipe-sysroot-native/lib -Wl,-rpath,/z/2.3-build-pyro/crosswalk=
/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sys=
root-native/usr/lib -Wl,-rpath,/z/2.3-build-pyro/crosswalk/build/tmp-glibc/=
work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-native/lib -=
Wl,-O1 -o "yocto_native/flatc" -Wl,--start-group @"yocto_native/flatc.rsp" =
 -Wl,--end-group   -ldl -lpthread -lrt=20
	collect2: fatal error: cannot find 'ld'
	compilation terminated.

This happens with both qemux86-64 and raspberrypi3. Unfortunately those log
files are 18M and 19M each, so I won't be attaching them. Why can't my build
find 'ld'? That seems quite strange. Probably some kind of ld vs gold issue?
I'm not using gold anywhere and have not enabled it, are you using gold?


Compiling chromium61 with master gives a long error in breakpad. That log f=
ile
is 73K so I've attached it (log.do_compile__qemux86-64__chromium61_master_b=
reakpad).
It appears to be a problem with the code itself. Here is the start:

	[84/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 =
-mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2=
-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/breakpad/=
client/ucontext_reader.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=
=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DU=
SE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_B=
ROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=3D64=
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND -DDYNAMIC_A=
NNOTATIONS_ENABLED=3D0 -I../../breakpad -I../../breakpad/src -I../../breakp=
ad/src/client -I../../breakpad/src/third_party/linux/include -I../.. -Igen =
-I../../breakpad/src -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fs=
tack-protector -funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -O=
2 -fno-ident -fdata-sections -ffunction-sections -fomit-frame-pointer -g0 -=
fvisibility=3Dhidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized -W=
no-missing-field-initializers -Wno-unused-parameter -std=3Dgnu++11 -fno-rtt=
i -fno-exceptions -fvisibility-inlines-hidden -Wno-narrowing  -O2 -pipe -fe=
liminate-unused-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk/buil=
d/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src/debu=
g/chromium/61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/build=
/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-n=
ative=3D -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/co=
re2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../../bre=
akpad/src/client/linux/dump_writer_common/ucontext_reader.cc -o obj/breakpa=
d/client/ucontext_reader.o
	FAILED: obj/breakpad/client/ucontext_reader.o=20
	x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3D=
sse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linu=
x/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/breakpad/client/ucon=
text_reader.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=3D1 -DUSE_P=
ANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DUSE_X11=3D1 -=
DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_L=
OCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=3D64 -D_LARGEFIL=
E_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_E=
NABLED=3D0 -I../../breakpad -I../../breakpad/src -I../../breakpad/src/clien=
t -I../../breakpad/src/third_party/linux/include -I../.. -Igen -I../../brea=
kpad/src -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fstack-protect=
or -funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -O2 -fno-ident=
 -fdata-sections -ffunction-sections -fomit-frame-pointer -g0 -fvisibility=
=3Dhidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-missing-=
field-initializers -Wno-unused-parameter -std=3Dgnu++11 -fno-rtti -fno-exce=
ptions -fvisibility-inlines-hidden -Wno-narrowing  -O2 -pipe -feliminate-un=
used-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc=
/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src/debug/chromium/=
61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/=
work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-native=3D -f=
debug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-l=
inux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../../breakpad/src/c=
lient/linux/dump_writer_common/ucontext_reader.cc -o obj/breakpad/client/uc=
ontext_reader.o
	../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc: In =
static member function 'static uintptr_t google_breakpad::UContextReader::G=
etStackPointer(const google_breakpad::ucontext*)':
	../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc:92:1=
2: error: invalid use of incomplete type 'const struct google_breakpad::uco=
ntext'

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="log.do_compile__qemux86-64__chromium61_master_breakpad"
Content-Transfer-Encoding: quoted-printable

DEBUG: Executing shell function do_compile
[1/29715] touch obj/build/config/exe_and_shlib_deps.stamp
[2/29715] touch obj/build/config/linux/gtk3/gtk3.stamp
[3/29715] touch obj/build/config/linux/gtk3/gtkprint3.stamp
[4/29715] touch obj/build/util/webkit_version.inputdeps.stamp
[5/29715] touch obj/build/config/freetype/freetype.stamp
[6/29715] touch obj/build/win/default_exe_manifest.stamp
[7/29715] ln -f ../../third_party/xdg-utils/scripts/xdg-settings xdg-settin=
gs 2>/dev/null || (rm -rf xdg-settings && cp -af ../../third_party/xdg-util=
s/scripts/xdg-settings xdg-settings)
[8/29715] touch obj/chrome/common/ini_parser.inputdeps.stamp
[9/29715] ln -f ../../third_party/xdg-utils/scripts/xdg-mime xdg-mime 2>/de=
v/null || (rm -rf xdg-mime && cp -af ../../third_party/xdg-utils/scripts/xd=
g-mime xdg-mime)
[10/29715] touch obj/chrome/manpage.inputdeps.stamp
[11/29715] touch obj/chrome/browser/search/local_ntp_code_generate.inputdep=
s.stamp
[12/29715] ln -f ../../chrome/tools/build/linux/chrome-wrapper chrome-wrapp=
er 2>/dev/null || (rm -rf chrome-wrapper && cp -af ../../chrome/tools/build=
/linux/chrome-wrapper chrome-wrapper)
[13/29715] ln -f ../../chrome/app/theme/chromium/product_logo_48.png produc=
t_logo_48.png 2>/dev/null || (rm -rf product_logo_48.png && cp -af ../../ch=
rome/app/theme/chromium/product_logo_48.png product_logo_48.png)
[14/29715] touch obj/chrome/xdg_mime.stamp
[15/29715] python ../../tools/generate_library_loader/generate_library_load=
er.py --name LibGioLoader --output-h gen/library_loaders/libgio.h --output-=
cc gen/library_loaders/libgio_loader.cc --header \<gio/gio.h\> --link-direc=
tly=3D0 glib_check_version g_type_init g_settings_new g_settings_get_child =
g_settings_get_string g_settings_get_boolean g_settings_get_int g_settings_=
get_strv g_settings_list_schemas
[16/29715] python ../../tools/generate_library_loader/generate_library_load=
er.py --name LibUdev0Loader --output-h gen/library_loaders/libudev0.h --out=
put-cc gen/library_loaders/libudev0_loader.cc --header \"third_party/libude=
v/libudev0.h\" --link-directly=3D0 udev_device_get_action udev_device_get_d=
evnode udev_device_get_parent udev_device_get_parent_with_subsystem_devtype=
 udev_device_get_property_value udev_device_get_subsystem udev_device_get_s=
ysattr_value udev_device_get_sysname udev_device_get_syspath udev_device_ne=
w_from_devnum udev_device_new_from_subsystem_sysname udev_device_new_from_s=
yspath udev_device_unref udev_enumerate_add_match_subsystem udev_enumerate_=
get_list_entry udev_enumerate_new udev_enumerate_scan_devices udev_enumerat=
e_unref udev_list_entry_get_next udev_list_entry_get_name udev_monitor_enab=
le_receiving udev_monitor_filter_add_match_subsystem_devtype udev_monitor_g=
et_fd udev_monitor_new_from_netlink udev_monitor_receive_device udev_monito=
r_unref udev_new udev_set_log_fn udev_set_log_priority udev_unref
[17/29715] python ../../tools/generate_library_loader/generate_library_load=
er.py --name LibUdev1Loader --output-h gen/library_loaders/libudev1.h --out=
put-cc gen/library_loaders/libudev1_loader.cc --header \"third_party/libude=
v/libudev1.h\" --link-directly=3D0 udev_device_get_action udev_device_get_d=
evnode udev_device_get_parent udev_device_get_parent_with_subsystem_devtype=
 udev_device_get_property_value udev_device_get_subsystem udev_device_get_s=
ysattr_value udev_device_get_sysname udev_device_get_syspath udev_device_ne=
w_from_devnum udev_device_new_from_subsystem_sysname udev_device_new_from_s=
yspath udev_device_unref udev_enumerate_add_match_subsystem udev_enumerate_=
get_list_entry udev_enumerate_new udev_enumerate_scan_devices udev_enumerat=
e_unref udev_list_entry_get_next udev_list_entry_get_name udev_monitor_enab=
le_receiving udev_monitor_filter_add_match_subsystem_devtype udev_monitor_g=
et_fd udev_monitor_new_from_netlink udev_monitor_receive_device udev_monito=
r_unref udev_new udev_set_log_fn udev_set_log_priority udev_unref
[18/29715] touch obj/build/linux/libudev/udev1_loader_loader.stamp
[19/29715] touch obj/build/linux/libgio/libgio_loader.stamp
[20/29715] touch obj/build/linux/libudev/udev0_loader_loader.stamp
[21/29715] touch obj/chrome/app/chrome_content_utility_manifest_overlay.inp=
utdeps.stamp
[22/29715] touch obj/chrome/app/chrome_content_gpu_manifest_overlay.inputde=
ps.stamp
[23/29715] touch obj/chrome/app/chrome_content_plugin_manifest_overlay.inpu=
tdeps.stamp
[24/29715] touch obj/chrome/app/chrome_content_renderer_manifest_overlay.in=
putdeps.stamp
[25/29715] touch obj/chrome/app/chrome_dll_resources.stamp
[26/29715] touch obj/chrome/app/chrome_manifest.inputdeps.stamp
[27/29715] python ../../chrome/tools/build/linux/sed.py ../../chrome/app/re=
sources/manpage.1.in chrome.1 -e\ s/@@NAME@@/Chromium/ -e\ s/@@FILENAME@@/c=
hromium-browser/ -e\ s/@@CONFDIR@@/chromium/
[28/29715] touch obj/chrome/app/chrome_manifest__is_service_manifest.stamp
[29/29715] touch obj/chrome/app/shutdown_signal_handlers.inputdeps.stamp
[30/29715] touch obj/chrome/app/command_ids.stamp
[31/29715] touch obj/chrome/app/vector_icons/chrome_vector_icons.inputdeps.=
stamp
[32/29715] touch obj/chrome/manpage.stamp
[33/29715] touch obj/components/crash/core/common/crash_keys.inputdeps.stam=
p
[34/29715] touch obj/components/safe_browsing_db/v4_rice.inputdeps.stamp
[35/29715] touch obj/components/handoff/handoff.stamp
[36/29715] touch obj/chrome/browser/profiling_host/profiling_host.stamp
[37/29715] touch obj/chrome/common/version_header_action.inputdeps.stamp
[38/29715] python ../../build/util/version.py --official -f ../../build/uti=
l/LASTCHANGE -f ../../chrome/VERSION -f ../../chrome/app/theme/chromium/BRA=
NDING -o gen/chrome/common/chrome_version.h ../../chrome/common/chrome_vers=
ion.h.in
[39/29715] touch obj/chrome/browser/chrome_internal_resources_gen.stamp
[40/29715] touch obj/chrome/common/version_header_action.stamp
[41/29715] touch obj/chrome/browser/theme_properties.stamp
[42/29715] touch obj/chrome/browser/resources/md_downloads/vulcanize.inputd=
eps.stamp
[43/29715] python ../../build/util/version.py -e LASTCHANGE=3DLASTCHANGE\[:=
LASTCHANGE.find\(\'-\'\)\] -f ../../build/util/LASTCHANGE ../../build/util/=
webkit_version.h.in gen/build/util/webkit_version.h
[44/29715] touch obj/build/util/webkit_version.stamp
[45/29715] touch obj/chrome/browser/resources/md_history/vulcanize_app.inpu=
tdeps.stamp
[46/29715] touch obj/chrome/browser/resources/md_history/vulcanize_lazy_loa=
d.inputdeps.stamp
[47/29715] python ../../services/service_manager/public/tools/manifest/mani=
fest_collator.py --parent=3D../../chrome/browser/chrome_content_gpu_manifes=
t_overlay.json --output=3Dgen/chrome/app/chrome_content_gpu_manifest_overla=
y.json
[48/29715] touch obj/chrome/app/chrome_content_gpu_manifest_overlay.stamp
[49/29715] python ../../services/service_manager/public/tools/manifest/mani=
fest_collator.py --parent=3D../../chrome/app/chrome_manifest.json --output=
=3Dgen/chrome/app/chrome_manifest.json
[50/29715] python ../../services/service_manager/public/tools/manifest/mani=
fest_collator.py --parent=3D../../chrome/browser/chrome_content_renderer_ma=
nifest_overlay.json --output=3Dgen/chrome/app/chrome_content_renderer_manif=
est_overlay.json
[51/29715] python ../../services/service_manager/public/tools/manifest/mani=
fest_collator.py --parent=3D../../chrome/browser/chrome_content_plugin_mani=
fest_overlay.json --output=3Dgen/chrome/app/chrome_content_plugin_manifest_=
overlay.json
[52/29715] touch obj/chrome/app/chrome_manifest.stamp
[53/29715] touch obj/chrome/app/chrome_content_renderer_manifest_overlay.st=
amp
[54/29715] touch obj/chrome/app/chrome_content_plugin_manifest_overlay.stam=
p
[55/29715] touch obj/chrome/browser/resources/md_bookmarks/vulcanize.inputd=
eps.stamp
[56/29715] touch obj/extensions/browser/api/api_registration_bundle_generat=
or_registration.inputdeps.stamp
[57/29715] python ../../services/service_manager/public/tools/manifest/mani=
fest_collator.py --parent=3D../../chrome/browser/chrome_content_utility_man=
ifest_overlay.json --output=3Dgen/chrome/app/chrome_content_utility_manifes=
t_overlay.json
[58/29715] touch obj/chrome/app/chrome_content_utility_manifest_overlay.sta=
mp
[59/29715] touch obj/components/client_update_protocol/client_update_protoc=
ol.inputdeps.stamp
[60/29715] python ../../chrome/browser/search/tools/generate_integrity_head=
er.py ../../chrome/browser/resources/local_ntp/local_ntp.js gen/chrome/brow=
ser/search/local_ntp_js_integrity.h
[61/29715] touch obj/chrome/browser/search/local_ntp_code_generate.stamp
[62/29715] touch obj/chrome/browser/search/generated.stamp
[63/29715] touch obj/chrome/common/non_code_constants.inputdeps.stamp
[64/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/build/linu=
x/libgio/libgio/libgio_loader.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUS=
E_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=
=3D1 -DUSE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD =
-DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_B=
ITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTANT_MACROS=
 -D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=3D2 -DNDEBUG -DNVALGRIND -DDYNAMI=
C_ANNOTATIONS_ENABLED=3D0 -DUSE_GIO -DGLIB_DISABLE_DEPRECATION_WARNINGS -I.=
./.. -Igen -I/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/c=
hromium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0 -I/z/chromium/c=
rosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/re=
cipe-sysroot/usr/lib/glib-2.0/include -fno-strict-aliasing --param=3Dssp-bu=
ffer-size=3D4 -fstack-protector -funwind-tables -fPIC -pipe -pthread -m64 -=
march=3Dx86-64 -Wall -Wno-unused-local-typedefs -Wno-maybe-uninitialized -W=
no-missing-field-initializers -Wno-unused-parameter -O2 -fno-ident -fdata-s=
ections -ffunction-sections -fomit-frame-pointer -g0 -fvisibility=3Dhidden =
-std=3Dgnu++11 -Wno-narrowing -fno-rtti -fno-exceptions -fvisibility-inline=
s-hidden  -O2 -pipe -feliminate-unused-debug-types -fdebug-prefix-map=3D/z/=
chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.316=
3.91-r0=3D/usr/src/debug/chromium/61.0.3163.91-r0 -fdebug-prefix-map=3D/z/c=
hromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163=
.91-r0/recipe-sysroot-native=3D -fdebug-prefix-map=3D/z/chromium/crosswalk/=
build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysr=
oot=3D -g1 -c gen/library_loaders/libgio_loader.cc -o obj/build/linux/libgi=
o/libgio/libgio_loader.o
[65/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/build/linu=
x/libudev/udev1_loader/libudev1_loader.o.d -DV8_DEPRECATION_WARNINGS -DUSE_=
UDEV -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NS=
S_CERTS=3D1 -DUSE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSI=
NG_CSD -DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_O=
FFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTANT=
_MACROS -D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=3D2 -DNDEBUG -DNVALGRIND -=
DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../.. -Igen -fno-strict-aliasing --param=
=3Dssp-buffer-size=3D4 -fstack-protector -funwind-tables -fPIC -pipe -pthre=
ad -m64 -march=3Dx86-64 -Wall -Wno-unused-local-typedefs -Wno-maybe-uniniti=
alized -Wno-missing-field-initializers -Wno-unused-parameter -O2 -fno-ident=
 -fdata-sections -ffunction-sections -fomit-frame-pointer -g0 -fvisibility=
=3Dhidden -std=3Dgnu++11 -Wno-narrowing -fno-rtti -fno-exceptions -fvisibil=
ity-inlines-hidden  -O2 -pipe -feliminate-unused-debug-types -fdebug-prefix=
-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromiu=
m/61.0.3163.91-r0=3D/usr/src/debug/chromium/61.0.3163.91-r0 -fdebug-prefix-=
map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium=
/61.0.3163.91-r0/recipe-sysroot-native=3D -fdebug-prefix-map=3D/z/chromium/=
crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/r=
ecipe-sysroot=3D -g1 -c gen/library_loaders/libudev1_loader.cc -o obj/build=
/linux/libudev/udev1_loader/libudev1_loader.o
[66/29715] touch obj/build/linux/libgio/libgio.stamp
[67/29715] touch obj/build/linux/libudev/udev1_loader.stamp
[68/29715] touch obj/chrome/common/version_header.stamp
[69/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/build/linu=
x/libudev/udev0_loader/libudev0_loader.o.d -DV8_DEPRECATION_WARNINGS -DUSE_=
UDEV -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NS=
S_CERTS=3D1 -DUSE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSI=
NG_CSD -DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_O=
FFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTANT=
_MACROS -D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=3D2 -DNDEBUG -DNVALGRIND -=
DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../.. -Igen -fno-strict-aliasing --param=
=3Dssp-buffer-size=3D4 -fstack-protector -funwind-tables -fPIC -pipe -pthre=
ad -m64 -march=3Dx86-64 -Wall -Wno-unused-local-typedefs -Wno-maybe-uniniti=
alized -Wno-missing-field-initializers -Wno-unused-parameter -O2 -fno-ident=
 -fdata-sections -ffunction-sections -fomit-frame-pointer -g0 -fvisibility=
=3Dhidden -std=3Dgnu++11 -Wno-narrowing -fno-rtti -fno-exceptions -fvisibil=
ity-inlines-hidden  -O2 -pipe -feliminate-unused-debug-types -fdebug-prefix=
-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromiu=
m/61.0.3163.91-r0=3D/usr/src/debug/chromium/61.0.3163.91-r0 -fdebug-prefix-=
map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium=
/61.0.3163.91-r0/recipe-sysroot-native=3D -fdebug-prefix-map=3D/z/chromium/=
crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/r=
ecipe-sysroot=3D -g1 -c gen/library_loaders/libudev0_loader.cc -o obj/build=
/linux/libudev/udev0_loader/libudev0_loader.o
[70/29715] touch obj/chrome/browser/ui/webui/omnibox/mojo_bindings__type_ma=
ppings.inputdeps.stamp
[71/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/chrome/com=
mon/non_code_constants/env_vars.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -D=
USE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=
=3D1 -DUSE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD =
-DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_B=
ITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTANT_MACROS=
 -D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=3D2 -DNDEBUG -DNVALGRIND -DDYNAMI=
C_ANNOTATIONS_ENABLED=3D0 -DGLIB_VERSION_MAX_ALLOWED=3DGLIB_VERSION_2_32 -D=
GLIB_VERSION_MIN_REQUIRED=3DGLIB_VERSION_2_26 -I../.. -Igen -I/z/chromium/c=
rosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/re=
cipe-sysroot/usr/include/glib-2.0 -I/z/chromium/crosswalk/build/tmp-glibc/w=
ork/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/lib/glib-=
2.0/include -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fstack-prot=
ector -funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -Wall -Wno-=
unused-local-typedefs -Wno-maybe-uninitialized -Wno-missing-field-initializ=
ers -Wno-unused-parameter -O2 -fno-ident -fdata-sections -ffunction-section=
s -fomit-frame-pointer -g0 -fvisibility=3Dhidden -std=3Dgnu++11 -Wno-narrow=
ing -fno-rtti -fno-exceptions -fvisibility-inlines-hidden  -O2 -pipe -felim=
inate-unused-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk/build/t=
mp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src/debug/c=
hromium/61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tm=
p-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-nati=
ve=3D -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2=
-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../../chrome=
/common/env_vars.cc -o obj/chrome/common/non_code_constants/env_vars.o
[72/29715] touch obj/build/linux/libudev/udev0_loader.stamp
[73/29715] python "../../build/toolchain/gcc_ar_wrapper.py"  --output=3Dobj=
/base/third_party/libevent/libevent.a --ar=3D"x86_64-oe-linux-ar"  rcsD @"o=
bj/base/third_party/libevent/libevent.a.rsp"
[74/29715] python ../../mojo/public/tools/bindings/generate_type_mappings.p=
y --output gen/chrome/browser/ui/webui/omnibox/mojo_bindings__type_mappings
[75/29715] touch obj/build/linux/libudev/libudev.stamp
[76/29715] touch obj/chrome/browser/ui/webui/omnibox/mojo_bindings__type_ma=
ppings.stamp
[77/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/chrome/com=
mon/non_code_constants/chrome_constants.o.d -DV8_DEPRECATION_WARNINGS -DUSE=
_UDEV -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_N=
SS_CERTS=3D1 -DUSE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWS=
ING_CSD -DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_=
OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTAN=
T_MACROS -D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=3D2 -DNDEBUG -DNVALGRIND =
-DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -DGLIB_VERSION_MAX_ALLOWED=3DGLIB_VERSION=
_2_32 -DGLIB_VERSION_MIN_REQUIRED=3DGLIB_VERSION_2_26 -I../.. -Igen -I/z/ch=
romium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.=
91-r0/recipe-sysroot/usr/include/glib-2.0 -I/z/chromium/crosswalk/build/tmp=
-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/l=
ib/glib-2.0/include -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fst=
ack-protector -funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -Wa=
ll -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-missing-field-i=
nitializers -Wno-unused-parameter -O2 -fno-ident -fdata-sections -ffunction=
-sections -fomit-frame-pointer -g0 -fvisibility=3Dhidden -std=3Dgnu++11 -Wn=
o-narrowing -fno-rtti -fno-exceptions -fvisibility-inlines-hidden  -O2 -pip=
e -feliminate-unused-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk=
/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src=
/debug/chromium/61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/=
build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysr=
oot-native=3D -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/wo=
rk/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../.=
./chrome/common/chrome_constants.cc -o obj/chrome/common/non_code_constants=
/chrome_constants.o
[78/29715] touch obj/chrome/common/extensions/api/api_schema_generator.inpu=
tdeps.stamp
[79/29715] touch obj/chrome/common/extensions/api/api_registration_bundle_g=
enerator_registration.inputdeps.stamp
[80/29715] python ../../build/write_buildflag_header.py --output extensions=
/features/features.h --rulename //extensions/features:features --gen-dir ge=
n --definitions __extensions_features_features___build_toolchain_yocto_yoct=
o_target__rule.rsp
[81/29715] python ../../build/write_buildflag_header.py --output chrome/com=
mon/features.h --rulename //chrome/common:features --gen-dir gen --definiti=
ons __chrome_common_features___build_toolchain_yocto_yocto_target__rule.rsp
[82/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/components=
/signin/core/browser/account_info/account_info.o.d -DV8_DEPRECATION_WARNING=
S -DUSE_UDEV -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 =
-DUSE_NSS_CERTS=3D1 -DUSE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAF=
E_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -=
D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_=
CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=3D2 -DNDEBUG -DNVA=
LGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../.. -Igen -fno-strict-aliasing=
 --param=3Dssp-buffer-size=3D4 -fstack-protector -funwind-tables -fPIC -pip=
e -pthread -m64 -march=3Dx86-64 -Wall -Wno-unused-local-typedefs -Wno-maybe=
-uninitialized -Wno-missing-field-initializers -Wno-unused-parameter -O2 -f=
no-ident -fdata-sections -ffunction-sections -fomit-frame-pointer -g0 -fvis=
ibility=3Dhidden -std=3Dgnu++11 -Wno-narrowing -fno-rtti -fno-exceptions -f=
visibility-inlines-hidden  -O2 -pipe -feliminate-unused-debug-types -fdebug=
-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/=
chromium/61.0.3163.91-r0=3D/usr/src/debug/chromium/61.0.3163.91-r0 -fdebug-=
prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/c=
hromium/61.0.3163.91-r0/recipe-sysroot-native=3D -fdebug-prefix-map=3D/z/ch=
romium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.=
91-r0/recipe-sysroot=3D -g1 -c ../../components/signin/core/browser/account=
_info.cc -o obj/components/signin/core/browser/account_info/account_info.o
[83/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/components=
/crash/core/common/crash_keys/crash_keys.o.d -DV8_DEPRECATION_WARNINGS -DUS=
E_UDEV -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_=
NSS_CERTS=3D1 -DUSE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROW=
SING_CSD -DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE=
_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTA=
NT_MACROS -D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=3D2 -DNDEBUG -DNVALGRIND=
 -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -DGLIB_VERSION_MAX_ALLOWED=3DGLIB_VERSIO=
N_2_32 -DGLIB_VERSION_MIN_REQUIRED=3DGLIB_VERSION_2_26 -I../.. -Igen -I/z/c=
hromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163=
.91-r0/recipe-sysroot/usr/include/glib-2.0 -I/z/chromium/crosswalk/build/tm=
p-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/=
lib/glib-2.0/include -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fs=
tack-protector -funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -W=
all -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-missing-field-=
initializers -Wno-unused-parameter -O2 -fno-ident -fdata-sections -ffunctio=
n-sections -fomit-frame-pointer -g0 -fvisibility=3Dhidden -std=3Dgnu++11 -W=
no-narrowing -fno-rtti -fno-exceptions -fvisibility-inlines-hidden  -O2 -pi=
pe -feliminate-unused-debug-types -fdebug-prefix-map=3D/z/chromium/crosswal=
k/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/sr=
c/debug/chromium/61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk=
/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sys=
root-native=3D -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/w=
ork/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../=
../components/crash/core/common/crash_keys.cc -o obj/components/crash/core/=
common/crash_keys/crash_keys.o
[84/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/breakpad/c=
lient/ucontext_reader.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=
=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DU=
SE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_B=
ROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=3D64=
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND -DDYNAMIC_A=
NNOTATIONS_ENABLED=3D0 -I../../breakpad -I../../breakpad/src -I../../breakp=
ad/src/client -I../../breakpad/src/third_party/linux/include -I../.. -Igen =
-I../../breakpad/src -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fs=
tack-protector -funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -O=
2 -fno-ident -fdata-sections -ffunction-sections -fomit-frame-pointer -g0 -=
fvisibility=3Dhidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized -W=
no-missing-field-initializers -Wno-unused-parameter -std=3Dgnu++11 -fno-rtt=
i -fno-exceptions -fvisibility-inlines-hidden -Wno-narrowing  -O2 -pipe -fe=
liminate-unused-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk/buil=
d/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src/debu=
g/chromium/61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/build=
/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-n=
ative=3D -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/co=
re2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../../bre=
akpad/src/client/linux/dump_writer_common/ucontext_reader.cc -o obj/breakpa=
d/client/ucontext_reader.o
FAILED: obj/breakpad/client/ucontext_reader.o=20
x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Ds=
se --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux=
/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/breakpad/client/ucont=
ext_reader.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=3D1 -DUSE_PA=
NGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DUSE_X11=3D1 -D=
DISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LO=
CAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE=
_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_EN=
ABLED=3D0 -I../../breakpad -I../../breakpad/src -I../../breakpad/src/client=
 -I../../breakpad/src/third_party/linux/include -I../.. -Igen -I../../break=
pad/src -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fstack-protecto=
r -funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -O2 -fno-ident =
-fdata-sections -ffunction-sections -fomit-frame-pointer -g0 -fvisibility=
=3Dhidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-missing-=
field-initializers -Wno-unused-parameter -std=3Dgnu++11 -fno-rtti -fno-exce=
ptions -fvisibility-inlines-hidden -Wno-narrowing  -O2 -pipe -feliminate-un=
used-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc=
/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src/debug/chromium/=
61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/=
work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-native=3D -f=
debug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-l=
inux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../../breakpad/src/c=
lient/linux/dump_writer_common/ucontext_reader.cc -o obj/breakpad/client/uc=
ontext_reader.o
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc: In s=
tatic member function 'static uintptr_t google_breakpad::UContextReader::Ge=
tStackPointer(const google_breakpad::ucontext*)':
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc:92:12=
: error: invalid use of incomplete type 'const struct google_breakpad::ucon=
text'
   return uc->uc_mcontext.gregs[REG_RSP];
            ^~
In file included from ../../breakpad/src/client/linux/dump_writer_common/uc=
ontext_reader.cc:30:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:49:=
 note: forward declaration of 'struct google_breakpad::ucontext'
   static uintptr_t GetStackPointer(const struct ucontext* uc);
                                                 ^~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc:92:14=
: error: invalid use of incomplete type 'const struct google_breakpad::ucon=
text'
   return uc->uc_mcontext.gregs[REG_RSP];
              ^~~~~~~~~~~
In file included from ../../breakpad/src/client/linux/dump_writer_common/uc=
ontext_reader.cc:30:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:49:=
 note: forward declaration of 'struct google_breakpad::ucontext'
   static uintptr_t GetStackPointer(const struct ucontext* uc);
                                                 ^~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc: In s=
tatic member function 'static uintptr_t google_breakpad::UContextReader::Ge=
tInstructionPointer(const google_breakpad::ucontext*)':
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc:96:12=
: error: invalid use of incomplete type 'const struct google_breakpad::ucon=
text'
   return uc->uc_mcontext.gregs[REG_RIP];
            ^~
In file included from ../../breakpad/src/client/linux/dump_writer_common/uc=
ontext_reader.cc:30:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:49:=
 note: forward declaration of 'struct google_breakpad::ucontext'
   static uintptr_t GetStackPointer(const struct ucontext* uc);
                                                 ^~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc:96:14=
: error: invalid use of incomplete type 'const struct google_breakpad::ucon=
text'
   return uc->uc_mcontext.gregs[REG_RIP];
              ^~~~~~~~~~~
In file included from ../../breakpad/src/client/linux/dump_writer_common/uc=
ontext_reader.cc:30:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:49:=
 note: forward declaration of 'struct google_breakpad::ucontext'
   static uintptr_t GetStackPointer(const struct ucontext* uc);
                                                 ^~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc: In s=
tatic member function 'static void google_breakpad::UContextReader::FillCPU=
Context(google_breakpad::RawContextCPU*, const google_breakpad::ucontext*, =
const _libc_fpstate*)':
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc:101:2=
6: error: invalid use of incomplete type 'const struct google_breakpad::uco=
ntext'
   const greg_t* regs =3D uc->uc_mcontext.gregs;
                          ^~
In file included from ../../breakpad/src/client/linux/dump_writer_common/uc=
ontext_reader.cc:30:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:49:=
 note: forward declaration of 'struct google_breakpad::ucontext'
   static uintptr_t GetStackPointer(const struct ucontext* uc);
                                                 ^~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc:101:2=
8: error: invalid use of incomplete type 'const struct google_breakpad::uco=
ntext'
   const greg_t* regs =3D uc->uc_mcontext.gregs;
                            ^~~~~~~~~~~
In file included from ../../breakpad/src/client/linux/dump_writer_common/uc=
ontext_reader.cc:30:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:49:=
 note: forward declaration of 'struct google_breakpad::ucontext'
   static uintptr_t GetStackPointer(const struct ucontext* uc);
                                                 ^~~~~~~~
[85/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/components=
/client_update_protocol/client_update_protocol/ecdsa.o.d -DV8_DEPRECATION_W=
ARNINGS -DUSE_UDEV -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLI=
B=3D1 -DUSE_NSS_CERTS=3D1 -DUSE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING=
 -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_B=
UILD -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_=
_STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=3D2 -DNDEBUG=
 -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -DGLIB_VERSION_MAX_ALLOWED=
=3DGLIB_VERSION_2_32 -DGLIB_VERSION_MIN_REQUIRED=3DGLIB_VERSION_2_26 -I../.=
. -Igen -I/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chro=
mium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0 -I/z/chromium/cros=
swalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recip=
e-sysroot/usr/lib/glib-2.0/include -I../../third_party/boringssl/src/includ=
e -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fstack-protector -fun=
wind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -Wall -Wno-unused-loc=
al-typedefs -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-u=
nused-parameter -O2 -fno-ident -fdata-sections -ffunction-sections -fomit-f=
rame-pointer -g0 -fvisibility=3Dhidden -std=3Dgnu++11 -Wno-narrowing -fno-r=
tti -fno-exceptions -fvisibility-inlines-hidden  -O2 -pipe -feliminate-unus=
ed-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/w=
ork/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src/debug/chromium/61=
.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/wo=
rk/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-native=3D -fde=
bug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-lin=
ux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../../components/clien=
t_update_protocol/ecdsa.cc -o obj/components/client_update_protocol/client_=
update_protocol/ecdsa.o
[86/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/breakpad/c=
lient/microdump_writer.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=
=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DU=
SE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_B=
ROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=3D64=
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND -DDYNAMIC_A=
NNOTATIONS_ENABLED=3D0 -I../../breakpad -I../../breakpad/src -I../../breakp=
ad/src/client -I../../breakpad/src/third_party/linux/include -I../.. -Igen =
-I../../breakpad/src -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fs=
tack-protector -funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -O=
2 -fno-ident -fdata-sections -ffunction-sections -fomit-frame-pointer -g0 -=
fvisibility=3Dhidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized -W=
no-missing-field-initializers -Wno-unused-parameter -std=3Dgnu++11 -fno-rtt=
i -fno-exceptions -fvisibility-inlines-hidden -Wno-narrowing  -O2 -pipe -fe=
liminate-unused-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk/buil=
d/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src/debu=
g/chromium/61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/build=
/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-n=
ative=3D -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/co=
re2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../../bre=
akpad/src/client/linux/microdump_writer/microdump_writer.cc -o obj/breakpad=
/client/microdump_writer.o
FAILED: obj/breakpad/client/microdump_writer.o=20
x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Ds=
se --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux=
/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/breakpad/client/micro=
dump_writer.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=3D1 -DUSE_P=
ANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DUSE_X11=3D1 -=
DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_L=
OCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=3D64 -D_LARGEFIL=
E_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_E=
NABLED=3D0 -I../../breakpad -I../../breakpad/src -I../../breakpad/src/clien=
t -I../../breakpad/src/third_party/linux/include -I../.. -Igen -I../../brea=
kpad/src -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fstack-protect=
or -funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -O2 -fno-ident=
 -fdata-sections -ffunction-sections -fomit-frame-pointer -g0 -fvisibility=
=3Dhidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-missing-=
field-initializers -Wno-unused-parameter -std=3Dgnu++11 -fno-rtti -fno-exce=
ptions -fvisibility-inlines-hidden -Wno-narrowing  -O2 -pipe -feliminate-un=
used-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc=
/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src/debug/chromium/=
61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/=
work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-native=3D -f=
debug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-l=
inux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../../breakpad/src/c=
lient/linux/microdump_writer/microdump_writer.cc -o obj/breakpad/client/mic=
rodump_writer.o
In file included from ../../breakpad/src/client/linux/microdump_writer/micr=
odump_writer.cc:41:0:
../../breakpad/src/client/linux/handler/exception_handler.h:194:21: error: =
field 'context' has incomplete type 'google_breakpad::ucontext'
     struct ucontext context;
                     ^~~~~~~
In file included from ../../breakpad/src/client/linux/microdump_writer/micr=
odump_writer.cc:40:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:49:=
 note: forward declaration of 'struct google_breakpad::ucontext'
   static uintptr_t GetStackPointer(const struct ucontext* uc);
                                                 ^~~~~~~~
../../breakpad/src/client/linux/microdump_writer/microdump_writer.cc: In me=
mber function '{anonymous}::MicrodumpWriter::CaptureResult {anonymous}::Mic=
rodumpWriter::CaptureCrashingThreadStack(int)':
../../breakpad/src/client/linux/microdump_writer/microdump_writer.cc:245:63=
: error: no matching function for call to 'google_breakpad::UContextReader:=
:GetStackPointer(const {anonymous}::ucontext* const&)'
     stack_pointer_ =3D UContextReader::GetStackPointer(ucontext_);
                                                               ^
In file included from ../../breakpad/src/client/linux/microdump_writer/micr=
odump_writer.cc:40:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:20:=
 note: candidate: static uintptr_t google_breakpad::UContextReader::GetStac=
kPointer(const google_breakpad::ucontext*)
   static uintptr_t GetStackPointer(const struct ucontext* uc);
                    ^~~~~~~~~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:20:=
 note:   no known conversion for argument 1 from 'const {anonymous}::uconte=
xt* const' to 'const google_breakpad::ucontext*'
../../breakpad/src/client/linux/microdump_writer/microdump_writer.cc:270:67=
: error: no matching function for call to 'google_breakpad::UContextReader:=
:GetInstructionPointer(const {anonymous}::ucontext* const&)'
     uintptr_t pc =3D UContextReader::GetInstructionPointer(ucontext_);
                                                                   ^
In file included from ../../breakpad/src/client/linux/microdump_writer/micr=
odump_writer.cc:40:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:46:20:=
 note: candidate: static uintptr_t google_breakpad::UContextReader::GetInst=
ructionPointer(const google_breakpad::ucontext*)
   static uintptr_t GetInstructionPointer(const struct ucontext* uc);
                    ^~~~~~~~~~~~~~~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:46:20:=
 note:   no known conversion for argument 1 from 'const {anonymous}::uconte=
xt* const' to 'const google_breakpad::ucontext*'
../../breakpad/src/client/linux/microdump_writer/microdump_writer.cc: In me=
mber function 'void {anonymous}::MicrodumpWriter::DumpCPUState()':
../../breakpad/src/client/linux/microdump_writer/microdump_writer.cc:402:65=
: error: no matching function for call to 'google_breakpad::UContextReader:=
:FillCPUContext(google_breakpad::RawContextCPU*, const {anonymous}::ucontex=
t* const&, const fpstate_t* const&)'
     UContextReader::FillCPUContext(&cpu, ucontext_, float_state_);
                                                                 ^
In file included from ../../breakpad/src/client/linux/microdump_writer/micr=
odump_writer.cc:40:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:52:15:=
 note: candidate: static void google_breakpad::UContextReader::FillCPUConte=
xt(google_breakpad::RawContextCPU*, const google_breakpad::ucontext*, const=
 _libc_fpstate*)
   static void FillCPUContext(RawContextCPU *out, const ucontext *uc,
               ^~~~~~~~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:52:15:=
 note:   no known conversion for argument 2 from 'const {anonymous}::uconte=
xt* const' to 'const google_breakpad::ucontext*'
[87/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/breakpad/c=
lient/exception_handler.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=
=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DU=
SE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_B=
ROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=3D64=
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND -DDYNAMIC_A=
NNOTATIONS_ENABLED=3D0 -I../../breakpad -I../../breakpad/src -I../../breakp=
ad/src/client -I../../breakpad/src/third_party/linux/include -I../.. -Igen =
-I../../breakpad/src -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fs=
tack-protector -funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -O=
2 -fno-ident -fdata-sections -ffunction-sections -fomit-frame-pointer -g0 -=
fvisibility=3Dhidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized -W=
no-missing-field-initializers -Wno-unused-parameter -std=3Dgnu++11 -fno-rtt=
i -fno-exceptions -fvisibility-inlines-hidden -Wno-narrowing  -O2 -pipe -fe=
liminate-unused-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk/buil=
d/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src/debu=
g/chromium/61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/build=
/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-n=
ative=3D -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/co=
re2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../../bre=
akpad/src/client/linux/handler/exception_handler.cc -o obj/breakpad/client/=
exception_handler.o
FAILED: obj/breakpad/client/exception_handler.o=20
x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Ds=
se --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux=
/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/breakpad/client/excep=
tion_handler.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=3D1 -DUSE_=
PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DUSE_X11=3D1 =
-DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_=
LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=3D64 -D_LARGEFI=
LE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_=
ENABLED=3D0 -I../../breakpad -I../../breakpad/src -I../../breakpad/src/clie=
nt -I../../breakpad/src/third_party/linux/include -I../.. -Igen -I../../bre=
akpad/src -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fstack-protec=
tor -funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -O2 -fno-iden=
t -fdata-sections -ffunction-sections -fomit-frame-pointer -g0 -fvisibility=
=3Dhidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-missing-=
field-initializers -Wno-unused-parameter -std=3Dgnu++11 -fno-rtti -fno-exce=
ptions -fvisibility-inlines-hidden -Wno-narrowing  -O2 -pipe -feliminate-un=
used-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc=
/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src/debug/chromium/=
61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/=
work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-native=3D -f=
debug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-l=
inux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../../breakpad/src/c=
lient/linux/handler/exception_handler.cc -o obj/breakpad/client/exception_h=
andler.o
In file included from ../../breakpad/src/client/linux/handler/exception_han=
dler.cc:66:0:
../../breakpad/src/client/linux/handler/exception_handler.h:194:21: error: =
field 'context' has incomplete type 'google_breakpad::ucontext'
     struct ucontext context;
                     ^~~~~~~
../../breakpad/src/client/linux/handler/exception_handler.h:194:12: note: f=
orward declaration of 'struct google_breakpad::ucontext'
     struct ucontext context;
            ^~~~~~~~
../../breakpad/src/client/linux/handler/exception_handler.cc: In member fun=
ction 'bool google_breakpad::ExceptionHandler::HandleSignal(int, siginfo_t*=
, void*)':
../../breakpad/src/client/linux/handler/exception_handler.cc:460:63: error:=
 invalid application of 'sizeof' to incomplete type 'google_breakpad::ucont=
ext'
   memcpy(&g_crash_context_.context, uc, sizeof(struct ucontext));
                                                               ^
../../breakpad/src/client/linux/handler/exception_handler.cc:474:13: error:=
 invalid use of incomplete type 'struct google_breakpad::ucontext'
   if (uc_ptr->uc_mcontext.fpregs) {
             ^~
In file included from ../../breakpad/src/client/linux/handler/exception_han=
dler.cc:66:0:
../../breakpad/src/client/linux/handler/exception_handler.h:194:12: note: f=
orward declaration of 'struct google_breakpad::ucontext'
     struct ucontext context;
            ^~~~~~~~
../../breakpad/src/client/linux/handler/exception_handler.cc:474:15: error:=
 invalid use of incomplete type 'struct google_breakpad::ucontext'
   if (uc_ptr->uc_mcontext.fpregs) {
               ^~~~~~~~~~~
In file included from ../../breakpad/src/client/linux/handler/exception_han=
dler.cc:66:0:
../../breakpad/src/client/linux/handler/exception_handler.h:194:12: note: f=
orward declaration of 'struct google_breakpad::ucontext'
     struct ucontext context;
            ^~~~~~~~
../../breakpad/src/client/linux/handler/exception_handler.cc:475:49: error:=
 invalid use of incomplete type 'struct google_breakpad::ucontext'
     memcpy(&g_crash_context_.float_state, uc_ptr->uc_mcontext.fpregs,
                                                 ^~
In file included from ../../breakpad/src/client/linux/handler/exception_han=
dler.cc:66:0:
../../breakpad/src/client/linux/handler/exception_handler.h:194:12: note: f=
orward declaration of 'struct google_breakpad::ucontext'
     struct ucontext context;
            ^~~~~~~~
../../breakpad/src/client/linux/handler/exception_handler.cc:475:51: error:=
 invalid use of incomplete type 'struct google_breakpad::ucontext'
     memcpy(&g_crash_context_.float_state, uc_ptr->uc_mcontext.fpregs,
                                                   ^~~~~~~~~~~
In file included from ../../breakpad/src/client/linux/handler/exception_han=
dler.cc:66:0:
../../breakpad/src/client/linux/handler/exception_handler.h:194:12: note: f=
orward declaration of 'struct google_breakpad::ucontext'
     struct ucontext context;
            ^~~~~~~~
../../breakpad/src/client/linux/handler/exception_handler.cc: In member fun=
ction 'bool google_breakpad::ExceptionHandler::SimulateSignalDelivery(int)'=
:
../../breakpad/src/client/linux/handler/exception_handler.cc:497:19: error:=
 aggregate 'google_breakpad::ucontext context' has incomplete type and cann=
ot be defined
   struct ucontext context;
                   ^~~~~~~
[88/29715] python ../../components/vector_icons/aggregate_vector_icons.py -=
-working_directory=3D../../chrome/app/vector_icons --file_list=3D__chrome_a=
pp_vector_icons_chrome_vector_icons___build_toolchain_yocto_yocto_target__r=
ule.rsp --output_cc=3Dgen/chrome/app/vector_icons/vector_icons.cc --output_=
h=3Dgen/chrome/app/vector_icons/vector_icons.h
[89/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/breakpad/c=
lient/minidump_writer.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=
=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DU=
SE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_B=
ROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=3D64=
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND -DDYNAMIC_A=
NNOTATIONS_ENABLED=3D0 -I../../breakpad -I../../breakpad/src -I../../breakp=
ad/src/client -I../../breakpad/src/third_party/linux/include -I../.. -Igen =
-I../../breakpad/src -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fs=
tack-protector -funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -O=
2 -fno-ident -fdata-sections -ffunction-sections -fomit-frame-pointer -g0 -=
fvisibility=3Dhidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized -W=
no-missing-field-initializers -Wno-unused-parameter -std=3Dgnu++11 -fno-rtt=
i -fno-exceptions -fvisibility-inlines-hidden -Wno-narrowing  -O2 -pipe -fe=
liminate-unused-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk/buil=
d/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src/debu=
g/chromium/61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/build=
/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-n=
ative=3D -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/co=
re2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../../bre=
akpad/src/client/linux/minidump_writer/minidump_writer.cc -o obj/breakpad/c=
lient/minidump_writer.o
FAILED: obj/breakpad/client/minidump_writer.o=20
x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Ds=
se --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux=
/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/breakpad/client/minid=
ump_writer.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=3D1 -DUSE_PA=
NGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DUSE_X11=3D1 -D=
DISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LO=
CAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE=
_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_EN=
ABLED=3D0 -I../../breakpad -I../../breakpad/src -I../../breakpad/src/client=
 -I../../breakpad/src/third_party/linux/include -I../.. -Igen -I../../break=
pad/src -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fstack-protecto=
r -funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -O2 -fno-ident =
-fdata-sections -ffunction-sections -fomit-frame-pointer -g0 -fvisibility=
=3Dhidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-missing-=
field-initializers -Wno-unused-parameter -std=3Dgnu++11 -fno-rtti -fno-exce=
ptions -fvisibility-inlines-hidden -Wno-narrowing  -O2 -pipe -feliminate-un=
used-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc=
/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src/debug/chromium/=
61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/=
work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-native=3D -f=
debug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-l=
inux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../../breakpad/src/c=
lient/linux/minidump_writer/minidump_writer.cc -o obj/breakpad/client/minid=
ump_writer.o
In file included from ../../breakpad/src/client/linux/minidump_writer/minid=
ump_writer.cc:69:0:
../../breakpad/src/client/linux/handler/exception_handler.h:194:21: error: =
field 'context' has incomplete type 'google_breakpad::ucontext'
     struct ucontext context;
                     ^~~~~~~
In file included from ../../breakpad/src/client/linux/minidump_writer/minid=
ump_writer.cc:68:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:49:=
 note: forward declaration of 'struct google_breakpad::ucontext'
   static uintptr_t GetStackPointer(const struct ucontext* uc);
                                                 ^~~~~~~~
../../breakpad/src/client/linux/minidump_writer/minidump_writer.cc: In memb=
er function 'bool {anonymous}::MinidumpWriter::CrashingThreadReferencesPrin=
cipalMapping()':
../../breakpad/src/client/linux/minidump_writer/minidump_writer.cc:196:78: =
error: no matching function for call to 'google_breakpad::UContextReader::G=
etStackPointer(const {anonymous}::ucontext* const&)'
     const uintptr_t stack_pointer =3D UContextReader::GetStackPointer(ucon=
text_);
                                                                           =
   ^
In file included from ../../breakpad/src/client/linux/minidump_writer/minid=
ump_writer.cc:68:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:20:=
 note: candidate: static uintptr_t google_breakpad::UContextReader::GetStac=
kPointer(const google_breakpad::ucontext*)
   static uintptr_t GetStackPointer(const struct ucontext* uc);
                    ^~~~~~~~~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:20:=
 note:   no known conversion for argument 1 from 'const {anonymous}::uconte=
xt* const' to 'const google_breakpad::ucontext*'
../../breakpad/src/client/linux/minidump_writer/minidump_writer.cc:197:73: =
error: no matching function for call to 'google_breakpad::UContextReader::G=
etInstructionPointer(const {anonymous}::ucontext* const&)'
     const uintptr_t pc =3D UContextReader::GetInstructionPointer(ucontext_=
);
                                                                         ^
In file included from ../../breakpad/src/client/linux/minidump_writer/minid=
ump_writer.cc:68:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:46:20:=
 note: candidate: static uintptr_t google_breakpad::UContextReader::GetInst=
ructionPointer(const google_breakpad::ucontext*)
   static uintptr_t GetInstructionPointer(const struct ucontext* uc);
                    ^~~~~~~~~~~~~~~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:46:20:=
 note:   no known conversion for argument 1 from 'const {anonymous}::uconte=
xt* const' to 'const google_breakpad::ucontext*'
../../breakpad/src/client/linux/minidump_writer/minidump_writer.cc: In memb=
er function 'bool {anonymous}::MinidumpWriter::WriteThreadListStream(MDRawD=
irectory*)':
../../breakpad/src/client/linux/minidump_writer/minidump_writer.cc:418:78: =
error: no matching function for call to 'google_breakpad::UContextReader::G=
etStackPointer(const {anonymous}::ucontext* const&)'
         const uintptr_t stack_ptr =3D UContextReader::GetStackPointer(ucon=
text_);
                                                                           =
   ^
In file included from ../../breakpad/src/client/linux/minidump_writer/minid=
ump_writer.cc:68:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:20:=
 note: candidate: static uintptr_t google_breakpad::UContextReader::GetStac=
kPointer(const google_breakpad::ucontext*)
   static uintptr_t GetStackPointer(const struct ucontext* uc);
                    ^~~~~~~~~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:44:20:=
 note:   no known conversion for argument 1 from 'const {anonymous}::uconte=
xt* const' to 'const google_breakpad::ucontext*'
../../breakpad/src/client/linux/minidump_writer/minidump_writer.cc:420:77: =
error: no matching function for call to 'google_breakpad::UContextReader::G=
etInstructionPointer(const {anonymous}::ucontext* const&)'
                              UContextReader::GetInstructionPointer(ucontex=
t_),
                                                                           =
  ^
In file included from ../../breakpad/src/client/linux/minidump_writer/minid=
ump_writer.cc:68:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:46:20:=
 note: candidate: static uintptr_t google_breakpad::UContextReader::GetInst=
ructionPointer(const google_breakpad::ucontext*)
   static uintptr_t GetInstructionPointer(const struct ucontext* uc);
                    ^~~~~~~~~~~~~~~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:46:20:=
 note:   no known conversion for argument 1 from 'const {anonymous}::uconte=
xt* const' to 'const google_breakpad::ucontext*'
../../breakpad/src/client/linux/minidump_writer/minidump_writer.cc:426:70: =
error: no matching function for call to 'google_breakpad::UContextReader::G=
etInstructionPointer(const {anonymous}::ucontext* const&)'
         uint64_t ip =3D UContextReader::GetInstructionPointer(ucontext_);
                                                                      ^
In file included from ../../breakpad/src/client/linux/minidump_writer/minid=
ump_writer.cc:68:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:46:20:=
 note: candidate: static uintptr_t google_breakpad::UContextReader::GetInst=
ructionPointer(const google_breakpad::ucontext*)
   static uintptr_t GetInstructionPointer(const struct ucontext* uc);
                    ^~~~~~~~~~~~~~~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:46:20:=
 note:   no known conversion for argument 1 from 'const {anonymous}::uconte=
xt* const' to 'const google_breakpad::ucontext*'
../../breakpad/src/client/linux/minidump_writer/minidump_writer.cc:472:74: =
error: no matching function for call to 'google_breakpad::UContextReader::F=
illCPUContext(MDRawContextAMD64*, const {anonymous}::ucontext* const&, cons=
t fpstate_t* const&)'
         UContextReader::FillCPUContext(cpu.get(), ucontext_, float_state_)=
;
                                                                          ^
In file included from ../../breakpad/src/client/linux/minidump_writer/minid=
ump_writer.cc:68:0:
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:52:15:=
 note: candidate: static void google_breakpad::UContextReader::FillCPUConte=
xt(google_breakpad::RawContextCPU*, const google_breakpad::ucontext*, const=
 _libc_fpstate*)
   static void FillCPUContext(RawContextCPU *out, const ucontext *uc,
               ^~~~~~~~~~~~~~
../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.h:52:15:=
 note:   no known conversion for argument 2 from 'const {anonymous}::uconte=
xt* const' to 'const google_breakpad::ucontext*'
[90/29715] python ../../tools/json_schema_compiler/compiler.py ../../chrome=
/common/extensions/api/dashboard_private.json --root=3D../../ --destdir=3Dg=
en --namespace=3Dextensions::api::\%\(namespace\)s --generator=3Dcpp --incl=
ude-rules=3Dextensions/common/api:extensions::api::\%\(namespace\)s
[91/29715] python ../../tools/json_schema_compiler/compiler.py ../../chrome=
/common/extensions/api/webstore_private.json --root=3D../../ --destdir=3Dge=
n --namespace=3Dextensions::api::\%\(namespace\)s --generator=3Dcpp --inclu=
de-rules=3Dextensions/common/api:extensions::api::\%\(namespace\)s
[92/29715] python ../../tools/json_schema_compiler/compiler.py ../../chrome=
/common/extensions/api/context_menus.json --root=3D../../ --destdir=3Dgen -=
-namespace=3Dextensions::api::\%\(namespace\)s --generator=3Dcpp --include-=
rules=3Dextensions/common/api:extensions::api::\%\(namespace\)s
[93/29715] python ../../tools/json_schema_compiler/compiler.py ../../chrome=
/common/extensions/api/cryptotoken_private.idl --root=3D../../ --destdir=3D=
gen --namespace=3Dextensions::api::\%\(namespace\)s --generator=3Dcpp --inc=
lude-rules=3Dextensions/common/api:extensions::api::\%\(namespace\)s
[94/29715] python ../../tools/json_schema_compiler/compiler.py ../../chrome=
/common/extensions/api/hotword_private.idl --root=3D../../ --destdir=3Dgen =
--namespace=3Dextensions::api::\%\(namespace\)s --generator=3Dcpp --include=
-rules=3Dextensions/common/api:extensions::api::\%\(namespace\)s
[95/29715] python ../../tools/json_schema_compiler/compiler.py ../../chrome=
/common/extensions/api/downloads.idl --root=3D../../ --destdir=3Dgen --name=
space=3Dextensions::api::\%\(namespace\)s --generator=3Dcpp --include-rules=
=3Dextensions/common/api:extensions::api::\%\(namespace\)s
[96/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/chrome/com=
mon/ini_parser/ini_parser.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AU=
RA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -=
DUSE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE=
_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=3D=
64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTANT_MACROS -D__S=
TDC_FORMAT_MACROS -D_FORTIFY_SOURCE=3D2 -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNO=
TATIONS_ENABLED=3D0 -DGLIB_VERSION_MAX_ALLOWED=3DGLIB_VERSION_2_32 -DGLIB_V=
ERSION_MIN_REQUIRED=3DGLIB_VERSION_2_26 -I../.. -Igen -I/z/chromium/crosswa=
lk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-s=
ysroot/usr/include/glib-2.0 -I/z/chromium/crosswalk/build/tmp-glibc/work/co=
re2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/lib/glib-2.0/in=
clude -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fstack-protector =
-funwind-tables -fPIC -pipe -pthread -m64 -march=3Dx86-64 -Wall -Wno-unused=
-local-typedefs -Wno-maybe-uninitialized -Wno-missing-field-initializers -W=
no-unused-parameter -O2 -fno-ident -fdata-sections -ffunction-sections -fom=
it-frame-pointer -g0 -fvisibility=3Dhidden -std=3Dgnu++11 -Wno-narrowing -f=
no-rtti -fno-exceptions -fvisibility-inlines-hidden  -O2 -pipe -feliminate-=
unused-debug-types -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-gli=
bc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0=3D/usr/src/debug/chromiu=
m/61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glib=
c/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot-native=3D =
-fdebug-prefix-map=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe=
-linux/chromium/61.0.3163.91-r0/recipe-sysroot=3D -g1 -c ../../chrome/commo=
n/ini_parser.cc -o obj/chrome/common/ini_parser/ini_parser.o
[97/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/chrome/app=
/shutdown_signal_handlers/shutdown_signal_handlers_posix.o.d -DV8_DEPRECATI=
ON_WARNINGS -DUSE_UDEV -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE=
_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DUSE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROW=
SING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMI=
UM_BUILD -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE=
 -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=3D2 -DND=
EBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -DGLIB_VERSION_MAX_ALLOW=
ED=3DGLIB_VERSION_2_32 -DGLIB_VERSION_MIN_REQUIRED=3DGLIB_VERSION_2_26 -I..=
/.. -Igen -I/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/ch=
romium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0 -I/z/chromium/cr=
osswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/rec=
ipe-sysroot/usr/lib/glib-2.0/include -fno-strict-aliasing --param=3Dssp-buf=
fer-size=3D4 -fstack-protector -funwind-tables -fPIC -pipe -pthread -m64 -m=
arch=3Dx86-64 -Wall -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wn=
o-missing-field-initializers -Wno-unused-parameter -O2 -fno-ident -fdata-se=
ctions -ffunction-sections -fomit-frame-pointer -g0 -fvisibility=3Dhidden -=
std=3Dgnu++11 -Wno-narrowing -fno-rtti -fno-exceptions -fvisibility-inlines=
-hidden  -O2 -pipe -feliminate-unused-debug-types -fdebug-prefix-map=3D/z/c=
hromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163=
.91-r0=3D/usr/src/debug/chromium/61.0.3163.91-r0 -fdebug-prefix-map=3D/z/ch=
romium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.=
91-r0/recipe-sysroot-native=3D -fdebug-prefix-map=3D/z/chromium/crosswalk/b=
uild/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysro=
ot=3D -g1 -c ../../chrome/app/shutdown_signal_handlers_posix.cc -o obj/chro=
me/app/shutdown_signal_handlers/shutdown_signal_handlers_posix.o
[98/29715] x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/z/chromium/crosswalk/build/tmp-glibc/work/core2-=
64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroot -MMD -MF obj/base/base/=
message_pump_glib.o.d -DUSE_SYMBOLIZE -DV8_DEPRECATION_WARNINGS -DUSE_UDEV =
-DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CER=
TS=3D1 -DUSE_X11=3D1 -DDISABLE_NACL -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CS=
D -DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET=
_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTANT_MACR=
OS -D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=3D2 -DNDEBUG -DNVALGRIND -DDYNA=
MIC_ANNOTATIONS_ENABLED=3D0 -DBASE_IMPLEMENTATION -DGLIB_VERSION_MAX_ALLOWE=
D=3DGLIB_VERSION_2_32 -DGLIB_VERSION_MIN_REQUIRED=3DGLIB_VERSION_2_26 -I../=
.. -Igen -I/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chr=
omium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0 -I/z/chromium/cro=
sswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/reci=
pe-sysroot/usr/lib/glib-2.0/include -fno-strict-aliasing --param=3Dssp-buff=
er-size=3D4 -fstack-protector -funwind-tables -fPIC -pipe -pthread -m64 -ma=
rch=3Dx86-64 -Wall -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno=
-missing-field-initializers -Wno-unused-parameter -fomit-frame-pointer -g0 =
-fvisibility=3Dhidden -O2 -fno-ident -fdata-sections -ffunction-sections -s=
td=3Dgnu++11 -Wno-narrowing -fno-rtti -fno-exceptions -fvisibility-inlines-=
hidden  -O2 -pipe -feliminate-unused-debug-types -fdebug-prefix-map=3D/z/ch=
romium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.=
91-r0=3D/usr/src/debug/chromium/61.0.3163.91-r0 -fdebug-prefix-map=3D/z/chr=
omium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.9=
1-r0/recipe-sysroot-native=3D -fdebug-prefix-map=3D/z/chromium/crosswalk/bu=
ild/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/recipe-sysroo=
t=3D -g1 -c ../../base/message_loop/message_pump_glib.cc -o obj/base/base/m=
essage_pump_glib.o
In file included from /z/chromium/crosswalk/build/tmp-glibc/work/core2-64-o=
e-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/lib/glib-2.0/include/gl=
ibconfig.h:9:0,
                 from /z/chromium/crosswalk/build/tmp-glibc/work/core2-64-o=
e-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib/g=
types.h:32,
                 from /z/chromium/crosswalk/build/tmp-glibc/work/core2-64-o=
e-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib/g=
alloca.h:32,
                 from /z/chromium/crosswalk/build/tmp-glibc/work/core2-64-o=
e-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib.h=
:30,
                 from ../../base/message_loop/message_pump_glib.cc:10:
/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.=
3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib/glib-autocleanups.h: In=
 function 'void glib_auto_cleanup_GVariantDict(GVariantDict*)':
/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.=
3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib/glib-autocleanups.h:87:=
48: warning: 'void g_variant_dict_clear(GVariantDict*)' is deprecated: Not =
available before 2.40 [-Wdeprecated-declarations]
 G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(GVariantDict, g_variant_dict_clear)
                                                ^
/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.=
3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib/gmacros.h:448:73: note:=
 in definition of macro 'G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC'
   static inline void _GLIB_AUTO_FUNC_NAME(TypeName) (TypeName *_ptr) { (fu=
nc) (_ptr); }                         \
                                                                         ^~=
~~
In file included from /z/chromium/crosswalk/build/tmp-glibc/work/core2-64-o=
e-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib/g=
messages.h:35:0,
                 from /z/chromium/crosswalk/build/tmp-glibc/work/core2-64-o=
e-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib.h=
:62,
                 from ../../base/message_loop/message_pump_glib.cc:10:
/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.=
3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib/gvariant.h:511:33: note=
: declared here
 void                            g_variant_dict_clear                    (G=
VariantDict         *dict);
                                 ^~~~~~~~~~~~~~~~~~~~
In file included from /z/chromium/crosswalk/build/tmp-glibc/work/core2-64-o=
e-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/lib/glib-2.0/include/gl=
ibconfig.h:9:0,
                 from /z/chromium/crosswalk/build/tmp-glibc/work/core2-64-o=
e-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib/g=
types.h:32,
                 from /z/chromium/crosswalk/build/tmp-glibc/work/core2-64-o=
e-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib/g=
alloca.h:32,
                 from /z/chromium/crosswalk/build/tmp-glibc/work/core2-64-o=
e-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib.h=
:30,
                 from ../../base/message_loop/message_pump_glib.cc:10:
/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.=
3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib/gmacros.h:448:84: warni=
ng: 'void g_variant_dict_clear(GVariantDict*)' is deprecated: Not available=
 before 2.40 [-Wdeprecated-declarations]
   static inline void _GLIB_AUTO_FUNC_NAME(TypeName) (TypeName *_ptr) { (fu=
nc) (_ptr); }                         \
                                                                           =
         ^
/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.=
3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib/glib-autocleanups.h:87:=
1: note: in expansion of macro 'G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC'
 G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(GVariantDict, g_variant_dict_clear)
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /z/chromium/crosswalk/build/tmp-glibc/work/core2-64-o=
e-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib/g=
messages.h:35:0,
                 from /z/chromium/crosswalk/build/tmp-glibc/work/core2-64-o=
e-linux/chromium/61.0.3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib.h=
:62,
                 from ../../base/message_loop/message_pump_glib.cc:10:
/z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.=
3163.91-r0/recipe-sysroot/usr/include/glib-2.0/glib/gvariant.h:511:33: note=
: declared here
 void                            g_variant_dict_clear                    (G=
VariantDict         *dict);
                                 ^~~~~~~~~~~~~~~~~~~~
[99/29715] python ../../chrome/browser/resources/vulcanize_gn.py --host his=
tory --html_in_file lazy_load.html --html_out_file lazy_load.vulcanized.unb=
uilt.html --js_out_file lazy_load.crisper.js --input ../../chrome/browser/r=
esources/md_history --out_folder gen/chrome/browser/resources/md_history --=
depfile gen/chrome/browser/resources/md_history/lazy_load.vulcanized.unbuil=
t.html.d --exclude chrome://resources/html/util.html chrome://history/const=
ants.html chrome://history/app.html
[100/29715] python ../../chrome/browser/resources/vulcanize_gn.py --host do=
wnloads --html_in_file downloads.html --html_out_file vulcanized.unbuilt.ht=
ml --js_out_file crisper.js --input ../../chrome/browser/resources/md_downl=
oads --out_folder gen/chrome/browser/resources/md_downloads --depfile gen/c=
hrome/browser/resources/md_downloads/vulcanized.unbuilt.html.d --insert_in_=
head \<base\ href=3Dchrome://downloads\>
[101/29715] python ../../chrome/browser/resources/vulcanize_gn.py --host hi=
story --html_in_file app.html --html_out_file app.vulcanized.unbuilt.html -=
-js_out_file app.crisper.js --input ../../chrome/browser/resources/md_histo=
ry --out_folder gen/chrome/browser/resources/md_history --depfile gen/chrom=
e/browser/resources/md_history/app.vulcanized.unbuilt.html.d --exclude chro=
me://resources/html/util.html chrome://history/constants.html
[102/29715] python ../../chrome/browser/resources/vulcanize_gn.py --host bo=
okmarks --html_in_file bookmarks.html --html_out_file vulcanized.unbuilt.ht=
ml --js_out_file crisper.js --input ../../chrome/browser/resources/md_bookm=
arks --out_folder gen/chrome/browser/resources/md_bookmarks --depfile gen/c=
hrome/browser/resources/md_bookmarks/vulcanized.unbuilt.html.d
[103/29715] python ../../tools/json_schema_compiler/compiler.py --root=3D..=
/../ --destdir=3Dgen --namespace=3Dextensions::api::\%\(namespace\)s --bund=
le-name=3D --generator=3Dcpp-bundle-registration --impl-dir=3Dextensions/br=
owser/api --include-rules=3D ../../extensions/common/api/alarms.idl ../../e=
xtensions/common/api/app_current_window_internal.idl ../../extensions/commo=
n/api/app_runtime.idl ../../extensions/common/api/app_view_guest_internal.j=
son ../../extensions/common/api/app_window.idl ../../extensions/common/api/=
audio.idl ../../extensions/common/api/bluetooth.idl ../../extensions/common=
/api/bluetooth_low_energy.idl ../../extensions/common/api/bluetooth_private=
.idl ../../extensions/common/api/bluetooth_socket.idl ../../extensions/comm=
on/api/cast_channel.idl ../../extensions/common/api/clipboard.idl ../../ext=
ensions/common/api/document_scan.idl ../../extensions/common/api/display_so=
urce.idl ../../extensions/common/api/dns.idl ../../extensions/common/api/ev=
ents.json ../../extensions/common/api/extensions_manifest_types.json ../../=
extensions/common/api/extension_options_internal.idl ../../extensions/commo=
n/api/extension_view_internal.json ../../extensions/common/api/extension_ty=
pes.json ../../extensions/common/api/file_system.idl ../../extensions/commo=
n/api/guest_view_internal.json ../../extensions/common/api/management.json =
../../extensions/common/api/hid.idl ../../extensions/common/api/idle.json .=
./../extensions/common/api/metrics_private.json ../../extensions/common/api=
/mime_handler_private.idl ../../extensions/common/api/mime_handler_view_gue=
st_internal.json ../../extensions/common/api/mojo_private.idl ../../extensi=
ons/common/api/networking_private.idl ../../extensions/common/api/power.idl=
 ../../extensions/common/api/printer_provider.idl ../../extensions/common/a=
pi/printer_provider_internal.idl ../../extensions/common/api/runtime.json .=
./../extensions/common/api/serial.idl ../../extensions/common/api/socket.id=
l ../../extensions/common/api/sockets_tcp.idl ../../extensions/common/api/s=
ockets_tcp_server.idl ../../extensions/common/api/sockets_udp.idl ../../ext=
ensions/common/api/storage.json ../../extensions/common/api/system_cpu.idl =
../../extensions/common/api/system_display.idl ../../extensions/common/api/=
system_memory.idl ../../extensions/common/api/system_network.idl ../../exte=
nsions/common/api/system_storage.idl ../../extensions/common/api/test.json =
../../extensions/common/api/usb.idl ../../extensions/common/api/virtual_key=
board.idl ../../extensions/common/api/virtual_keyboard_private.json ../../e=
xtensions/common/api/web_request.json ../../extensions/common/api/web_view_=
internal.json ../../extensions/common/api/web_request_internal.json
ninja: build stopped: subcommand failed.
WARNING: /z/chromium/crosswalk/build/tmp-glibc/work/core2-64-oe-linux/chrom=
ium/61.0.3163.91-r0/temp/run.do_compile.31398:1 exit 1 from 'ninja -v "-j 2=
0" chrome chrome_sandbox'
ERROR: Function failed: do_compile (log file is located at /z/chromium/cros=
swalk/build/tmp-glibc/work/core2-64-oe-linux/chromium/61.0.3163.91-r0/temp/=
log.do_compile.31398)

--k+w/mQv8wyuph6w0--
