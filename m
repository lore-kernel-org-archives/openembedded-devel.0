Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1LY46P-00043A-33
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 20:53:33 +0100
Received: (qmail 12145 invoked by uid 1003); 13 Feb 2009 19:51:57 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 13 Feb 2009 19:51:56 -0000
Message-ID: <4995CF5B.6080103@balister.org>
Date: Fri, 13 Feb 2009 14:51:55 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4995BFE1.7090900@dls.net>
In-Reply-To: <4995BFE1.7090900@dls.net>
Subject: Re: boost-1.36.0 fails when compiling; cannot find the compiler
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
X-List-Received-Date: Fri, 13 Feb 2009 19:53:33 -0000
X-Groupsio-MsgNum: 7729
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms000303050108050306020203"

--------------ms000303050108050306020203
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Mike (mwester) wrote:
> Boost 1.36.0 fails to build, do_compile log is below.  In a nutshell, it
> seems to have lost the PATH variable.  The 1.33.1 version builds just fine.
> 
> The compiler is present.  The PATH is set correctly, it appears, from
> the run.do_compile file.  So I can only presume that whatever "bjam" is,
> its resetting the PATH or something.
> 
> Nothing else has changed in the environment; 1.33.1 builds, 1.36.0
> doesn't, and I have no idea what the heck this "bjam" stuff is or how to
> debug it.
> 
> Any suggestions?  Does this work for anyone else?

It's been working on arm. And yes, the boost build system sucks :(

Philip

> 
> Mike (mwester)
> 
> 
> -----------
> + bjam -sTOOLS=gcc '-sGCC=armeb-linux-gnueabi-gcc -march=armv5te
> -mtune=xscale -mno-thumb-interwork -mno-thumb -mno-thumb-interwork
> -mno-thumb  -L/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib
> -Wl,-rpath-link,/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib
> -Wl,-O1 ${TARGET_LINK_HASH_STYLE}
> '\''-DBOOST_PLATFORM_CONFIG="boost/config/platform/linux-gnueabi.hpp"'\'''
> '-sGXX=armeb-linux-gnueabi-g++ -march=armv5te -mtune=xscale
> -mno-thumb-interwork -mno-thumb -mno-thumb-interwork -mno-thumb
> -L/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib
> -Wl,-rpath-link,/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib
> -Wl,-O1 ${TARGET_LINK_HASH_STYLE}
> '\''-DBOOST_PLATFORM_CONFIG="boost/config/platform/linux-gnueabi.hpp"'\'''
> -sGCC_INCLUDE_DIRECTORY=/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/include
> -sGCC_STDLIB_DIRECTORY=/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib
> -sNO_BZIP2=1 -sNO_ZLIB=1 '-sBUILD=release <optimization>space
> <inlining>on <debug-symbols>off' '-sPYTHON_VERSION=${PYTHON_VERSION}'
> --layout=system
> --builddir=/u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/boost-1.36.0-r5/boost_1_36_0/armeb-linux-gnueabi
> --prefix=/usr --exec-prefix=/usr --libdir=/usr/lib --includedir=/usr/include
> warning: Graph library does not contain optional GraphML reader.
> note: to enable GraphML support, set EXPAT_INCLUDE and EXPAT_LIBPATH to the
> note: directories containing the Expat headers and libraries, respectively.
> warning: skipping optional Message Passing Interface (MPI) library.
> note: to enable MPI support, add "using mpi ;" to user-config.jam.
> note: to suppress this message, pass "--without-mpi" to bjam.
> note: otherwise, you can safely ignore this message.
> Building Boost.Regex with the optional Unicode/ICU support disabled.
> Please refer to the Boost.Regex documentation for more information
> (don't panic: this is a strictly optional feature).
> ...patience...
> ...patience...
> ...patience...
> ...found 5258 targets...
> ...updating 765 targets...
> MkDir1-quick-fix-for-unix bin.v2
> MkDir1-quick-fix-for-unix bin.v2/libs
> MkDir1-quick-fix-for-unix bin.v2/libs/math
> MkDir1-quick-fix-for-unix bin.v2/libs/math/build
> MkDir1-quick-fix-for-unix bin.v2/libs/math/build/gcc-4.3.1
> MkDir1-quick-fix-for-unix bin.v2/libs/math/build/gcc-4.3.1/release
> MkDir1-quick-fix-for-unix
> bin.v2/libs/math/build/gcc-4.3.1/release/threading-multi
> gcc.compile.c++
> bin.v2/libs/math/build/gcc-4.3.1/release/threading-multi/acosh.o
> armeb-linux-gnueabi-g++: : No such file or directory
> 
>     "armeb-linux-gnueabi-g++" "-march=armv5te" "-mtune=xscale"
> "-mno-thumb-interwork" "-mno-thumb" "-mno-thumb-interwork" "-mno-thumb"
> "-L/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib"
> "-Wl,-rpath-link,/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib"
> "-Wl,-O1" "${TARGET_LINK_HASH_STYLE}"  -ftemplate-depth-128 -O3
> -finline-functions -Wno-inline -Wall -fPIC -pthread
> -DBOOST_ALL_NO_LIB=1 -DBOOST_MATH_TR1_DYN_LINK=1 -DNDEBUG  -I"." -c -o
> "bin.v2/libs/math/build/gcc-4.3.1/release/threading-multi/acosh.o"
> "libs/math/build/../src/tr1/acosh.cpp"
> 
> ...failed gcc.compile.c++
> bin.v2/libs/math/build/gcc-4.3.1/release/threading-multi/acosh.o...
> ...removing bin.v2/libs/math/build/gcc-4.3.1/release/threading-multi/acosh.o
> gcc.compile.c++
> bin.v2/libs/math/build/gcc-4.3.1/release/threading-multi/asinh.o
> armeb-linux-gnueabi-g++: : No such file or directory
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

--------------ms000303050108050306020203
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDIxMzE5
NTE1NVowIwYJKoZIhvcNAQkEMRYEFFssEymxelRoGFZj+rHV7ON7CRd7MFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXYhTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXY
hTANBgkqhkiG9w0BAQEFAASCAQA3DHEGa3+UurvHUDt2aKMqzAAf1uNVWZza1Wepp2bN84MwANE2
wl7H0XtbpSh5Fj5S5xSVVJ8RTl+9SK3GggVWKEgYzyyykn16EqQ4HYLgMNXlnnHQCJErjFQYj5dT
U7for+P5aQwYyb1urSQ/46oq/Ut7LHaqNbjjFxRL8JcT6Vm065IH5ch5t4dbIYNmpd2ma2VVxjks
O1JZuOjHDxHpg8q+ZTqUDpGJsC0sasGztB5boPhfV6iMhCM5hZNYCiozb8wXC6RSIhCGanN/nUCB
syhfEIX9ddQZC8prcuZfwv7mq7EGZbBnYvppjuIaulRkPT7hXG43Hc+SY9RQmcSuAAAAAAAA

--------------ms000303050108050306020203--
