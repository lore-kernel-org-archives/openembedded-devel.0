Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1M1Irq-0005u7-6V
	for openembedded-devel@openembedded.org; Tue, 05 May 2009 13:31:25 +0200
Received: (qmail 29470 invoked by uid 1003); 5 May 2009 11:25:27 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 5 May 2009 11:25:26 -0000
Message-ID: <4A002225.7020503@balister.org>
Date: Tue, 05 May 2009 07:25:25 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1241519336-28278-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1241519336-28278-3-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1241519336-28278-3-git-send-email-marcin@juszkiewicz.com.pl>
Subject: Re: [STABLE][PATCH 1/1] u-boot-bug: Added U-Boot for BUG (from BUG	Labs SVN)
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
X-List-Received-Date: Tue, 05 May 2009 11:31:29 -0000
X-Groupsio-MsgNum: 10026
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms080104060603060507090403"

--------------ms080104060603060507090403
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <marcin@buglabs.net>
> 
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
> ---
>  conf/distro/include/sane-srcrevs.inc |    1 +
>  recipes/u-boot/u-boot-bug_svn.bb     |   37 ++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/u-boot/u-boot-bug_svn.bb
> 
> diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
> index 64781eb..d924070 100644
> --- a/conf/distro/include/sane-srcrevs.inc
> +++ b/conf/distro/include/sane-srcrevs.inc
> @@ -239,6 +239,7 @@ SRCREV_pn-table ?= "2191"
>  SRCREV_pn-tichy ?= "ab68d849502009cf3214df48ffa8075a10cc2177"
>  SRCREV_pn-tmut ?= "60"
>  SRCREV_pn-toscoterm ?= "f02add76f365a2fecd2dbefc230ceaab20244f96"
> +SRCREV_pn-u-boot-bug ?= "8674"
>  SRCREV_pn-u-boot-openmoko ?= "650149a53dbdd48bf6dfef90930c8ab182adb512"
>  SRCREV_pn-u-boot-openmoko-devel ?= "ba029a1426bfca169572bf80d50a8b190a6b0e19"
>  SRCREV_pn-uclibc ?= "25712"
> diff --git a/recipes/u-boot/u-boot-bug_svn.bb b/recipes/u-boot/u-boot-bug_svn.bb
> new file mode 100644
> index 0000000..c1930f4
> --- /dev/null
> +++ b/recipes/u-boot/u-boot-bug_svn.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION = "U-boot bootloader w/ BUG support"
> +LICENSE = "GPL"
> +SECTION = "bootloader"
> +PRIORITY = "optional"
> +PV = "1.3.2+svnr${SRCREV}"
> +SRCREV = "${AUTOREV}"
> +PR = "r6"
> +
> +SRC_URI = "\
> +  svn://svn.buglabs.net/bug/branches/R1.4/qa;module=u-boot;proto=svn \
> +"
> +S = "${WORKDIR}/u-boot"
> +
> +COMPATIBLE_MACHINE = "bug"
> +PACKAGE_ARCH = "${MACHINE}"
> +
> +EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
> +TARGET_LDFLAGS = ""
> +
> +do_compile () {
> +    oe_runmake mx31_bug2_config
> +    oe_runmake clean
> +    oe_runmake all
> +}
> +
> +do_deploy () {
> +    install -d ${DEPLOY_DIR_IMAGE}
> +    install -m 0644 ${S}/u-boot.bin ${DEPLOY_DIR_IMAGE}/u-boot-${PV}-${PR}.bin
> +    ln -sf ${DEPLOY_DIR_IMAGE}/u-boot-${PV}-${PR}.bin ${DEPLOY_DIR_IMAGE}/uboot-latest.bin
> +}
> +
> +do_stage() {
> +    install -m 0755 tools/mkimage ${STAGING_BINDIR_NATIVE}/mkimage
> +}
> +
> +do_deploy[dirs] = "${S}"
> +addtask deploy before do_package after do_install

--------------ms080104060603060507090403
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDUwNTEx
MjUyNVowIwYJKoZIhvcNAQkEMRYEFD5lvbCZkmurfZqeSTw1qUXrzBwpMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQB+voY8RKxb2wKBEsFeetvgVBeX6YLBlS3OtST/tYJjbhzY6P5f
EmeAhDatwzmdO4oEyZrmKLCiQJS9LaSEb9mJ33g2CNuqN6QqpdEVdSxnQWn3c0XMaMkLJ7T3nKpi
d0Jyt2kI1syglpRRuN7mdbm2N6Luu/x3nKlLCOunLDSjVOw63sGfFTIKMVMDs0aZxnkME+cyQaQi
5kzpocPht3BFsUN/2FdRE3g30m4pJCo4SaKH+IoDJk7dobNWX7NNyqEbF6gtKVovEazH0Bz7f+ni
aLOBMaxrHAlxLVU/iTiBz1n8AtNMHkz351rUXm1PVuYGRHnYIvCxkJNglh5AKq72AAAAAAAA

--------------ms080104060603060507090403--
