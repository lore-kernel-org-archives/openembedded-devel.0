Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Lp0zA-0003Fi-To
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 16:00:09 +0200
Received: (qmail 712 invoked by uid 1003); 1 Apr 2009 13:57:46 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 1 Apr 2009 13:57:45 -0000
Message-ID: <49D372D6.8020402@balister.org>
Date: Wed, 01 Apr 2009 09:57:42 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1238532011-2902-1-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1238532011-2902-1-git-send-email-k.kooi@student.utwente.nl>
Subject: Re: [STABLE][PATCH] ti-codec-combos: Use DVSDK Codec Combos to be	aligned with DVSDK
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
X-List-Received-Date: Wed, 01 Apr 2009 14:00:10 -0000
X-Groupsio-MsgNum: 8933
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms010101010002020102070003"

--------------ms010101010002020102070003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister (philip@balister.org)

Koen Kooi wrote:
> From: Roger Monk <r-monk@ti.com>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/dsplink/ti-codec-combos_3.16.bb |   19 +++----------------
>  recipes/dsplink/ti-codec-engine_2.23.bb |    5 +++--
>  2 files changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/recipes/dsplink/ti-codec-combos_3.16.bb b/recipes/dsplink/ti-codec-combos_3.16.bb
> index dc1ef9f..dd97a57 100644
> --- a/recipes/dsplink/ti-codec-combos_3.16.bb
> +++ b/recipes/dsplink/ti-codec-combos_3.16.bb
> @@ -4,7 +4,9 @@ LICENCE = "unknown"
>  
>  require ti-paths.inc
>  
> -SRC_URI = "http://software-dl.ti.com/sdo/sdo_apps_public_sw/omap3530_dvsdk_combos_tspa/omap3530_dvsdk_combos_tspa-3_16-Linux-x86.bin \
> +
> +# Tar-Up Codec Combos from the OMAP DVSDK (http://www.ti.com/dvevmupdates) and drop in files/
> +SRC_URI = "file://omap3530_dvsdk_combos_3_16.tar.gz \
>      "
>  
>  S = "${WORKDIR}/omap3530_dvsdk_combos_3_16"
> @@ -20,21 +22,6 @@ export CE_INSTALL_DIR="${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/ti-codec-engine/pa
>  # Needed for now since makefile in latest package assumes this is set
>  export CODEC_INSTALL_DIR="${S}"
>  
> -# Helper function to run the binary installer and unpack the tar.gz in the same place as it was before - this could be optimised later
> -do_accept_license() {
> -        export HOME="${WORKDIR}"
> -	chmod +x ${WORKDIR}/omap3530_dvsdk_combos_tspa-3_16-Linux-x86.bin
> -        ${WORKDIR}/omap3530_dvsdk_combos_tspa-3_16-Linux-x86.bin --mode silent --prefix ${S}_install
> -        cd "${S}_install"
> -	tar -xzvf omap3530_dvsdk_combos_tspa_3_16.tar.gz
> -	if [ -d ${S} ] ; then 
> -            rm -rf ${S}
> -        fi
> -        mv omap3530_dvsdk_combos_tspa_3_16 ${S}
> -}
> -
> -addtask accept_license after do_unpack before do_configure
> -
>  do_compile() {
>  
>          # For now, remove the reference to Rules.make and swap prod for eval, since this only has eval libs included
> diff --git a/recipes/dsplink/ti-codec-engine_2.23.bb b/recipes/dsplink/ti-codec-engine_2.23.bb
> index 78684f4..a42c33b 100644
> --- a/recipes/dsplink/ti-codec-engine_2.23.bb
> +++ b/recipes/dsplink/ti-codec-engine_2.23.bb
> @@ -125,7 +125,7 @@ do_compile () {
>        COMPILER="${KERNEL_CC}" \
>        ARCHIVER="${KERNEL_AR}" \
>        KERNEL_DIR="${STAGING_KERNEL_DIR}" \
> -      clean default
> +      clean all
>  
>      # Build the gpp samples
>      cd ${DSPLINK}/gpp/src/samples
> @@ -230,7 +230,8 @@ do_compile () {
>            CGTOOLS_V5T="${CROSS_DIR}" \
>            CGTOOLS_C64P="${TICGTOOLSDIR}" \ 
>            -C ${S}/examples/ti/sdo/ce/examples/$i \
> -         clean all
> +         clean 
> +#all
>      done    
>  }
>  

--------------ms010101010002020102070003
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
NTc0MlowIwYJKoZIhvcNAQkEMRYEFEIhqp+B2gq+u4ySHiGY67tTy2hQMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXYhTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXY
hTANBgkqhkiG9w0BAQEFAASCAQB488F9tyeIqAqCgIQ0e2Aua6PLbZKobxiGNEHf2COWSgPbMVth
9ganw5QQWpW3S3K8CnyPkXefZXFEVqtpAfbhgE413/eV8J0YrfOsSTP/OzWK6ClUzHggEZZAryKt
OVC5rwGGnPUrzlTRwftkIpPeqSi3xJzy0g394SKmwRzVUi2jo/v8dgc4H1kvWdnxkn0lHZebdixG
Qb2FhHhV2zFBpLt5AMyciigHzblKW++KhAhYbIUI8KnF3dloQUD7IO4ElARk13g12xGwqMpCk4jl
ATa5EvwDkWgeTzLmK4YtiQTv2LhhT6nSmkLKH1XYFDGR19lBusi4/InSX4zuYf4rAAAAAAAA

--------------ms010101010002020102070003--
