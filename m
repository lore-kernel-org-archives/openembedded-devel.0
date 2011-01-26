Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PiAWk-0001EG-55
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 19:55:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id B28BA314CC9B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 19:54:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id qb7zapEjdvOz
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 19:54:43 +0100 (CET)
Received: from [172.22.22.61] (ip-178-200-120-208.unitymediagroup.de
	[178.200.120.208])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 521C631474F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 19:54:43 +0100 (CET)
Message-ID: <4D406DF6.5070105@opendreambox.org>
Date: Wed, 26 Jan 2011 19:54:46 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101210 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296066116-10466-1-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1296066116-10466-1-git-send-email-rep.dot.nop@gmail.com>
Subject: Re: [PATCH 1/2] busybox: add group to -passwd package
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
X-List-Received-Date: Wed, 26 Jan 2011 18:55:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Bernhard,

On 01/26/2011 07:21 PM, Bernhard Reutner-Fischer wrote:
>  recipes/busybox/files/passwd     |    3 ---
>  recipes/busybox/files/shadow     |    3 ---

these two changes seem to have been included by mistake.

> diff --git a/recipes/busybox/files/passwd b/recipes/busybox/files/passwd
> index 64c9ab6..34921c3 100644
> --- a/recipes/busybox/files/passwd
> +++ b/recipes/busybox/files/passwd
> @@ -2,10 +2,7 @@ root:x:0:0:root:/root:/bin/sh
>  daemon:x:1:1:daemon:/usr/sbin:/bin/sh
>  bin:x:2:2:bin:/bin:/bin/sh
>  sys:x:3:3:sys:/dev:/bin/sh
> -sync:x:4:65534:sync:/bin:/bin/sync
>  man:x:6:12:man:/var/cache/man:/bin/sh
>  mail:x:8:8:mail:/var/mail:/bin/sh
>  www-data:x:33:33:www-data:/var/www:/bin/sh
> -backup:x:34:34:backup:/var/backups:/bin/sh
> -irc:x:39:39:ircd:/var/run/ircd:/bin/sh
>  nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
> diff --git a/recipes/busybox/files/shadow b/recipes/busybox/files/shadow
> index 25df693..e64a964 100644
> --- a/recipes/busybox/files/shadow
> +++ b/recipes/busybox/files/shadow
> @@ -2,10 +2,7 @@ root::14741:0:99999:7:::
>  daemon:*:14741:0:99999:7:::
>  bin:*:14741:0:99999:7:::
>  sys:*:14741:0:99999:7:::
> -sync:*:14741:0:99999:7:::
>  man:*:14741:0:99999:7:::
>  mail:*:14741:0:99999:7:::
>  www-data:*:14741:0:99999:7:::
> -backup:*:14741:0:99999:7:::
> -irc:*:14741:0:99999:7:::
>  nobody:*:14741:0:99999:7:::

Apart from that, the patch looks sane.

Regards,
Andreas



