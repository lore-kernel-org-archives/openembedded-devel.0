Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1C06065C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Jun 2013 09:25:44 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Jun 2013 02:25:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,783,1363158000"; d="scan'208";a="249418989"
Received: from unknown (HELO helios.localnet) ([10.252.121.211])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Jun 2013 02:25:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Thomas Fitzsimmons <fitzsim@cisco.com>
Date: Sat, 01 Jun 2013 10:25:43 +0100
Message-ID: <5272086.yW5j78zTuC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-22-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <m6pgd2s6a4yg.fsf@cisco.com>
References: <m6pgd2s6a4yg.fsf@cisco.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] net-snmp: Backport fix for NETSNMP_NO_SYSTEMD typos
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
X-List-Received-Date: Sat, 01 Jun 2013 09:25:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Thomas,

On Friday 31 May 2013 23:24:23 Thomas Fitzsimmons wrote:
> This patch fixes a net-snmp build failure for non-systemd builds [1]:
> | .libs/snmpd.o: In function `main':
> | [...]/net-snmp/5.7.2-r0/net-snmp-5.7.2/agent/snmpd.c:459: undefined
> | reference to `netsnmp_sd_listen_fds' collect2: error: ld returned 1 exit
> | status
> 
> It backports a typo fix from upstream:
> 
> commit 3692875172352f72cf3afd0d35f355e83d7e421b
> Author: Bart Van Assche <bvanassche@acm.org>
> Date:   Mon Aug 8 18:22:08 2011 +0200
> 
>     Fix typos introduced in commit 19499c3c90bf9d7b2b9e5d08baa26cc6bba28a11.
> Unbreaks the build.
> 
> Thomas
> 
> 1. Previously reported here:
>    http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57756
> 
> Signed-off-by: Thomas Fitzsimmons <fitzsim@cisco.com>
> ---
>  .../net-snmp/net-snmp/systemd-support.patch        |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch
> index 18955f2..b88531f 100644
> ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch
> +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch
> @@ -7,6 +7,7 @@ fef6cddfdb94da1a6b1fb768af62918b80f11fd3
>  0641e43c694c485cbbffef0556efc4641bd3ff50
>  76530a89f1c8bbd0b63acce63e10d5d4812a1a16 (conflict resolved)
>  bf108d7f1354f6276fc43c129963f2c49b9fc242
> +3692875172352f72cf3afd0d35f355e83d7e421b
>  74412748067c685e1d8ab6ed3bcc3ca9c2774844
>  86132e3f1e6ef7b4e0b96d8fa24e37c81b71b0e0
>  63557cf8986a33dba1d4429b583a901361052c4f
> @@ -89,10 +90,10 @@ index b177d5b..08bdfc7 100644
>   #endif
> 
>   #ifndef WIN32
> -+#ifndef NETSNMP_NO_SYSYSTEMD
> ++#ifndef NETSNMP_NO_SYSTEMD
>  +    /* check if systemd has sockets for us and don't close them */
>  +    prepared_sockets = netsnmp_sd_listen_fds(0);
> -+#endif /* NETSNMP_NO_SYSYSTEMD */
> ++#endif /* NETSNMP_NO_SYSTEMD */
>  +
>       /*
>        * close all non-standard file descriptors we may have

Could you please include a header with the description, Signed-off-by and 
"Upstream-Status: Backport" at the top of the inner patch itself? This makes 
things easier when upgrading the recipe in future.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

