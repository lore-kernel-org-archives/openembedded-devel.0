Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1H3dwd-0002WS-BI
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jan 2007 20:44:39 +0100
Received: by ug-out-1314.google.com with SMTP id e2so5651664ugf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jan 2007 11:43:05 -0800 (PST)
Received: by 10.78.185.16 with SMTP id i16mr7599663huf.1168198984937;
	Sun, 07 Jan 2007 11:43:04 -0800 (PST)
Received: by 10.78.39.8 with HTTP; Sun, 7 Jan 2007 11:43:04 -0800 (PST)
Message-ID: <432beae0701071143t4fe066e6mfa7961c7cd9cc7d4@mail.gmail.com>
Date: Sun, 7 Jan 2007 11:43:04 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1168146083.2742.8.camel@dollar.3rdshift.com>
MIME-Version: 1.0
References: <1168146083.2742.8.camel@dollar.3rdshift.com>
Subject: Re: qemu-native-0.8.2-r2 fails to build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Jan 2007 19:44:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/6/07, VLG <3rdshift@comcast.net> wrote:
> Hi,
>
> I am trying to build 'openzaurus-3.5.4.2' distro for 'collie' in the
> org.openembedded.oz354x/ without much luck:
>
> $ bitbake gpe-image
> --------------------------------------------------------------------------------
> OE Build Configuration:
> BB_VERSION     = "1.6.3"
> OE_REVISION    = "format_version "1"
>
> new_manifest [0000000000000000000000000000000000000004]
>
> old_revision [87c2d837ea5586793e98a4604630ceb3fa70dc7c]"
> TARGET_ARCH    = "arm"
> TARGET_OS      = "linux"
> MACHINE        = "collie"
> DISTRO         = "openzaurus"
> DISTRO_VERSION = "3.5.4.2-rc2"
> TARGET_FPU     = "soft"
>
> NOTE: package qemu-native-0.8.2: started
> NOTE: package qemu-native-0.8.2-r2: task do_fetch: started
> NOTE: package qemu-native-0.8.2-r2: task do_fetch: completed
> NOTE: package qemu-native-0.8.2-r2: task do_patch: started
> NOTE: Applying patch '2.6.17-linux-libc-headers-fix.patch'
> NOTE: Applying patch 'debug.patch'
> ERROR: function do_patchcmd failed
> ERROR: log data follows
> (/extra/stuff/tmp/work/qemu-native-0.8.2-r2/temp/log.do_patchcmd.22315)
> | Importing
> patch /extra/stuff/org.openembedded.oz354x/packages/qemu/qemu-native-0.8.2/./debug.patch (stored as debug.patch)
> | cp: cannot stat
> `/extra/stuff/org.openembedded.oz354x/packages/qemu/qemu-native-0.8.2/./debug.patch': No such file or directory
> | Failed to import patch debug.patch

That was my fault. I checked in some changes that I that didn't mean
to. Please pull and update again.

-- 
Justin Patrin


