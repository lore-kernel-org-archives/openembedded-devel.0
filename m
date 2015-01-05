Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A89E27213F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 05:40:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t055e5rf004143
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 4 Jan 2015 21:40:07 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 4 Jan 2015 21:40:05 -0800
Message-ID: <54AA23B3.6010001@windriver.com>
Date: Mon, 5 Jan 2015 13:40:03 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
References: <1420425561-36741-1-git-send-email-leimaohui@cn.fujitsu.com>	<1420425561-36741-2-git-send-email-leimaohui@cn.fujitsu.com>
	<54A9FFBB.7040609@windriver.com>
	<1B56A49860EB2D45ADE3731B15C959FDAE1DE0@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDAE1DE0@G08CNEXMBPEKD01.g08.fujitsu.local>
Subject: Re: [meta-networking][PATCH 1/2] GeoIP: add recipe
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
X-List-Received-Date: Mon, 05 Jan 2015 05:40:19 -0000
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit



On 01/05/2015 01:36 PM, Lei, Maohui wrote:
> Hi Robert
> 
> 
>>> +HOMEPAGE = "http://dev.maxmind.com/geoip/"
>>> +SECTION = "Development/Libraries"
>>
>> I think that this is a fedora like section name? We usually use debian style
>> in OE, for example:
>>
>> SECTION = "net"
> 
> Thank you, it does make sense. I didn't pay attention to this detail.
> But it is hard to find the rule of assignment of " SECTION " variable.
> I searched the meta-openembedded, "network" is also be used to be section name.
> What's the difference between the "net" and the "network"?

I think they are the same, Joe M, who is the maintainer of meta-networking may
know about it.

// Robert

> 
> [meta-openembedded]$ grep "SECTION " ./ -r | grep bb
> ...
> ./meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb:SECTION = "net"
> ...
> ./meta-networking/recipes-daemons/squid/squid_3.4.7.bb:SECTION = "network"
> ...
> [meta-openembedded]$
> 
>>
>> The similar to geoipupdate.
> 
> 
> Lei
> 
> 
> 
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Robert Yang
>> Sent: Monday, January 05, 2015 11:07 AM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-networking][PATCH 1/2] GeoIP: add recipe
>>
>>
>>
>> On 01/05/2015 10:39 AM, leimaohui wrote:
>>> From: leimh <leimaohui@cn.fujitsu.com>
>>>
>>> GeoIP app allow you to look up information about a given IP address.
>>>
>>> Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
>>> ---
>>>    .../recipes-support/geoip/geoip_1.6.0.bb           | 58
>> ++++++++++++++++++++++
>>>    1 file changed, 58 insertions(+)
>>>    create mode 100644
>>> meta-networking/recipes-support/geoip/geoip_1.6.0.bb
>>>
>>> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
>>> b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
>>> new file mode 100644
>>> index 0000000..d1bdae9
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
>>> @@ -0,0 +1,58 @@
>>> +SUMMARY = "C library for country/city/organization to IP address or hostname
>> mapping"
>>> +DESCRIPTION = "GeoIP is a C library that enables the user to find the
>>> +country that any IP\ address or hostname originates from. It uses a
>>> +file based database that is\ accurate as of March 2003. This database
>>> +simply contains IP blocks as keys, and\ countries as values. This
>>> +database should be more complete and accurate than\ using reverse DNS
>> lookups."
>>> +
>>> +HOMEPAGE = "http://dev.maxmind.com/geoip/"
>>> +SECTION = "Development/Libraries"
>>
>> I think that this is a fedora like section name? We usually use debian style
>> in OE, for example:
>>
>> SECTION = "net"
>>
>> The similar to geoipupdate.
>>
>> // Robert
>>
>>> +
>>> +SRC_URI =
>> "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar.gz;name=tarba
>> ll \
>>> +
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.da
>> t.gz;apply=no;name=GeoIP-dat \
>>> +
>> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no
>> ;name=GeoIPv6-dat \
>>> +
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;appl
>> y=no;name=GeoLiteCity-dat \
>>> +
>>>
>> +http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/Geo
>> LiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat \ "
>>> +
>>> +SRC_URI[tarball.md5sum] = "89f4cdfdab43f1d67364cd7c85bbe8ca"
>>> +SRC_URI[tarball.sha256sum] =
>> "075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10dbfa1ce7c6cd48d4a635"
>>> +
>>> +SRC_URI[GeoIP-dat.md5sum] = "53416cd33e556a8048ac522fc9a98e05"
>>> +SRC_URI[GeoIP-dat.sha256sum] =
>> "a423a0c87bf9a78ef8d68153b424987c6bbddec85b5f784ca747706f4df10361"
>>> +
>>> +SRC_URI[GeoIPv6-dat.md5sum] = "f1a4abf4015c0300267f4717c9d7ead2"
>>> +SRC_URI[GeoIPv6-dat.sha256sum] =
>> "1a8e61732e39ac9d9acc20d648b2530d7bd0ff1c250f51fd18148931fbfe2830"
>>> +
>>> +SRC_URI[GeoLiteCity-dat.md5sum] = "48af3b8a204d7c5f8e42a4f5f4dd1874"
>>> +SRC_URI[GeoLiteCity-dat.sha256sum] =
>> "2f3f62f171c333cdd4e68534585e51978cb3a12dc7b269786f50daf10071d7d6"
>>> +
>>> +SRC_URI[GeoLiteCityv6-dat.md5sum] = "a42504adfd8030c3a10f749191598b4a"
>>> +SRC_URI[GeoLiteCityv6-dat.sha256sum] =
>> "4a5eeaa4a9107e6ccdbe94ad1c7c987dc70cd250cd40624ada1e3a03836bbbdb"
>>> +
>>> +
>>> +LICENSE = "LGPL-2.1"
>>> +
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=d5d53d6b948c064f4070183180a4fa89 \
>>> +                    file://LICENSE;md5=f04db71812ba70aaba8b38da91984cd2
>> "
>>> +
>>> +S = "${WORKDIR}/GeoIP-1.6.0"
>>> +
>>> +inherit autotools
>>> +
>>> +EXTRA_OECONF = "--disable-static               \
>>> +                --disable-dependency-tracking  "
>>> +
>>> +do_install() {
>>> +    make DESTDIR=${D} install
>>> +    install -d ${D}/${datadir}/GeoIP
>>> +    install ${WORKDIR}/GeoIP.dat ${D}/${datadir}/GeoIP/
>>> +    install ${WORKDIR}/GeoIPv6.dat ${D}/${datadir}/GeoIP/
>>> +    install ${WORKDIR}/GeoLiteCity.dat ${D}/${datadir}/GeoIP/
>>> +    install ${WORKDIR}/GeoLiteCityv6.dat ${D}/${datadir}/GeoIP/ }
>>> +
>>> +PACKAGES =+ "${PN}-database"
>>> +FILES_${PN}-database = ""
>>> +FILES_${PN}-database += "${datadir}/GeoIP/*"
>>> +
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 

