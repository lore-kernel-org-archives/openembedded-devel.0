Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E0AE260017
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 14:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1MEgUsD028466; Mon, 22 Feb 2016 14:42:30 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aUJc4eRt3i2w; Mon, 22 Feb 2016 14:42:29 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1MEgPuI028462
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Feb 2016 14:42:26 GMT
Message-ID: <1456152145.28376.196.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org, Martin Jansa
	<martin.jansa@gmail.com>
Date: Mon, 22 Feb 2016 14:42:25 +0000
In-Reply-To: <1456146625-10100-5-git-send-email-Martin.Jansa@gmail.com>
References: <1456146625-10100-1-git-send-email-Martin.Jansa@gmail.com>
	<1456146625-10100-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH][meta-networking 5/5] dovecot: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 14:42:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-22 at 14:10 +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-networking/recipes
> -support/dovecot/dovecot_2.2.21.bb b/meta-networking/recipes
> -support/dovecot/dovecot_2.2.21.bb
> index 7fb8b44..f297dff 100644
> --- a/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
> +++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
> @@ -63,3 +63,5 @@ FILES_${PN}-staticdev += "${libdir}/dovecot/*/*.a"
>  FILES_${PN}-dev += "${libdir}/dovecot/*.so"
>  FILES_${PN}-dbg += "${libdir}/dovecot/*/.debug"
>  
> +# http://errors.yoctoproject.org/Errors/Details/35133/
> +PNBLACKLIST[dovecot] ?= "BROKEN: QA Issue: -dev package contains non
> -symlink .so""

Typo "" above causes a parsing failure with master-next.

Cheers,

Richard

