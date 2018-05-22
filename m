Return-Path: <prvs=673fc8d93=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 0056274A05
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 22:02:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.49,430,1520895600"; 
   d="scan'208";a="1456255"
To: Khem Raj <raj.khem@gmail.com>
References: <20180522122500.4092-1-richard.leitner@skidata.com>
	<CAMKF1spmcZsgQzsvBXhNtoovvZUWtwv9hanzf=L9Yuiu_xYAnw@mail.gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <2dd37cf4-905c-c4ad-e21b-821ec8892280@skidata.com>
Date: Wed, 23 May 2018 00:02:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spmcZsgQzsvBXhNtoovvZUWtwv9hanzf=L9Yuiu_xYAnw@mail.gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	dev@g0hl1n.net
Subject: Re: [meta-oe][PATCH] uhubctl: add recipe
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
X-List-Received-Date: Tue, 22 May 2018 22:02:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Khem,
thank you for your feedback!

On 05/22/2018 08:17 PM, Khem Raj wrote:
> On Tue, May 22, 2018 at 8:25 AM, Richard Leitner
> <richard.leitner@skidata.com> wrote:
>> Add recipe for uhubctl v2.0.0, an utility to control USB power per-port
>> on "smart" USB hubs.
>>
>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>> ---
>>   ...001-Makefile-set-program-version-to-2.0.0.patch | 34 ++++++++++++++++++++++
>>   meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb   | 22 ++++++++++++++
>>   2 files changed, 56 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/uhubctl/files/0001-Makefile-set-program-version-to-2.0.0.patch
>>   create mode 100644 meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
>>
>> diff --git a/meta-oe/recipes-support/uhubctl/files/0001-Makefile-set-program-version-to-2.0.0.patch b/meta-oe/recipes-support/uhubctl/files/0001-Makefile-set-program-version-to-2.0.0.patch
>> new file mode 100644
>> index 000000000..e9e06bc71
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/uhubctl/files/0001-Makefile-set-program-version-to-2.0.0.patch

> can we do it via some other means ? may be via sed or some such and use ${PV}
> be used instead of hardcoding version.

You're right... a sed using ${PV} is cleaner and will avoid modifying 
the patch on each recipe update. I'll do that in a v2.

>> +
>> diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb b/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
>> new file mode 100644
>> index 000000000..80fc92332
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
>> @@ -0,0 +1,22 @@
>> +SUMMARY = "USB hub per-port power control"
>> +HOMEPAGE = "https://github.com/mvp/uhubctl"
>> +BUGTRACKER = "https://github.com/mvp/uhubctl/issues"
>> +DEPENDS = "libusb1"
>> +
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +SRC_URI = "\
>> +    https://github.com/mvp/${PN}/archive/v${PV}.tar.gz \
>> +    file://0001-Makefile-set-program-version-to-2.0.0.patch \
>> +    "
>> +SRC_URI[md5sum] = "5c711911d766d76813333c3812277574"
>> +SRC_URI[sha256sum] = "4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e"
>> +
>> +S = "${WORKDIR}/${PN}-${PV}"
>> +
> 
> this looks redundant.

Indeed... it is :-). I'll remove it in v2.

> 
>> +do_install () {
>> +    oe_runmake install DESTDIR=${D}
>> +}
>> +
> 
> do we need this ?

Yes. Otherwise the uhubctl binary won't get installed anywhere (except 
the build inside ${S}) and therefore no package is created.

> 
>> +FILES_${PN} = "${sbindir}/uhubctl"
> 
> Do we need this ?

Nope... I'll remove it in v2.

regards;Richard.L

