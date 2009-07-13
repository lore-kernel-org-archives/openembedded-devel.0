Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1MQKOX-00081Z-0n
	for openembedded-devel@openembedded.org; Mon, 13 Jul 2009 14:12:33 +0200
Received: (qmail 7735 invoked by uid 1003); 13 Jul 2009 11:59:20 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 13 Jul 2009 11:59:19 -0000
Message-ID: <4A5B2195.9050101@balister.org>
Date: Mon, 13 Jul 2009 07:59:17 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1247173768-5707-1-git-send-email-k.kooi@student.utwente.nl>
	<h3f654$f0j$1@ger.gmane.org>
In-Reply-To: <h3f654$f0j$1@ger.gmane.org>
Subject: Re: [STABLE][PATCH] julius: add 4.1.2 of julius speech	recognizer
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
X-List-Received-Date: Mon, 13 Jul 2009 12:12:33 -0000
X-Groupsio-MsgNum: 11903
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms060205060308010103020608"

--------------ms060205060308010103020608
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

Koen Kooi wrote:
> On 09-07-09 23:09, Koen Kooi wrote:
>> From: Koen Kooi<koen@openembedded.org>
> 
> ping
> 
> 
>>
>>
>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>> ---
>>   conf/checksums.ini             |    4 ++
>>   recipes/julius/julius_4.1.2.bb |   63 
>> ++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 67 insertions(+), 0 deletions(-)
>>   create mode 100644 recipes/julius/julius_4.1.2.bb
>>
>> diff --git a/conf/checksums.ini b/conf/checksums.ini
>> index bb1224c..152afb1 100644
>> --- a/conf/checksums.ini
>> +++ b/conf/checksums.ini
>> @@ -11338,6 +11338,10 @@ 
>> sha256=bc4f62cbac4716c2c1a25cf53b73343a03883964576d9dd590a9e4c7a70f465a
>>   md5=a746183ea41aebc27a0f771036f668e1
>>   sha256=1b8f50169bc2d827c6efe6bc98bbef2161f615219e4e8921e68227888fd50a9e
>>
>> +[http://iij.dl.sourceforge.jp/julius/37582/julius-4.1.2.tar.gz]
>> +md5=886a114b391aa1992567019213efc63e
>> +sha256=542c7f1042679c8484dc2f5f5536ed0c79fa79b2b9dd6cf6881278a6fdb37a84
>> +
>>   [http://osdn.dl.sourceforge.jp/julius/37582/julius-4.1.2.tar.gz]
>>   md5=886a114b391aa1992567019213efc63e
>>   sha256=542c7f1042679c8484dc2f5f5536ed0c79fa79b2b9dd6cf6881278a6fdb37a84
>> diff --git a/recipes/julius/julius_4.1.2.bb 
>> b/recipes/julius/julius_4.1.2.bb
>> new file mode 100644
>> index 0000000..d528357
>> --- /dev/null
>> +++ b/recipes/julius/julius_4.1.2.bb
>> @@ -0,0 +1,63 @@
>> +DESCRIPTION = "Julius is a high-performance, two-pass large 
>> vocabulary continuous speech recognition (LVCSR) decoder software for 
>> speech-related researchers and developers."
>> +LICENSE = "julius"
>> +DEPENDS = "libsndfile1 flex zlib alsa-lib"
>> +
>> +SRC_URI = 
>> "http://iij.dl.sourceforge.jp/julius/37582/julius-${PV}.tar.gz"
>> +
>> +inherit autotools
>> +
>> +TARGET_CC_ARCH += "${LDFLAGS}"
>> +
>> +EXTRA_OECONF = "--with-mictype=alsa --enable-julian"
>> +
>> +do_configure() {
>> +    libtoolize --force
>> +    gnu-configize
>> +    oe_runconf
>> +}
>> +
>> +do_install() {
>> +    export prefix=${D}${prefix}
>> +    export libdir=${D}${libdir}
>> +    export bindir=${D}${bindir}
>> +    export includedir=${D}${includedir}
>> +    export mandir=${D}${mandir}
>> +    export exec_prefix=${D}${exec_prefix}
>> +    export datadir=${D}${datadir}
>> +
>> +    for i in libsent libjulius julius mkbingram mkbinhmm adinrec 
>> adintool mkgshmm mkss jcontrol generate-ngram jclient-perl man ; do
>> +        sed -i -e s:\ /usr/bin:\ \$\{bindir\}:g  -e s:\ /usr/share:\ 
>> \$\{datadir\}:g ${S}/$i/Makefile   
>> +        cd ${S}/$i
>> +        oe_runmake -e install
>> +    done
>> +
>> +    for i in mkdfa/mkfa-1.44-flex mkdfa dfa_minimize generate 
>> accept_check nextword yomi2voca gram2sapixml dfa_determinize ; do
>> +        sed -i -e s:\ /usr/bin:\ \$\{bindir\}:g 
>> ${S}/gramtools/$i/Makefile
>> +        cd ${S}/gramtools/$i
>> +        oe_runmake -e install
>> +    done
>> +
>> +    for i in ${D}${bindir}/*.pl ; do
>> +        sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
>> +        echo sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i>>  
>> /tmp/k
>> +    done
>> +}
>> +
>> +do_stage() {
>> +    export libdir=${STAGING_LIBDIR}
>> +    export bindir=${STAGING_BINDIR}
>> +    export includedir=${STAGING_INCDIR}
>> +    export datadir=${STAGING_DATADIR}
>> +
>> +    for i in libsent libjulius julius mkbingram mkbinhmm adinrec 
>> adintool mkgshmm mkss jcontrol generate-ngram jclient-perl man ; do
>> +        sed -i -e s:\ /usr/bin:\ \$\{bindir\}:g  -e s:\ /usr/share:\ 
>> \$\{datadir\}:g ${S}/$i/Makefile
>> +        cd ${S}/$i
>> +        oe_runmake -e install
>> +    done
>> +
>> +    for i in mkdfa/mkfa-1.44-flex mkdfa dfa_minimize generate 
>> accept_check nextword yomi2voca gram2sapixml dfa_determinize ; do
>> +        sed -i -e s:\ /usr/bin:\ \$\{bindir\}:g 
>> ${S}/gramtools/$i/Makefile
>> +        cd ${S}/gramtools/$i
>> +        oe_runmake -e install
>> +    done
>> +}
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

--------------ms060205060308010103020608
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDcxMzEx
NTkxN1owIwYJKoZIhvcNAQkEMRYEFCeYf7nkXNIFFne9uTsBJolEb6NtMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQCx8h3r3hmjjpuw2fazFwjIFShYCNtSScNERq0sKZB1OmAH6XDM
YhsQnSmtPeL2M5D94GyT4cJvy5d00O09fEHea/6/WQiNlcJ5rhH6UDzk59aimTlWOFxOaoU8LCNO
ah6PWoTvTH/sMglrf0MRPeClZJL+ftck7LY4vZW9GYX28gM5k6r7adXno9oUf+nJHVWgY/b5YEUE
Q8/cAVtALzOkfaTA74sgnJNYzxo88ziPn6tVL/eoM/YWY2UOAQ1iodlQRE/Xy7lv0w53xJ4f7C1p
vPbrOuAslI0wH60EudiH0eaX1yxrKA8y+iELd0RmS/2IlNbOzq2CKnbWrwMgoPBaAAAAAAAA

--------------ms060205060308010103020608--
