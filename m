Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id C6E3376F56
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 22:41:54 +0000 (UTC)
Received: by paczk9 with SMTP id zk9so4884964pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 15:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=8bSiFwLOsVJTSw0xjGmJoBqqqOaZRKCksrRl7iAqSuY=;
	b=NkVVxamDr7zveLqkGy2b3on0Ss86O6mWO2JOvwjV7YP87oHMjNnOCBPHI7UI4SQngg
	aP5jvcn6zNhBeAhuKbiRZz12EyZwMF+op3/yvz3ieMy/HuH2UZpm5s/3Ckq8IF+h2/dQ
	Mq/TzKCMSxebbpV/9j4EZnRvWDqKq7Lolm6fUOPX43FLMpD1L6f8Pv2Y957n31ZrFQmY
	4kNV5qJgJDLtvc8xa+YYvKjAPADNeDW5k9OJyxPlgV9KyPwA3xdEWfM09nF83LZkR/ku
	5u/2me7rwxymG6XFQXT13sd3I0e7oVx+h213jmoQDkw0ElEyYWYJYQKNgDu+Q8EsMAx8
	Tv2w==
X-Received: by 10.66.146.132 with SMTP id tc4mr41000618pab.124.1441060914670; 
	Mon, 31 Aug 2015 15:41:54 -0700 (PDT)
Received: from [10.22.11.207] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	zn9sm15813682pac.11.2015.08.31.15.41.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Aug 2015 15:41:53 -0700 (PDT)
Message-ID: <55E4D830.3090105@gmail.com>
Date: Mon, 31 Aug 2015 15:41:52 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1441050036-27596-1-git-send-email-haris.okanovic@ni.com>
In-Reply-To: <1441050036-27596-1-git-send-email-haris.okanovic@ni.com>
Subject: Re: [meta-security] [PATCH] tripwire: Fix path to nano in default twcfg.txt
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
X-List-Received-Date: Mon, 31 Aug 2015 22:41:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

merged.

thanks,
Armin

On 08/31/2015 12:40 PM, Haris Okanovic wrote:
> Nano is installed under /usr/bin/, not /bin/.
> 
> Installed Tripwire on a Fido image and successfully ran
> `tripwire --update` to invoke text editor.
> 
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> ---
>  recipes-security/tripwire/files/twcfg.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-security/tripwire/files/twcfg.txt b/recipes-security/tripwire/files/twcfg.txt
> index 131b097..224e920 100644
> --- a/recipes-security/tripwire/files/twcfg.txt
> +++ b/recipes-security/tripwire/files/twcfg.txt
> @@ -4,7 +4,7 @@ DBFILE                 =/var/lib/tripwire/$(HOSTNAME).twd
>  REPORTFILE             =/var/lib/tripwire/report/$(HOSTNAME)-$(DATE).twr
>  SITEKEYFILE            =/etc/tripwire/site.key
>  LOCALKEYFILE           =/etc/tripwire/$(HOSTNAME)-local.key
> -EDITOR                 =/bin/nano
> +EDITOR                 =/usr/bin/nano
>  LATEPROMPTING          =false
>  LOOSEDIRECTORYCHECKING =false
>  MAILNOVIOLATIONS       =true
> 

