Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 33611731F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:41:16 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id x75so12463673vke.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=6EieWefUwUcR0NxSiBxZauK/tuVFokeFReagxjxqOWM=;
	b=qnUMvEogEd7uQZoJYg+uWa6gCunFUvrGzZaqqm3Am7Ms8RPQ7GwFbCqU3M4bR6MGwa
	OJ0kWjnJiSDMcThf8N3oD3b6iqh+83T/J0dh4wwN1XGoFMxXmjymArvoSqTY79MjR9Wc
	bjfVWo254dAUw7Kq+tFGOdR7yCk3UXdtf/MGyWzUt7TqYAEJOPxOTLnVrJ9/bvLxFWh9
	J5EEVdpU/lFjG0WrtoPZVe9SKT2ouZ1B17EJbKAR+CZERLWFT1cvMXWuNOQqFNo15ufP
	Nln52lavk1N0Q77t3/4atqDTR8/DarziOBJrz5eXmLfIUJVPpvH22Y1Q+x5DLPYznu7e
	H2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=6EieWefUwUcR0NxSiBxZauK/tuVFokeFReagxjxqOWM=;
	b=ZJ69ZV34ZHURGCnFSKiL6jd8byLjiUXNt5ojfLMp1RzvEiw1Wx0aW0PNOS3R+DZw9Y
	hu9y9pVEg9BlA1GTnQnaIsMjsaTQUz7yUDdQ2v1UTdQoIHzpn87t9xi27Bxq+6gsfn6M
	BV27yzRffsMtGLoxBVCtRyV3yk9Za071zYRNft41Sb4EJmh877WqS4Bh6q08KoVmw+D7
	IpZPoT1yNQ8Q727oTUK/yC6XALgRGear3y7dREtJ7ubcJpE2r1BlFBpPzZ8oWxFY65Vo
	+abbpvsECPuNjnFvcAuEK9fNrVh0c1GFl5oDdHdXwev314U6JoqMfoyyTXWc5NqipKG/
	jhXQ==
X-Gm-Message-State: AMke39mw3e4LjwKH4+f731TZrH9iZUdS2OSLLsRI6/RvyHHORBvdGF18DG4dKRFwNh1PtJPQLxdLsB1yO+2cJw==
X-Received: by 10.31.204.197 with SMTP id c188mr1440012vkg.31.1487259676631;
	Thu, 16 Feb 2017 07:41:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Thu, 16 Feb 2017 07:40:46 -0800 (PST)
In-Reply-To: <CALwQErrncghs0kw=JXCHHFbwZWN4f=9K4t2nH+Qdv=d1zf1WPw@mail.gmail.com>
References: <CALwQErrncghs0kw=JXCHHFbwZWN4f=9K4t2nH+Qdv=d1zf1WPw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Feb 2017 07:40:46 -0800
Message-ID: <CAMKF1spszaA1G0aMSzDXZ0uA56nFty4L=XPakXTd-O6_fExyEQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Query regarding segfault during gstreamer playback with libx32
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
X-List-Received-Date: Thu, 16 Feb 2017 15:41:17 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 16, 2017 at 2:28 AM, Shrikant Bobade
<bobadeshrikant@gmail.com> wrote:
> Hi All,
>
> I have prepared core-image-sato from poky: morty:
> 6a1f33cc40bfac33cf030fe41e1a8efd1e5fad6f HEAD with libx32 support w.r.to
> section 4.6.3 under
> http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html#support ,
> while using gst. playback I am getting segfault, below are the setup
> details & logs. Dose anyone else faced similar issue?
>
> Thanks
> Shrikant
>
>
> 1.with libx32 support: added below stuff to local.conf
>
> MACHINE = "qemux86-64"
> DEFAULTTUNE = "x86-64-x32"
> baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) \
>          or 'INVALID'), True) or 'lib'}"
>
> 2. gstreamer1.0-plugins-good/base/bad available with image.
>
> 3. build conf:
> Build Configuration:
> BB_VERSION        = "1.32.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "universal-4.8"
> TARGET_SYS        = "x86_64-poky-linux-gnux32"
> MACHINE           = "qemux86-64"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.2.1"
> TUNE_FEATURES     = "mx32"
> TARGET_FPU        = ""
> meta
> meta-poky
> meta-yocto-bsp    = "morty:6a1f33cc40bfac33cf030fe41e1a8efd1e5fad6f"
>
> 4. bt log
> #0  0xf67ef8fd in poll () from /libx32/libc.so.6
> #1  0xf6d04eb5 in ?? () from /usr/libx32/libglib-2.0.so.0
> #2  0xf6d05222 in g_main_loop_run () from /usr/libx32/libglib-2.0.so.0
> #3  0xf724f01e in gst_bus_poll () from /usr/libx32/libgstreamer-1.0.so.0
> #4  0x00403a78 in ?? ()
> #5  0x00402a25 in ?? ()
> #6  0xf672e54d in __libc_start_main () from /libx32/libc.so.6
> #7  0x00403048 in ?? ()
>

may be you can add debug info to image to get better trace.

