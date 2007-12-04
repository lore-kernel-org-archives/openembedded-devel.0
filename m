Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philip@balister.org>) id 1IzfNA-0004mP-5o
	for openembedded-devel@openembedded.org; Tue, 04 Dec 2007 22:32:08 +0100
Received: (qmail 20865 invoked by uid 1003); 4 Dec 2007 21:28:58 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 4 Dec 2007 21:28:57 -0000
Message-ID: <4755C67E.6080400@balister.org>
Date: Tue, 04 Dec 2007 16:28:30 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.9 (X11/20071115)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1Iywhd-0003TY-4R@linuxtogo.org>
	<bdb0025f0712041137t3312e6b7l518ef813b9eab943@mail.gmail.com>
In-Reply-To: <bdb0025f0712041137t3312e6b7l518ef813b9eab943@mail.gmail.com>
Subject: Re: [oe-commits] org.oe.dev directfb : Update include file	paths so that directfb-examples builds.
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
X-List-Received-Date: Tue, 04 Dec 2007 21:32:08 -0000
X-Groupsio-MsgNum: 3550
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms050807080804090700030000"

--------------ms050807080804090700030000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Do you have any specific examples of packages that depend on directfb 
and do not build anymore?

directfb-examples did not build until we committed the changes. We had 
looked at packages that listed directfb as a dependency, and none of 
them appeared to build anyway.

Philip

Rodrigo Vivi wrote:
> I didn't understand why to change the includedir and
> internalincludedir of directfb...
> 
> The standard of directfb is includedir/directfb/ and changing it all
> others packages that depends on directfb will break...
> 
> On Dec 2, 2007 6:50 PM, sakoman commit
> <openembedded-commits@lists.openembedded.org> wrote:
>> directfb : Update include file paths so that directfb-examples builds.
>>
>> Author: sakoman@gmail.com
>> Branch: org.openembedded.dev
>> Revision: b1610df18b4d8070f056d9621c7826cf30b62bca
>> ViewMTN: http://monotone.openembedded.org/revision/info/b1610df18b4d8070f056d9621c7826cf30b62bca
>> Files:
>> 1
>> packages/directfb/files/fix-configure-include-path.patch
>> packages/directfb/directfb-examples_1.0.0.bb
>> packages/directfb/directfb_1.1.0.bb
>> Diffs:
>>
>> #
>> # mt diff -r5c78b2077c12b748ddbcb3eac965642d2d89c95c -rb1610df18b4d8070f056d9621c7826cf30b62bca
>> #
>> #
>> #
>> # add_file "packages/directfb/files/fix-configure-include-path.patch"
>> #  content [95a5712b69ed26362c0a8e8e8624e9b05fb506b2]
>> #
>> # patch "packages/directfb/directfb-examples_1.0.0.bb"
>> #  from [88c9cc59f32b02ec4cd0c0f876b204399b265bdf]
>> #    to [1905769a0ea0cc18c68ea7969adaa55fe65ad9aa]
>> #
>> # patch "packages/directfb/directfb_1.1.0.bb"
>> #  from [c9da95fb956d450af0c360a3364023c960f9d1af]
>> #    to [1af7bf22ffbfcbc869a08e6664c2dde2ff16c7d2]
>> #
>> ============================================================
>> --- packages/directfb/files/fix-configure-include-path.patch    95a5712b69ed26362c0a8e8e8624e9b05fb506b2
>> +++ packages/directfb/files/fix-configure-include-path.patch    95a5712b69ed26362c0a8e8e8624e9b05fb506b2
>> @@ -0,0 +1,13 @@
>> +--- DirectFB-1.1.0/configure.in-orig   2007-08-27 00:07:00.000000000 -0700
>> ++++ DirectFB-1.1.0/configure.in        2007-11-26 12:05:52.000000000 -0800
>> +@@ -1380,8 +1380,8 @@
>> +
>> + MODULEDIR=$libdir/$MODULEDIRNAME
>> + DATADIR=$datadir/directfb-$VERSION
>> +-INCLUDEDIR=$includedir/directfb
>> +-INTERNALINCLUDEDIR=$includedir/directfb-internal
>> ++INCLUDEDIR=$includedir/
>> ++INTERNALINCLUDEDIR=$includedir/
>> +
>> + SOPATH=$libdir/libdirectfb-$LT_RELEASE.so.$LT_CURRENT
>> + AC_SUBST(SOPATH)
>> ============================================================
>> --- packages/directfb/directfb-examples_1.0.0.bb        88c9cc59f32b02ec4cd0c0f876b204399b265bdf
>> +++ packages/directfb/directfb-examples_1.0.0.bb        1905769a0ea0cc18c68ea7969adaa55fe65ad9aa
>> @@ -1,10 +1,12 @@ LICENSE = "GPL"
>>  DESCRIPTION = "DirectFB extra providers"
>>  DEPENDS = "directfb"
>>  SECTION = "libs"
>>  LICENSE = "GPL"
>>
>> -SRC_URI = "http://www.directfb.org/downloads/Extras/DirectFB-extra-${PV}.tar.gz"
>> -S = "${WORKDIR}/DirectFB-extra-${PV}"
>> +SRC_URI = " \
>> +           http://www.directfb.org/downloads/Extras/DirectFB-examples-${PV}.tar.gz \
>> +          "
>> +S = "${WORKDIR}/DirectFB-examples-${PV}"
>>
>>  inherit autotools
>>
>> ============================================================
>> --- packages/directfb/directfb_1.1.0.bb c9da95fb956d450af0c360a3364023c960f9d1af
>> +++ packages/directfb/directfb_1.1.0.bb 1af7bf22ffbfcbc869a08e6664c2dde2ff16c7d2
>> @@ -10,12 +10,15 @@ RV = "1.1-0"
>>  PR = "r1"
>>  RV = "1.1-0"
>>
>> -SRC_URI = "http://www.directfb.org/download/DirectFB/DirectFB-${PV}.tar.gz \
>> -           file://fix-pkgconfig-cflags.patch;patch=1 \
>> -          file://fix-font-missing-char.patch;patch=1 \
>> -           file://getpagesize.patch;patch=1 \
>> -           file://fix-includes.patch;patch=1 \
>> -          file://mkdfiff.patch;patch=1"
>> +SRC_URI = " \
>> +    http://www.directfb.org/download/DirectFB/DirectFB-${PV}.tar.gz \
>> +    file://fix-configure-include-path.patch;patch=1 \
>> +    file://fix-pkgconfig-cflags.patch;patch=1 \
>> +    file://fix-font-missing-char.patch;patch=1 \
>> +    file://getpagesize.patch;patch=1 \
>> +    file://fix-includes.patch;patch=1 \
>> +    file://mkdfiff.patch;patch=1 \
>> +   "
>>
>>  S = "${WORKDIR}/DirectFB-${PV}"
>>
>> @@ -23,11 +26,12 @@ inherit autotools pkgconfig
>>
>>  inherit autotools pkgconfig
>>
>> -EXTRA_OECONF = "--with-gfxdrivers=none \
>> +EXTRA_OECONF = " \
>> +    --with-gfxdrivers=none \
>>                 --enable-libmpeg3=no \
>>                 --enable-freetype=yes \
>>                 --enable-sdl=no \
>> -               --enable-vnc=no \
>> +               --enable-vnc=no \
>>                 --disable-x11 \
>>                 "
>>
>>
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>>
> 
> 
> 

--------------ms050807080804090700030000
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA3MTIwNDIx
MjgzMFowIwYJKoZIhvcNAQkEMRYEFJtN77N9UosEKtAZSbQ/LbcXgBy/MFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyuqTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyu
qTANBgkqhkiG9w0BAQEFAASCAQAdJ+BPlHWu9zvA9c2kOgPQds21W52m5Zi3px5QBynq8oyVaM40
d7q4KLSpSgWscdX9QUZuEseGXicWy0HBXsxIgfEtIvQNQZSIyYmbQYA+2F15visRB+SkTq241tbA
YY8O4OlqFwMwepPLXTZYLqGgpCxXp+29BTgZ4IAh9YbN7ps2OiILPxbBzAmU/vqYyU+gTEr36Au0
JgmURaiF5+FLdFxs2eJh/a0c25/lBmd85DyON2E4o0eL6oITTeQunNTHfgytijjSNgdyxEsej6Km
esfxpIywU05S5VBiNH3tPt+UkR71E6jiVOLlfLAe17mmIrZSRXKnOyxMK8IV0bMjAAAAAAAA

--------------ms050807080804090700030000--
