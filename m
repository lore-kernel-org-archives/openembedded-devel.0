Return-Path: <ml@communistcode.co.uk>
Received: from bmx2.eumx.net (bmx2.eumx.net [37.48.73.248])
	by mail.openembedded.org (Postfix) with ESMTP id A98BA60761
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 10:53:54 +0000 (UTC)
Received: from owm.eumx.net (unknown [10.1.1.70])
	by bmx2.eumx.net (Postfix) with ESMTPS id 5B42FDC8BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 10:50:42 +0000 (UTC)
Received: from localhost ([127.0.0.1]:50620 helo=owm.eumx.net)
	by owm.eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1a3M5i-0007Tl-Mr
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2015 10:53:54 +0000
Received: from [109.224.219.180] (port=48284 helo=[192.168.1.13])
	by owm.eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1a3M5i-0007Ti-D3 for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2015 10:53:54 +0000
To: openembedded-devel@lists.openembedded.org
References: <1448215516-13579-1-git-send-email-fathi.boudra@linaro.org>
From: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <565C2B09.2020000@communistcode.co.uk>
Date: Mon, 30 Nov 2015 10:55:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1448215516-13579-1-git-send-email-fathi.boudra@linaro.org>
Subject: Re: [meta-oe][PATCH v2] libsoc: upgrade from version 0.6 to 0.7
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
X-List-Received-Date: Mon, 30 Nov 2015 10:53:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/15 18:05, Fathi Boudra wrote:
> update SRCREV
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>   changes from v1:
>    * don't ship board configs
>    * don't oe-stylize
>
>   meta-oe/recipes-support/libsoc/{libsoc_0.6.bb => libsoc_0.7.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-support/libsoc/{libsoc_0.6.bb => libsoc_0.7.bb} (90%)
>
> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
> similarity index 90%
> rename from meta-oe/recipes-support/libsoc/libsoc_0.6.bb
> rename to meta-oe/recipes-support/libsoc/libsoc_0.7.bb
> index 79c171a..3b7436f 100644
> --- a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
> +++ b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
>
>   inherit autotools
>
> -SRCREV = "3643cf161a4b37bfbdfd05437166c4a29ac3ed8d"
> +SRCREV = "4d5c5af71e225cc4e792d2166da3f3e432b08735"
>   SRC_URI = "git://github.com/jackmitch/libsoc.git"
>
>   S = "${WORKDIR}/git"
>

There might be an issue building this with GCC 5.2, has this been tested? If it 
does break I can do a 0.7.1 release and we should use that with the GCC 5.2 fix 
included [1].

Cheers,
Jack

[1] 
https://github.com/jackmitch/libsoc/commit/0b863612540f67c032ef0efc417538443a00b285

