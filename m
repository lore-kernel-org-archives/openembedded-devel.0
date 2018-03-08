Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB8A788BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2018 03:12:47 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id l4so1719623pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 19:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=zpGciBIpzZ/3uyJb6kbTlbxpG0gjyuK5RoVUCrX4D7M=;
	b=IFaI67KEhivqDA0gFcdMjqA+chNja1L430zrLdwz2uxDLw3/BAYf4U8kNN7NZ7oZKL
	JvH5wgIJM5AvnosePnqPHrpR8lESj6lCLI0W5Fai5nP2niNJPHEE57imQQ4smvYat32k
	An8A1sHKaiuRPSluWxSZnKj5/HqdHDll/3oBbMglluzkGpY0+p9cSNfNIUdlz7pJEABZ
	1tK80FvgErt/9Sae1BLDAmYZNcfq2TUc2BtKMdSiGlkCw/6LDIOfA8fsb06pn5wK1kKU
	91yVuZmKMAzDN7pt6JOdEJNa3ARe3bleMmz0b+/YCmfrlPxlslU8Qp4Mb3KdUtu5TWWn
	VLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=zpGciBIpzZ/3uyJb6kbTlbxpG0gjyuK5RoVUCrX4D7M=;
	b=CALOD8WuW1Har5T2GDdBIusZIOAeSGNl/r1NcL74ebATr/gTj8bxfGkyCLBpAE8j6R
	gSx2lsDsHNCPDDRfXtau4j+nUNmptxKiG0mX5AkttRDnAb5Vn+a2rFYCYRXGgcPJtzvV
	VaD8mwTUq3/l6FTC4vkCJgZs5txz3kqbDg3oz3+zQv0TaPswlomQqej3u3qbDsY7sqX3
	fh0Hm+/9nOg19i63W2uDvgxhXmaCW8s7KDSS/NzsoqjQ/AQsZkRjmERqyrqi6V6JeGRw
	/a3l38lrWY+sbdZhvgHOBHGmqvRAicT1NE+ZBc13Xypca9DFXeai9yGFwrLF4uRsq46T
	Y9eQ==
X-Gm-Message-State: APf1xPBYTcXkQXx+KpNYaR6YgCkU85eFqglMcPh8drLvQHwiZ7iDobaB
	L7FnaSjQTt61neay2BQCfV3v5A==
X-Google-Smtp-Source: AG47ELs7HQ9ArRvg7YW8+K3rP9riklMdSC6fItxtuCY3RP2u8RDWxOZTe0+wK30MPTGR51G0xIluQQ==
X-Received: by 10.99.116.90 with SMTP id e26mr19470940pgn.16.1520478768203;
	Wed, 07 Mar 2018 19:12:48 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:6d76:b853:98d2:431c?
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	t126sm31847622pgb.85.2018.03.07.19.12.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Mar 2018 19:12:46 -0800 (PST)
To: Derek Straka <derek@asterius.io>
References: <1520091651-25420-1-git-send-email-derek@asterius.io>
	<1284db2a-8cff-7f97-dc7b-dc17370167c6@gmail.com>
	<CADNbA1okmMSAE4ivTaKaX09i51rG4KiAFDUF2kp=DtZaAYF6AA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <365557a4-411d-353c-226c-b46187dfb4a5@gmail.com>
Date: Wed, 7 Mar 2018 19:12:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CADNbA1okmMSAE4ivTaKaX09i51rG4KiAFDUF2kp=DtZaAYF6AA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCHv3] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Thu, 08 Mar 2018 03:12:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 03/07/2018 01:09 PM, Derek Straka wrote:
> Feel free to drop that portion of the commit message or I can send
> another rev.

done. its in stagging/master-next

thanks,
Armin
>
> On Wed, Mar 7, 2018 at 2:42 PM, akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>
>
>     On 03/03/2018 07:40 AM, Derek Straka wrote:
>     > License-Update: Update the license checksum for copyright year
>     and verify the terms remain the same
>     >
>     > diff -u SQLAlchemy-1.1.15/LICENSE SQLAlchemy-1.1.17/LICENSE
>     > --- SQLAlchemy-1.1.15/LICENSE 2017-11-03 16:47:01.000000000 -0400
>     > +++ SQLAlchemy-1.1.17/LICENSE 2018-02-22 16:08:41.000000000 -0500
>     > @@ -1,6 +1,6 @@
>     >  This is the MIT license:
>     http://www.opensource.org/licenses/mit-license.php
>     <http://www.opensource.org/licenses/mit-license.php>
>     >
>     > -Copyright (c) 2005-2017 the SQLAlchemy authors and contributors
>     <see AUTHORS file>.
>     > +Copyright (c) 2005-2018 the SQLAlchemy authors and contributors
>     <see AUTHORS file>.
>     >  SQLAlchemy is a trademark of Michael Bayer.
>     >
>     >  Permission is hereby granted, free of charge, to any person
>     obtaining a copy of this
>     The above is confusing pw.sh as it thinks it a patch to be applied.
>
>     - armin
>     >
>     > Signed-off-by: Derek Straka <derek@asterius.io
>     <mailto:derek@asterius.io>>
>     > ---
>     >  meta-python/recipes-devtools/python/python-sqlalchemy.inc     
>          | 6 +++---
>     >  .../{python-sqlalchemy_1.1.15.bb
>     <http://python-sqlalchemy_1.1.15.bb> =>
>     python-sqlalchemy_1.1.17.bb <http://python-sqlalchemy_1.1.17.bb>} 
>       | 0
>     >  .../{python3-sqlalchemy_1.1.15.bb
>     <http://python3-sqlalchemy_1.1.15.bb> =>
>     python3-sqlalchemy_1.1.17.bb
>     <http://python3-sqlalchemy_1.1.17.bb>}  | 0
>     >  3 files changed, 3 insertions(+), 3 deletions(-)
>     >  rename
>     meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb
>     <http://python-sqlalchemy_1.1.15.bb> =>
>     python-sqlalchemy_1.1.17.bb <http://python-sqlalchemy_1.1.17.bb>}
>     (100%)
>     >  rename
>     meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb
>     <http://python3-sqlalchemy_1.1.15.bb> =>
>     python3-sqlalchemy_1.1.17.bb
>     <http://python3-sqlalchemy_1.1.17.bb>} (100%)
>     >
>     > diff --git
>     a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>     b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>     > index 2683a6a..0c191ae 100644
>     > --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>     > +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>     > @@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object
>     Relational Mapper that gives \
>     >  application developers the full power and flexibility of SQL"
>     >  HOMEPAGE = "http://www.sqlalchemy.org/"
>     >  LICENSE = "MIT"
>     > -LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
>     > +LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
>     >
>     >  PYPI_PACKAGE = "SQLAlchemy"
>     >  inherit pypi
>     >
>     > -SRC_URI[md5sum] = "077f9bd3339957f53068b5572a152674"
>     > -SRC_URI[sha256sum] =
>     "8b79a5ed91cdcb5abe97b0045664c55c140aec09e5dd5c01303e23de5fe7a95a"
>     > +SRC_URI[md5sum] = "03db1c8f8ae911977c0bf3950a4c9c21"
>     > +SRC_URI[sha256sum] =
>     "6b55ec379c11ad696f9371ce8e0de93c7f21134323f56a56a1b0d8fbef17013c"
>     >
>     >  RDEPENDS_${PN} += " \
>     >      ${PYTHON_PN}-json \
>     > diff --git
>     a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
>     <http://python-sqlalchemy_1.1.15.bb>
>     b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
>     <http://python-sqlalchemy_1.1.17.bb>
>     > similarity index 100%
>     > rename from
>     meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
>     <http://python-sqlalchemy_1.1.15.bb>
>     > rename to
>     meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
>     <http://python-sqlalchemy_1.1.17.bb>
>     > diff --git
>     a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
>     <http://python3-sqlalchemy_1.1.15.bb>
>     b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
>     <http://python3-sqlalchemy_1.1.17.bb>
>     > similarity index 100%
>     > rename from
>     meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
>     <http://python3-sqlalchemy_1.1.15.bb>
>     > rename to
>     meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
>     <http://python3-sqlalchemy_1.1.17.bb>
>
>


