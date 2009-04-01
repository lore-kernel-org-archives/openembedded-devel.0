Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Lp1YI-0000xS-SO
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 16:36:29 +0200
Received: (qmail 29389 invoked by uid 1003); 1 Apr 2009 14:34:04 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 1 Apr 2009 14:34:03 -0000
Message-ID: <49D37B58.9090909@balister.org>
Date: Wed, 01 Apr 2009 10:34:00 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1238532016-3172-1-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1238532016-3172-1-git-send-email-k.kooi@student.utwente.nl>
Subject: Re: [STABLE][PATCH] linux-omap 2.6.29: disable alignment trapping completely for omap3board
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
X-List-Received-Date: Wed, 01 Apr 2009 14:36:42 -0000
X-Groupsio-MsgNum: 8941
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms010507000306060308020509"

--------------ms010507000306060308020509
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister (philip@balister.org)

Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  .../linux/linux-omap-2.6.29/beagleboard/defconfig  |    2 +-
>  .../linux-omap-2.6.29/fix-unaligned-access.diff    |   41 ++++++++++++++++++++
>  .../linux-omap-2.6.29/make-alignment-visible.diff  |   26 ++++++++++++
>  .../linux-omap-2.6.29/omap3-pandora/defconfig      |    2 +-
>  recipes/linux/linux-omap-2.6.29/omap3evm/defconfig |    2 +-
>  recipes/linux/linux-omap-2.6.29/omapzoom/defconfig |    2 +-
>  recipes/linux/linux-omap_2.6.29.bb                 |    4 +-
>  7 files changed, 74 insertions(+), 5 deletions(-)
>  create mode 100644 recipes/linux/linux-omap-2.6.29/fix-unaligned-access.diff
>  create mode 100644 recipes/linux/linux-omap-2.6.29/make-alignment-visible.diff
> 
> diff --git a/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig b/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig
> index f6c503c..2292ae2 100644
> --- a/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig
> +++ b/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig
> @@ -288,7 +288,7 @@ CONFIG_ZONE_DMA_FLAG=0
>  CONFIG_VIRT_TO_BUS=y
>  CONFIG_UNEVICTABLE_LRU=y
>  CONFIG_LEDS=y
> -CONFIG_ALIGNMENT_TRAP=y
> +CONFIG_ALIGNMENT_TRAP=n
>  
>  #
>  # Boot options
> diff --git a/recipes/linux/linux-omap-2.6.29/fix-unaligned-access.diff b/recipes/linux/linux-omap-2.6.29/fix-unaligned-access.diff
> new file mode 100644
> index 0000000..c82090f
> --- /dev/null
> +++ b/recipes/linux/linux-omap-2.6.29/fix-unaligned-access.diff
> @@ -0,0 +1,41 @@
> +From: Mans Rullgard <mans@mansr.com>
> +Date: Sat, 28 Mar 2009 12:54:25 +0000 (+0000)
> +Subject: NSM: Fix unaligned accesses in nsm_init_private()
> +X-Git-Url: http://git.mansr.com/?p=linux-omap;a=commitdiff_plain;h=8f2bd6fdde1ebfef57f65b6cf29b29008c23d297
> +
> +NSM: Fix unaligned accesses in nsm_init_private()
> +
> +This fixes unaligned accesses in nsm_init_private() when
> +creating nlm_reboot keys.
> +
> +Signed-off-by: Mans Rullgard <mans@mansr.com>
> +---
> +
> +diff --git a/fs/lockd/mon.c b/fs/lockd/mon.c
> +index 5e2c4d5..6d5d4a4 100644
> +--- a/fs/lockd/mon.c
> ++++ b/fs/lockd/mon.c
> +@@ -16,6 +16,8 @@
> + #include <linux/sunrpc/svc.h>
> + #include <linux/lockd/lockd.h>
> + 
> ++#include <asm/unaligned.h>
> ++
> + #define NLMDBG_FACILITY		NLMDBG_MONITOR
> + #define NSM_PROGRAM		100024
> + #define NSM_VERSION		1
> +@@ -274,10 +276,12 @@ static void nsm_init_private(struct nsm_handle *nsm)
> + {
> + 	u64 *p = (u64 *)&nsm->sm_priv.data;
> + 	struct timespec ts;
> ++	s64 ns;
> + 
> + 	ktime_get_ts(&ts);
> +-	*p++ = timespec_to_ns(&ts);
> +-	*p = (unsigned long)nsm;
> ++	ns = timespec_to_ns(&ts);
> ++	put_unaligned(ns, p);
> ++	put_unaligned((unsigned long)nsm, p + 1);
> + }
> + 
> + static struct nsm_handle *nsm_create_handle(const struct sockaddr *sap,
> diff --git a/recipes/linux/linux-omap-2.6.29/make-alignment-visible.diff b/recipes/linux/linux-omap-2.6.29/make-alignment-visible.diff
> new file mode 100644
> index 0000000..9b3958f
> --- /dev/null
> +++ b/recipes/linux/linux-omap-2.6.29/make-alignment-visible.diff
> @@ -0,0 +1,26 @@
> +From: Mans Rullgard <mans@mansr.com>
> +Date: Mon, 13 Oct 2008 19:32:16 +0000 (+0100)
> +Subject: ARM: Add prompt for CONFIG_ALIGNMENT_TRAP
> +X-Git-Url: http://git.mansr.com/?p=linux-omap;a=commitdiff_plain;h=60d60f0ca47fcf4fbb649e45aa64f5a0a4c2f2c8
> +
> +ARM: Add prompt for CONFIG_ALIGNMENT_TRAP
> +
> +This adds a prompt text for CONFIG_ALIGNMENT_TRAP, thus making it
> +visible in make *config.
> +
> +Signed-off-by: Mans Rullgard <mans@mansr.com>
> +---
> +
> +diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> +index 61314f6..18d3119 100644
> +--- a/arch/arm/Kconfig
> ++++ b/arch/arm/Kconfig
> +@@ -971,7 +971,7 @@ config LEDS_CPU
> + 	  will overrule the CPU usage LED.
> + 
> + config ALIGNMENT_TRAP
> +-	bool
> ++	bool "Enable alignment trap"
> + 	depends on CPU_CP15_MMU
> + 	default y if !ARCH_EBSA110
> + 	help
> diff --git a/recipes/linux/linux-omap-2.6.29/omap3-pandora/defconfig b/recipes/linux/linux-omap-2.6.29/omap3-pandora/defconfig
> index 5db83f0..8ac420c 100644
> --- a/recipes/linux/linux-omap-2.6.29/omap3-pandora/defconfig
> +++ b/recipes/linux/linux-omap-2.6.29/omap3-pandora/defconfig
> @@ -298,7 +298,7 @@ CONFIG_ZONE_DMA_FLAG=0
>  CONFIG_VIRT_TO_BUS=y
>  CONFIG_UNEVICTABLE_LRU=y
>  CONFIG_LEDS=y
> -CONFIG_ALIGNMENT_TRAP=y
> +CONFIG_ALIGNMENT_TRAP=n
>  
>  #
>  # Boot options
> diff --git a/recipes/linux/linux-omap-2.6.29/omap3evm/defconfig b/recipes/linux/linux-omap-2.6.29/omap3evm/defconfig
> index da5a8c4..da72671 100644
> --- a/recipes/linux/linux-omap-2.6.29/omap3evm/defconfig
> +++ b/recipes/linux/linux-omap-2.6.29/omap3evm/defconfig
> @@ -298,7 +298,7 @@ CONFIG_ZONE_DMA_FLAG=0
>  CONFIG_VIRT_TO_BUS=y
>  CONFIG_UNEVICTABLE_LRU=y
>  CONFIG_LEDS=y
> -CONFIG_ALIGNMENT_TRAP=y
> +CONFIG_ALIGNMENT_TRAP=n
>  
>  #
>  # Boot options
> diff --git a/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig b/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig
> index d2d2ee5..aa11eb0 100644
> --- a/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig
> +++ b/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig
> @@ -291,7 +291,7 @@ CONFIG_ZONE_DMA_FLAG=0
>  CONFIG_VIRT_TO_BUS=y
>  CONFIG_UNEVICTABLE_LRU=y
>  # CONFIG_LEDS is not set
> -CONFIG_ALIGNMENT_TRAP=y
> +CONFIG_ALIGNMENT_TRAP=n
>  
>  #
>  # Boot options
> diff --git a/recipes/linux/linux-omap_2.6.29.bb b/recipes/linux/linux-omap_2.6.29.bb
> index f5c20ba..a74bd62 100644
> --- a/recipes/linux/linux-omap_2.6.29.bb
> +++ b/recipes/linux/linux-omap_2.6.29.bb
> @@ -10,7 +10,7 @@ DEFAULT_PREFERENCE = "-1"
>  
>  SRCREV = "90e758af52ba803cba233fabee81176d99589f09"
>  
> -PR = "r2+gitr${SRCREV}"
> +PR = "r3+gitr${SRCREV}"
>  
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
>  	   file://defconfig"
> @@ -22,6 +22,8 @@ SRC_URI_append = " \
>             file://fix-install.patch;patch=1 \
>             file://DSS2.diff;patch=1 \
>             file://0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch;patch=1 \
> +           file://fix-unaligned-access.diff;patch=1 \
> +           file://make-alignment-visible.diff;patch=1 \
>  "
>  
>  

--------------ms010507000306060308020509
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICEHW4VJIUQV0u11NnfLpF2IUwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA4MDQxNDE5MTkzMVoXDTA5MDQxNDE5MTkz
MVowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxyNViPlSmMq2Kl4m7iDBI3gB7Pwhg+4vnXCKEF3qIoLwNDVl
27CP8RY0umjENzykOR6ZhzYx4fH8arNV5+nlXsH8KNnbDpd5ICTZvbUJdt1gPETmLczGy4hh8woC
u7qodyy7YZcGMiUY5LxoL7vIQHysir4rbMRV/JIdmhKfFrHb+glDe8XbfTJ3xKO+BsMgLDaSiRMe
lH6uFLAVv9oRoIJxHQhwKLvlrOSQj+ek2fL683BzOUsM4BN/fiwvtJ/y3doVEoKUp8ippOXrwLAX
FPprPAAdIydqufTxHotooFqbQzqSJv4cTNDTxf2fg9YfH2RAs8vTdc/wgIVlL8fJnQIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEASFC7i4DqutUTifbyNtEe+e9bqgqWUScDFl0BTV5fFVBX/mFpM3RBZJfq+iM5q0L7
qont3sGaXG0cdVvRk2dkuV2i0HwkmTLJ4HTLMyJ57BjMJWY9ydDiY+Ai1pINmjIgq/qI0aireByq
Nee68q+PaWE7bfW1XvfqZD56QunCijswggL9MIICZqADAgECAhB1uFSSFEFdLtdTZ3y6RdiFMA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wODA0MTQxOTE5MzFaFw0wOTA0MTQxOTE5MzFaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMcjVYj5UpjK
tipeJu4gwSN4Aez8IYPuL51wihBd6iKC8DQ1Zduwj/EWNLpoxDc8pDkemYc2MeHx/GqzVefp5V7B
/CjZ2w6XeSAk2b21CXbdYDxE5i3MxsuIYfMKAru6qHcsu2GXBjIlGOS8aC+7yEB8rIq+K2zEVfyS
HZoSnxax2/oJQ3vF230yd8SjvgbDICw2kokTHpR+rhSwFb/aEaCCcR0IcCi75azkkI/npNny+vNw
czlLDOATf34sL7Sf8t3aFRKClKfIqaTl68CwFxT6azwAHSMnarn08R6LaKBam0M6kib+HEzQ08X9
n4PWHx9kQLPL03XP8ICFZS/HyZ0CAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBAEhQu4uA6rrVE4n28jbRHvnvW6oK
llEnAxZdAU1eXxVQV/5haTN0QWSX6vojOatC+6qJ7d7BmlxtHHVb0ZNnZLldotB8JJkyyeB0yzMi
eewYzCVmPcnQ4mPgItaSDZoyIKv6iNGoq3gcqjXnuvKvj2lhO231tV736mQ+ekLpwoo7MIIDPzCC
AqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rl
cm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEo
MCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3Rl
IFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDE
pjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J
8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+n
ttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4
oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmww
CwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODAN
BgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0
HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghO
rvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCA2QwggNgAgEBMHYwYjELMAkGA1UEBhMC
WkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhB1uFSSFEFdLtdTZ3y6RdiFMAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDQwMTE0
MzQwMFowIwYJKoZIhvcNAQkEMRYEFJWCHt9J1S2MBEKShZ/r/1wggbZzMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXYhTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXY
hTANBgkqhkiG9w0BAQEFAASCAQC7+835ne96GgBQbpc0Cl3DZwbX4l/Y3niiSsga5aaQ+PG2gpCQ
8tegGkOjs9ERf6OTL3Wv+0XuR0LlqIzQtiaoSMrvQbvqdm2nKYWSrn8kWHL+IhReAARjGDistWyE
sgoe0vsOJK76O03YNllgntYS4fd8XH2er4DfBdqOkLzbzcUbsyCKXF/FYnSCUzZfE0kxBmJDnUPe
CjYBqHxbxm6oxarDJCLREkZpiLdE8Ca0TqEjwXF1PLnST6m6Q7wufPzYrMIroq++3NgJFcf3EQEN
rB9KmqLW1icNi458BRDcmrGVICJkVbd8BVvjQqrNEE/YVUdqQaaCN98bfRx3dOuKAAAAAAAA

--------------ms010507000306060308020509--
