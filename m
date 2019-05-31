Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D2A3F7D2B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 08:44:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45FdLB3CjWz1n;
	Fri, 31 May 2019 10:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559292290;
	bh=Mw3RqNIYXlpkWTRLNOLg3a3MVGkTFVaX2A+TEkTlBvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8jkAxLay0HUTRgVSEnBRobOlc9ZQgN6PasVb+OuwyybvOTtRHWKIXgvEU0VhUBrq
	kFzWJzt8gkW6VTnJfDXIAyK2o9+qmxQ4cc3vqsv76vDNIj+cEah2kmd9pSOwCeqfJ/
	l72W8EfcUilq+Kv7A+DG7qczkeZU5FPkEf/81Rf8OEHZ+4F1vRkIA5kQ20KwCggQtE
	iW9lb0ZkfbofUnosRzFKFVXwBDQ49Mf01ZTgdjbap9CNfRoVcYAjYHQoK/Cep/nluC
	5u6xuLsEylX1zU3yM1yg+WYPTA43HDp/iojO+ViqpRBFeNvNbVGDkq6uUdxMwV1Dja
	qbJHbIa/vBpKLXV2RXvebhTyzlqgAerP3LwR1nPPuT6YulODGMEv2tm2Go/NyZ8IwR
	uSGAYvGpXNGB3lY1c5sJlQYgwHZzih+1aJXMKzkRGSd9Sw6DYEmas3a5z8e6FQkyof
	S1XBZHCBeb+hLWLPD/MQrjnqV8vs8ED2WrLSWaH3PaTY3WtLpQcBocwQM/XbAkBcRs
	gNnTTb5wE5/JOXSxBqZ4+o/OhCFVTBndFzMpuIlapbOxxgONlAE6AtoTpj/cr/nDO0
	RI5nQ9Y//Qlue5nyU2sOa6gmjjJU15Sgv7CI2d/EFazCaO/EeTdb5oqiJuZZ4Jn2Cl
	ESVgUUsnXrWvMOt8vaxNZ/o4=
Date: Fri, 31 May 2019 11:44:47 +0300
From: Adrian Bunk <bunk@stusta.de>
To: zhe.he@windriver.com
Message-ID: <20190531084447.GA18583@localhost>
References: <1559271137-240663-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1559271137-240663-1-git-send-email-zhe.he@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] rocksdb: Fix build failure due to GCC9 deprecated-copy pessimizing-move
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
X-List-Received-Date: Fri, 31 May 2019 08:44:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 31, 2019 at 10:52:17AM +0800, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
> 
> GCC9 introduce more stricter checks deprecated-copy and pessimizing-move, while
> rocksdb uses -Werror and causes the following build error.
> 
> db/version_edit.h:178:33: error: implicitly-declared 'constexpr rocksdb::FileDescriptor::FileDescriptor(const rocksdb::FileDescriptor&)' is deprecated [-Werror=deprecated-copy]
> 
> utilities/persistent_cache/persistent_cache_util.h:51:23: error: moving a local object in a return statement prevents copy elision [-Werror=pessimizing-move]
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> index 8d84619..bbd8e4f 100644
> --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> @@ -31,6 +31,9 @@ EXTRA_OECMAKE = "\
>      -DWITH_TESTS=OFF \
>      -DWITH_TOOLS=OFF \
>  "
> +do_compile_prepend() {
> +    sed -i 's/set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-error=shadow")/set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-error=shadow -Wno-error=deprecated-copy -Wno-error=pessimizing-move")/' ${S}/CMakeLists.txt
> +}
>...

It would be more elegant to add -DFAIL_ON_WARNINGS=OFF to EXTRA_OECMAKE 
instead.

This is also correct in general, since the few packages using -Werror 
are frequently causing this kind of problem for distributions.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


