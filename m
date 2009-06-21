Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1MIPll-0006Lv-Uu
	for openembedded-devel@openembedded.org; Sun, 21 Jun 2009 18:19:51 +0200
Received: (qmail 30896 invoked by uid 1003); 21 Jun 2009 16:08:55 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 21 Jun 2009 16:08:55 -0000
Message-ID: <4A3E5B16.2060803@balister.org>
Date: Sun, 21 Jun 2009 12:08:54 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [Fwd: [Gumstix-users] Small patch to fix DirectFB]
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
X-List-Received-Date: Sun, 21 Jun 2009 16:19:52 -0000
X-Groupsio-MsgNum: 11477
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms050303040602040605040807"

--------------ms050303040602040605040807
Content-Type: multipart/mixed;
 boundary="------------020903090805060803070604"

--------------020903090805060803070604
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

I'd look at this, but I really need to start packing for Linuxtag .....

Philip

-------- Original Message --------
Subject: [Gumstix-users] Small patch to fix DirectFB
Date: Sun, 21 Jun 2009 17:42:06 +0200
From: Vincent <vincent.stehle@laposte.net>
Reply-To: General mailing list for gumstix users.=20
<gumstix-users@lists.sourceforge.net>
To: gumstix-users@lists.sourceforge.net


Hi,

Here is a small patch (against commit
af278f54d6bec590640dfc920e251e29890f7316), which fixes the DirectFB
1.2.8 recipes (URL has changed).

I don't know where to submit this kind of fix, hence my posting here, in
the hope that someone will push it somewhere :)

Best regards,

--=20
Vincent Stehl=E9

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 4463dbd..00e9f34 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -226,7 +226,7 @@ sha256=3D80ab8e34246a280bc380020cf331bcc0014cf816380ce=
e3935ad455c108e661e
 md5=3D59ca16f600e96c8c104a485ff7c322c6
 sha256=3D80ab8e34246a280bc380020cf331bcc0014cf816380cee3935ad455c108e661e
=20
-[http://directfb.org/downloads/Core/DirectFB-1.2/DirectFB-1.2.8.tar.gz]
+[http://directfb.org/downloads/Core/DirectFB-1.2.8.tar.gz]
 md5=3Dac13d21682aa368df4e177ae5b51ad2d
 sha256=3Dcbf94eb10e9c305c81b24e298e55c7825df5ab9060d82443f7b9734f760f859d
=20
diff --git a/recipes/directfb/directfb_1.2.8.bb b/recipes/directfb/directf=
b_1.2.8.bb
index 4d3eb90..bf0b95e 100644
--- a/recipes/directfb/directfb_1.2.8.bb
+++ b/recipes/directfb/directfb_1.2.8.bb
@@ -5,7 +5,7 @@ RV =3D "1.2-0"
 DEPENDS +=3D "sysfsutils"
=20
 SRC_URI =3D " \
-    http://directfb.org/downloads/Core/DirectFB-1.2/DirectFB-${PV}.tar.gz=
 \
+    http://directfb.org/downloads/Core/DirectFB-${PV}.tar.gz \
     file://directfb-1.2.x-fix-pkgconfig-cflags.patch;patch=3D1 \
     file://mkdfiff.patch;patch=3D1 \
     file://dont-use-linux-config.patch;patch=3D1 \

--------------------------------------------------------------------------=
----
Are you an open source citizen? Join us for the Open Source Bridge confere=
nce!
Portland, OR, June 17-19. Two days of sessions, one day of unconference: $=
250.
Need another reason to go? 24-hour hacker lounge. Register today!
http://ad.doubleclick.net/clk;215844324;13503038;v?http://opensourcebridge=
.org
_______________________________________________
gumstix-users mailing list
gumstix-users@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/gumstix-users


--------------020903090805060803070604--

--------------ms050303040602040605040807
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDYyMTE2
MDg1NFowIwYJKoZIhvcNAQkEMRYEFIr0KL4EWYFdpBD6ifnYXNYyBSsmMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQC143W9UW22eXb77qd6NsQXxpi3CkbyqK9UDofs433w1iLQnGgT
7GKluSWU+/N8czNc3CzN6HP+IItfzicd/YHgE4GquGGmJsX6Dyrn//TsG3qVwJjc+jbVaTnOnAVM
slQtaQDMDYxwyau89o8gMyBoWtn15wtBOlyB1Jfwgpo9h5qbXf57afZnJ9Gwla6tDWq6AolUfeW3
IAIVaW9HZMJLzYpAtrw4ajV4nZ1Kd7cTdZF+vlmoVZsMyPMcWZc8ArG8OLxEyquDCgO9e6SCOsSo
kz8DPITjTRwiw0gfa8U9eme4pjjdMjpu9fSwUvz02g2E1CFCLX341h7poLbjfIOXAAAAAAAA

--------------ms050303040602040605040807--
