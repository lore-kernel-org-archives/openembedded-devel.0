Return-Path: <oram.embedded@gmail.com>
Received: from mail-yh0-f49.google.com (unknown [209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFEA65DBF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 04:57:24 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id c41so1242573yho.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 21:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=skX3pjCBqmbO2kI6wuy/OuGvm8fZgOuivJ9eY7aXTkU=;
	b=zswOd5/hdhJdFK/ZnU/1bL/t8ayHNIOWlwFsDPW+he+qox29CuVAFx4czy0h3t6oVP
	JwCBJYZqZ2eRvoICYNdMmMEw5MXaJO20d/aU5MNEMtm1DrABLe17tvJRcBlIcJhYUFtK
	3S3B2E/0Yw1nR4xtlE6lNyaa+9WGSupEdoXzWHY5HRY0qInzSBuuGfFl2abhuP5g3XpR
	11hZsjRO9XOoJbSWYnYCbAgHLjlBglqc7vq8bjTZQ/LfCzfVTNy2RQpIrTJNeVjLAUCZ
	oHNs3FdpteonpKXlTunoOvxi+oZ2UoLbYgEDK2O+cmRUdB+Qt6fcToKfRJt8AjSEdCRh
	3+eA==
MIME-Version: 1.0
X-Received: by 10.236.112.237 with SMTP id y73mr1684180yhg.103.1400043445646; 
	Tue, 13 May 2014 21:57:25 -0700 (PDT)
Sender: oram.embedded@gmail.com
Received: by 10.170.229.84 with HTTP; Tue, 13 May 2014 21:57:25 -0700 (PDT)
Date: Wed, 14 May 2014 16:57:25 +1200
X-Google-Sender-Auth: Pvd4iBzuwordyW4-qBfuYqVYqeE
Message-ID: <CAGw0TDP6FDCfCyWjj2Akm+BfNButm5q93kGC=G8-MKCNxTuG+A@mail.gmail.com>
From: Charles Oram <charles@oram.co.nz>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: freetype build error 'libfreetype.la: No such file or directory'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 May 2014 04:57:32 -0000
Content-Type: text/plain; charset=UTF-8

I am getting an error 'libfreetype.la: No such file or directory' (see log
file below) when building freetype 2.5.3
It builds fine if I revert to the revision with freetype 2.5.2
I'm wondering if there is an error in the arguments to libtool, because it
seems to be complaining that libfreetype.la doesn't exist, but isn't that a
file it is meant to be creating?
Has anyone else seen this error?

Last section of freetype/2.5.3-r0/temp/log_do_compile:
-------------------------------------------------------
...
...
|/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/apinames
-o/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftexport.sym
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/freetype.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ft2build.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftadvanc.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftautoh.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftbbox.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftbdf.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftbitmap.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftbzip2.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftcache.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftcffdrv.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftchapters.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftcid.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/fterrdef.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/fterrors.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftgasp.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftglyph.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftgxval.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftgzip.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftimage.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftincrem.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftlcdfil.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftlist.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftlzw.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftmac.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftmm.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftmodapi.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftmoderr.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftotval.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftoutln.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftpfr.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftrender.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftsizes.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftsnames.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftstroke.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftsynth.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftsystem.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/fttrigon.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftttdrv.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/fttypes.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftwinfnt.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ftxf86.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/t1tables.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ttnameid.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/tttables.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/tttags.h
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include/ttunpat.h
|rm -f builds/unix/freetype-config builds/unix/freetype-config.tmp
|sed -e 's|%LIBS_CONFIG%|-lfreetype -lharfbuzz|'               \
|        -e 's|%LIBSSTATIC_CONFIG%|-lfreetype -lharfbuzz|'   \
|        -e 's|%build_libtool_libs%||' \
|        -e 's|%exec_prefix%|/usr|'               \
|        -e 's|%ft_version%|17.2.11|'                 \
|        -e 's|%includedir%|/usr/include|'                 \
|        -e 's|%libdir%|/usr/lib|'                         \
|        -e 's|%prefix%|/usr|'                         \
|
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/builds/unix/
freetype-config.in                                                 \
|        > builds/unix/freetype-config.tmp
|chmod +x builds/unix/freetype-config.tmp
|chmod a-w builds/unix/freetype-config.tmp
|mv builds/unix/freetype-config.tmp builds/unix/freetype-config
|rm -f builds/unix/freetype2.pc builds/unix/freetype2.pc.tmp
|sed -e 's|%REQUIRES_PRIVATE%|harfbuzz >= 0.9.19|'     \
|        -e 's|%LIBS_PRIVATE%||'             \
|        -e 's|%build_libtool_libs%||' \
|        -e 's|%exec_prefix%|/usr|'               \
|        -e 's|%ft_version%|17.2.11|'                 \
|        -e 's|%includedir%|/usr/include|'                 \
|        -e 's|%libdir%|/usr/lib|'                         \
|        -e 's|%prefix%|/usr|'                         \
|
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/builds/unix/
freetype2.in                                                 \
|        > builds/unix/freetype2.pc.tmp
|chmod a-w builds/unix/freetype2.pc.tmp
|mv builds/unix/freetype2.pc.tmp builds/unix/freetype2.pc
|arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc
-march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon
-mtune=cortex-a9
--sysroot=/home/charles/fsl-community-bsp/build/tmp/sysroots/cubox-i
-pedantic -ansi
-I/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs
-I./builds/unix
-I/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/include
-c -Wall -O2 -pipe -g -feliminate-unused-debug-types
-I/home/charles/fsl-community-bsp/build/tmp/sysroots/cubox-i/usr/include/harfbuzz
-DFT_CONFIG_OPTION_USE_HARFBUZZ "-DFT_CONFIG_CONFIG_H=<ftconfig.h>"
-DFT2_BUILD_LIBRARY "-DFT_CONFIG_MODULES_H=<ftmodule.h>"
-I/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/src/psaux
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/src/psaux/psaux.c
-o
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/psaux.o
>/dev/null 2>&1
|/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/builds/unix/arm-poky-linux-gnueabi-libtool
--mode=link arm-poky-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork
-mfloat-abi=hard -mfpu=neon -mtune=cortex-a9
--sysroot=/home/charles/fsl-community-bsp/build/tmp/sysroots/cubox-i -o
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/
libfreetype.la
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftsystem.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftdebug.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftinit.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftbase.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftbbox.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftbdf.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftbitmap.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftcid.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftfstype.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftgasp.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftglyph.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftgxval.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftlcdfil.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftmm.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftotval.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftpatent.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftpfr.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftstroke.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftsynth.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/fttype1.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftwinfnt.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftxf86.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/truetype.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/type1.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/cff.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/type1cid.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/pfr.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/type42.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/winfnt.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/pcf.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/bdf.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/sfnt.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/autofit.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/pshinter.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/raster.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/smooth.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftcache.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftgzip.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftlzw.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/ftbzip2.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/psaux.lo
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/psnames.lo
-rpath /usr/lib -version-info 17:2:11 -Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed -lharfbuzz  -no-undefined
|/bin/grep:
/home/charles/fsl-community-bsp/build/tmp/sysroots/cubox-i/usr/lib/
libfreetype.la: No such file or directory
|sed: can't read
/home/charles/fsl-community-bsp/build/tmp/sysroots/cubox-i/usr/lib/
libfreetype.la: No such file or directory
|arm-poky-linux-gnueabi-libtool: link:
`/home/charles/fsl-community-bsp/build/tmp/sysroots/cubox-i/usr/lib/
libfreetype.la' is not a valid libtool archive
|make: ***
[/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/freetype-2.5.3/objs/
libfreetype.la] Error 1
|ERROR: oe_runmake failed
|WARNING: exit code 1 from a shell command.
|ERROR: Function failed: do_compile (log file is located at
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/freetype/2.5.3-r0/temp/log.do_compile.16497)

regards,
Charles

