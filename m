Return-Path: <ray.kinsella@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2828672F37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 02:02:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 22 Feb 2017 18:02:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="51566452"
Received: from rkinsell-mobl.ger.corp.intel.com (HELO [10.252.30.67])
	([10.252.30.67])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 18:02:03 -0800
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1487697210-29779-1-git-send-email-ray.kinsella@intel.com>
	<20170221172236.GT8436@mentor.com>
From: "Kinsella, Ray" <ray.kinsella@intel.com>
Message-ID: <329cc241-860d-ba79-5574-058b07c82164@intel.com>
Date: Thu, 23 Feb 2017 02:02:02 +0000
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170221172236.GT8436@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] [meta-networking] ddclient: new package
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
X-List-Received-Date: Thu, 23 Feb 2017 02:02:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 21/02/2017 17:22, Joe MacDonald wrote:
> [[oe] [PATCH]  [meta-networking] ddclient: new package] On 17.02.21 (Tue 17:13) Ray Kinsella wrote:
>
>> Adding the package ddclient. DDClient updates Dynamic DNS servers with an IP address.
>> Recipe is based on the original OE recipe found here.
>>
>> http://cgit.openembedded.org/openembedded/tree/recipes/ddclient/ddclient_3.6.3.bb
>>
>> DDClient version has been updated to 3.8.3.
>>
>> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
>> ---
>>  .../recipes-daemons/ddclient/ddclient_3.8.3.bb     | 45 ++++++++++++++++++++++
>>  .../recipes-daemons/ddclient/files/ip-up           |  4 ++
>>  2 files changed, 49 insertions(+)
>>  create mode 100644 meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
>>  create mode 100644 meta-networking/recipes-daemons/ddclient/files/ip-up
>>
>> diff --git a/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
>> new file mode 100644
>> index 0000000..723eb67
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
>> @@ -0,0 +1,45 @@
>> +SECTION = "net/misc"
>> +DESCRIPTION = "Ddclient is a Perl client used to update dynamic DNS entries for accounts on Dynamic DNS Network Services"
>> +HOMEPAGE = "http://ddclient.sourceforge.net/"
>> +LICENSE = "GPLv2"
>> +PR = "r4"
>
> We don't need explicit PRs anymore.

ACK - will fix.

>
>> +SRC_URI = "\
>> +    ${SOURCEFORGE_MIRROR}/ddclient/ddclient-${PV}.tar.bz2 \
>> +    file://ip-up"
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>> +
>> +RDEPENDS_${PN} = "\
>> +    perl-module-getopt-long \
>> +    perl-module-sys-hostname \
>> +    perl-module-io-socket \
>> +    perl-module-vars \
>> +    perl-module-overload \
>> +    perl-module-overloading \
>> +    perl-module-config \
>> +    perl-module-integer \
>> +    perl-module-exporter-heavy \
>> +    perl-module-symbol \
>> +    perl-module-selectsaver \
>> +    bash \
>> +    perl \
>> +    libio-socket-ssl-perl"
>
> I haven't looked at the download, but I did briefly read the SF documentation
> and it seems like maybe these would be appropriate as well:
>
> do_configure[noexec] = "1"
> do_compile[noexec] = "1"

yup - you are correct, I will add these.

>
>> +do_install() {
>> +    install -d ${D}${sbindir} ${D}${sysconfdir}/ddclient ${D}${sysconfdir}/init.d
>> +    install -d ${D}${sysconfdir}/ppp/ip-up.d/ install -d ${D}${docdir}/ddclient
>> +    install -m 755 ${S}/ddclient ${D}${sbindir}
>> +    install ${S}/sample-etc_ddclient.conf ${D}${sysconfdir}/ddclient/ddclient.conf
>> +    install -m 755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/ip-up.d/ddclient
>> +    sed -e 's|/etc/ddclient.conf|/etc/ddclient/ddclient.conf|g' ${S}/sample-etc_rc.d_init.d_ddclient > ${S}/rc_init
>> +    install -m 755 ${S}/rc_init ${D}${sysconfdir}/init.d/ddclient
>> +    install ${S}/README* ${D}${docdir}/ddclient
>> +    install ${S}/COPY* ${D}${docdir}/ddclient
>> +    install ${S}/sample* ${D}${docdir}/ddclient
>> +}
>> +
>> +CONFFILES_${PN} = "${sysconfdir}/ddclient/ddclient.conf"
>> +
>> +SRC_URI[md5sum] = "3b426ae52d509e463b42eeb08fb89e0b"
>> +SRC_URI[sha256sum] = "d40e2f1fd3f4bff386d27bbdf4b8645199b1995d27605a886b8c71e44d819591"
>> diff --git a/meta-networking/recipes-daemons/ddclient/files/ip-up b/meta-networking/recipes-daemons/ddclient/files/ip-up
>> new file mode 100644
>> index 0000000..52a44f8
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/ddclient/files/ip-up
>> @@ -0,0 +1,4 @@
>> +#!/bin/sh
>> +
>> +logger -t ddclient $PPP_IFACE $PPP_LOCAL
>> +ddclient -daemon=0 -syslog -use=if -if=$PPP_IFACE >/dev/null 2>&1
>> \ No newline at end of file
>
> That's odd.  :-)
>
> Anyway, I'll have a look at this in more detail when it loops through
> master-next.
>

