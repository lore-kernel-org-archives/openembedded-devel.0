Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE1A60721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 01:59:04 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id xk12so1296100pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2016 18:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=bXRCzNquOxHETkxxIoROSjVp4gbEPIa3xYFeuRIIusE=;
	b=Y+LSCrcMA0AS49eoz5KiWinGJu1OhCAvoygL9c7UWnkLSnJa3RsV5IhBT6ZE/YPFl6
	WtA1INIaGjdIWehSUvx2IAFmHkk6aUN9EY8rGQDSJmxfQfyTPyCMsKklCo/LJKC3RUB3
	BimJLLSDCgIAH0U4inY9S85sXhuuKf4Gxf+Pg0yQsis738EJqWfKS0ot5Or5MTE/TBvQ
	ybkd6OgZUjeKzdE0q/HaLLknzpueDlRPFycIh82izk5YUaJRbjzQwwOAlUSdIGJxLIHo
	AIKF97Mc79LRsiXXtvzoOI2jNH/sRk2To1+szcPWJ4uQq2P8in8udjXy5JyG7ayUaEzR
	vcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=bXRCzNquOxHETkxxIoROSjVp4gbEPIa3xYFeuRIIusE=;
	b=BlxeUu1aK48hbuYOW4yY9HLxT6Cff2TQhVUlWQqQLnRfR9Pyk5LczWvlapqUA3UTy3
	JlQGiZPcPGp1Veoi6kPgUT56t7oflHDEqPTOcm2CucbDDK/Du1eY96zcFu5/vbHCjse1
	gSszztyJWIhhpwDVFPyHYfwz93SSiIxB3XIFgWQzH77QXlwxMq2WZ3d+5QsjkAa/5ckK
	ip7tZPvWRypROsA34TAKxqx22mcU3DV5TUaYRisf8tK3CwCEEvX5sWMSQj/V6SdjHEPu
	xQL/z9UucYVtZc4LggxK33lD9QAJdqqS8wbzwG+DY4a3Fn8WrXi20WkZsIh+u96E2hlx
	S37A==
X-Gm-Message-State: ALyK8tLIOBupSjyCioRwzfOtIipdW0JYiIubT+IcAjaPhvir3WdmmN5QvU777XPVd+TAePZEoG6+Kf7/PmgWEg==
MIME-Version: 1.0
X-Received: by 10.66.43.51 with SMTP id t19mr2907034pal.48.1464055144882; Mon,
	23 May 2016 18:59:04 -0700 (PDT)
Received: by 10.66.72.70 with HTTP; Mon, 23 May 2016 18:59:04 -0700 (PDT)
Date: Tue, 24 May 2016 10:59:04 +0900
Message-ID: <CACrLJgAY+=-AY-xUsY3jsCB6whHmXJrHa-EZLw6tiV-+cwt6+A@mail.gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-raspberrypi] userland fetch error
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
X-List-Received-Date: Tue, 24 May 2016 01:59:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Khem Raj



I=E2=80=99m trying to build raspberrypi with meta-raspberrypi but I got the=
 below
patch error.

I use latest commit in master branch of meta-raspberrypi. Could you check
this?



Thanks

Changhyeok



*$ bitbake userland*

ERROR: Command Error: exit status: 1  Output:

Applying patch 0004-wayland-Add-support-for-the-Wayland-winsys.patch

patching file .gitignore

patching file CMakeLists.txt

patching file README.md

patching file buildme

patching file interface/khronos/CMakeLists.txt

patching file interface/khronos/common/khrn_client.c

patching file interface/khronos/common/khrn_client.h

patching file interface/khronos/common/khrn_client_mangle.h

patching file interface/khronos/common/khrn_client_platform.h

patching file interface/khronos/common/khrn_client_unmangle.h

patching file interface/khronos/common/linux/khrn_client_platform_linux.c

patching file interface/khronos/common/linux/khrn_wayland.c

patching file interface/vmcs_host/vc_vchi_dispmanx.h

patching file interface/khronos/egl/egl_client.c

patching file interface/khronos/egl/egl_client_get_proc.c

patching file interface/khronos/egl/egl_client_surface.c

patching file interface/khronos/egl/egl_client_surface.h

patching file interface/khronos/egl/egl_int_impl.h

patching file interface/khronos/ext/egl_wayland.c

patching file interface/khronos/include/EGL/eglext.h

patching file interface/khronos/wayland-egl/wayland-egl-priv.h

patching file interface/khronos/wayland-egl/wayland-egl.c

patching file interface/khronos/wayland-egl/wayland-egl.pc.in

patching file interface/vmcs_host/CMakeLists.txt

patching file interface/vmcs_host/vc_dispmanx.h

patching file interface/vmcs_host/vc_vchi_dispmanx.c

patching file interface/vmcs_host/vc_vchi_dispmanx.h

Hunk #1 FAILED at 66.

1 out of 1 hunk FAILED -- rejects in file
interface/vmcs_host/vc_vchi_dispmanx.h

patching file interface/wayland/dispmanx.xml

patching file makefiles/cmake/Wayland.cmake

Patch 0004-wayland-Add-support-for-the-Wayland-winsys.patch does not apply
(enforce with -f)

ERROR: Function failed: patch_do_patch

ERROR: Logfile of failure stored in:
/home/changhyeok.bae/work/rpt/rasp3/BUILD/work/raspberrypi3-webos-linux-gnu=
eabi/userland/git-r5/temp/log.do_patch.36319

ERROR: Task 1
(/home/changhyeok.bae/work/rpt/rasp3/meta-raspberrypi/recipes-graphics/user=
land/
userland_git.bb, do_patch) failed with exit code '1'

