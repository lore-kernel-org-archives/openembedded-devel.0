Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id AEFD974D0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 12:33:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l15-v6so1894563wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 05:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=6xRsFrLTwXR8U6PCBeVefcjm33LaL2pvVCCGl7HK51Y=;
	b=WU1IgOOczvY96SpJ67hTOQS8RPpfjVWwecul92VFM0JgpqAzsTIoseIIQv1yikY1pP
	KvA48lVv803LGgeAIyg8tPMVb2v1mFqCStzyISAh0sb60quUXEiWORy0IOReSHmU1cy3
	p0ylXPMkp54ApdvSooPw0vyFeYjyCZjGnC+Bf0WKjyyiO6GivtYzc3muAd9V++fF54NL
	be9uhHmbDvTT7FI5cUSHgJHb1DvYLRXKn7vtQg1tlzBD+uhSm2N6TB0kbVTvADX1BfNM
	C2oJ5dBeA9pUYcfiXojmbEdiUFJqhXO+KI9aCTozT3LODzoZtIef6x/1qljPy1A+m7V0
	c/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=6xRsFrLTwXR8U6PCBeVefcjm33LaL2pvVCCGl7HK51Y=;
	b=RQUVHlOS3m6O2TkVVMi9t0X/Xdom/mGkAtdCnQJyWeq6jjabH9q7+04TtyiUE5IIE4
	uILZIQxbz+RWKi0pFbiN83hHIO08N/EjUrY2rK+ocNhnZgY0x+vluiAzJcv/WUupSGzG
	ll8Y49Wa23L5gbjpeNt+k0B1rcTnyH2O4UqplxvWaZY3XJP7Fg1m3nbyByVpjpcywShm
	BzeSDIOANCYWEcZcQfuMyOZfxXKhC7nTzjl8ItF7qRqc6/3KwAu1hbyFrBJHERqdUBT8
	wZk0MG4zx1tfbv49Z4mmn7UrpeJCZ5eZAcFEWT7T2IAXXqF7hsHCou4Vb3a28QGLKtM8
	rS9Q==
X-Gm-Message-State: APt69E22s1uVIA5vBqGDX/jq1BjgzySfjVxFhTvJlYf6sNt+Mopl2O9K
	6conBMh+NZbhHigYiHyLXEgjJywKlPumUpE+B60wDw==
X-Google-Smtp-Source: AAOMgpeTRnfytnkYtInJj+vxUfDrDJlIHAolw3E72uP+cpS1putfbdKRK3OAZj4SpY1q5qXtiUj99WOkoKQVvS04QUA=
X-Received: by 2002:a1c:a342:: with SMTP id
	m63-v6mr1594729wme.141.1530275594023; 
	Fri, 29 Jun 2018 05:33:14 -0700 (PDT)
MIME-Version: 1.0
From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 29 Jun 2018 14:33:02 +0200
Message-ID: <CAAfyv37AbvjKMnu=N38KxfJtRLFzAU=0CVFSpi64LpZgG6KTag@mail.gmail.com>
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: meta-java openjdk-8 fails to compile for beaglebone
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
X-List-Received-Date: Fri, 29 Jun 2018 12:33:14 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm trying to compile openjdk-8 from actual meta-java master (I'm
using rocko poky though).
I basically copy content of openjdk to custom layer and added small
bbappend with following content:

DEPENDS += "cups libxrender xtst libxt"

as without that when building with X11 configure phase fails. But
during compilation I get this error:

i/openjdk-8/162b12-r0/build/jdk/gensrc_headers.BUILD_JDK.tmp
@/home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/classes/_the.BUILD_JDK_batch.tmp
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/XRenderPictFormat.java:8:
error: cannot find symbol
| public class XRenderPictFormat extends XWrapperBase {
|                                        ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/XRenderDirectFormat.java:8:
error: cannot find symbol
| public class XRenderDirectFormat extends XWrapperBase {
|                                          ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/XVisibilityEvent.java:8:
error: cannot find symbol
| public class XVisibilityEvent extends XWrapperBase {
|                                       ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/XkbExtensionDeviceNotifyEvent.java:8:
error: cannot find symbol
| public class XkbExtensionDeviceNotifyEvent extends XWrapperBase {
|                                                    ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/AwtGraphicsConfigData.java:8:
error: cannot find symbol
| public class AwtGraphicsConfigData extends XWrapperBase {
|                                            ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/XVisualInfo.java:8:
error: cannot find symbol
| public class XVisualInfo extends XWrapperBase {
|                                  ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/awtImageData.java:8:
error: cannot find symbol
| public class awtImageData extends XWrapperBase {
|                                   ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/ColorData.java:8:
error: cannot find symbol
| public class ColorData extends XWrapperBase {
|                                ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/XPixmapFormatValues.java:8:
error: cannot find symbol
| public class XPixmapFormatValues extends XWrapperBase {
|                                          ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/ColorEntry.java:8:
error: cannot find symbol
| public class ColorEntry extends XWrapperBase {
|                                 ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/XKeymapEvent.java:8:
error: cannot find symbol
| public class XKeymapEvent extends XWrapperBase {
|                                   ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/AwtScreenData.java:8:
error: cannot find symbol
| public class AwtScreenData extends XWrapperBase {
|                                    ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/XColormapEvent.java:8:
error: cannot find symbol
| public class XColormapEvent extends XWrapperBase {
|                                     ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/XEvent.java:8:
error: cannot find symbol
| public class XEvent extends XWrapperBase {
|                             ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/XAnyEvent.java:8:
error: cannot find symbol
| public class XAnyEvent extends XWrapperBase {
|                                ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/XKeyEvent.java:8:
error: cannot find symbol
| public class XKeyEvent extends XWrapperBase {
|                                ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/XButtonEvent.java:8:
error: cannot find symbol
| public class XButtonEvent extends XWrapperBase {
|                                   ^
|   symbol: class XWrapperBase
| /home/marek/projects/yocto/build-test/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-8/162b12-r0/build/jdk/gensrc/sun/awt/X11/XMotionEvent.java:8:
error: cannot find symbol

any ideas what to check, update? Also I plan to post dependency patch
with X11 missing dependencies. Thanks.

BR,

marek
-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

