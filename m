Return-Path: <ray.kinsella@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4ED72FDB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 02:00:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 18:00:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="51565416"
Received: from rkinsell-mobl.ger.corp.intel.com (HELO [10.252.30.67])
	([10.252.30.67])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 18:00:57 -0800
To: Martin Jansa <martin.jansa@gmail.com>,
	Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1487697210-29779-1-git-send-email-ray.kinsella@intel.com>
	<20170221172236.GT8436@mentor.com> <20170222130208.GB3283@jama>
From: "Kinsella, Ray" <ray.kinsella@intel.com>
Message-ID: <7ebb36b8-8b28-81d0-5e0f-7bdf932f35c2@intel.com>
Date: Thu, 23 Feb 2017 02:00:56 +0000
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170222130208.GB3283@jama>
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
X-List-Received-Date: Thu, 23 Feb 2017 02:00:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

inline

On 22/02/2017 13:02, Martin Jansa wrote:
> On Tue, Feb 21, 2017 at 12:22:37PM -0500, Joe MacDonald wrote:
>
> I've added it to master-next, but now I'll drop it again, because
> it creates dependency on meta-perl and meta-networking doesn't depend
> on meta-perl (at least not yet - good luck with OEDAM plan to separate
> meta-perl, meta-python, meta-networking to separate layers).

ok then - your saying that meta-networking isn't the right home for it.
meta-perl doesn't look right either as it is not a perl extension.
any advice as to where it belongs?

>
> ERROR: Nothing RPROVIDES 'libio-socket-ssl-perl' (but meta-oe/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb RDEPENDS on or otherwise requires it)

did you get a build error?

>> I haven't looked at the download, but I did briefly read the SF documentation
>> and it seems like maybe these would be appropriate as well:
>>
>> do_configure[noexec] = "1"
>> do_compile[noexec] = "1"
>>
>>> +do_install() {
>>> +    install -d ${D}${sbindir} ${D}${sysconfdir}/ddclient ${D}${sysconfdir}/init.d
>>> +    install -d ${D}${sysconfdir}/ppp/ip-up.d/ install -d ${D}${docdir}/ddclient
>>> +    install -m 755 ${S}/ddclient ${D}${sbindir}
>>> +    install ${S}/sample-etc_ddclient.conf ${D}${sysconfdir}/ddclient/ddclient.conf
>>> +    install -m 755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/ip-up.d/ddclient
>>> +    sed -e 's|/etc/ddclient.conf|/etc/ddclient/ddclient.conf|g' ${S}/sample-etc_rc.d_init.d_ddclient > ${S}/rc_init
>>> +    install -m 755 ${S}/rc_init ${D}${sysconfdir}/init.d/ddclient
>>> +    install ${S}/README* ${D}${docdir}/ddclient
>>> +    install ${S}/COPY* ${D}${docdir}/ddclient
>>> +    install ${S}/sample* ${D}${docdir}/ddclient
>>> +}
>>> +
>>> +CONFFILES_${PN} = "${sysconfdir}/ddclient/ddclient.conf"
>>> +
>>> +SRC_URI[md5sum] = "3b426ae52d509e463b42eeb08fb89e0b"
>>> +SRC_URI[sha256sum] = "d40e2f1fd3f4bff386d27bbdf4b8645199b1995d27605a886b8c71e44d819591"
>>> diff --git a/meta-networking/recipes-daemons/ddclient/files/ip-up b/meta-networking/recipes-daemons/ddclient/files/ip-up
>>> new file mode 100644
>>> index 0000000..52a44f8
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-daemons/ddclient/files/ip-up
>>> @@ -0,0 +1,4 @@
>>> +#!/bin/sh
>>> +
>>> +logger -t ddclient $PPP_IFACE $PPP_LOCAL
>>> +ddclient -daemon=0 -syslog -use=if -if=$PPP_IFACE >/dev/null 2>&1
>>> \ No newline at end of file
>>
>> That's odd.  :-)

I will take a look

>> Anyway, I'll have a look at this in more detail when it loops through
>> master-next.
>>
>> --
>> -Joe MacDonald.
>> :wq
>
>
>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

