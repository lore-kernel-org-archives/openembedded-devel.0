Return-Path: <ayoub.zaki@googlemail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id BF6AC786D7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 10:22:11 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id z43so12481223uac.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 02:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cHogYSFFAMzKRv31CpaBhnrW6Au62sASUIOpjHROGjA=;
	b=KVxD7Su9woumNmCitl2cGWZREMbycDvGNDQPTWkdxRkATD+cHmzhPm6ILRydXJkl6N
	/gKeiW2GC8joG7yNS4DjN/4xEUiLNAq5uB+4ViDPv+0nDMLQxXn5xSZjxfvQaxclrxYI
	EGI/MbCb5rPg3+erFSIalxD9WoLb8B6xndxV4FzkUUwvqjJ3YFjWZulOTU8EgHu56Xtk
	vp/ewvn/1Kns7/jMl0LzVH6Yduvvt3X5QPWWJG4Tmrd0tSvfAoqpleV2Ylf5Wa2INlSi
	kmUIASgibmYFC/gP9AXmbJqi3Jf5AXbSn46PD9zTqO5Q3Gs/mVkjEi6ncjQGuwhFanAQ
	ZAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cHogYSFFAMzKRv31CpaBhnrW6Au62sASUIOpjHROGjA=;
	b=ffzc6/SkO0Pbb+eTXbo6B5sWWYWi50kp8zGCjiEy9F5p4q34gNfXcofwmp8PzEAlol
	s9oCAS9nZPhux5qRwQQiBh/3KNDodx9CcH8/3koPKaHDYL5SQ6U/oVufffS9Z5nEponE
	i3a49qwaoQm9q7EJPGyCiohw9qlSP9u4RC9BHE7Pk5ba86APOnGVUIQvXn6OVtaZeyT0
	3BkwmIJE46lBxI42cknqwCOmGwB1lrJBQNiUJF3wf//qV6NRzwgXXH2ySrIUjCxf4fGH
	54WjrXLQKjdQtU0oUGy+XsZ48mf4L8vdIFPoSjFoY/n3+EN5zhYZnbJoYfaQ95GyynNw
	EXpw==
X-Gm-Message-State: AJaThX4FWEaM2HzgpZxt8EwgXJLYALHYc7WAUGr+m6FF/7UzcRZ48xIQ
	9jDzRX84kvAYjRrWaAXsm7ZDIXburalKH4f+uZQ=
X-Google-Smtp-Source: AGs4zMaRrpGnwkGL70+yRN7bNbkn72i90rWMPiQ46WcTpzaLCW0Gobt59/b+zfMU3C+AYWr8Ek2CRh7Fc4CQS2CayjM=
X-Received: by 10.176.81.244 with SMTP id h49mr17693279uaa.121.1511432532139; 
	Thu, 23 Nov 2017 02:22:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.67 with HTTP; Thu, 23 Nov 2017 02:22:11 -0800 (PST)
In-Reply-To: <CAMKF1soYSpfBApFPmBa1zj1U6nkqJ9+nqPckRser8Y3eWPmRmg@mail.gmail.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
	<CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
	<877eur1nby.fsf@rkubodac-desk.ger.corp.intel.com>
	<20171115174136.GA4530@jama>
	<CAMKF1soYSpfBApFPmBa1zj1U6nkqJ9+nqPckRser8Y3eWPmRmg@mail.gmail.com>
From: Ayoub Zaki <ayoub.zaki@googlemail.com>
Date: Thu, 23 Nov 2017 11:22:11 +0100
Message-ID: <CA+-BmJYi0W7whu3T5BneZGdt2me2J7iJBDXMy9FsoaKrnJvF3A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Thu, 23 Nov 2017 10:22:12 -0000
Content-Type: text/plain; charset="UTF-8"

Hello all,

I'm trying to build from the latest commit meta-browser:
a8bb1e779bc3565beacceadc4414816670f33475 with an imx6 using yocto pyro
branch with meta-freescale, however the build fails :

 [460/30779] touch obj/chrome/browser/search/local_ntp_code_generate.stamp
| [461/30779] touch obj/chrome/browser/search/generated.stamp
| [462/30779] python
../../mojo/public/tools/bindings/generate_type_mappings.py --output
gen/chrome/browser/ui/webui/omnibox/mojo_bindings__type_mappings
| [463/30779] touch
obj/chrome/browser/ui/webui/omnibox/mojo_bindings__type_mappings.stamp
| [464/30779] touch obj/chrome/browser/chrome_internal_resources_gen.stamp
| [465/30779] touch obj/chrome/browser/theme_properties.stamp
| [466/30779] python ../../chrome/browser/resources/vulcanize_gn.py --host
bookmarks --input ../../chrome/browser/resources/md_bookmarks --out_folder
gen/chrome/browser/resources/md_bookmarks --depfile
gen/chrome/browser/resources/md_bookmarks/build.d --html_in_files
bookmarks.html --html_out_files vulcanized.html --js_out_files crisper.js
| FAILED: gen/chrome/browser/resources/md_bookmarks/vulcanized.html
gen/chrome/browser/resources/md_bookmarks/crisper.js
| python ../../chrome/browser/resources/vulcanize_gn.py --host bookmarks
--input ../../chrome/browser/resources/md_bookmarks --out_folder
gen/chrome/browser/resources/md_bookmarks --depfile
gen/chrome/browser/resources/md_bookmarks/build.d --html_in_files
bookmarks.html --html_out_files vulcanized.html --js_out_files crisper.js
| ../../third_party/node/linux/node-linux-x64/bin/node
../../third_party/node/node_modules/polymer-bundler/lib/bin/polymer-bundler
--exclude chrome://resources/html/polymer.html --exclude
chrome://resources/polymer/v1_0/polymer/polymer.html --exclude
chrome://resources/polymer/v1_0/polymer/polymer-micro.html --exclude
chrome://resources/polymer/v1_0/polymer/polymer-mini.html --exclude
chrome://resources/polymer/v1_0/web-animations-js/web-animations-next-lite.min.js
--exclude chrome://resources/css/roboto.css --exclude
chrome://resources/css/text_defaults.css --exclude
chrome://resources/css/text_defaults_md.css --exclude
chrome://resources/js/load_time_data.js --inline-css --inline-scripts
--rewrite-urls-in-templates --strip-comments --redirect
"chrome://resources/cr_components/|../../ui/webui/resources/cr_components"
--redirect
"chrome://resources/cr_elements/|../../ui/webui/resources/cr_elements"
--redirect "chrome://resources/css/|../../ui/webui/resources/css"
--redirect "chrome://resources/html/|../../ui/webui/resources/html"
--redirect "chrome://resources/js/|../../ui/webui/resources/js" --redirect
"chrome://resources/polymer/v1_0/|../../third_party/polymer/v1_0/components-chromium"
--exclude strings.js --exclude chrome://bookmarks/strings.js --manifest-out
/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/chromium-62.0.3202.94/out/Release/gen/chrome/browser/resources/md_bookmarks/bookmarks_requestlist.txt
--root
/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/chromium-62.0.3202.94/chrome/browser/resources/md_bookmarks
--redirect
"chrome://bookmarks/|/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/chromium-62.0.3202.94/chrome/browser/resources/md_bookmarks"
--out-dir gen/chrome/browser/resources/md_bookmarks/bundled --shell
bookmarks.html --in-html bookmarks.html failed:
/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/chromium-62.0.3202.94/third_party/node/node_modules/polymer-bundler/lib/bin/polymer-bundler.js:178
|         const [prefix, path] = redirect.split('|');
|               ^
|
| SyntaxError: Unexpected token [
|     at exports.runInThisContext (vm.js:53:16)
|     at Module._compile (module.js:373:25)
|     at Object.Module._extensions..js (module.js:416:10)
|     at Module.load (module.js:343:32)
|     at Function.Module._load (module.js:300:12)
|     at Function.Module.runMain (module.js:441:10)
|     at startup (node.js:140:18)
|     at node.js:1043:3
|
| Traceback (most recent call last):
|   File "../../chrome/browser/resources/vulcanize_gn.py", line 252, in
<module>
|     main(sys.argv[1:])
|   File "../../chrome/browser/resources/vulcanize_gn.py", line 235, in main
|     manifest_out_path = _vulcanize(args.input, args)
|   File "../../chrome/browser/resources/vulcanize_gn.py", line 159, in
_vulcanize
|     ] + in_html_args)
|   File "../../third_party/node/node.py", line 28, in RunNode
|     raise
| TypeError: exceptions must be old-style classes or derived from
BaseException, not NoneType
| [467/30779] python ../../chrome/browser/resources/vulcanize_gn.py --host
downloads --input ../../chrome/browser/resources/md_downloads --out_folder
gen/chrome/browser/resources/md_downloads --depfile
gen/chrome/browser/resources/md_downloads/build.d --html_in_files
downloads.html --html_out_files vulcanized.html --js_out_files crisper.js
--insert_in_head \<base\ href=chrome://downloads\>
| FAILED: gen/chrome/browser/resources/md_downloads/vulcanized.html
gen/chrome/browser/resources/md_downloads/crisper.js
| python ../../chrome/browser/resources/vulcanize_gn.py --host downloads
--input ../../chrome/browser/resources/md_downloads --out_folder
gen/chrome/browser/resources/md_downloads --depfile
gen/chrome/browser/resources/md_downloads/build.d --html_in_files
downloads.html --html_out_files vulcanized.html --js_out_files crisper.js
--insert_in_head \<base\ href=chrome://downloads\>
| ../../third_party/node/linux/node-linux-x64/bin/node
../../third_party/node/node_modules/polymer-bundler/lib/bin/polymer-bundler
--exclude chrome://resources/html/polymer.html --exclude
chrome://resources/polymer/v1_0/polymer/polymer.html --exclude
chrome://resources/polymer/v1_0/polymer/polymer-micro.html --exclude
chrome://resources/polymer/v1_0/polymer/polymer-mini.html --exclude
chrome://resources/polymer/v1_0/web-animations-js/web-animations-next-lite.min.js
--exclude chrome://resources/css/roboto.css --exclude
chrome://resources/css/text_defaults.css --exclude
chrome://resources/css/text_defaults_md.css --exclude
chrome://resources/js/load_time_data.js --inline-css --inline-scripts
--rewrite-urls-in-templates --strip-comments --redirect
"chrome://resources/cr_components/|../../ui/webui/resources/cr_components"
--redirect
"chrome://resources/cr_elements/|../../ui/webui/resources/cr_elements"
--redirect "chrome://resources/css/|../../ui/webui/resources/css"
--redirect "chrome://resources/html/|../../ui/webui/resources/html"
--redirect "chrome://resources/js/|../../ui/webui/resources/js" --redirect
"chrome://resources/polymer/v1_0/|../../third_party/polymer/v1_0/components-chromium"
--exclude strings.js --exclude chrome://downloads/strings.js --manifest-out
/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/chromium-62.0.3202.94/out/Release/gen/chrome/browser/resources/md_downloads/downloads_requestlist.txt
--root
/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/chromium-62.0.3202.94/chrome/browser/resources/md_downloads
--redirect
"chrome://downloads/|/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/chromium-62.0.3202.94/chrome/browser/resources/md_downloads"
--out-dir gen/chrome/browser/resources/md_downloads/bundled --shell
downloads.html --in-html downloads.html failed:
/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/chromium-62.0.3202.94/third_party/node/node_modules/polymer-bundler/lib/bin/polymer-bundler.js:178
|         const [prefix, path] = redirect.split('|');
|               ^
|
| SyntaxError: Unexpected token [
|     at exports.runInThisContext (vm.js:53:16)
|     at Module._compile (module.js:373:25)
|     at Object.Module._extensions..js (module.js:416:10)
|     at Module.load (module.js:343:32)
|     at Function.Module._load (module.js:300:12)
|     at Function.Module.runMain (module.js:441:10)
|     at startup (node.js:140:18)
|     at node.js:1043:3
|
| Traceback (most recent call last):
|   File "../../chrome/browser/resources/vulcanize_gn.py", line 252, in
<module>
|     main(sys.argv[1:])
|   File "../../chrome/browser/resources/vulcanize_gn.py", line 235, in main
|     manifest_out_path = _vulcanize(args.input, args)
|   File "../../chrome/browser/resources/vulcanize_gn.py", line 159, in
_vulcanize
|     ] + in_html_args)
|   File "../../third_party/node/node.py", line 28, in RunNode
|     raise
| TypeError: exceptions must be old-style classes or derived from
BaseException, not NoneType
| [468/30779] python ../../chrome/browser/resources/vulcanize_gn.py --host
history --input ../../chrome/browser/resources/md_history --out_folder
gen/chrome/browser/resources/md_history --depfile
gen/chrome/browser/resources/md_history/build.d --html_in_files app.html
lazy_load.html --html_out_files app.vulcanized.html
lazy_load.vulcanized.html --js_out_files app.crisper.js
lazy_load.crisper.js --exclude chrome://resources/html/util.html
chrome://history/constants.html
| FAILED: gen/chrome/browser/resources/md_history/app.vulcanized.html
gen/chrome/browser/resources/md_history/lazy_load.vulcanized.html
gen/chrome/browser/resources/md_history/app.crisper.js
gen/chrome/browser/resources/md_history/lazy_load.crisper.js
| python ../../chrome/browser/resources/vulcanize_gn.py --host history
--input ../../chrome/browser/resources/md_history --out_folder
gen/chrome/browser/resources/md_history --depfile
gen/chrome/browser/resources/md_history/build.d --html_in_files app.html
lazy_load.html --html_out_files app.vulcanized.html
lazy_load.vulcanized.html --js_out_files app.crisper.js
lazy_load.crisper.js --exclude chrome://resources/html/util.html
chrome://history/constants.html
| ../../third_party/node/linux/node-linux-x64/bin/node
../../third_party/node/node_modules/polymer-bundler/lib/bin/polymer-bundler
--exclude chrome://resources/html/polymer.html --exclude
chrome://resources/polymer/v1_0/polymer/polymer.html --exclude
chrome://resources/polymer/v1_0/polymer/polymer-micro.html --exclude
chrome://resources/polymer/v1_0/polymer/polymer-mini.html --exclude
chrome://resources/polymer/v1_0/web-animations-js/web-animations-next-lite.min.js
--exclude chrome://resources/css/roboto.css --exclude
chrome://resources/css/text_defaults.css --exclude
chrome://resources/css/text_defaults_md.css --exclude
chrome://resources/js/load_time_data.js --inline-css --inline-scripts
--rewrite-urls-in-templates --strip-comments --redirect
"chrome://resources/cr_components/|../../ui/webui/resources/cr_components"
--redirect
"chrome://resources/cr_elements/|../../ui/webui/resources/cr_elements"
--redirect "chrome://resources/css/|../../ui/webui/resources/css"
--redirect "chrome://resources/html/|../../ui/webui/resources/html"
--redirect "chrome://resources/js/|../../ui/webui/resources/js" --redirect
"chrome://resources/polymer/v1_0/|../../third_party/polymer/v1_0/components-chromium"
--exclude chrome://resources/html/util.html --exclude
chrome://history/constants.html --exclude strings.js --exclude
chrome://history/strings.js --manifest-out
/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/chromium-62.0.3202.94/out/Release/gen/chrome/browser/resources/md_history/history_requestlist.txt
--root
/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/chromium-62.0.3202.94/chrome/browser/resources/md_history
--redirect
"chrome://history/|/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/chromium-62.0.3202.94/chrome/browser/resources/md_history"
--out-dir gen/chrome/browser/resources/md_history/bundled --shell app.html
--in-html app.html --in-html lazy_load.html failed:
/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/chromium-62.0.3202.94/third_party/node/node_modules/polymer-bundler/lib/bin/polymer-bundler.js:178
|         const [prefix, path] = redirect.split('|');
|               ^
|
| SyntaxError: Unexpected token [
|     at exports.runInThisContext (vm.js:53:16)
|     at Module._compile (module.js:373:25)
|     at Object.Module._extensions..js (module.js:416:10)
|     at Module.load (module.js:343:32)
|     at Function.Module._load (module.js:300:12)
|     at Function.Module.runMain (module.js:441:10)
|     at startup (node.js:140:18)
|     at node.js:1043:3
|
| Traceback (most recent call last):
|   File "../../chrome/browser/resources/vulcanize_gn.py", line 252, in
<module>
|     main(sys.argv[1:])
|   File "../../chrome/browser/resources/vulcanize_gn.py", line 235, in main
|     manifest_out_path = _vulcanize(args.input, args)
|   File "../../chrome/browser/resources/vulcanize_gn.py", line 159, in
_vulcanize
|     ] + in_html_args)
|   File "../../third_party/node/node.py", line 28, in RunNode
|     raise
| TypeError: exceptions must be old-style classes or derived from
BaseException, not NoneType
| [469/30779] arm-beld-linux-gnueabi-g++  -march=armv7-a -marm -mfpu=neon
-mfloat-abi=hard
--sysroot=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot
-MMD -MF obj/base/base/shared_memory_tracker.o.d -DUSE_SYMBOLIZE
-DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=1 -DUSE_PANGO=1
-DUSE_CAIRO=1 -DUSE_GLIB=1 -DUSE_NSS_CERTS=1 -DUSE_X11=1 -DDISABLE_NACL
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTANT_MACROS
-D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=2 -DNDEBUG -DNVALGRIND
-DDYNAMIC_ANNOTATIONS_ENABLED=0 -DBASE_IMPLEMENTATION
-DGLIB_VERSION_MAX_ALLOWED=GLIB_VERSION_2_32
-DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_26 -I../.. -Igen
-I/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot/usr/include/glib-2.0
-I/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot/usr/lib/glib-2.0/include
-fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector
-funwind-tables -fPIC -pipe -pthread -march=armv7-a -mfloat-abi=hard
-mtune=generic-armv7-a -mfpu=neon -mthumb -Wall -Wno-psabi
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-missing-field-initializers -Wno-unused-parameter -fomit-frame-pointer
-g0 -fvisibility=hidden -O2 -fno-ident -fdata-sections -ffunction-sections
-std=gnu++14 -Wno-narrowing -fno-rtti -fno-exceptions
-fvisibility-inlines-hidden  -O2 -pipe -feliminate-unused-debug-types
-fdebug-prefix-map=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0=/usr/src/debug/chromium/62.0.3202.94-r0
-fdebug-prefix-map=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot-native=
-fdebug-prefix-map=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot=
-g1 -c ../../base/memory/shared_memory_tracker.cc -o
obj/base/base/shared_memory_tracker.o
| [470/30779] arm-beld-linux-gnueabi-g++  -march=armv7-a -marm -mfpu=neon
-mfloat-abi=hard
--sysroot=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot
-MMD -MF obj/chrome/common/ini_parser/ini_parser.o.d
-DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=1 -DUSE_PANGO=1
-DUSE_CAIRO=1 -DUSE_GLIB=1 -DUSE_NSS_CERTS=1 -DUSE_X11=1 -DDISABLE_NACL
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTANT_MACROS
-D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=2 -DNDEBUG -DNVALGRIND
-DDYNAMIC_ANNOTATIONS_ENABLED=0
-DGLIB_VERSION_MAX_ALLOWED=GLIB_VERSION_2_32
-DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_26 -I../.. -Igen
-I/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot/usr/include/glib-2.0
-I/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot/usr/lib/glib-2.0/include
-fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector
-funwind-tables -fPIC -pipe -pthread -march=armv7-a -mfloat-abi=hard
-mtune=generic-armv7-a -mfpu=neon -mthumb -Wall -Wno-psabi
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-missing-field-initializers -Wno-unused-parameter -O2 -fno-ident
-fdata-sections -ffunction-sections -fomit-frame-pointer -g0
-fvisibility=hidden -std=gnu++14 -Wno-narrowing -fno-rtti -fno-exceptions
-fvisibility-inlines-hidden  -O2 -pipe -feliminate-unused-debug-types
-fdebug-prefix-map=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0=/usr/src/debug/chromium/62.0.3202.94-r0
-fdebug-prefix-map=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot-native=
-fdebug-prefix-map=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot=
-g1 -c ../../chrome/common/ini_parser.cc -o
obj/chrome/common/ini_parser/ini_parser.o
| [471/30779] arm-beld-linux-gnueabi-g++  -march=armv7-a -marm -mfpu=neon
-mfloat-abi=hard
--sysroot=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot
-MMD -MF
obj/chrome/app/shutdown_signal_handlers/shutdown_signal_handlers_posix.o.d
-DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=1 -DUSE_PANGO=1
-DUSE_CAIRO=1 -DUSE_GLIB=1 -DUSE_NSS_CERTS=1 -DUSE_X11=1 -DDISABLE_NACL
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTANT_MACROS
-D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=2 -DNDEBUG -DNVALGRIND
-DDYNAMIC_ANNOTATIONS_ENABLED=0
-DGLIB_VERSION_MAX_ALLOWED=GLIB_VERSION_2_32
-DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_26 -I../.. -Igen
-I/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot/usr/include/glib-2.0
-I/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot/usr/lib/glib-2.0/include
-fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector
-funwind-tables -fPIC -pipe -pthread -march=armv7-a -mfloat-abi=hard
-mtune=generic-armv7-a -mfpu=neon -mthumb -Wall -Wno-psabi
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-missing-field-initializers -Wno-unused-parameter -O2 -fno-ident
-fdata-sections -ffunction-sections -fomit-frame-pointer -g0
-fvisibility=hidden -std=gnu++14 -Wno-narrowing -fno-rtti -fno-exceptions
-fvisibility-inlines-hidden  -O2 -pipe -feliminate-unused-debug-types
-fdebug-prefix-map=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0=/usr/src/debug/chromium/62.0.3202.94-r0
-fdebug-prefix-map=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot-native=
-fdebug-prefix-map=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot=
-g1 -c ../../chrome/app/shutdown_signal_handlers_posix.cc -o
obj/chrome/app/shutdown_signal_handlers/shutdown_signal_handlers_posix.o
| [472/30779] arm-beld-linux-gnueabi-g++  -march=armv7-a -marm -mfpu=neon
-mfloat-abi=hard
--sysroot=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot
-MMD -MF obj/base/base/activity_analyzer.o.d -DUSE_SYMBOLIZE
-DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=1 -DUSE_PANGO=1
-DUSE_CAIRO=1 -DUSE_GLIB=1 -DUSE_NSS_CERTS=1 -DUSE_X11=1 -DDISABLE_NACL
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTANT_MACROS
-D__STDC_FORMAT_MACROS -D_FORTIFY_SOURCE=2 -DNDEBUG -DNVALGRIND
-DDYNAMIC_ANNOTATIONS_ENABLED=0 -DBASE_IMPLEMENTATION
-DGLIB_VERSION_MAX_ALLOWED=GLIB_VERSION_2_32
-DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_26 -I../.. -Igen
-I/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot/usr/include/glib-2.0
-I/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot/usr/lib/glib-2.0/include
-fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector
-funwind-tables -fPIC -pipe -pthread -march=armv7-a -mfloat-abi=hard
-mtune=generic-armv7-a -mfpu=neon -mthumb -Wall -Wno-psabi
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-missing-field-initializers -Wno-unused-parameter -fomit-frame-pointer
-g0 -fvisibility=hidden -O2 -fno-ident -fdata-sections -ffunction-sections
-std=gnu++14 -Wno-narrowing -fno-rtti -fno-exceptions
-fvisibility-inlines-hidden  -O2 -pipe -feliminate-unused-debug-types
-fdebug-prefix-map=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0=/usr/src/debug/chromium/62.0.3202.94-r0
-fdebug-prefix-map=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot-native=
-fdebug-prefix-map=/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/recipe-sysroot=
-g1 -c ../../base/debug/activity_analyzer.cc -o
obj/base/base/activity_analyzer.o
| [473/30779] python
../../tools/metrics/histograms/generate_expired_histograms_array.py
-nchrome_metrics -ogen -Hchrome/browser/metrics/expired_histograms_array.h
../../tools/metrics/histograms/histograms.xml
../../tools/metrics/histograms/enums.xml
| ninja: build stopped: subcommand failed.
| WARNING:
/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/temp/run.do_compile.13059:1
exit 1 from 'ninja -v -j 8 chrome chrome_sandbox chromedriver'
| ERROR: Function failed: do_compile (log file is located at
/opt/yocto/pyro/build/tmp/work/armv7ahf-neon-imx-beld-linux-gnueabi/chromium/62.0.3202.94-r0/temp/log.do_compile.13059)
ERROR: Task
(/opt/yocto/pyro/meta-browser/recipes-browser/chromium/chromium_62.0.3202.94.bb:do_compile)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 3903 tasks of which 3721 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:

/opt/yocto/pyro/meta-browser/recipes-browser/chromium/chromium_62.0.3202.94.bb:
do_compile
Summary: There were 12 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


Which tag/commit is know to build correctly ?

Thank you !

Best regards

On Wed, Nov 15, 2017 at 8:34 PM, Khem Raj <raj.khem@gmail.com> wrote:

> >> As for musl: like I said in my original email and on GitHub, the musl
> >> build is currently broken. Carrying tons of patches in the recipe is an
> >> uphill battle, so unless someone takes the time to work with upstream I
> >> don't think it makes much sense to try to keep the build working.
> >
>
> musl is relatively newer and support for various components may not be
> upstream
> but it is getting there. There is no alternative than to carry patches
> as of now.
> and keep forward porting them as the versions advance. We may never get all
> of them upstreamed as is the case with many other large packages.
>
> > OK, fair enough, maybe Khem will again chime in and fix it for musl (in
> > the meantime we might blacklist it for musl that people don't wait for
> > the build to fail).
>
> The patches needs to be redone mostly. Its ok to blacklist it from now.
> I wish someone besides me would have cared too.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

