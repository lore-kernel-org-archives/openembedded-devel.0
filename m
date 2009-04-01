Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Lp0wI-0007yM-SE
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 15:57:11 +0200
Received: (qmail 15122 invoked by uid 1003); 1 Apr 2009 13:54:48 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 1 Apr 2009 13:54:47 -0000
Message-ID: <49D37224.1090106@balister.org>
Date: Wed, 01 Apr 2009 09:54:44 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1238532010-2811-1-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1238532010-2811-1-git-send-email-k.kooi@student.utwente.nl>
Subject: Re: [STABLE][PATCH] linux-omap: add patch to fix mmc support and	update defconfig
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
X-List-Received-Date: Wed, 01 Apr 2009 13:57:11 -0000
X-Groupsio-MsgNum: 8930
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms050809040509000302070106"

--------------ms050809040509000302070106
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister (philip@balister.org)

Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  ...add-regulator-info-to-get-the-microSD-slo.patch |  110 ++++++++++++++++++++
>  recipes/linux/linux-omap-2.6.29/omapzoom/defconfig |    6 +-
>  recipes/linux/linux-omap_2.6.29.bb                 |    3 +-
>  3 files changed, 115 insertions(+), 4 deletions(-)
>  create mode 100644 recipes/linux/linux-omap-2.6.29/0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch
> 
> diff --git a/recipes/linux/linux-omap-2.6.29/0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch b/recipes/linux/linux-omap-2.6.29/0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch
> new file mode 100644
> index 0000000..ddee308
> --- /dev/null
> +++ b/recipes/linux/linux-omap-2.6.29/0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch
> @@ -0,0 +1,110 @@
> +From 0561e7124500418e913a3b91ddc09d4bd8dc5032 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@beagleboard.org>
> +Date: Mon, 30 Mar 2009 15:21:37 +0200
> +Subject: [PATCH] ARM: OMAP: board-ldp: add regulator info to get the microSD slot working again
> +
> +The ldp board was left behind when other boards got updated. The ldp info was copied from the beagleboard board file and s/beagle/ldp/g
> +
> +Signed-off-by: Koen Kooi <koen@beagleboard.org>
> +---
> + arch/arm/mach-omap2/board-ldp.c |   55 +++++++++++++++++++++++++++++++++++++++
> + 1 files changed, 55 insertions(+), 0 deletions(-)
> +
> +diff --git a/arch/arm/mach-omap2/board-ldp.c b/arch/arm/mach-omap2/board-ldp.c
> +index 30926b0..faf62f8 100644
> +--- a/arch/arm/mach-omap2/board-ldp.c
> ++++ b/arch/arm/mach-omap2/board-ldp.c
> +@@ -22,6 +22,7 @@
> + #include <linux/clk.h>
> + #include <linux/spi/spi.h>
> + #include <linux/spi/ads7846.h>
> ++#include <linux/regulator/machine.h>
> + #include <linux/i2c/twl4030.h>
> + 
> + #include <mach/hardware.h>
> +@@ -450,7 +451,17 @@ static struct twl4030_script *twl4030_scripts[] __initdata = {
> + 	&wrst_script,
> + };
> + 
> ++static const struct twl4030_resconfig ldp_resconfig[] = {
> ++	/* disable regulators that u-boot left enabled; the
> ++	 * devices' drivers should be managing these.
> ++	 */
> ++	{ .resource = RES_VMMC1, },
> ++	{ .resource = RES_VSIM, },
> ++	{ 0, },
> ++};
> ++
> + static struct twl4030_power_data sdp3430_t2scripts_data __initdata = {
> ++	.resource_config	= ldp_resconfig,
> + 	.scripts	= twl4030_scripts,
> + 	.size		= ARRAY_SIZE(twl4030_scripts),
> + };
> +@@ -474,6 +485,44 @@ static struct twl4030_madc_platform_data ldp_madc_data = {
> + 	.irq_line	= 1,
> + };
> + 
> ++static struct regulator_consumer_supply ldp_vmmc1_supply = {
> ++	.supply			= "vmmc",
> ++};
> ++
> ++static struct regulator_consumer_supply ldp_vsim_supply = {
> ++	.supply			= "vmmc_aux",
> ++};
> ++
> ++/* VMMC1 for MMC1 pins CMD, CLK, DAT0..DAT3 (20 mA, plus card == max 220 mA) */
> ++static struct regulator_init_data ldp_vmmc1 = {
> ++	.constraints = {
> ++		.min_uV			= 1850000,
> ++		.max_uV			= 3150000,
> ++		.valid_modes_mask	= REGULATOR_MODE_NORMAL
> ++					| REGULATOR_MODE_STANDBY,
> ++		.valid_ops_mask		= REGULATOR_CHANGE_VOLTAGE
> ++					| REGULATOR_CHANGE_MODE
> ++					| REGULATOR_CHANGE_STATUS,
> ++	},
> ++	.num_consumer_supplies	= 1,
> ++	.consumer_supplies	= &ldp_vmmc1_supply,
> ++};
> ++
> ++/* VSIM for MMC1 pins DAT4..DAT7 (2 mA, plus card == max 50 mA) */
> ++static struct regulator_init_data ldp_vsim = {
> ++	.constraints = {
> ++		.min_uV			= 1800000,
> ++		.max_uV			= 3000000,
> ++		.valid_modes_mask	= REGULATOR_MODE_NORMAL
> ++					| REGULATOR_MODE_STANDBY,
> ++		.valid_ops_mask		= REGULATOR_CHANGE_VOLTAGE
> ++					| REGULATOR_CHANGE_MODE
> ++					| REGULATOR_CHANGE_STATUS,
> ++	},
> ++	.num_consumer_supplies	= 1,
> ++	.consumer_supplies	= &ldp_vsim_supply,
> ++};
> ++
> + static struct twl4030_platform_data ldp_twldata = {
> + 	.irq_base	= TWL4030_IRQ_BASE,
> + 	.irq_end	= TWL4030_IRQ_END,
> +@@ -483,6 +532,8 @@ static struct twl4030_platform_data ldp_twldata = {
> + 	.madc		= &ldp_madc_data,
> + 	.usb		= &ldp_usb_data,
> + 	.power		= &sdp3430_t2scripts_data,
> ++	.vmmc1		= &ldp_vmmc1,
> ++	.vsim		= &ldp_vsim,
> + 	.gpio		= &ldp_gpio_data,
> + 	.keypad		= &ldp_kp_twl4030_data,
> + };
> +@@ -530,6 +581,10 @@ static void __init omap_ldp_init(void)
> + 	omap_serial_init();
> + 	usb_musb_init();
> + 	twl4030_mmc_init(mmc);
> ++	/* link regulators to MMC adapters */
> ++	ldp_vmmc1_supply.dev = mmc[0].dev;
> ++	ldp_vsim_supply.dev = mmc[0].dev;
> ++	
> + }
> + 
> + static void __init omap_ldp_map_io(void)
> +-- 
> +1.6.2
> +
> diff --git a/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig b/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig
> index 194ec72..d2d2ee5 100644
> --- a/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig
> +++ b/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig
> @@ -1,7 +1,7 @@
>  #
>  # Automatically generated make config: don't edit
>  # Linux kernel version: 2.6.29-omap1
> -# Mon Mar 30 12:32:35 2009
> +# Mon Mar 30 15:25:29 2009
>  #
>  CONFIG_ARM=y
>  CONFIG_SYS_SUPPORTS_APM_EMULATION=y
> @@ -1773,8 +1773,8 @@ CONFIG_DETECT_SOFTLOCKUP=y
>  # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
>  CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
>  CONFIG_SCHED_DEBUG=y
> -# CONFIG_SCHEDSTATS is not set
> -# CONFIG_TIMER_STATS is not set
> +CONFIG_SCHEDSTATS=y
> +CONFIG_TIMER_STATS=y
>  # CONFIG_DEBUG_OBJECTS is not set
>  # CONFIG_DEBUG_SLAB is not set
>  # CONFIG_DEBUG_RT_MUTEXES is not set
> diff --git a/recipes/linux/linux-omap_2.6.29.bb b/recipes/linux/linux-omap_2.6.29.bb
> index cf1a93c..86827fd 100644
> --- a/recipes/linux/linux-omap_2.6.29.bb
> +++ b/recipes/linux/linux-omap_2.6.29.bb
> @@ -10,7 +10,7 @@ DEFAULT_PREFERENCE = "-1"
>  
>  SRCREV = "90e758af52ba803cba233fabee81176d99589f09"
>  
> -PR = "r0+gitr${SRCREV}"
> +PR = "r1+gitr${SRCREV}"
>  
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
>  	   file://defconfig"
> @@ -21,6 +21,7 @@ SRC_URI_append = " \
>             file://read_die_ids.patch;patch=1 \
>             file://fix-install.patch;patch=1 \
>             file://DSS2.diff;patch=1 \
> +           file://0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch;patch=1 \
>  "
>  
>  

--------------ms050809040509000302070106
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDQwMTEz
NTQ0NFowIwYJKoZIhvcNAQkEMRYEFOivPSKJQ4hqpkDA0DKbWS4S/XZ9MFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXYhTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXY
hTANBgkqhkiG9w0BAQEFAASCAQAR9Muu5hgmNCdgHABfIBuKGIC0dlX2Fumdu/rgSYngFlLN2zXU
C5bbrnAF8dOj2ID118a2j0RP3BYy3gn9zmroyGId+8e8b9ubdoyLIrxi/F0plg1QHnZ8utQGDTip
pUf09XTKUf6XSk0N9A8yjRqpAdV+2wxqK9sxMfQbacKVETcIqFXn9ZeC8ZXfacx2Hyd2x75iVYJ3
AjPHLiZ2X3TmZ58Zq8knMBasSFVmO9+gw19Bqo+MjooIhiIEQPqccbvPjiLvI67NgZQE/7Fp5el1
2g30bUEYI7QmOGiBt7lK3WnV70Ft7qCNK5n1UW/B9nVyyBJk6g2Vn7n5mULg2BhsAAAAAAAA

--------------ms050809040509000302070106--
