Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PsRS1-0001SW-CL
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 04:01:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id C861B314E040
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 03:59:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id OdpoHzdIx960
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 03:59:44 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 99E73314E03F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 03:59:44 +0100 (CET)
Message-ID: <4D65C99F.5060909@opendreambox.org>
Date: Thu, 24 Feb 2011 03:59:43 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110208 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298511101-5170-1-git-send-email-denis@denix.org>
In-Reply-To: <1298511101-5170-1-git-send-email-denis@denix.org>
Subject: Re: [PATCH] busybox: fix udhcp check for NFS rootfs for new style /proc/mounts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Feb 2011 03:01:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Denys,

On 02/24/2011 02:31 AM, Denys Dmytriyenko wrote:
> diff --git a/recipes/busybox/busybox-1.13.2/udhcpc-new-nfsroot.patch b/recipes/busybox/busybox-1.13.2/udhcpc-new-nfsroot.patch
> new file mode 100644
> index 0000000..46aaab9
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.13.2/udhcpc-new-nfsroot.patch
> @@ -0,0 +1,16 @@
> +diff -uNr busybox-1.13.2.orig/examples/udhcp/simple.script busybox-1.13.2/examples/udhcp/simple.script
> +--- busybox-1.13.2.orig/examples/udhcp/simple.script	2011-02-23 00:30:32.000000000 -0500
> ++++ busybox-1.13.2/examples/udhcp/simple.script	2011-02-23 17:05:37.873381763 -0500
> +@@ -10,7 +10,12 @@
> + 
> + # return 0 if root is mounted on a network filesystem
> + root_is_nfs() {
> ++	# old style mounts
> + 	grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
> ++	if ! $? ; then
> ++		# new style mounts
> ++		grep -qe '^.*:.* / \(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
> ++	fi

Would "grep -qe '^\S\+ / \(nfs\|smbfs\|ncp\|coda\) ' /proc/mounts" work
for both cases?

> diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1.1x.inc
> index 7623944..aefa57f 100644
> --- a/recipes/busybox/busybox_1.1x.inc
> +++ b/recipes/busybox/busybox_1.1x.inc
> @@ -5,6 +5,7 @@ SRC_URI = "\
>    file://fdisk_nios2.patch \
>    file://udhcpscript.patch \
>    file://udhcpc-fix-nfsroot.patch \
> +  file://udhcpc-new-nfsroot.patch \

Should the two patches above be merged into a single patch?

Regards,
Andreas


