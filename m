Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id D825E744D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 14:28:03 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id o76-v6so3849248pfi.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 07:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NPgZCE45yGjwF69Dt0S/qp7GQc6QRtE5F3lQY9eEXlA=;
	b=EzLCRfY6cwzdzQcnSg0/Pd6vqO79qoVTihyzllImSK/VanpQEeVi/0hTGEblXuHhYD
	apqFCya/PTSXg1cwg/xUQKDfWHSZnVexK76yycHdLUeaXn/CR+o9iRPp0Gowx6+pFlI2
	T9PKjmQzyhEshTidEBXoGxoc579V0BxmxErJnaeq42N3MYk0pHNPm3a0Lm6fQAnht5fj
	g1zhpY3SC73bQ8SzasP3EDOerHFJrwVrMiL17w2t7TfU0ODoJO7BtIcgJW15aC5fq8sY
	uwmM7UWdj0uKoT1atQX5F7VkTYbVoAK9R7AXqgHRnET1779Lu80lEfX9e3efpTj2stVY
	3JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NPgZCE45yGjwF69Dt0S/qp7GQc6QRtE5F3lQY9eEXlA=;
	b=oigbDhDcf7RHeF0WyJbLj0NLgU8r9zRqkCurPCBJ+XWckC9rjLFHBp84dhtJgrrL+c
	MGVIsSVyRxv47Eir29uCobHlUxVZX5/MIECnEEaX/rzdfon4SspZOK7EKjClizaH0A8b
	szOJ3I1I7n+rwaxUWEoV30Js3DJs3p/MyvNQO1rwssbJ3pNqZzi2MKNq0DlABDShmLGT
	rxeaobHcnP52wLG4hrwLtklctLDTLmFnh7NXZg82ABiSPi8muiG7DaDVgPi2djniylGE
	PGM59xrSymikZ8YpWbqii1Jpr2+QPjHgSn0h3V9n+I+1VdJJL/VCki6b1EXQPNt1CUJy
	Vnvw==
X-Gm-Message-State: ALKqPwczVsT35La3blKYMPYjeSEoSe5JnU02WHLlsqKuTVhT4whZQGBh
	FD5UHCVcmEcTY3Fd66XOqQsxEVAiVK1l4Y3UbXg=
X-Google-Smtp-Source: AB8JxZqRfzqWdKhZkbaJQNAmnoUnSIl1C3r6QYSed+3UukvIbQKUfpWDnWVndshRM3jVO8SmD7haIqSiDvQ7xrXU9+c=
X-Received: by 2002:a63:7b10:: with SMTP id
	w16-v6mr3881961pgc.55.1526653684367; 
	Fri, 18 May 2018 07:28:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Fri, 18 May 2018 07:27:33
	-0700 (PDT)
In-Reply-To: <20180518111117.12241-1-pascal.bach@siemens.com>
References: <20180518111117.12241-1-pascal.bach@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 May 2018 07:27:33 -0700
Message-ID: <CAMKF1sof=d7U7L4Z9X+9rWr-6iXN5FS4AORvPyX1SG1r0hZ-WA@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rocksdb: update to 5.13.1
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
X-List-Received-Date: Fri, 18 May 2018 14:28:04 -0000
Content-Type: text/plain; charset="UTF-8"

Can you rebase/squash on top of

https://patchwork.openembedded.org/patch/150734/

On Fri, May 18, 2018 at 4:11 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> index 1e6cbae38..727488d1e 100644
> --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>                      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
>
> -SRCREV = "8969445642039566214d650cc6614849e7dd5e17"
> -SRCBRANCH = "5.12.fb"
> -PV = "5.12.2"
> +SRCREV = "c60df9d9e7629fe208a9b848293a5599f83d5e77"
> +SRCBRANCH = "5.13.fb"
> +PV = "5.13.1"
>
>  SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH}"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

