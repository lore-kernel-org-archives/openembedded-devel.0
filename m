Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 1F74872F91
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2017 13:20:22 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v9ADKLGN001669
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 10 Oct 2017 15:20:22 +0200
Received: from [139.16.76.113] (MD1FZU9C.ad001.siemens.net [139.16.76.113])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v9ADKLlY021141;
	Tue, 10 Oct 2017 15:20:21 +0200
To: Martin Jansa <martin.jansa@gmail.com>
References: <1507618762-30618-1-git-send-email-pascal.bach@siemens.com>
	<CA+chaQdHXmH_Ct7WgVO-2HyrFGSd5w6nq=cF0z33amc+TWNGBQ@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <ca950ead-0a02-ce2b-21e9-c88fcdc1ff54@siemens.com>
Date: Tue, 10 Oct 2017 15:20:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdHXmH_Ct7WgVO-2HyrFGSd5w6nq=cF0z33amc+TWNGBQ@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv2] rocksdb: add version 5.8
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
X-List-Received-Date: Tue, 10 Oct 2017 13:20:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 10.10.2017 10:53, Martin Jansa wrote:
> The v1 failed to build with:
> http://errors.yoctoproject.org/Errors/Details/157120/
>
> If the v2 only updated LICENSE, it will need fix for this as well.
It seems this only happens on ARMv5 as there seems to be some instructions for atomic.
I need to dig deeper into how I can fix this.
>
> On Tue, Oct 10, 2017 at 8:59 AM, Pascal Bach <pascal.bach@siemens.com <mailto:pascal.bach@siemens.com>> wrote:
>
>     Version 5.8 does no longer includes the facebook patent grant and is
>     licensed under the Apache-2.0 or GPL-2.0 license.
>
>     Signed-off-by: Pascal Bach <pascal.bach@siemens.com <mailto:pascal.bach@siemens.com>>
>     ---
>      meta-oe/recipes-extended/rocksdb/rocksdb_git.bb <http://rocksdb_git.bb> | 28 +++++++++++++++++++++++++
>      1 file changed, 28 insertions(+)
>      create mode 100644 meta-oe/recipes-extended/rocksdb/rocksdb_git.bb <http://rocksdb_git.bb>
>
>     diff --git a/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb <http://rocksdb_git.bb> b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb <http://rocksdb_git.bb>
>     new file mode 100644
>     index 0000000..2e988bf
>     --- /dev/null
>     +++ b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb <http://rocksdb_git.bb>
>     @@ -0,0 +1,28 @@
>     +SUMMARY = "RocksDB an embeddable, persistent key-value store"
>     +DESCRIPTION = "RocksDB is library that provides an embeddable, persistent key-value store for fast storage."
>     +HOMEPAGE = "http://rocksdb.org/"
>     +LICENSE = "(Apache-2.0 | GPL-2.0) & BSD-3-Clause"
>     +LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>     +                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>     +                    file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
>     +
>     +SRCREV = "266ac245affd69555643b735d19d3715c4eff91a"
>     +PV = "5.8+git${SRCPV}"
>     +
>     +SRC_URI = "git://github.com/facebook/${BPN}.git <http://github.com/facebook/$%7BBPN%7D.git>"
>     +
>     +S = "${WORKDIR}/git"
>     +
>     +inherit cmake
>     +
>     +PACKAGECONFIG ??= "bzip2 zlib lz4"
>     +PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON,-DWITH_BZ2=OFF,bzip2"
>     +PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON,-DWITH_LZ4=OFF,lz4"
>     +PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
>     +PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
>     +
>     +EXTRA_OECMAKE = "\
>     +    -DPORTABLE=ON \
>     +"
>     +
>     +FILES_${PN}-dev += "${libdir}/cmake"
>     --
>     2.1.4
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


