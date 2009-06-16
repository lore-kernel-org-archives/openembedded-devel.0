Received: from [216.168.135.167] (helo=sanddollar.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1MGdi6-0007B7-Sc
	for openembedded-devel@openembedded.org; Tue, 16 Jun 2009 20:48:43 +0200
Received: (qmail 27620 invoked by uid 1003); 16 Jun 2009 18:38:20 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 16 Jun 2009 18:38:19 -0000
Message-ID: <4A37E699.6050408@balister.org>
Date: Tue, 16 Jun 2009 14:38:17 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <C960916A-B754-4AD4-9751-67D7025AC8C1@mac.com>
	<h18o6n$oos$2@ger.gmane.org>
In-Reply-To: <h18o6n$oos$2@ger.gmane.org>
Subject: Re: Patch for libfann-2.0.0 recipe
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
X-List-Received-Date: Tue, 16 Jun 2009 18:48:43 -0000
X-Groupsio-MsgNum: 11298
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms060200030403060902020901"

--------------ms060200030403060902020901
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 16-06-09 19:14, Elvis Dowson wrote:
>> Hi,
>> I'm attaching a patch for the libfann-2.0.0 recipe for inclusion into
>> the oe repository.
>>
>> Best regards,
>>
>> Elvis
>>
>>  From edb273d68849fd968f83a0bf59efba120b578fa3 Mon Sep 17 00:00:00 2001
>> From: Elvis Dowson <elvis.dowson@gmail.com>
>> Date: Tue, 16 Jun 2009 21:12:52 +0400
>> Subject: [PATCH] Added libfann-2.0.0 recipe
>>
>> ---
>> conf/checksums.ini | 4 ++++
>> recipes/libfann/libfann_2.0.0.bb | 23 +++++++++++++++++++++++
>> 2 files changed, 27 insertions(+), 0 deletions(-)
>> create mode 100644 recipes/libfann/libfann_2.0.0.bb
>>
>> diff --git a/conf/checksums.ini b/conf/checksums.ini
>> index 37d55c7..7c38ea9 100644
>> --- a/conf/checksums.ini
>> +++ b/conf/checksums.ini
>> @@ -286,6 +286,10 @@
>> sha256=1f8504c7f08d2d59c71a70915fc834a285b99587444ee33e23ee3f135c071da0
>> md5=a8cf945d09c6458cb27228218e9a2f45
>> sha256=8416e162d6fc921f14a61c8905e9f9a28dc25e67e1c71b75574360a13f0c28c7
>>
>> +[http://prdownloads.sourceforge.net/fann/fann-2.0.0.tar.bz2]
>> +md5=4224efa533265dcf39237667973d0e20
>> +sha256=762a1313a9b935300cb66ebf052d469d04823ca721fe6dd2a49c01e13e8ab30a
>> +
>> [http://downloads.sourceforge.net/fordiac/FORTE-0.3.5.zip]
>> md5=d207d3b389ee9f2702df095681459f99
>> sha256=2b87b331e931db2db07408c1b07bdb557227e0c16f8fe37f72e40b08fca0a09c
>> diff --git a/recipes/libfann/libfann_2.0.0.bb
>> b/recipes/libfann/libfann_2.0.0.bb
>> new file mode 100644
>> index 0000000..d3166ec
>> --- /dev/null
>> +++ b/recipes/libfann/libfann_2.0.0.bb
>> @@ -0,0 +1,23 @@
>> +# libfann-2.0.0 recipie
>> +SECTION = "libs"
>> +DEFAULT_PREFERENCE = "1"
>> +
>> +# Package information
>> +DESCRIPTION = "libfann, Fast Artificial Neural Network Library is a
>> free open source neural network library, which implements multilayer
>> artificial neural networks in C with support for both fully connected
>> and sparsely connected networks."
>> +LICENSE = "BSD"
>> +PN = "libfann"
>> +PV = "2.0.0"
>> +PR = "r01"
>> +
>> +SRC_URI = "http://prdownloads.sourceforge.net/fann/fann-${PV}.tar.bz2"
>> +
>> +S = "${WORKDIR}/fann-${PV}"
>> +
>> +inherit autotools pkgconfig
>> +
>> +do_stage () {
>> + oe_libinstall -a -so -C src libfann ${STAGING_LIBDIR}
>> + install -d ${STAGING_INCDIR}/fann
>> + (cd ${S}/src/include; cp compat_time.h config.h doublefann.h fann.h
>> fann_activation.h fann_cascade.h fann_data.h fann_error.h
>> fann_internal.h fann_io.h fann_train.h fixedfann.h floatfann.h
>> ${STAGING_INCDIR}/fann/)
>> + install -m 0644 ${S}/aclocal.m4 ${STAGING_DATADIR}/aclocal/
>> +}
> 
> Can't you use autotools_stage to stage all this? And if not, don't use 
> 'cp', but 'install'.

 From the emails, it seems like the code that uses the headers expects 
them to be in the subdir. It would be worth looking at where they get 
installed on something like Debian or Fedora to be consistent.

Philip

--------------ms060200030403060902020901
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDYxNjE4
MzgxN1owIwYJKoZIhvcNAQkEMRYEFMKSz2d6kyG16XNWwvXtadASuOqNMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQBWTlKsevbeXYVbX1j1wU/v7DDpomZUNMREFacbvz3WsIbDQ+ek
MnWHl5ngrYKpR3xxofI4SW9bJbEmB9Ptbd0RGpeUfgwsK1uIRlF1+9e3lTGugk8lxVjH1Qc9xnYf
NYknIUDv5vWnLp2IzcI7wGyFTRbdIt6nde/g8K96WDovfxRjgIvKAIsoBwVjzbeK2rgbV2qX0B27
NZ8Bsyr1rVZR8DrnPkjGf85RTCxJ90pKWKTK6vj07X0muy4Z2H1RBnoM25BMjPuWFtAYam3BMp6D
f4OkShMVWRerEIkxRqrhSGNsF5Mo0d60mQVSTlk7ja/qfBuy99ng4yw7G9ardQtAAAAAAAAA

--------------ms060200030403060902020901--
