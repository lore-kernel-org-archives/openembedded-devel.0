Return-Path: <mario.goulart@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8952C734B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 19:35:46 +0000 (UTC)
Received: by iodt126 with SMTP id t126so31993607iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 12:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=kYbdyqKG1v5TiFNfhFZrYLVSZw9ojVkHWPSTP1gPjKY=;
	b=vhcObYwqq3UdRrCAks8bQuv7kuNPUYm+HMt+875Y6txFPICNPdAxoFgq+iODIVwaVW
	jnPHbmdSlW5LVa9WBal1lJXrm1twN/u91UGQ7nNemxEh0gl0QK6fVROUhT+KMHjMpPh9
	chA9D6CQHUyfG6+pBsr1DtbuscSeBOugGC42J9QaEjwXLKV1hXpdhsJrJ45/+MstD4GA
	sV6ma0JunEcd7M3XU40ps2/w4Slz6R2RYmU64l4/hEdpKQBbmOewsheC/RmDyFtaRuhl
	m4ghVqQxlMUDnTj9ozkYodjkSMQXMKbPvKu5G1pRMctMPiFp7yWMuhY0G8thPkFIciRU
	vHpg==
X-Received: by 10.107.37.142 with SMTP id l136mr6234299iol.126.1440617746261; 
	Wed, 26 Aug 2015 12:35:46 -0700 (PDT)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94])
	by smtp.gmail.com with ESMTPSA id k64sm50503iod.3.2015.08.26.12.35.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Aug 2015 12:35:45 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
References: <1440617672-7518-1-git-send-email-mario@ossystems.com.br>
Date: Wed, 26 Aug 2015 19:35:44 +0000
In-Reply-To: <1440617672-7518-1-git-send-email-mario@ossystems.com.br> (Mario
	Domenech Goulart's message of "Wed, 26 Aug 2015 16:34:32 -0300")
Message-ID: <87a8tdkflb.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] mariadb: fix tarball fetch URL
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
X-List-Received-Date: Wed, 26 Aug 2015 19:35:48 -0000
Content-Type: text/plain

On Wed, 26 Aug 2015 16:34:32 -0300 Mario Domenech Goulart <mario@ossystems.com.br> wrote:

> http://mirror.stshosting.co.uk/mariadb responds with a 404 error, so
> use http://archive.mariadb.org instead.

Please, also backport this patch to fido.

>
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> ---
>  meta-oe/recipes-support/mysql/mariadb.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
> index d2418e7..4e2a64c 100644
> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> @@ -4,7 +4,7 @@ SECTION = "libs"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  
> -SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
> +SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
>             file://fix-cmake-module-path.patch \
>             file://remove-bad-path.patch \
>             file://fix-mysqlclient-r-version.patch \

Best wishes.
Mario
-- 
http://www.ossystems.com.br

