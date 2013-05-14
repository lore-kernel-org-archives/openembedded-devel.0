Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UcAHL-0001en-M4
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 10:08:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2013 00:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,667,1363158000"; d="scan'208";a="302119770"
Received: from sorvi.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
	by azsmga001.ch.intel.com with ESMTP; 14 May 2013 00:48:55 -0700
Message-ID: <5191EC66.1070007@linux.intel.com>
Date: Tue, 14 May 2013 10:48:54 +0300
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120801 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1368448471-2941-1-git-send-email-jukka.rissanen@linux.intel.com>
	<kmrj87$g8t$1@ger.gmane.org>
In-Reply-To: <kmrj87$g8t$1@ger.gmane.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-networking][PATCH] vpnc: Runtime dependency to perl was missing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 08:08:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Koen,

On 13.05.2013 23:42, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 13-05-13 14:34, Jukka Rissanen schreef:
>> Generated package contains perl script but dependecy to perl was
>> missing.
>>
>> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com> ---
>> meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 2 +- 1 file
>> changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
>> b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb index
>> 2ce9530..df90234 100644 ---
>> a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb +++
>> b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb @@ -6,7 +6,7 @@
>> PRIORITY = "optional" LICENSE = "GPL-2.0+" LIC_FILES_CHKSUM =
>> "file://COPYING;md5=173b74cb8ac640a9992c03f3bce22a33" DEPENDS =
>> "libgcrypt" -RDEPENDS_${PN} = "kernel-module-tun" +RDEPENDS_${PN} =
>> "kernel-module-tun perl"
>
> I've seen a number of patches doing this and I hate it for 2 reasons:
>
> 1) the perl stuff should be looked at and split out in a subpackage whenever
> possible
> 2) it doesn't actually fix the problem, since you need to specify the
> perl-modules it needs as well.
>
> So patches like this drag in perl while at the same time not actually fixing
> the problem of failing runtimes, only papering over RPM bitching out
> dependencies.

Thanks, I missed that one. I will send a new version with proper dependency.


Cheers,
Jukka



