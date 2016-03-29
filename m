Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id D2A8265CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 08:48:56 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id F092668A019; Tue, 29 Mar 2016 09:48:56 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id E012268A019;
	Tue, 29 Mar 2016 09:48:51 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 9A4F06740714;
	Tue, 29 Mar 2016 10:48:51 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1459238795-12674-1-git-send-email-jose.bollo@iot.bzh>
	<56FA39A7.4030205@mlbassoc.com>
	<CA+LDafABV55oxnpcwB4i_zbSG63A=HvNNR_Wzxd=pD+ZRxkHaw@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56FA4173.7030206@mlbassoc.com>
Date: Tue, 29 Mar 2016 10:48:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CA+LDafABV55oxnpcwB4i_zbSG63A=HvNNR_Wzxd=pD+ZRxkHaw@mail.gmail.com>
Subject: Re: [PATCH] libmicrohttp: update to version 0.9.48
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
X-List-Received-Date: Tue, 29 Mar 2016 08:48:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2016-03-29 10:20, José Bollo wrote:
> spdy? because it merely disappeared.
> regards
> José
> José Bollo - Senior Software Engineer
> www.iot.bzh
>

Then please improve the comment above this line as it doesn't really
convey this information very well.

>
> 2016-03-29 10:15 GMT+02:00 Gary Thomas <gary@mlbassoc.com>:
>> On 2016-03-29 10:06, jose.bollo@iot.bzh wrote:
>>>
>>> From: José Bollo <jose.bollo@iot.bzh>
>>>
>>> Change-Id: I33a1acf8360d074a3310f9691ac939fe70a99f3e
>>> Signed-off-by: José Bollo <jose.bollo@iot.bzh>
>>> ---
>>>    .../libmicrohttpd/libmicrohttpd_0.9.34.bb          | 27
>>> ----------------------
>>>    .../libmicrohttpd/libmicrohttpd_0.9.48.bb          | 27
>>> ++++++++++++++++++++++
>>>    2 files changed, 27 insertions(+), 27 deletions(-)
>>>    delete mode 100644
>>> meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
>>>    create mode 100644
>>> meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>>>
>>> diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
>>> b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
>>> deleted file mode 100644
>>> index e3c833b..0000000
>>> --- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
>>> +++ /dev/null
>>> @@ -1,27 +0,0 @@
>>> -DESCRIPTION = "A small C library that is supposed to make it easy to run
>>> an HTTP server as part of another application"
>>> -HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
>>> -LICENSE = "LGPL-2.1+"
>>> -LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
>>> -SECTION = "net"
>>> -DEPENDS = "libgcrypt gnutls file"
>>> -
>>> -SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
>>> -SRC_URI[md5sum] = "2947eee13c2c8affb95023a0cb6fda0c"
>>> -SRC_URI[sha256sum] =
>>> "29a2bfd4fd2ddf60c756b8c283291a134898e3cc143843be421a040be1b25a88"
>>> -
>>> -inherit autotools lib_package
>>> -
>>> -# disable spdy, because it depends on openssl
>>> -EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../
>>> --disable-spdy"
>>> -
>>> -PACKAGECONFIG ?= "curl"
>>> -PACKAGECONFIG_append_class-target = "\
>>> -        ${@base_contains('DISTRO_FEATURES', 'largefile', 'largefile', '',
>>> d)} \
>>> -"
>>> -PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
>>> -PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
>>> -
>>> -do_compile_append() {
>>> -       sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
>>> -}
>>> -
>>> diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>>> b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>>> new file mode 100644
>>> index 0000000..892009e
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>>> @@ -0,0 +1,27 @@
>>> +DESCRIPTION = "A small C library that is supposed to make it easy to run
>>> an HTTP server as part of another application"
>>> +HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
>>> +LICENSE = "LGPL-2.1+"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
>>> +SECTION = "net"
>>> +DEPENDS = "libgcrypt gnutls file"
>>> +
>>> +SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
>>> +SRC_URI[md5sum] = "9c298c890088a91fe0d7ac3fec9d0097"
>>> +SRC_URI[sha256sum] =
>>> "87667e158f2bf8c691a002e256ffe30885d4121a9ee4143af0320c47cdf8a2a4"
>>> +
>>> +inherit autotools lib_package
>>> +
>>> +# disable spdy, because it depends on openssl
>>> +EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
>>
>>
>> Why not make this a PACKAGECONFIG choice?
>>
>>> +
>>> +PACKAGECONFIG ?= "curl"
>>> +PACKAGECONFIG_append_class-target = "\
>>> +        ${@base_contains('DISTRO_FEATURES', 'largefile', 'largefile', '',
>>> d)} \
>>> +"
>>> +PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
>>> +PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
>>> +
>>> +do_compile_append() {
>>> +       sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
>>> +}
>>> +

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

