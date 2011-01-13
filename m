Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PdG5q-0001QD-6Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 06:51:30 +0100
Received: by pvd12 with SMTP id 12so207294pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 21:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=9sNiKBpRnGRPmriiX6giv+gHj7cYQEl8oZI6ZHEkLQk=;
	b=KOZW6GYxnXWyL7tHu/gABqQ0QhZPf5zVrZ4lbRMoKu+BwpjSfODFp3ex/e2i0ZSLgc
	EWq5s3KaaKHnKMyI/Sy+YHplv5uGiaDnjkL2sUTfRC9OgxRUd69Pha3ps1aPPhBAcEmU
	lTMbakrIgFh5aeUL7lBtjy7w7ux6lVkALCzkc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=FtosjLtbtTxgCJ6pEFGvfMqGY6L+4LUcaDMddR8CYk8UOlj13GsZUdRt/04pCQmFCV
	ZyvIv/jgs08QdjI3/YzAFmlgt9yDR4rPP8gsWFrs51Cz0mvKXD3b8Lc5xwR7jAcgCAy6
	B0DdPbq8hb3azjsLvy0CrPt/+8+4n/6Bb4x80=
Received: by 10.142.187.21 with SMTP id k21mr543226wff.261.1294897847005;
	Wed, 12 Jan 2011 21:50:47 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b11sm1879657wff.9.2011.01.12.21.50.45
	(version=SSLv3 cipher=RC4-MD5); Wed, 12 Jan 2011 21:50:46 -0800 (PST)
Message-ID: <4D2E92B1.1000404@gmail.com>
Date: Wed, 12 Jan 2011 21:50:41 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294867230-7827-1-git-send-email-eric@eukrea.com>
	<1294867230-7827-2-git-send-email-eric@eukrea.com>
In-Reply-To: <1294867230-7827-2-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 2/3] busybox 1.18.1: add latest fix
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
X-List-Received-Date: Thu, 13 Jan 2011 05:51:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/12/2011 1:20 PM, Eric Bénard wrote:
> * httpd: send correct mtime for .gz filesmaster
> * patch fetched from git as per blindvt request
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>   recipes/busybox/busybox_1.18.1.bb |    7 ++++---
>   1 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/busybox/busybox_1.18.1.bb b/recipes/busybox/busybox_1.18.1.bb
> index a2b4475..f337eef 100644
> --- a/recipes/busybox/busybox_1.18.1.bb
> +++ b/recipes/busybox/busybox_1.18.1.bb
> @@ -1,5 +1,5 @@
>   require busybox_1.1x.inc
> -PR = "${INC_PR}.4"
> +PR = "${INC_PR}.5"
>
>   SRC_URI += " \
>   	file://busybox-1.18.1-hush.patch \
> @@ -8,9 +8,10 @@ SRC_URI += " \
>   	file://busybox-1.18.1-mkswap.patch \
>   	file://busybox-1.18.1-warning.patch \
>   	file://busybox-1.18.1-modprobe-small.patch \
> -	file://busybox-1.18.1-tftp.patch \
> +	http://git.busybox.net/busybox/patch/id=8030a1484917d5b71d5ccd1a1d28a29da7a3d7f0;apply=yes;name=bb181-01 \
>   	"
>
>   SRC_URI[md5sum] = "f15fe752d8b7012aa5e59f83b88ccb1c"
>   SRC_URI[sha256sum] = "33eb25ea7b20c727c3af769256b21408a1ac1f927ff9f89a1f1e3767c18c9967"
> -
> +SRC_URI[bb181-01.md5sum] = "fe58a0e758c2581fdd2554186089b03b"
> +SRC_URI[bb181-01.sha256sum] = "f776d0b4ba525c62abe5e91f1432773eca92904cdecbdf48546a9271166cd896"



