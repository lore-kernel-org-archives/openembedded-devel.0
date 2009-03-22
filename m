Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1LlP1B-0008Nk-VB
	for openembedded-devel@openembedded.org; Sun, 22 Mar 2009 15:51:18 +0100
Received: (qmail 9141 invoked by uid 1003); 22 Mar 2009 14:49:59 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 22 Mar 2009 14:49:59 -0000
Message-ID: <49C65016.4040901@balister.org>
Date: Sun, 22 Mar 2009 10:49:58 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1237731142-8136-1-git-send-email-matthieu.poullet@gmail.com>
In-Reply-To: <1237731142-8136-1-git-send-email-matthieu.poullet@gmail.com>
Subject: Re: [PATCH] Alsa-state: Wildcard removed and all *.state put back	in the recipes
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
X-List-Received-Date: Sun, 22 Mar 2009 14:51:18 -0000
X-Groupsio-MsgNum: 8606
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms070201080403070100000307"

--------------ms070201080403070100000307
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Matthieu Poullet wrote:
> The wildcard doesn't work properly.
> So either the wildcard support must be fixed or all the *.state files must be added in the SRC_URI.

Acked-by: Philip Balister (philip@balister.org)

This makes the packages created from this recipe more deterministic.


> 
> ---
>  recipes/alsa/alsa-state.bb |   10 +++++++++-
>  1 files changed, 9 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/alsa/alsa-state.bb b/recipes/alsa/alsa-state.bb
> index 3ebc0d5..a878c57 100644
> --- a/recipes/alsa/alsa-state.bb
> +++ b/recipes/alsa/alsa-state.bb
> @@ -13,7 +13,15 @@ SRC_URI = "\
>    file://asound.conf \
>    file://asound.state \
>    file://alsa-state \
> -  file://*.state \
> +  file://asound.state \
> +  file://at91sam9263ek/asound.state \
> +  file://spitz/asound.state \
> +  file://tosa/asound.state \
> +  file://c7x0/asound.state \
> +  file://magician/asound.state \
> +  file://hx4700/asound.state \
> +  file://nokia800/asound.state \
> +  file://akita/asound.state \
>  "
>  
>  inherit update-rc.d

--------------ms070201080403070100000307
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDMyMjE0
NDk1OFowIwYJKoZIhvcNAQkEMRYEFHm7k9VKmI4LXN7EzdrCd4FnPJ55MFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXYhTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXY
hTANBgkqhkiG9w0BAQEFAASCAQAJ81OJY5DubNXRrxwkn4QgLd/1WiABj7Da0kn6BZHyW0dGcHCR
ufqB6X2SoIARcQZYzaYOfrwGWCdyKjNW9zet5gJdkzLNav+6r2AOqz1fgCMgNgYXSXP2smvBtzWD
DkKTHeJXtegCwIe1ObP3zi6X+Wm9uCfuhCchGMhA9G9V5eyNmIqXtJKFpJQ1BuyE/pA6vlT7PDYh
HWobqGdEAiK8nh3kcJ/Cy27ChyvHYpoykBVCVGkZDp5f2BKMzoI76WejCwLScdh4fP+t16JovmLl
Zy8HQ5z/iL8qfs7vjTZGchyksYMp9GAOmxlWPu55B/mcO0A+bYaC+MmzhKNUAOPFAAAAAAAA

--------------ms070201080403070100000307--
