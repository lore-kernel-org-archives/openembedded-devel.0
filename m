Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id A68E760670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 13:23:11 +0000 (UTC)
Received: by mail-yk0-f181.google.com with SMTP id 142so9131339ykq.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 05:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=oL+8oHo0I6w3JylnOlKyFH9Kq1UWIPzNK6+SGVhWD2w=;
	b=GQaLhISsn4cuvE6cOtBvL2V++aJ+nj4EB/3lqhlwgCd01B0B56LduGU4cTk073efdH
	H8MAzKvtmYOlvr2AKjLbbuZRk788MhEoaNc4NvcreNAtBXwx2uIobTcnTg6plSwnT2sA
	U+eNH9eZ/oSFta52vVj1gm/+SnMHjJAqyL3pZxeOrPaA4VGABRd6EZjMAB0fKZwsncVd
	+uUZJQtzaKIHfo3TDxJe0ehy2vHdxfmzFIxfeLrMDV2a5zlnNmA2Bht4EC6U0Ih7CwhK
	FXy5SC72Hm/yReBGLS7oWQuRoMjBKpGN6EXi2869teglXBDDoglW/fxzh/XdJxQyK0Vl
	6hHQ==
MIME-Version: 1.0
X-Received: by 10.236.210.5 with SMTP id t5mr21839134yho.104.1421068991716;
	Mon, 12 Jan 2015 05:23:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Mon, 12 Jan 2015 05:23:11 -0800 (PST)
In-Reply-To: <1421065834-29221-1-git-send-email-akuster808@gmail.com>
References: <1421065834-29221-1-git-send-email-akuster808@gmail.com>
Date: Mon, 12 Jan 2015 11:23:11 -0200
X-Google-Sender-Auth: NcjyA3zvAnra5Sv76A2UrKL54wM
Message-ID: <CAP9ODKo+cLCxPfcfZpUOzmQ9cnQwb6FOccVnZ93aV6qgh3uvPg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][dizzy]PATCH] php5: update to later minor version 5.4.36
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
X-List-Received-Date: Mon, 12 Jan 2015 13:23:13 -0000
Content-Type: text/plain; charset=UTF-8

Yes. I am fine with those changes.

Those also fix some issues people where having using the RPM backend
with the generated PHP package, it seems. So please, go ahead.

On Mon, Jan 12, 2015 at 10:30 AM, Armin Kuster <akuster808@gmail.com> wrote:
> Dizzy is missing several CVE's and upgrading to a later version within the same
> series seems reasonable since most changes are bugfixes or Security releated.
>
> if you are ok with this approach, please Ack and I will stage this with the next series of updates I am working on.
>
> - armin
>
> 18-Dec-2014
> Core:
>     Upgraded crypt_blowfish to version 1.3.
>     Fixed bug #68545 (NULL pointer dereference in unserialize.c).
>     Fixed bug #68594 (Use after free vulnerability in unserialize()). (CVE-2014-8142)
>
> Mcrypt:
>     Fixed possible read after end of buffer and use after free.
>
> 13 Nov 2014
> Core:
>     Fixed bug #68365 (zend_mm_heap corrupted after memory overflow in zend_hash_copy).
> Fileinfo:
>     Fixed bug #68283 (fileinfo: out-of-bounds read in elf note headers). (CVE-2014-3710)
> GMP:
>     Fixed bug #63595 (GMP memory management conflicts with other libraries using GMP).
> PDO_pgsql:
>     Fixed bug #66584 (Segmentation fault on statement deallocation).
>
> 16 Oct 2014
> Fileinfo:
>     Fixed bug #66242 (libmagic: don't assume char is signed).
> Core:
>     Fixed bug #67985 (Incorrect last used array index copied to new array after unset).
>     Fixed bug #68044 (Integer overflow in unserialize() (32-bits only)). (CVE-2014-3669)
> cURL:
>     Fixed bug #68089 (NULL byte injection - cURL lib).
> EXIF:
>     Fixed bug #68113 (Heap corruption in exif_thumbnail()). (CVE-2014-3670)
> OpenSSL:
>     Reverted fixes for bug #41631, due to regressions.
> XMLRPC:
>     Fixed bug #68027 (Global buffer overflow in mkgmtime() function). (CVE-2014-3668)
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-devtools/php/{php_5.4.33.bb => php_5.4.36.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/php/{php_5.4.33.bb => php_5.4.36.bb} (97%)
>
> diff --git a/meta-oe/recipes-devtools/php/php_5.4.33.bb b/meta-oe/recipes-devtools/php/php_5.4.36.bb
> similarity index 97%
> rename from meta-oe/recipes-devtools/php/php_5.4.33.bb
> rename to meta-oe/recipes-devtools/php/php_5.4.36.bb
> index 6fdfe0f..43c7736 100644
> --- a/meta-oe/recipes-devtools/php/php_5.4.33.bb
> +++ b/meta-oe/recipes-devtools/php/php_5.4.36.bb
> @@ -30,8 +30,8 @@ SRC_URI_append_class-target += " \
>              file://php-fpm-apache.conf \
>            "
>
> -SRC_URI[md5sum] = "c6878bb1cdb46bfc1e1a5cd67a024737"
> -SRC_URI[sha256sum] = "1a75b2d0835e74b8886cd3980d9598a0e06691441bb7f91d19b74c2278e40bb5"
> +SRC_URI[md5sum] = "70e223be4bb460e465b7a9d7cb5b9cac"
> +SRC_URI[sha256sum] = "b0951608c3e8afb978a624c7f79a889980210f5258f666c1d997bd6491e13241"
>
>  S = "${WORKDIR}/php-${PV}"
>
> --
> 1.9.1
>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

