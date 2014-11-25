Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9961570A7E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 21:14:08 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id g10so1312073pdj.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 13:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=n50rKsB17FnQbct3TUTMzDAgZPoNly+i292erVvqRQk=;
	b=b56noIHKADX898m9ELP40o1gXTMJ+3kD+f1ZUC+pIo1dSVK9i2XmPWeQejltGoS5gF
	ykN8WhNz7sHucuYPZ4XGJbyQ4yXdIwLn63BDqbMgmqH/NMG8whbkin8lfm6laC4Sw2cs
	G6qVbypwNOxLnAiHOSwWc4haD/SLEf4qwtWIhnmmjuV2doqgIh2asw7wtAZINjMH4pk1
	n4hGtCfJI6hJ8oYn6aqxZ6IIy2bMcSBgvlPjDrwjv8pTnJSGKCRmPDAxwEWgbqPpRKjK
	6zak2a+H1l5wWFrp2nXbS6o5rM9qQI0FFY3rbQ7Fon9/8/7lzrPAoV8bFnf7ATcaPW2d
	KdDw==
X-Gm-Message-State: ALoCoQm/amyU0+evqjwAISaEVss4pHxN2rek6BNCYbEvpZnJ+/nTFwVUHhNHICdh1kLOICi2sn0J
X-Received: by 10.70.63.73 with SMTP id e9mr47019075pds.50.1416950048719;
	Tue, 25 Nov 2014 13:14:08 -0800 (PST)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id bn13sm2371550pdb.4.2014.11.25.13.14.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Nov 2014 13:14:08 -0800 (PST)
Message-ID: <5474F112.2080505@mvista.com>
Date: Tue, 25 Nov 2014 13:13:54 -0800
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: "javier.viguera@digi.com >> Javier Viguera" <javier.viguera@digi.com>
References: <1416939435-30118-1-git-send-email-javier.viguera@digi.com>
In-Reply-To: <1416939435-30118-1-git-send-email-javier.viguera@digi.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][master][dizzy]PATCH] xserver-common: disable TCP connections
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
X-List-Received-Date: Tue, 25 Nov 2014 21:14:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Javier,

What is the disposition of the patch?

There is a recommend format, see:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations

please resubmit once correct.

regards,
- Armin

On 11/25/2014 10:17 AM, Javier Viguera wrote:
> For security reasons disable TCP connections to the xserver.
>
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> ---
>   ...15-xserver-common-disable-TCP-connections.patch | 22 ++++++++++++++++++++++
>   .../xserver-common/xserver-common_1.34.bb          |  1 +
>   2 files changed, 23 insertions(+)
>   create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
>
> diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
> new file mode 100644
> index 000000000000..0af8030160e2
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
> @@ -0,0 +1,22 @@
> +From: Javier Viguera <javier.viguera@digi.com>
> +Date: Tue, 25 Nov 2014 18:47:12 +0100
> +Subject: [PATCH] xserver-common: disable TCP connections
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

