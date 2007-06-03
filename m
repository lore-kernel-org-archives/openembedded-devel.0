Received: from [198.82.23.235] (helo=www.balister.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philip@balister.org>) id 1Huubz-0007Q9-6R
	for openembedded-devel@openembedded.org; Sun, 03 Jun 2007 20:15:31 +0200
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by www.balister.org (8.13.8/8.13.8) with ESMTP id l53IDQYd006500
	for <openembedded-devel@openembedded.org>;
	Sun, 3 Jun 2007 14:13:26 -0400
Message-ID: <466304C5.9070806@balister.org>
Date: Sun, 03 Jun 2007 14:13:25 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 1.5.0.12 (X11/20070530)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>
In-Reply-To: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>
Subject: Re: problems doing bitbake task-base
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
X-List-Received-Date: Sun, 03 Jun 2007 18:15:31 -0000
X-Groupsio-MsgNum: 2168
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms040702040700020108080409"

--------------ms040702040700020108080409
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

I'm not sure about this error, but I have been building Angstrom images 
for the OSK successfully. More of us work with Angstrom, and I am the 
machine mentor, so we can better support Angstrom than the generic distro.

There are some you can download from here:

http://www.angstrom-distribution.org/unstable/images/omap5912osk/20070528/

I haven't tested these ones yet. But it is on my list of things to do. I 
am running very recent Angstrom bootstrap-image I built myself at the 
moment.

Philip

Luís Cargnini wrote:
> Please someone could told me what is the reason of this error messsage:
> NOTE: Using cache in
> '/home/lvcargnini/puc/instramed/openembedded/tmp/cache/omap5912osk'
> NOTE: Handling BitBake files: | (4598/4598) [100 %]
> NOTE: Parsing finished. 723 cached, 3663 parsed, 212 skipped, 0 masked.
> 
> NOTE: build 200706022342: started
> 
> OE Build Configuration:
> BB_VERSION     = "1.6.6"
> OE_REVISION    = "c6559ceba5987d7142c9759ae7f895632ac3b712"
> TARGET_ARCH    = "arm"
> TARGET_OS      = "linux"
> MACHINE        = "omap5912osk"
> DISTRO         = "generic"
> DISTRO_VERSION = ".dev-snapshot-20070603"
> TARGET_FPU     = "soft"
> 
> NOTE: package glibc-2.5: started
> NOTE: package glibc-2.5-r6: task do_package: started
> ERROR: Error in executing:
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/glibc/glibc_2.5.bb
> ERROR: Exception:exceptions.ValueError Message:need more than 1 value to
> unpack
> ERROR: Printing the environment of the function
> ERROR:  0057:   # Collate the locales by base and encoding
> ERROR:  0058:   encodings = {}
> ERROR:  0059:   for l in supported:
> ERROR:  0060:           l = l[:-1]
> ERROR:  0061:           (locale, charset) = l.split(" ")
> ERROR:  0062:           m = dot_re.match(locale)
> ERROR:  0063:           if m:
> ERROR:  0064:                   locale = m.group(1)
> ERROR:  0065:           if not encodings.has_key(locale):
> ERROR: Error in executing:
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/glibc/glibc_2.5.bb
> ERROR: Exception:exceptions.ValueError Message:need more than 1 value to
> unpack
> ERROR: Printing the environment of the function
> ERROR:  0057:   if (bb.data.getVar('INHIBIT_PACKAGE_STRIP', d, 1) != '1'):
> ERROR:  0058:           stripfunc = ""
> ERROR:  0059:           for root, dirs, files in os.walk(dvar):
> ERROR:  0060:                   for f in files:
> ERROR:  0061:                           file = os.path.join(root, f)
> ERROR:  0062:                           if not os.path.islink(file) and not
> os.path.isdir(file) and isexec(file):
> ERROR:  0063:                                   stripfunc += "\trunstrip %s
> || st=1\n" % (file)
> ERROR:  0064:           if not stripfunc == "":
> ERROR:  0065:                   from bb import build
> ERROR: Error in executing:
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/glibc/glibc_2.5.bb
> ERROR: Exception:exceptions.ValueError Message:need more than 1 value to
> unpack
> ERROR: Printing the environment of the function
> ERROR: Error in executing:
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/glibc/glibc_2.5.bb
> ERROR: Exception:exceptions.ValueError Message:need more than 1 value to
> unpack
> ERROR: Printing the environment of the function
> ERROR: Error in executing:
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/glibc/glibc_2.5.bb
> ERROR: Exception:exceptions.ValueError Message:need more than 1 value to
> unpack
> ERROR: Printing the environment of the function
> Traceback (most recent call last):
>   File "/usr/bin/bitbake", line 1162, in ?
>     main()
>   File "/usr/bin/bitbake", line 1157, in main
>     cooker.cook( BBConfiguration( options ), args[1:] )
>   File "/usr/bin/bitbake", line 973, in cook
>     if self.buildProvider( k , False ) == 0:
>   File "/usr/bin/bitbake", line 608, in buildProvider
>     if self.tryBuild(fn, item, buildAllDeps, build_depends + [fn]):
>   File "/usr/bin/bitbake", line 308, in tryBuild
>     if self.buildProvider( dependency , buildAllDeps , build_depends ) == 0:
>   File "/usr/bin/bitbake", line 608, in buildProvider
>     if self.tryBuild(fn, item, buildAllDeps, build_depends + [fn]):
>   File "/usr/bin/bitbake", line 328, in tryBuild
>     return self.tryBuildPackage( fn, item, the_data )
>   File "/usr/bin/bitbake", line 234, in tryBuildPackage
>     bb.build.exec_task('do_%s' % self.configuration.cmd, the_data)
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 288, in
> exec_task
>     task_graph.walkdown(task, execute)
>   File "/usr/lib/python2.4/site-packages/bb/__init__.py", line 1191, in
> walkdown
>     ret = self.walkdown(p, callback, debug, usecache)
>   File "/usr/lib/python2.4/site-packages/bb/__init__.py", line 1191, in
> walkdown
>     ret = self.walkdown(p, callback, debug, usecache)
>   File "/usr/lib/python2.4/site-packages/bb/__init__.py", line 1191, in
> walkdown
>     ret = self.walkdown(p, callback, debug, usecache)
>   File "/usr/lib/python2.4/site-packages/bb/__init__.py", line 1196, in
> walkdown
>     return callback(self, item)
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 267, in execute
>     exec_task(item, d)
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 288, in
> exec_task
>     task_graph.walkdown(task, execute)
>   File "/usr/lib/python2.4/site-packages/bb/__init__.py", line 1196, in
> walkdown
>     return callback(self, item)
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 277, in execute
>     exec_func(item, localdata)
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 98, in exec_func
>     exec_func_python(func, d)
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 117, in
> exec_func_python
>     utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
>   File "/usr/lib/python2.4/site-packages/bb/utils.py", line 142, in
> better_exec
>     exec code in context
>   File "do_package", line 4, in ?
>   File "do_package", line 2, in do_package
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 98, in exec_func
>     exec_func_python(func, d)
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 117, in
> exec_func_python
>     utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
>   File "/usr/lib/python2.4/site-packages/bb/utils.py", line 142, in
> better_exec
>     exec code in context
>   File "package_tar_do_package", line 4, in ?
>   File "package_tar_do_package", line 2, in package_tar_do_package
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 98, in exec_func
>     exec_func_python(func, d)
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 117, in
> exec_func_python
>     utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
>   File "/usr/lib/python2.4/site-packages/bb/utils.py", line 142, in
> better_exec
>     exec code in context
>   File "package_do_package", line 5, in ?
>   File "package_do_package", line 3, in package_do_package
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 98, in exec_func
>     exec_func_python(func, d)
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 117, in
> exec_func_python
>     utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
>   File "/usr/lib/python2.4/site-packages/bb/utils.py", line 142, in
> better_exec
>     exec code in context
>   File "populate_packages", line 188, in ?
>   File "populate_packages", line 5, in populate_packages
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 98, in exec_func
>     exec_func_python(func, d)
>   File "/usr/lib/python2.4/site-packages/bb/build.py", line 117, in
> exec_func_python
>     utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
>   File "/usr/lib/python2.4/site-packages/bb/utils.py", line 142, in
> better_exec
>     exec code in context
>   File "package_do_split_gconvs", line 152, in ?
>   File "package_do_split_gconvs", line 61, in package_do_split_gconvs
> ValueError: need more than 1 value to unpack
> 
> 

--------------ms040702040700020108080409
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA3MDYwMzE4
MTMyNVowIwYJKoZIhvcNAQkEMRYEFG0IjhBgxQ8cHf8LXw/6d8ehcgRMMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyuqTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyu
qTANBgkqhkiG9w0BAQEFAASCAQBtZCJUlSKLcP0dzKJjRo6gbICE7jYIB61AGOP1zQonXP1LIIe8
BsPPmLmu7ER00sF2I+aJMFnP+80eOKuAcMnLRdBJy1WmUDpNkpeQAAF0jpLKlh2SXhdHvHN+vySz
8WFlOUrESQuCQpS9XJfUweQjnBC734FQxICmessjjhdpwpwDKJcqF/YjnZasB0Y7mTJ45ITFTV/f
zjej6jfdnTrwT7/x18EGQDxccDddiYxspFkydLxYevPg02olGgWQZqLDo1JCbOaLaGkxbUhcq+YU
Yxfqg88WbXB5sKQYY1P7bmjNz2PkSswHMBVDyZ6T0qVgcn9XJwLQpgKg4pGBvj+0AAAAAAAA

--------------ms040702040700020108080409--
