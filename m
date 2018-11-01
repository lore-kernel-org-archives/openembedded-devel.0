Return-Path: <stefan@agner.ch>
X-Greylist: delayed 421 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Nov 2018 11:07:14 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id C284879DCA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 11:07:14 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 7333E5C0491;
	Thu,  1 Nov 2018 12:00:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1541070012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=alSLKT8kq7d/AVeyn9nveXxtLZm4mbcS/5WUJrgDQIk=;
	b=Kja6ZLAbq7QEAPG11s/VLsxWfx9osaohqMbF2ad9QE5oBN0vq3u3vsKj4N9oxO9dC2PwhT
	hQlD2qTODl6XsRKT8IfXm2WrdTXkIyG8NcW4cFKtdIds7NGxekrT/LGQt6rfU7faGo5QYM
	MP2zrlwvWrsA2ZA7g6YESm/O93grQWs=
MIME-Version: 1.0
Date: Thu, 01 Nov 2018 12:00:12 +0100
From: Stefan Agner <stefan@agner.ch>
To: mingli.yu@windriver.com
In-Reply-To: <1541055886-448901-1-git-send-email-mingli.yu@windriver.com>
References: <1541055886-448901-1-git-send-email-mingli.yu@windriver.com>
Message-ID: <de490c25f64fe074ecbeef22a27c0053@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] lvm2: update SRC_URI
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
X-List-Received-Date: Thu, 01 Nov 2018 11:07:15 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 01.11.2018 08:04, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> Update SRC_URI for lvm2 as the previous
> one is invalid.
> 
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>

Hit that too, and the new URL works, so:

Tested-by: Stefan Agner <stefan.agner@toradex.com>

If they  move releases to old/ always maybe using a different source
would be better?

--
Stefan


> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc
> b/meta-oe/recipes-support/lvm2/lvm2.inc
> index 75f4d89..5728d83 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
>  
>  DEPENDS += "util-linux libaio"
>  
> -SRC_URI = "ftp://sources.redhat.com/pub/lvm2/LVM2.${PV}.tgz \
> +SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
>             file://lvm.conf \
>             file://0001-implement-libc-specific-reopen_stream.patch \
>             file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
> -- 
> 2.7.4

