Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yb0-f171.google.com (mail-yb0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2247178412
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 14:32:20 +0000 (UTC)
Received: by mail-yb0-f171.google.com with SMTP id r4so13709225ybd.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 06:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=GGlcgYCQJg6l6BGSA3Kt1Z4vghA0QJ3YHxDs0mlhCQE=;
	b=SqiVbJGfr9AGBceuBQThZULQcSdSiwqktCorGW562JU2+qo1rPIXK7RtdJffoQaDSq
	kqY1CnFYA2MafZM+OXahM21fa1eEJya8cSuyAGinN5/AyZQkHMGIToEP085vJxafl/hJ
	bQxv3qQKJf4hj4UI4eAYZxMUaBClUK6c7H3TUDcH/5yXqjY/OUUl3VxEQZcviitjqIMn
	d589ovgYasS+c6Z4cLajcSgfmCLQkZX9GWdvxrDPUCtrp5PynjxPTqdb4Sj/jiGQ9hSk
	lrq2ny1h8eqc7x3p2513BvTdaRRItkFFKB0t/gvCd7qo/EGDSUfk2U3fCH4zrkyZSoOM
	fLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=GGlcgYCQJg6l6BGSA3Kt1Z4vghA0QJ3YHxDs0mlhCQE=;
	b=HVWDH/fFvtSnuW01rwsA5lwyUEbHxf8ilYMyqW4lV7qiDsL4qo8yqzYXlbYmlaKK71
	4W+5Lx45ffq57ZWKt41QXNA4/e70vBpWuPOilcD4WV/moa0TNJtldWVq/+GnawNNge+e
	vVsvv7UTwWSKKL5Bxl1630N88Yws9ExH6RqvtJJTxugw3r5IF+pBsmFLk5PjZ3/3ldzx
	iqF49KQuOfbBhnbP4kh3Umo8KHnQ0KIT+SpXP0eAiLrnD0xr9rjaHBpgUlJR7sP9qQQE
	Ro2jewiWncDBCQ5+Yx18Ec7+c+GY8a6DZNCzv5VeTtz8zBE2ADnRtisJ/uv1UzhBY0iT
	bf4w==
X-Gm-Message-State: AKGB3mIKJWYai0f2HPsoCtVLB2wZu//gBErr76Fz0Nb7uelAKIFFHgUk
	BCk3dLSHCbamj8fKrpScxUhl3qBL/e1TBaTnMAk=
X-Google-Smtp-Source: ACJfBotNAdUaACXuPThREGGJwzTLYVa/hin2Cno5ZSJU/GmXFarZ6fO6rtvwV0zLJ6z7l0JFuoIqr0N3HVl2snRv7hY=
X-Received: by 10.37.203.198 with SMTP id b189mr2664434ybg.72.1513693941758;
	Tue, 19 Dec 2017 06:32:21 -0800 (PST)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Tue, 19 Dec 2017 14:32:11 +0000
Message-ID: <CAFeBWL4U2QEH=J_HkeNSdEttMsG05DZ-MC2_j=tqBSdR+b-MJg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] File name too long error while building qtwebengine
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
X-List-Received-Date: Tue, 19 Dec 2017 14:32:21 -0000
Content-Type: text/plain; charset="UTF-8"

I am on meta-qt5 master (# 06d1c47396508), but this happens on Rocko as
well.

*| ninja: error:
WriteFile(__third_party_WebKit_Source_bindings_modules_v8_bindings_modules_v8_generated_init_partial__home_build_tisdk-rocko-glibc_work_armv7ahf-neon-oe-linux-gnueabi_qtwebengine_5.9.2_gitAUTOINC_c11c2c8981_cfe8*
*c60903-r0_build_src_toolchain_target__rule.rsp): Unable to create file.
File name too long*
| ninja: build stopped: .
| Makefile.gn_run:321: recipe for target 'run_ninja' failed
| make[3]: *** [run_ninja] Error 1
| make[3]: Leaving directory
'/home/build/tisdk-rocko-glibc/work/armv7ahf-neon-oe-linux-gnueabi/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/build/src/core'
| Makefile:80: recipe for target 'sub-gn_run-pro-make_first' failed
| make[2]: *** [sub-gn_run-pro-make_first] Error 2
| make[2]: Leaving directory
'/home/build/tisdk-rocko-glibc/work/armv7ahf-neon-oe-linux-gnueabi/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/build/src/core'
| Makefile:78: recipe for target 'sub-core-make_first' failed
| make[1]: *** [sub-core-make_first] Error 2
| make[1]: Leaving directory
'/home/build/tisdk-rocko-glibc/work/armv7ahf-neon-oe-linux-gnueabi/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/build/src'
| Makefile:46: recipe for target 'sub-src-make_first' failed
| make: *** [sub-src-make_first] Error 2
| ERROR: oe_runmake failed
| WARNING:
/home/build/tisdk-rocko-glibc/work/armv7ahf-neon-oe-linux-gnueabi/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/temp/run.do_compile.35312:1
exit 1 from 'exit 1'
| ERROR: Function failed: do_compile (log file is located at
/home/build/tisdk-rocko-glibc/work/armv7ahf-neon-oe-linux-gnueabi/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/temp/log.do_compile.35312)
ERROR: Task
(/home/build/tisdk-rocko/sources/meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1972 tasks of which 1965 didn't need to be
rerun and 1 failed.

Adam

