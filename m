Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 08CC472221
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 03:44:45 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id ft15so12061740pdb.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 19:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=pvYd2+nUv86VQsDD+7h6D1xKvJHsRSqJcmHv7u1cBpw=;
	b=eAiHmHn+h4t0XPR1IzxfU4O19fVzRH7G2yvZ52x0mH5brQr+ti1KBMlM033zLoyqPm
	CtwJSIefgBeSsK9Kxn5ZXTuQEA1djpHRhuEywAr20e6f0tO+1ZG3ssXJQ/RSqiy80fVM
	l5URNR1TJ54i+gikNqmjhuz3KGlMYCswF2OTSaHFmbJXkqgZc4eEybrcpZPheV1b69qa
	mfZblEfQ/saNgFy2jAW+fC9yvezJ2IfMgAFf8QT8rvNFnyRGswT2bd8wkxmCpsVARdLv
	7DY97hbpjf9qe+mst2V3KaD0LrvoENHhMHNqXchepNCJ2V48tiXNIidMkQ1dCVWkmtBa
	MM2w==
X-Received: by 10.68.227.104 with SMTP id rz8mr2160213pbc.4.1417491885795;
	Mon, 01 Dec 2014 19:44:45 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:30ed:d4f1:6765:3ec7?
	([2601:c:9380:601:30ed:d4f1:6765:3ec7])
	by mx.google.com with ESMTPSA id fb3sm441065pbc.82.2014.12.01.19.44.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 19:44:44 -0800 (PST)
Message-ID: <547D35A8.4000700@gmail.com>
Date: Mon, 01 Dec 2014 19:44:40 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1416990854-11188-1-git-send-email-javier.viguera@digi.com>
In-Reply-To: <1416990854-11188-1-git-send-email-javier.viguera@digi.com>
Subject: Re: [meta-oe][master][dizzy]PATCH v2] xserver-common: disable TCP connections
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
X-List-Received-Date: Tue, 02 Dec 2014 03:44:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

thanks.

pulling in change for next round of merges.

- Armin

On 11/26/2014 12:34 AM, Javier Viguera wrote:
> For security reasons disable TCP connections to the xserver.
>
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> ---
>
> Notes:
>      v2:
>        * Add upstream-status
>
>   ...15-xserver-common-disable-TCP-connections.patch | 24 ++++++++++++++++++++++
>   .../xserver-common/xserver-common_1.34.bb          |  1 +
>   2 files changed, 25 insertions(+)
>   create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
>
> diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
> new file mode 100644
> index 000000000000..06df2618bd76
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
> @@ -0,0 +1,24 @@
> +From: Javier Viguera <javier.viguera@digi.com>
> +Date: Wed, 26 Nov 2014 09:24:44 +0100
> +Subject: [PATCH] xserver-common: disable TCP connections
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> +---
> + X11/xserver-common | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/X11/xserver-common b/X11/xserver-common
> +index 017e5aee1ab0..4dc48c412741 100644
> +--- a/X11/xserver-common
> ++++ b/X11/xserver-common
> +@@ -44,7 +44,7 @@ SCREEN_SIZE=`fallback_screen_arg`
> + export USER=root
> + export XSERVER_DEFAULT_ORIENTATION=normal
> +
> +-ARGS="-br -pn $INPUT_EXTRA_ARGS"
> ++ARGS="-br -pn -nolisten tcp $INPUT_EXTRA_ARGS"
> + DPI="100"
> + MOUSE=""
> + KDRIVEARGS=""
> diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
> index 12fff9ae9a0d..f5b1984cdde3 100644
> --- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
> +++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
> @@ -24,6 +24,7 @@ SRC_URI_append = " \
>       file://0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch \
>       file://0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch \
>       file://0014-Xserver-Start-Xsession-like-x11-common-does.patch \
> +    file://0015-xserver-common-disable-TCP-connections.patch \
>   "
>
>   do_install_append() {
>

