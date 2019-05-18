Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3F98079980
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 May 2019 19:42:18 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z19so11836724qtz.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 May 2019 12:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0Y9XrbYoSn6JfQBwkqy4OoVFh8KKZel6snEzGXVPuww=;
	b=PYre4RyBAERt57IPy7EhsgjxvVrfDqrtOyLxkcxo6ocoXcakpilbIkU4VdJog06+a0
	MReVnXq69kSGGcLmdfDdQAVtTxpEh9IEH5zs72gH0EaLEiRlaHZ2HD7cuzRmxmeZ5YYd
	f3TSOtS42kYWqa9MUXdYpgxNlAa31fYAs5akMtjsmlgsE9Qabf67inF0ZWKBa9kqJ9FN
	JNoAS/CXBgG+GzwOHFYhTCnicSuPCxkSXr98Iqkq+cGKbqT1GiUKOAU4ETtqv3BMzQz8
	RgrWAg4aXmylweEr5cjsNZH12BTmD/SUVy0NHJEtx/FoHh0eiJoWSSVPPEAXjqWJgJrS
	4oIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0Y9XrbYoSn6JfQBwkqy4OoVFh8KKZel6snEzGXVPuww=;
	b=JPWAuwarUjS3TYAQI3cysK2OMNcyQGhCZRhp6ixDGeYwRHoOzlOCO1bZBBd6QUUF67
	mdptf/i1UK2azczxALBvX0fhut8hkCU13l1eBmnkfnYCZPis+pFtq0z3UGYY8tWE3oud
	3QW3FbOIlEnbUxrB5HXlqKdSV2kxjAd7zIxjb4oWirMjDXh03PwrLUzlHr4KHzrtByQ7
	bdituQppYfLFG4eCBWBlKfpcwej2GupcppudhyzfOoML4LhHSTRa6aoHxD8ZPVqF3lqt
	2b3BdtZNjy17OQyAIOsQxLR5BmR85VO74uBIEV/Nj2GpDM4RMDTNw+YRZGD3xm/X54JO
	t/SQ==
X-Gm-Message-State: APjAAAVbcOPOT4jwB833v1fZuDyFUhXLkeskwSp6O7JfrCtKg6GXoZez
	0HeCpRXl/CNEqRBNAaQEHa21pireMjBUho3HHqM=
X-Google-Smtp-Source: APXvYqzpsVcSRCtSlOzelzJrw6J8pW5WtWKdZgwwGlNF0H/E8vmi02IUCPwPScXKzuHmEexnJQHFot/w2JO5nke6EOc=
X-Received: by 2002:a0c:96e7:: with SMTP id b36mr19542450qvd.51.1558208538826; 
	Sat, 18 May 2019 12:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <036838bbf1cb46dc9c9e3b16bd8027a0@XCH-RCD-007.cisco.com>
In-Reply-To: <036838bbf1cb46dc9c9e3b16bd8027a0@XCH-RCD-007.cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 May 2019 12:41:53 -0700
Message-ID: <CAMKF1sp6hLt5sqWqu_Nqb2wFJVmaP-sNbRVFSpvQVojtfr5TnA@mail.gmail.com>
To: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC@Cisco)" <oobitots@cisco.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf: Fix ptest compilation
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
X-List-Received-Date: Sat, 18 May 2019 19:42:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 16, 2019 at 2:04 AM Oleksiy Obitotskyi -X (oobitots -
GLOBALLOGIC INC at Cisco) via Openembedded-devel
<openembedded-devel@lists.openembedded.org> wrote:
>
> Tests require c++11 support, so add -std=c++11
> to compiler flags.
>
This does not apply cleanly on top of master, can you rebase and send again ?

> Upstream-Status: Pending
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> ---
> meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> index cf72d9ca7..4791e13ca 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> @@ -40,8 +40,8 @@ do_compile_ptest() {
> # which haven't been installed yet.
> cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"
> sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> - sed -e 's|Cflags:|Cflags: -I${S}/src|' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> - sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> + sed -e 's|Cflags:|Cflags: -std=c++11 -I${S}/src|' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> + sed -e 's|Libs:|Libs: -std=c++11 -L${B}/src/.libs|' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
> # Save the pkgcfg sysroot variable, and update it to nothing so
>
> --
> 2.19.1
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

