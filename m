Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pc0Yd-0003K0-25
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 20:04:03 +0100
Received: by pxi17 with SMTP id 17so3546805pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Jan 2011 11:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=Mx3LPtPLa5UUBfaVknbFoCA7JatrjOp7HLl/6r1u1ZY=;
	b=EloF8oD/MBp22jBQLzRFkQI1aSs4IdXx/nx20vF9GHl/vYgTzyauejw83+5UQu6pet
	qLCAShJ7tD4NbMmcN+RIb36yQTMj9dsBp71qK5JfdEFW5PkDt546HlnprtvoiYAkE0ym
	hkc2MFvDs63YCV2/VPDSSv/BqaXIMw/neD7Yk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=iroJ1zavDWgC8Ij7G68Tcqt4FnpceitCogBZu0xTLnVnU49BkV524PJI9Wiq985Z/7
	xzAtE64lh+OUWEo13SsZ685wsGiDMAFlfAQ54ifmswWUqFyUag5K5tok2gtkPrwqzT1+
	jmE0E8y4scGuQVOCjUm1duxoJpm8CHCHN/JtU=
Received: by 10.142.149.21 with SMTP id w21mr3679699wfd.168.1294599809417;
	Sun, 09 Jan 2011 11:03:29 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id e14sm6445550wfg.20.2011.01.09.11.03.28
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Jan 2011 11:03:28 -0800 (PST)
Message-ID: <4D2A0680.6030704@gmail.com>
Date: Sun, 09 Jan 2011 11:03:28 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294586079.4036.63.camel@mattotaupa>
In-Reply-To: <1294586079.4036.63.camel@mattotaupa>
Subject: Re: [PATCH] libcap_1.10: remove `do_stage()`
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
X-List-Received-Date: Sun, 09 Jan 2011 19:04:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/2011 7:14 AM, Paul Menzel wrote:
> Date: Sun, 9 Jan 2011 15:59:33 +0100
>
> Convert `libcap_1.10` to new staging system by removing `do_stage()` [1].
>
> This change is build tested with the following configuration and `PREFERRED_BINUTILS_VERSION = "2.21"`.
>
>          Build Configuration:
>          BB_VERSION        = "1.10.2"
>          METADATA_BRANCH   = "org.openembedded.dev"
>          METADATA_REVISION = "224c193"
>          TARGET_ARCH       = "arm"
>          TARGET_OS         = "linux-uclibceabi"
>          MACHINE           = "beagleboard"
>          DISTRO            = "minimal-uclibc"
>          DISTRO_VERSION    = "dev-snapshot-20110109"
>          TARGET_FPU        = "soft"
>
> [1] http://wiki.openembedded.org/index.php/Legacy_staging
>
> Signed-off-by: Paul Menzel<paul@gw90.de>

this patch is malformed and have spurious line breaks and other stuff. 
Please redo and send again

> ---
>   recipes/libcap/libcap_1.10.bb |    6 ------
>   1 files changed, 0 insertions(+), 6 deletions(-)
>
> diff --git a/recipes/libcap/libcap_1.10.bb b/recipes/libcap/libcap_1.10.bb
> index e6ca393..af5600b 100644
> --- a/recipes/libcap/libcap_1.10.bb
> +++ b/recipes/libcap/libcap_1.10.bb
> @@ -22,11 +22,5 @@ do_install() {
>          oe_libinstall -s -C libcap libcap ${D}${libdir}
>   }
>
> -do_stage() {
> -       install -d ${STAGING_INCDIR}/sys
> -       install -m 0644 libcap/include/sys/capability.h ${STAGING_INCDIR}/sys/
> -       oe_libinstall -s -C libcap libcap ${STAGING_LIBDIR}
> -}
> -
>   SRC_URI[md5sum] = "4426a413128142cab89eb2e6f13d8571"
>   SRC_URI[sha256sum] = "66c3f033fdc8f9ba0bd9d0ae2d1f2c11f9fa51bf0d1418e5cb75e29e6577a5bc"
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



