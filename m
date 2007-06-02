Received: from [198.82.23.235] (helo=www.balister.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philip@balister.org>) id 1HubAH-0001bO-RU
	for openembedded-devel@openembedded.org; Sat, 02 Jun 2007 23:29:38 +0200
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by www.balister.org (8.13.8/8.13.8) with ESMTP id l52LRc6m002103
	for <openembedded-devel@openembedded.org>;
	Sat, 2 Jun 2007 17:27:38 -0400
Message-ID: <4661E0C7.7000108@balister.org>
Date: Sat, 02 Jun 2007 17:27:35 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 1.5.0.10 (X11/20070302)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <465F3C8B.80200@dominion.kabel.utwente.nl>	<ae36f8040705311923r4a9e871ewf4c5a6bf76adc9ab@mail.gmail.com>	<432beae0705311951p68201aa4u542ad050cbe5b609@mail.gmail.com>	<ae36f8040706011335u7cf556afo7d9a36890b7df2a@mail.gmail.com>
	<ae36f8040706021402o6306798ax50e7038f7c334c01@mail.gmail.com>
In-Reply-To: <ae36f8040706021402o6306798ax50e7038f7c334c01@mail.gmail.com>
Subject: Re: Glibc 2.6 added, please test
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
X-List-Received-Date: Sat, 02 Jun 2007 21:29:38 -0000
X-Groupsio-MsgNum: 2163
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms090205070500080602070505"

--------------ms090205070500080602070505
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

What machine and distro?

Philip

Luís Cargnini wrote:
> rewsult :
> 
> 
> | dl-lookup.c: In function 'add_dependency':
> | dl-lookup.c:104: error: 'RTLD_SINGLE_THREAD_P' undeclared (first use in
> this function)
> | dl-lookup.c:104: error: (Each undeclared identifier is reported only once
> | dl-lookup.c:104: error: for each function it appears in.)
> | make[2]: ***
> [/home/lvcargnini/puc/instramed/openembedded/tmp/work/armv5te-linux/glibc-
> 2.6-r0/build-arm-linux/elf/dl-lookup.o] Error 1
> | make[2]: Leaving directory
> `/home/lvcargnini/puc/instramed/openembedded/tmp/work/armv5te-linux/glibc-
> 2.6-r0/glibc-2.6/elf'
> | make[1]: *** [elf/subdir_lib] Error 2
> | make[1]: Leaving directory
> `/home/lvcargnini/puc/instramed/openembedded/tmp/work/armv5te-linux/glibc-
> 2.6-r0/glibc-2.6'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> NOTE: Task failed:
> /home/lvcargnini/puc/instramed/openembedded/tmp/work/armv5te-linux/glibc-
> 2.6-r0/temp/log.do_compile.522
> NOTE: package glibc-2.6-r0: task do_compile: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package glibc-2.6: failed
> ERROR: Build of 'glibc' failed
> Build statistics:
>   Attempted builds: 1
>   Failed builds: 1
> 
> 
> On 6/1/07, Luís Cargnini <lvcargnini@gmail.com> wrote:
>> I should always perform, pull before update ?
>>
>> On 5/31/07, Justin Patrin <papercrane@gmail.com> wrote:
>>> On 5/31/07, Luís Cargnini <lvcargnini@gmail.com > wrote:
>>>> I did an mtn update but glibc 2.6 is not appearing on my
>>> packages/glibc
>>>> directory
>>> Did you mtn pull first?
>>>
>>>> On 5/31/07, Koen Kooi < koen@dominion.kabel.utwente.nl> wrote:
>>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>>> Hash: SHA1
>>>>>
>>>>> Hi,
>>>>>
>>>>> Glibc 2.6 has just been added to OE, please test it and report bugs.
>>>>> TIA,
>>>>>
>>>>> Koen
>>>>> -----BEGIN PGP SIGNATURE-----
>>>>> Version: GnuPG v1.4.5 (Darwin)
>>>>>
>>>>> iD8DBQFGXzyLMkyGM64RGpERAk8EAJ9vszt8ghLdUoVvRLarLWNM40TpUgCfToVG
>>>>> QCCW9dQifUQvV8H8H+5VVR0=
>>>>> =9U8f
>>>>> -----END PGP SIGNATURE-----
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>>
>>>> --
>>>>
>>> ------------------------------------------------------------------------------
>>>> Thanks && Regards
>>>> Msc. Bsc. Luís Vitório Cargnini
>>>> IEEE Member
>>>> Electrical Engineer Faculty @ PUCRS
>>>> Ipiranga Avenue, 6681 – Building 30
>>>> P.O. Box: 90619-900 – Porto Alegre/RS
>>>> Phone: +55 51 3320 3500  extension: 7696
>>>>
>>> ---------------------------------------------------------------------------------
>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>
>>> --
>>> Justin Patrin
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>>
>> --
>>
>> ------------------------------------------------------------------------------
>> Thanks && Regards
>> Msc. Bsc. Luís Vitório Cargnini
>> IEEE Member
>> Electrical Engineer Faculty @ PUCRS
>> Ipiranga Avenue, 6681 – Building 30
>> P.O. Box: 90619-900 – Porto Alegre/RS
>> Phone: +55 51 3320 3500  extension: 7696
>> ---------------------------------------------------------------------------------
>>
>>
> 
> 
> 

--------------ms090205070500080602070505
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA3MDYwMjIx
MjczNVowIwYJKoZIhvcNAQkEMRYEFHoGh2f5DpYQDrNI5YoS/W2a4aoGMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyuqTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyu
qTANBgkqhkiG9w0BAQEFAASCAQAnRA+7d8LBWuYmudwJrlRsBjdbiYKl1WP2lY+FwoaEhSkokqUK
Ujh7oiz29hr0xQGFp/V+63tyo4MyJRAa6J7OUu5p8QY7qWAG2JqEgN/JhVen8c9eJ6oVMGrf7Kp1
NlXmsjDvLRWBpO8wU98XCgdALc2xOOAPvthD8wnzd+zjECsfoot56sln0Wr4SDiAR35D/CBfCnJc
cWzz5fzBI52+0UC3bcqXDPc7AnqDBbEpm0cT+bdpRwU75UR4Fq2SSNmEa8PFaqiLHqjEc6jVqD8p
WeLcnJh2Ud+bhB5TeF/6Y/GDKxZr+fctBRdYgaHTCJXtb6+ePh8+QVRv2HEcD3hxAAAAAAAA

--------------ms090205070500080602070505--
