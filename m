Received: from [66.207.66.26] (helo=www.balister.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philip@balister.org>) id 1HnvUu-0005P4-97
	for openembedded-devel@openembedded.org; Tue, 15 May 2007 13:47:21 +0200
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by www.balister.org (8.13.8/8.13.8) with ESMTP id l4FBl7qe011924
	for <openembedded-devel@openembedded.org>;
	Tue, 15 May 2007 07:47:08 -0400
Message-ID: <46499DBB.9080001@balister.org>
Date: Tue, 15 May 2007 07:47:07 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 1.5.0.10 (X11/20070302)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <4648EB51.4040303@dominion.kabel.utwente.nl>
In-Reply-To: <4648EB51.4040303@dominion.kabel.utwente.nl>
Subject: Re: Fixing up libtool-native and libtool-cross
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2007 11:47:21 -0000
X-Groupsio-MsgNum: 2091
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms050500060702030107070109"

--------------ms050500060702030107070109
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Can we apply these to the 1.5.22 libtool bb files also? I ahve added 
these with DEFAULT_PREFERENCE = "-1" since they have trouble building 
some packages, apparently due to looking in build system directories for 
libraries

Philip

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> Richard has fixed up libtool in Poky a bit and I want to merge his work into OE. Since
> it's 1 AM now, and libtool is a pretty 'core' part, I'm posting the patch for review
> before committing it tomorrow night.
> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFGSOtRMkyGM64RGpERAuiCAJ0Yqz+t4X/zNCjTbZIBU7yjaDt8twCgkgVq
> iM3uwQTciklpQKjurM34Nys=
> =W6UX
> -----END PGP SIGNATURE-----
> 
> 
> ------------------------------------------------------------------------
> 
> #
> # old_revision [990392a71744fa8ec062ee769a883473775269ee]
> #
> # patch "classes/autotools.bbclass"
> #  from [dced52fcafd4e224bafcb35c4fb04253857c7c3b]
> #    to [113ae9d1554b6e93d9c7a7fda84d71da4712caf9]
> # 
> # patch "packages/libtool/libtool-cross_1.5.10.bb"
> #  from [58b238af5bb9acdeca5b86c34b50c419fb49b55e]
> #    to [5134256c71b2d679838e87a55b084a99b1ac17d4]
> # 
> # patch "packages/libtool/libtool-native_1.5.10.bb"
> #  from [e1d2b08387782afbf7c5c6787a92d9af864dfb2d]
> #    to [bc799a0464069f3531cbb0a017c4d8d2a1afd63e]
> #
> ============================================================
> --- classes/autotools.bbclass	dced52fcafd4e224bafcb35c4fb04253857c7c3b
> +++ classes/autotools.bbclass	113ae9d1554b6e93d9c7a7fda84d71da4712caf9
> @@ -15,6 +15,10 @@ def autotools_dep_prepend(d):
>  
>  	if not pn in ['libtool', 'libtool-native', 'libtool-cross']:
>  		deps += 'libtool-native '
> +		if not bb.data.inherits_class('native', d) \
> +                        and not bb.data.inherits_class('cross', d) \
> +                        and not bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, 1):
> +                    deps += 'libtool-cross '
>  
>  	return deps + 'gnu-config-native '
>  
> ============================================================
> --- packages/libtool/libtool-cross_1.5.10.bb	58b238af5bb9acdeca5b86c34b50c419fb49b55e
> +++ packages/libtool/libtool-cross_1.5.10.bb	5134256c71b2d679838e87a55b084a99b1ac17d4
> @@ -1,7 +1,7 @@ require libtool_${PV}.bb
>  SECTION = "devel"
>  require libtool_${PV}.bb
>  
> -PR = "r4"
> +PR = "r5"
>  PACKAGES = ""
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
>  SRC_URI_append = " file://libdir-la.patch;patch=1 \
> @@ -21,6 +21,13 @@ do_stage () {
>  
>  do_stage () {
>          install -m 0755 ${HOST_SYS}-libtool ${bindir}/${HOST_SYS}-libtool
> +        install -m 0644 libltdl/ltdl.h ${STAGING_INCDIR}/
> +        install -d ${STAGING_DATADIR}/libtool ${STAGING_DATADIR}/aclocal
> +        install -c config.guess ${STAGING_DATADIR}/libtool/
> +        install -c config.sub ${STAGING_DATADIR}/libtool/
> +        install -c -m 0644 ltmain.sh ${STAGING_DATADIR}/libtool/
> +        install -c -m 0644 libtool.m4 ${STAGING_DATADIR}/aclocal/
> +        install -c -m 0644 ltdl.m4 ${STAGING_DATADIR}/aclocal/
>  }
>  
>  do_install () {
> ============================================================
> --- packages/libtool/libtool-native_1.5.10.bb	e1d2b08387782afbf7c5c6787a92d9af864dfb2d
> +++ packages/libtool/libtool-native_1.5.10.bb	bc799a0464069f3531cbb0a017c4d8d2a1afd63e
> @@ -1,7 +1,7 @@ require libtool_${PV}.bb
>  SECTION = "devel"
>  require libtool_${PV}.bb
>  
> -PR = "r4"
> +PR = "r5"
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
>  SRC_URI_append = " file://libdir-la.patch;patch=1 \
>                     file://prefix.patch;patch=1 \
> @@ -10,8 +10,6 @@ S = "${WORKDIR}/libtool-${PV}"
>                     file://install-path-check.patch;patch=1"
>  S = "${WORKDIR}/libtool-${PV}"
>  
> -STAGING_DATADIR_safe := "${STAGING_DATADIR}"
> -
>  inherit native
>  
>  do_stage () {
> @@ -19,22 +17,12 @@ do_stage () {
>  	install -m 0755 libtoolize ${STAGING_BINDIR}/libtoolize
>  	oe_libinstall -a -so -C libltdl libltdl ${STAGING_LIBDIR}
>  	install -m 0644 libltdl/ltdl.h ${STAGING_INCDIR}/
> -	for dir in ${STAGING_DATADIR} ${STAGING_DATADIR_safe}; do
> -		ltdldir="${dir}/libtool/libltdl"
> -		install -d $dir/libtool \
> -			   $ltdldir \
> -			   $dir/aclocal
> -		install -c config.guess $dir/libtool/config.guess
> -		install -c config.sub $dir/libtool/config.sub
> -		install -c -m 0644 ltmain.sh $dir/libtool/
> -		install -c -m 0644 libtool.m4 $dir/aclocal/
> -		install -c -m 0644 ltdl.m4 $dir/aclocal/
> -
> -		for src in README COPYING.LIB Makefile.am configure.ac \
> -				config-h.in ltdl.c ltdl.h; do
> -			install -m 0644 libltdl/${src} ${ltdldir}
> -		done
> -	done
> +	install -d ${STAGING_DATADIR}/libtool ${STAGING_DATADIR}/aclocal
> +	install -c config.guess ${STAGING_DATADIR}/libtool/
> +	install -c config.sub ${STAGING_DATADIR}/libtool/
> +	install -c -m 0644 ltmain.sh ${STAGING_DATADIR}/libtool/
> +	install -c -m 0644 libtool.m4 ${STAGING_DATADIR}/aclocal/
> +	install -c -m 0644 ltdl.m4 ${STAGING_DATADIR}/aclocal/
>  }
>  
>  do_install () {
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--------------ms050500060702030107070109
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICEHzDFPOZ2p8t9T4wm358rqkwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA3MDQxNDEzMTkyOVoXDTA4MDQxMzEzMTky
OVowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvJS5tUVsXVRltIKV57mvyOnqjrDpQX8YvC35MubnQf7RctFZ
65G/JPVfYuJzo0956WHCLCSPC1mhaA5bVNCogPweIYq9EoZZsTijl3qrP6AkCdfr47S5fwIps4vZ
X3zFZ1BXZ7up+wrl+s0Xp3i6IJrdVysiAbz5oUF1Fl7Go0SzLgwQa+m7LL2XqFaMM3jIH+qUxu72
tDt43Jjl97/8YGsdNWQRipOWA+VvK6JS5yse1IxEI73mWZWeQMe4y6TEtp/8kcWxCB7aIjrMNQMN
szDZVB2pvaRXapwf5HKxY7zLuScR94reAR0hBmusQ2xPuhDGbbjEdkvgcST2yR0ZlwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEAbLC8HLx4GoPVKDTTePeZ6Atrqtro0XmJi/Nqw7DJyWG5mzqAS2HdIFnxOuAk9srp
nbYSpM8lXwnRtLaIrlnawIMDtCrvBQ4RSnrUsxxDVVa+FJYDP2nzYFFul8eXoZfCUiYil1flfdYN
U5QulSNRWJZkmYvowYVfU81qKnZ0TFAwggL9MIICZqADAgECAhB8wxTzmdqfLfU+MJt+fK6pMA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wNzA0MTQxMzE5MjlaFw0wODA0MTMxMzE5MjlaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALyUubVFbF1U
ZbSClee5r8jp6o6w6UF/GLwt+TLm50H+0XLRWeuRvyT1X2Lic6NPeelhwiwkjwtZoWgOW1TQqID8
HiGKvRKGWbE4o5d6qz+gJAnX6+O0uX8CKbOL2V98xWdQV2e7qfsK5frNF6d4uiCa3VcrIgG8+aFB
dRZexqNEsy4MEGvpuyy9l6hWjDN4yB/qlMbu9rQ7eNyY5fe//GBrHTVkEYqTlgPlbyuiUucrHtSM
RCO95lmVnkDHuMukxLaf/JHFsQge2iI6zDUDDbMw2VQdqb2kV2qcH+RysWO8y7knEfeK3gEdIQZr
rENsT7oQxm24xHZL4HEk9skdGZcCAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBAGywvBy8eBqD1Sg003j3megLa6ra
6NF5iYvzasOwyclhuZs6gEth3SBZ8TrgJPbK6Z22EqTPJV8J0bS2iK5Z2sCDA7Qq7wUOEUp61LMc
Q1VWvhSWAz9p82BRbpfHl6GXwlImIpdX5X3WDVOULpUjUViWZJmL6MGFX1PNaip2dExQMIIDPzCC
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
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhB8wxTzmdqfLfU+MJt+fK6pMAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA3MDUxNTEx
NDcwN1owIwYJKoZIhvcNAQkEMRYEFHGkOzMEc6c3mrv0V/vYkAuNU2a7MFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyuqTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyu
qTANBgkqhkiG9w0BAQEFAASCAQAbT/QSWrepFpY/vbLnIZLgyf+uhnlYZ4FehixqS9/xSywF1Oec
//hlilJke1wA50N4AERjRJdtd2EYzVIaBxdYUhPqGokGcZR/LyiiTWEW0ARSf3JgCXE9NrZXeoDn
/vaaA4JP7pxq8x03YRefXxa6J/gH5A4Hl0p1XNAMK5uw5oHkHS2uJPSDOvs9nc8651UOCusPJbiz
hXwnP4y+MD6v5IZ7ns2PDA93O/aiibVlT47zBvXiGHwOulJ9+B1eke6k0k1BNbbdlJf38XiEK7kE
SnotRHBKnSjtT2Jx1S2XtxU9tAPSVSrbMbGcbHvjCV8QX53nPdZuAhXZFJqBZ1/ZAAAAAAAA

--------------ms050500060702030107070109--
