Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with ESMTP id 980BB72F6F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:37:58 +0000 (UTC)
Received: (qmail 24351 invoked by uid 1003); 28 Feb 2017 14:37:59 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.116.166)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	28 Feb 2017 14:37:59 -0000
To: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-devel@lists.openembedded.org, jackie.huang@windriver.com
References: <1488108808-30079-1-git-send-email-mike.looijmans@topic.nl>
From: Philip Balister <philip@balister.org>
Message-ID: <474b3876-7b97-6303-cb88-a1b0175855c3@balister.org>
Date: Tue, 28 Feb 2017 09:37:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1488108808-30079-1-git-send-email-mike.looijmans@topic.nl>
Subject: Re: [PATCH][meta-filesystems] fuse: Remove unneeded RDEPENDS on util-linux-mount
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
X-List-Received-Date: Tue, 28 Feb 2017 14:38:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 02/26/2017 06:33 AM, Mike Looijmans wrote:
> Fuse claimed to need util-linux-mount at runtime, which isn't true. This
> drags util-linux-mount into any image that uses fuse.
> 
> Encountered no problems with busybox's mount command and fuse (and never
> had). Fuse doesn't call the "mount" program anywhere, so the dependency
> doesn't make sense anyway.

The RDEPEND was added by Jackie from Wind River in September 2015. Any
idea why it was needed then?

Philip

> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
> index 9a2dc11..153fcb4 100644
> --- a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
> +++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
> @@ -29,9 +29,6 @@ DEPENDS = "gettext-native"
>  
>  PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
>  
> -# Fusermount requires features from the util-linux version of mount.
> -RDEPENDS_${PN}_class-target += "util-linux-mount"
> -
>  RRECOMMENDS_${PN}_class-target = "kernel-module-fuse libulockmgr fuse-utils"
>  
>  FILES_${PN} += "${libdir}/libfuse.so.*"
> 

