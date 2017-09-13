Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC8F78686
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 16:56:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8DGu8lQ000602
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 13 Sep 2017 09:56:08 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 13 Sep 2017 09:56:07 -0700
To: Martin Jansa <martin.jansa@gmail.com>, Kai Kang <kai.kang@windriver.com>
References: <20170913093821.12746-1-kai.kang@windriver.com>
	<CA+chaQfD6QeAiKWQo+u6i5xSQ-bAFvMVL9CMvuA4N6-4dj3pGQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5cbf0e14-1b03-b621-65b8-c11579bdef5a@windriver.com>
Date: Wed, 13 Sep 2017 11:56:19 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfD6QeAiKWQo+u6i5xSQ-bAFvMVL9CMvuA4N6-4dj3pGQ@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libpng12: add it back from oe-core
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
X-List-Received-Date: Wed, 13 Sep 2017 16:56:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/13/17 4:54 AM, Martin Jansa wrote:
> All other LSB related recipes are in oe-core, why should libpng12 be
> different and live in meta-oe?

We had talked about some of this before, and I thought the OE/YP decision was to
create a new meta-lsb to carry any packages that were clearly obsolete (and thus
not in oe-core anymore), but still needed for LSB testing.

That way if anyone cared about the results they could contribute..  It also
SHOULD be fairly low maintenance.

This may be the first (only?) package we need to do that with.. similar to the
meta-gplv2.

--Mark

> On Wed, Sep 13, 2017 at 11:38 AM, <kai.kang@windriver.com> wrote:
> 
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> libpng12 is removed from oe-core. But lsb test 5.0 still requires
>> libpng12. So add it back.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb | 36
>> +++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>  create mode 100644 meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb
>>
>> diff --git a/meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb
>> b/meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb
>> new file mode 100644
>> index 000000000..9f74f5fdb
>> --- /dev/null
>> +++ b/meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb
>> @@ -0,0 +1,36 @@
>> +SUMMARY = "PNG image format decoding library"
>> +HOMEPAGE = "http://www.libpng.org/"
>> +SECTION = "libs"
>> +LICENSE = "Libpng"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=597b8a91994a3e27ae6aa79bf02677d9 \
>> +                    file://png.h;beginline=19;endline=109;md5=
>> 166406397718925b660f0033f7558ef7"
>> +DEPENDS = "zlib"
>> +
>> +PN = "libpng12"
>> +S = "${WORKDIR}/libpng-${PV}"
>> +
>> +SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz"
>> +
>> +SRC_URI[md5sum] = "307052e5e8af97b82b17b64fb1b3677a"
>> +SRC_URI[sha256sum] = "0f4620e11fa283fedafb474427c8e9
>> 6bf149511a1804bdc47350963ae5cf54d8"
>> +
>> +UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libpng/files/
>> libpng12/"
>> +UPSTREAM_CHECK_REGEX = "/libpng12/(?P<pver>(\d+[\.\-_]*)+)/"
>> +
>> +BINCONFIG_GLOB = "${PN}-config"
>> +
>> +inherit autotools binconfig pkgconfig
>> +
>> +do_install_append() {
>> +       # The follow link files link to corresponding png12*.h and
>> libpng12* files
>> +       # They conflict with higher verison, so drop them
>> +       rm ${D}/${includedir}/png.h
>> +       rm ${D}/${includedir}/pngconf.h
>> +
>> +       rm ${D}/${libdir}/libpng.la
>> +       rm ${D}/${libdir}/libpng.so
>> +       rm ${D}/${libdir}/libpng.a || true
>> +       rm ${D}/${libdir}/pkgconfig/libpng.pc
>> +
>> +       rm ${D}/${bindir}/libpng-config
>> +}
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


