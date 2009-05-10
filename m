Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1M37s8-0001Yg-Ch
	for openembedded-devel@openembedded.org; Sun, 10 May 2009 14:11:12 +0200
Received: (qmail 31727 invoked by uid 1003); 10 May 2009 12:04:45 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 10 May 2009 12:04:44 -0000
Message-ID: <4A06C2DB.50707@balister.org>
Date: Sun, 10 May 2009 08:04:43 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1241686197-14065-1-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1241686197-14065-1-git-send-email-k.kooi@student.utwente.nl>
Subject: Re: [STABLE][PATCH] zaurusd: point tskeys to the real ts device instead hardcoding it to event1
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
X-List-Received-Date: Sun, 10 May 2009 12:11:12 -0000
X-Groupsio-MsgNum: 10140
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms000908060402000807010103"

--------------ms000908060402000807010103
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  .../use-ts-symlink-instead-of-hardcoding.diff      |   88 ++++++++++++++++++++
>  recipes/zaurusd/zaurusd_svn.bb                     |    5 +-
>  2 files changed, 91 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/zaurusd/files/use-ts-symlink-instead-of-hardcoding.diff
> 
> diff --git a/recipes/zaurusd/files/use-ts-symlink-instead-of-hardcoding.diff b/recipes/zaurusd/files/use-ts-symlink-instead-of-hardcoding.diff
> new file mode 100644
> index 0000000..b49a21f
> --- /dev/null
> +++ b/recipes/zaurusd/files/use-ts-symlink-instead-of-hardcoding.diff
> @@ -0,0 +1,88 @@
> +--- /tmp/mach-akita-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-akita-vars.in	2009-04-28 16:40:06.000000000 +0200
> +@@ -5,6 +5,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> + 
> + TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
> +-TSKEYS_DEVICE=/dev/input/event1
> ++TSKEYS_DEVICE=/dev/input/touchscreen0
> + 
> + ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
> +\ No newline at end of file
> +--- /tmp/mach-borzoi-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-borzoi-vars.in	2009-04-28 16:40:06.000000000 +0200
> +@@ -5,6 +5,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> + 
> + TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
> +-TSKEYS_DEVICE=/dev/input/event1
> ++TSKEYS_DEVICE=/dev/input/touchscreen0
> + 
> + ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
> +\ No newline at end of file
> +--- /tmp/mach-corgi-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-corgi-vars.in	2009-04-28 16:40:06.000000000 +0200
> +@@ -5,6 +5,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> + 
> + TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
> +-TSKEYS_DEVICE=/dev/input/event1
> ++TSKEYS_DEVICE=/dev/input/touchscreen0
> + 
> + ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
> +\ No newline at end of file
> +--- /tmp/mach-husky-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-husky-vars.in	2009-04-28 16:40:06.000000000 +0200
> +@@ -5,6 +5,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> + 
> + TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
> +-TSKEYS_DEVICE=/dev/input/event1
> ++TSKEYS_DEVICE=/dev/input/touchscreen0
> + 
> + ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
> +\ No newline at end of file
> +--- /tmp/mach-poodle-vars	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-poodle-vars	2009-04-28 16:40:06.000000000 +0200
> +@@ -4,6 +4,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> + 
> + #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
> +-#TSKEYS_DEVICE=/dev/input/event1
> ++#TSKEYS_DEVICE=/dev/input/touchscreen0
> + 
> + ALSA_MIXER_INIT=@appconfdir@/alsa/poodle-default.state
> +\ No newline at end of file
> +--- /tmp/mach-shepherd-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-shepherd-vars.in	2009-04-28 16:40:06.000000000 +0200
> +@@ -5,6 +5,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> + 
> + TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
> +-TSKEYS_DEVICE=/dev/input/event1
> ++TSKEYS_DEVICE=/dev/input/touchscreen0
> + 
> + ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
> +\ No newline at end of file
> +--- /tmp/mach-spitz-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-spitz-vars.in	2009-04-28 16:40:06.000000000 +0200
> +@@ -5,6 +5,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> + 
> + TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
> +-TSKEYS_DEVICE=/dev/input/event1
> ++TSKEYS_DEVICE=/dev/input/touchscreen0
> + 
> + ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
> +\ No newline at end of file
> +--- /tmp/mach-tosa-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-tosa-vars.in	2009-04-28 16:40:06.000000000 +0200
> +@@ -4,6 +4,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> + 
> + #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
> +-#TSKEYS_DEVICE=/dev/input/event1
> ++#TSKEYS_DEVICE=/dev/input/touchscreen0
> + 
> + ALSA_MIXER_INIT=@appconfdir@/alsa/6000x-default.state
> +\ No newline at end of file
> diff --git a/recipes/zaurusd/zaurusd_svn.bb b/recipes/zaurusd/zaurusd_svn.bb
> index 2ad405e..b2b1622 100644
> --- a/recipes/zaurusd/zaurusd_svn.bb
> +++ b/recipes/zaurusd/zaurusd_svn.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPL"
>  DEPENDS = "tslib"
>  RDEPENDS = "procps"
>  PV = "0.0+svn${SRCDATE}"
> -PR = "r18"
> +PR = "r19"
>  
>  SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=zaurusd;proto=http \
>             file://zaurus-hinge.in \
> @@ -18,7 +18,8 @@ SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=zaurusd;proto=http \
>  	   file://zaurus-hinge.bl-on \
>  	   file://zaurus-hinge.bl-off \
>  	   file://01-check-toggle-landscape \
> -	   file://01-check-toggle-portait"
> +	   file://01-check-toggle-portait \
> +       file://use-ts-symlink-instead-of-hardcoding.diff;patch=1 "
>  
>  
>  S = "${WORKDIR}/${PN}"

--------------ms000908060402000807010103
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICECwlen/oUcoDd1VrNqKp/fwwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA5MDQxNTAwNDQ1OFoXDTEwMDQxNTAwNDQ1
OFowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx5Xoie8CV9dJeiaiKRdylvicHE9Aha6f9/CLlVs+Ezob7fIu
Ra4P9ugzZZ2VCtPMQU3Qsjw35mVmYaKXB1U+fZeffbyad6OJEIK1jhqBIz5jtJMc/YWXn/bRmqCl
MfTCgilUMOcsfiHAbmLVhYiNbEhOuy6vWdxSSolHqVa/IHE72qqjhoYWHd+5XVfx1c4jW+CePNMQ
EHxjCzuD+wq6Mzle72dXw+bnyIpG99hB26uNmV//h5iz1VmJU63FZWynSjG79NcY9+mTWXeX213V
V6kJ2wce2rETbYvKQ7err6NnZnG/tiwGI1M7fQqQAti+CkDciLJ129LO+APVYZQgEwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEAIUyDAPIEniN6SUdbDiBqi2dtITdnkoUItm/tX9TRn66P0VtWug7k7xjo6piWRE7B
ZwhihotNY0ZnjlK+h0VorxfY63B5tarRB6qJ7f26ukmpltwWWLDB2hWFoKUCn6PE2NTdj+1xNinh
ZNQHy4GyygXjlVfVSn/ZnaGJ31z4PK0wggL9MIICZqADAgECAhAsJXp/6FHKA3dVazaiqf38MA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wOTA0MTUwMDQ0NThaFw0xMDA0MTUwMDQ0NThaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMeV6InvAlfX
SXomoikXcpb4nBxPQIWun/fwi5VbPhM6G+3yLkWuD/boM2WdlQrTzEFN0LI8N+ZlZmGilwdVPn2X
n328mnejiRCCtY4agSM+Y7STHP2Fl5/20ZqgpTH0woIpVDDnLH4hwG5i1YWIjWxITrsur1ncUkqJ
R6lWvyBxO9qqo4aGFh3fuV1X8dXOI1vgnjzTEBB8Yws7g/sKujM5Xu9nV8Pm58iKRvfYQdurjZlf
/4eYs9VZiVOtxWVsp0oxu/TXGPfpk1l3l9td1VepCdsHHtqxE22LykO3q6+jZ2Zxv7YsBiNTO30K
kALYvgpA3IiyddvSzvgD1WGUIBMCAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBACFMgwDyBJ4jeklHWw4gaotnbSE3
Z5KFCLZv7V/U0Z+uj9FbVroO5O8Y6OqYlkROwWcIYoaLTWNGZ45SvodFaK8X2OtwebWq0Qeqie39
urpJqZbcFliwwdoVhaClAp+jxNjU3Y/tcTYp4WTUB8uBssoF45VX1Up/2Z2hid9c+DytMIIDPzCC
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
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAsJXp/6FHKA3dVazaiqf38MAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDUxMDEy
MDQ0M1owIwYJKoZIhvcNAQkEMRYEFBIqfxTbI/lBxs0B1jhgbAlKhJCHMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQAEZjUoV2PJTnjh06YUHp6Hx65WlCai2uvaMCVkItmlHDVp1Rlq
KmF5uUfv+K12/2CTqlIqCj7ye4aFMkv8IE6BR9ujvFhH7abEgBxAzTiUsBbYGM+Z/jMTnu3NAFpd
ubItwjwkiyQ0ei9I3Q0vQFquGcLu+TNspRIJUp3aAnzhuNR2ZIufAkLXlbuc/d6Hjfxh0TzF5hwX
74pFtBjxYiTDgmIuoxBJYTbRls5kGs3SN7C5mTcjfs8Kt0R7etHU0u8kMEhP/H5IasT70FvDyNA3
XtiYcXOZtnVLb34TkNT4n699wxeYSGiUOPCFJen5Z37mP3C4aEM3gtoGulrGBO9jAAAAAAAA

--------------ms000908060402000807010103--
