Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id AC92071DD0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Oct 2017 07:16:31 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v997GVHi020837
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 9 Oct 2017 09:16:31 +0200
Received: from [139.16.76.113] (MD1FZU9C.ad001.siemens.net [139.16.76.113])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v997GV7q006541;
	Mon, 9 Oct 2017 09:16:31 +0200
To: Khem Raj <raj.khem@gmail.com>
References: <1507289466-13238-1-git-send-email-pascal.bach@siemens.com>
	<CAMKF1srGvzWgLJA8muqkTWCA-ahxrKQVbN8JM7y237M8JTXsAg@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <e86a9605-7690-c7cb-e48c-e31ac1badb9a@siemens.com>
Date: Mon, 9 Oct 2017 09:16:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srGvzWgLJA8muqkTWCA-ahxrKQVbN8JM7y237M8JTXsAg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rocksdb: add version 5.8
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
X-List-Received-Date: Mon, 09 Oct 2017 07:16:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 06.10.2017 16:05, Khem Raj wrote:
> On Fri, Oct 6, 2017 at 4:31 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
>> Version 5.8 does no longer includes the facebook patent grant and is
>> licensed under the Apache-2.0 license.
>>
> I see leveldb as well as GPL-2.0 licence file in repo. Are they not used
The detailed license assessment from our side is still in progress and will probably take several weeks till I have the result.
I just did a quick survey again and it seems the license is something like (Apache-2.0 | GPL-2.0) & BSD-3-Clause
The BSD-3-Clause comes from leveldb.

I can update the recipe with the above license statement and then, if the detailed reports finds something different, I can update the recipe.
Would this be desirable or should I wait and submit the recipe again after the results are in?

>
>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>> ---
>>  meta-oe/recipes-extended/rocksdb/rocksdb_git.bb | 26 +++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
>>
>> diff --git a/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
>> new file mode 100644
>> index 0000000..a4fbf34
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
>> @@ -0,0 +1,26 @@
>> +SUMMARY = "RocksDB an embeddable, persistent key-value store"
>> +DESCRIPTION = "RocksDB is library that provides an embeddable, persistent key-value store for fast storage."
>> +HOMEPAGE = "http://rocksdb.org/"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57"
>> +
>> +SRCREV = "266ac245affd69555643b735d19d3715c4eff91a"
>> +PV = "5.8+git${SRCPV}"
>> +
>> +SRC_URI = "git://github.com/facebook/${BPN}.git"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit cmake
>> +
>> +PACKAGECONFIG ??= "bzip2 zlib lz4"
>> +PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON,-DWITH_BZ2=OFF,bzip2"
>> +PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON,-DWITH_LZ4=OFF,lz4"
>> +PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
>> +PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
>> +
>> +EXTRA_OECMAKE = "\
>> +    -DPORTABLE=ON \
>> +"
>> +
>> +FILES_${PN}-dev += "${libdir}/cmake"
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


