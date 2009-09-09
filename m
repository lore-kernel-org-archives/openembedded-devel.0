Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MlMDw-0006FZ-ML
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 14:24:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 0B3191409721
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Sep 2009 14:17:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfTA6q2czYdo
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Sep 2009 14:17:21 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id D71BE1416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Sep 2009 14:17:21 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1252329016-10848-3-git-send-email-ihar.hrachyshka@gmail.com>
References: <1252329016-10848-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1252329016-10848-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1252329016-10848-3-git-send-email-ihar.hrachyshka@gmail.com>
Date: Wed, 09 Sep 2009 14:24:05 +0200
Message-Id: <1252499045.5887.11.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.90 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fixed checksum for tda1004x-firmware.
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
X-List-Received-Date: Wed, 09 Sep 2009 12:24:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Ihar Hrachyshka wrote:
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
>  conf/checksums.ini |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 053a2ad..bb075cc 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -18299,8 +18299,8 @@ md5=7fa369bff1031acbe4ca41f03bee7d02
>  sha256=53d2f92c3d14423b49c2ff077855cf3987d38def963c82fd26fba5de379ca540

If your patch will be applied, you would probably have to review
d5345f88b5ffdca098e0281f42f51e42ef43e79d and nearly completely revert
plus remove unzip-native from DEPENDS.

Warning: You cannot do it completely. There are recipes that call unzip
on auto-extract .exe file, and you have to keep my change there.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



