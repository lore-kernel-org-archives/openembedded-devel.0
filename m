Received: from [66.207.66.26] (helo=www.balister.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philip@balister.org>) id 1Hb54k-0002dA-3X
	for openembedded-devel@openembedded.org; Tue, 10 Apr 2007 03:23:14 +0200
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by www.balister.org (8.13.8/8.13.8) with ESMTP id l3A1NCHg008537
	for <openembedded-devel@openembedded.org>;
	Mon, 9 Apr 2007 21:23:12 -0400
Message-ID: <461AE6FA.8010009@balister.org>
Date: Mon, 09 Apr 2007 21:23:06 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 1.5.0.10 (X11/20070302)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <4611582F.8010203@openhardware.net>	<f96d234e0704050628p3f72ec6exe9ef8ea5c732d80b@mail.gmail.com>	<c384c5ea0704081010y623cdbafq4f9dce1148a593e5@mail.gmail.com>	<461972D6.1060901@openhardware.net>	<461A6F08.3020904@openhardware.net>	<f96d234e0704091138j7118f436j4f4a3cc3edee4446@mail.gmail.com>
	<461AE55E.6020301@openhardware.net>
In-Reply-To: <461AE55E.6020301@openhardware.net>
Subject: Re: versioning madness
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
X-List-Received-Date: Tue, 10 Apr 2007 01:23:15 -0000
X-Groupsio-MsgNum: 1788
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms090207060802040005020700"

--------------ms090207060802040005020700
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom,

Have you looked at bb collections?

http://bitbake.berlios.de/manual/ch04s02.html#id870544

I think they will do what you want. You can keep separate data and chose 
which data takes priority in case of duplicate packages.

Philip

Tom Walsh wrote:
> Cliff Brake wrote:
>> On 4/9/07, Tom Walsh <tom@openhardware.net> wrote:
>>   
>>> Tom Walsh wrote:
>>>     
>>>> AH!  You know, I use svn regularly and I didn't even think about using
>>>> it against the OE tree!  Thanks, that would be the best solution for me.
>>>>
>>>>
>>>>       
>>> Nope, didn't work as well as I had hoped.  Both monotone and subversion
>>> bit^H^H^H complain about having an existing directory, so, I cannot
>>> "overlay" into the OE tree with either.
>>>
>>> I'll just have to do it the old-fashioned way and edit the stuff with vi.
>>>     
>> I don't understand?  I have two trees that are completely separate
>> from each other:
>>
>> openembedded (HEAD of OE managed with monotone)
>> openembedded.custom (custom stuff managed with SVN)
>>
>> The beauty of this setup is the trees do not interfere with each other.
>>
>>   
> True, I was doing it that way, having two source trees.  That works fine 
> if your recipes are for something that is not already in the OE tree.  
> However, it becomes problematic where you have the same recipe in both 
> trees.
> 
> For example, sysvinit.  I have changes to sysvinit that I want to make.  
> So, you can do that only one of two ways:
> 
> 1. create a subdir under the OE tree as 
> '$projroot/org.openembedded.dev/packages/sysvinit/sysvinit/zipit', where 
> 'zipit' is the name of my MACHINE.  Copy initab into the 'zipit' dir, 
> then edit your changes.  Done.
> 
> 2. duplicate the recipe for sysvinit into the private tree 
> ($projroot/zipitbbfiles/sysvinit).  Do the same here with creating the 
> new MACHINE dir ($projroot/zipitbbfiles/sysvinit/sysvinit/zipit/), copy 
> & edit inittab as before.
> 
> When the two recipe trees are specified within 
> $projdir/build/conf/local.conf as BBFILES := 
> "$projdir/zipitbbfiles/*/*.bb 
> $projdir/org.openembedded.dev/packages/*/*.bb", still no problem.
> 
> The problem comes up later when someone edits the recipe for 
> $projroot/org.openembedded.dev/packages/sysvinit/sysvinit_2.86.bb and 
> changes the PR = "rX" to a value larger than the one contained inside 
> $projdir/zipitbbfiles/sysvinit_2.86.bb.  Guess what happens now?  The 
> undesired recipe now takes precedence over the private recipe copy as PR 
> gets asserted in the numerical version vote!
> 
> Do you see the problems? 
> 
> A) The problem is that my recipe would be outvoted in the second case 
> structure of a private tree having a duplicate recipe.
> 
> B) There appears no convenient way to manage the addition of an 
> extension to a recipe that is kept inside the OE tree (without commiting 
> that into the main OE repository).  That is the problem with the first 
> case example.
> 
> 
> I guess that the issue(s) are not so much "versioning" but "source 
> control" as the PV version voting borks private copies.  And, a code 
> versioning system like subversion (or another copy of monotone, perhaps) 
> is unable to do source control within the org.openembedded.dev OE main 
> tree copy.
> 
> That's what I would like to resolve.  I could commit my board changes 
> into the OE repository, but, as it is a proprietary hardware design, I 
> doubt that anyone would encounter one as surplus.
> 
> There are some more issues, but, I'll stop here.  heh.
> 
> Regards,
> 
> TomW
> 
> 
>> Cliff
>>
>>   
> 
> 

--------------ms090207060802040005020700
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICEBHvMir6xnUSDyiLP20+hb4wDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA2MDQxNDEyNDMyNVoXDTA3MDQxNDEyNDMy
NVowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq3dpPM5m9xXgeamg5R4O98aJ573uQPAU0hARVdQQeipeYZTD
642AZkuc0T+u+pTHVGp2RYX8/2ihbnSxqDMXiYsaKG5q+7QVXIe/gIQSD1WhmDUcDaZ9cFU04ogh
SosFnIQFDzgde1Npi0hixmAUR/W0yJ/h1qAw4Gl5+RA+XMD7bSQ8JzbnaVyxzHa7lWz2TtT7SG7U
+xBKaxUoPiujB86EZplhKaK/aBNi1Qexo6ibCzr5L0MalCyTY0wyvLkuB8fVLneGmS9k+FixKnET
n/AI5dv1Rvnw98pT1iLdxD9bxaygntLM43B+MFrk7ovEUS5kKnIaOVq8szeo/eRUXwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEEBQADgYEAieX+0Zb3MOoVi4spKQb4SE/qINe6cqFUBKcQWh5AjcOlr8UQlKr5kv2KXGlg786S
s6svdkqqI8ecfLbzT/mi1fSHAIoXIRwoVZATRto7UUW7RjHq9too/h2Ady0cFMCheKA/qRZ6ptRh
8JCIoqnvD5EGexK1Tk4OPeeBlK9QuocwggL9MIICZqADAgECAhAR7zIq+sZ1Eg8oiz9tPoW+MA0G
CSqGSIb3DQEBBAUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wNjA0MTQxMjQzMjVaFw0wNzA0MTQxMjQzMjVaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKt3aTzOZvcV
4HmpoOUeDvfGiee97kDwFNIQEVXUEHoqXmGUw+uNgGZLnNE/rvqUx1RqdkWF/P9ooW50sagzF4mL
Gihuavu0FVyHv4CEEg9VoZg1HA2mfXBVNOKIIUqLBZyEBQ84HXtTaYtIYsZgFEf1tMif4dagMOBp
efkQPlzA+20kPCc252lcscx2u5Vs9k7U+0hu1PsQSmsVKD4rowfOhGaZYSmiv2gTYtUHsaOomws6
+S9DGpQsk2NMMry5LgfH1S53hpkvZPhYsSpxE5/wCOXb9Ub58PfKU9Yi3cQ/W8WsoJ7SzONwfjBa
5O6LxFEuZCpyGjlavLM3qP3kVF8CAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBAInl/tGW9zDqFYuLKSkG+EhP6iDX
unKhVASnEFoeQI3Dpa/FEJSq+ZL9ilxpYO/OkrOrL3ZKqiPHnHy280/5otX0hwCKFyEcKFWQE0ba
O1FFu0Yx6vbaKP4dgHctHBTAoXigP6kWeqbUYfCQiKKp7w+RBnsStU5ODj3ngZSvULqHMIIDPzCC
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
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAR7zIq+sZ1Eg8oiz9tPoW+MAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA3MDQxMDAx
MjMwNlowIwYJKoZIhvcNAQkEMRYEFP5xYXefUvVHfbgDjHgzavPglLcbMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQEe8yKvrGdRIPKIs/bT6FvjCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQEe8yKvrGdRIPKIs/bT6F
vjANBgkqhkiG9w0BAQEFAASCAQB1rydzZxLeQhCKotlj4xJDNR2xpiJ9eOMvXmSAiEMM+zPXBcXL
2w434BRr+K83am/NZuDvz/hWTw8wPK7S/7ozxLB4nfKHyrGOBfeMc7H8aC7EEhWNSEFInMVWExoO
U2Z9zWx35JQDYzSHBLqMZeYOVoFIfpOnASrm/6rGIgQ0VTJEkr6wahPw3Q4Cc/WjHFuFWqEQ8xBq
BOt6++Mkl4TjMrNa/4ByFNHct1mGiHza1KKfnqnmglSXg1xxCrWWrLJGqqw6lPbK25YKxu2w0u0A
F3otSjW1otCz+Ve+nYtJrzHxBaZu83SvpgzGMHGi/kJXqQ9RBuPC4tmbO0PWkCMYAAAAAAAA

--------------ms090207060802040005020700--
