Return-Path: <net147@gmail.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id B026D6E750
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 03:13:45 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id j15so1968683qaq.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 20:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=VmNXK+MZsftRTjRcarJmugTkDGsMsY2+IfLXmx3gQ98=;
	b=FgqNnDT9er4CTpta6ILXldjKhMDrjOsyrz1LyntnjigtqDmp7VlmQmYW9ShEps26SX
	S0n9uubqidXAnabY3TOCufSljB2IaqCeO1v5W8zZ+VG94SgGkvrNvKIWAIb4lsp3cwnH
	VjFh3YhPHgYneQcq+u3ih893QPAnI+fXuDnrhGz9QJwUdd6Uu27InlijjIk8pyE4zTzl
	ubmzzRD+Qm6TjpHMPFSyc0usolJBtT0HhvcwuSCHYLns8Bo5UYlJHmHrp/99Z7M3DnWf
	x7tW8vG7zx5T8KME9l2INBgLk6j1meESwnPwgPNoj1+SmliWLGj67roBkfKXH7HVEw7o
	12aw==
MIME-Version: 1.0
X-Received: by 10.224.93.10 with SMTP id t10mr6990073qam.82.1394766826934;
	Thu, 13 Mar 2014 20:13:46 -0700 (PDT)
Received: by 10.96.33.35 with HTTP; Thu, 13 Mar 2014 20:13:46 -0700 (PDT)
In-Reply-To: <CAP9ODKpSGubOE6p7=Z=RprvWEkgj=GPsEyU68rbNVQTXHhRyhA@mail.gmail.com>
References: <1394664760-8615-1-git-send-email-net147@gmail.com>
	<1394664760-8615-2-git-send-email-net147@gmail.com>
	<CAP9ODKpSGubOE6p7=Z=RprvWEkgj=GPsEyU68rbNVQTXHhRyhA@mail.gmail.com>
Date: Fri, 14 Mar 2014 14:13:46 +1100
Message-ID: <CANwerB1Hm8PjOZqw0b39LLeMM=r-EERP36q9h_H1=t3gGwx22Q@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v5 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Fri, 14 Mar 2014 03:13:48 -0000
Content-Type: text/plain; charset=UTF-8

On 13 March 2014 13:01, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Hello,
>
> On Wed, Mar 12, 2014 at 7:52 PM, Jonathan Liu <net147@gmail.com> wrote:
>> This adds the necessary target packages for development with all of the
>> Qt 5 modules.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>
> | Computing transaction...error: Can't install
> qtwayland-dev-5.2.1+git0+573d0ee5ba-r0.0@cortexa9hf_vfp_neon: no
> package provides qtwayland = 5.2.1+git0+573d0ee5ba-r0.0
> |
> | Saving cache...
> |
> | WARNING: /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/run.populate_sdk_image.29400:1
> exit 1 from
> |   smart --data-dir=${target_rootfs}/var/lib/smart install -y
> ${pkgs_to_install}
> | DEBUG: Python function do_populate_sdk finished
> | ERROR: Function failed: populate_sdk_image (log file is located at
> /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/lo

That's interesting, qtwayland package exists for me:
qtwayland_5.2.1+git0+573d0ee5ba-r0.0_cortexa7hf-vfp-vfpv4-neon.ipk
qtwayland-dbg_5.2.1+git0+573d0ee5ba-r0.0_cortexa7hf-vfp-vfpv4-neon.ipk
qtwayland-dev_5.2.1+git0+573d0ee5ba-r0.0_cortexa7hf-vfp-vfpv4-neon.ipk
qtwayland-examples_5.2.1+git0+573d0ee5ba-r0.0_cortexa7hf-vfp-vfpv4-neon.ipk
qtwayland-examples-dbg_5.2.1+git0+573d0ee5ba-r0.0_cortexa7hf-vfp-vfpv4-neon.ipk
qtwayland-mkspecs_5.2.1+git0+573d0ee5ba-r0.0_cortexa7hf-vfp-vfpv4-neon.ipk
qtwayland-plugins_5.2.1+git0+573d0ee5ba-r0.0_cortexa7hf-vfp-vfpv4-neon.ipk
qtwayland-plugins-dbg_5.2.1+git0+573d0ee5ba-r0.0_cortexa7hf-vfp-vfpv4-neon.ipk
qtwayland-tools_5.2.1+git0+573d0ee5ba-r0.0_cortexa7hf-vfp-vfpv4-neon.ipk
qtwayland-tools-dbg_5.2.1+git0+573d0ee5ba-r0.0_cortexa7hf-vfp-vfpv4-neon.ipk

qtwayland package contains:
./usr/lib/libQt5WaylandClient.so.5
./usr/lib/libQt5WaylandClient.so.5.3
./usr/lib/libQt5Compositor.so.5.3.0
./usr/lib/libQt5WaylandClient.so.5.3.0
./usr/lib/libQt5Compositor.so.5.3
./usr/lib/libQt5Compositor.so.5

I was able to build SDK with qtwayland included.

Regards,
Jonathan

>
> Please fix this and test the combinations of enable/disable features.
> They seem not well tested.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --

