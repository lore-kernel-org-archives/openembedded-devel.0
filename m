Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1LetK7-00058L-Ke
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:47:56 +0100
Received: (qmail 25835 invoked by uid 1003); 4 Mar 2009 15:43:41 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 4 Mar 2009 15:43:40 -0000
Message-ID: <49AEA1A2.8090102@balister.org>
Date: Wed, 04 Mar 2009 10:43:30 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090303204954.CCB9CE8008@amethyst.openembedded.net>	<1236119119.10602.62.camel@andromeda>	<49ADB183.5070709@balister.org>	<1236120999.10602.70.camel@andromeda>	<49AE5117.5020806@gefanuc.com>	<golk8b$52t$1@ger.gmane.org>
	<49AE8DAC.30504@gefanuc.com>
In-Reply-To: <49AE8DAC.30504@gefanuc.com>
Subject: Re: [oe-commits] Koen Kooi : angstrom 2009.X: bump automake-native to 1.10. 2 since some idiot deleted 1.10
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
X-List-Received-Date: Wed, 04 Mar 2009 15:47:59 -0000
X-Groupsio-MsgNum: 8146
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms040107010809000602080604"

--------------ms040107010809000602080604
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Martyn Welch wrote:
> Koen Kooi wrote:
>> On 04-03-09 10:59, Martyn Welch wrote:
>>> Michael 'Mickey' Lauer wrote:
>>>> Am Dienstag, den 03.03.2009, 17:38 -0500 schrieb Philip Balister:
>>>>> Michael 'Mickey' Lauer wrote:
>>>>>> Am Dienstag, den 03.03.2009, 21:49 +0100 schrieb GIT User account:
>>>>>>> Module: openembedded.git
>>>>>>> Branch: org.openembedded.dev
>>>>>>> Commit: eee859a9c348871d6d644ece76bc57b151cc80e8
>>>>>>> URL:
>>>>>>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=eee859a9c348871d6d644ece76bc57b151cc80e8 
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Author: Koen Kooi <koen@openembedded.org>
>>>>>>> Date: Tue Mar 3 21:47:57 2009 +0100
>>>>>>>
>>>>>>> angstrom 2009.X: bump automake-native to 1.10.2 since some idiot
>>>>>>> deleted 1.10
>>>>>> Ah, are we in that mood again? Take more pills.
>>>>> We need to have a serious discussion about deleting recipes. I know
>>>>> the deletion of python 2.5 will force me to address the 2.5->2.6
>>>>> upgrade in gnuradio before the upstream developers are ready.
>>>>>
>>>>> We need a way to remove recipes, but doing it as part of adding a new
>>>>> recipe is causing problems for OE users.
>>>>
>>>> Yes, we need to have a serious discussion about lots of things
>>>> surrounding the OpenEmbedded project, before the popularity kills the
>>>> project. Judging from the amount of interest though, I don't see that
>>>> happening -- neither short term nor long term.
>>>>
>>>
>>> Ok, so if a serious discussion is out of the question, lets just have a
>>> normal discussion.
>>>
>>> I see this issue to be partially related to the on going discussions
>>> regarding submissions. I assume that the "Commit_Policy"[1] on the wiki
>>> is either unofficial, out-of-date or optional as it states:
>>>
>>> * Changes to core toolchain components need review (gcc, binutils,
>>> libtool, pkgconfig, automake, autoconf etc.)
>>>
>>> Where:
>>>
>>> "Review" is defined as posting it on the mailing lists and getting
>>> positive agreement from two or more core developers.
>>> Now a quick check of my OpenEmbedded mail folder doesn't chuck up any
>>> messages with automake in the title that have a patch with this commit.
>>> Maybe I'm looking on the wrong mailing list.
>>
>> I haven't seen anything like that either, and upgrading automake *did* 
>> break, since a lot of apps now do 'install -s' which calls host strip :(
>> This is exactly why we did extensive testing the last time we touched 
>> automake.
>>
> 
> TBH, I think that the commit policy seems to have evolved over time to 
> include a number of tips as well as policies.
> 
> Rolf: it seems that you are the maintainer of this part of the wiki. 
> Would you please consider the following version which I have re-ordered 
> to try and bring greater clarity to what requires a review, what 
> requires the consultation of the maintainer or interested party and what 
> are tips rather than policy?:
> 
> ----
> 
> Making changes to the core infrastructure can impact many other users and
> developers. Whilst we don't want to discourage people hacking on and 
> improving
> the core infrastructure, more care is needed in those areas compared to 
> recipes
> with no dependants.
> 
> Above all else, commits are based on a gentleman's agreement. The following
> rules are not hard fast rules and the changes a developer is allowed to 
> commit
> without review will depend on their experience. Anyone found to be 
> committing
> inappropriate changes could have their access to the repository revoked 
> (at the discression of the core team).
> 
> More draconian review and commit policies may exist for topic branches, 
> such as
> the stable branch. Should these policies exist, they should be 
> documented in a
> README file in the root of the branch or a link provided in the README 
> to the
> location of the policies.
> 
> Developers without commit access should post their changes as patches to 
> the
> OpenEmbedded Developer mailing list (openembedded-devel@openembedded.org).
> 
> The following changes require a review:
> 
>  * Changes to class files (classes/*)
>  * Changes to global .conf files (e.g. bitbake.conf)
>  * Changes to core toolchain components (gcc, binutils,    libtool, 
> pkgconfig, automake, autoconf, etc.)
> 
> A "review" is defined as posting the proposed change as a patch to the
> OpenEmbedded Developer mailing list (OpenEmbedded-Devel) and receiving 
> agreement
> from two or more core developers.
> 
> Where present, the apropriate maintainer should be consulted before the
> following changes are made:
> 
>  * Machine configs (machine maintainer)
>  * Distro configs (distribution maintainer)
>  * Recipes (recipe maintainer)
> 
> It's fine to fix a recipe you don't maintain, however an attempt should 
> be made
> to contact anyone else actively maintaining that recipe (the git logs 
> show when
> and who made changes to the file in question). Try to contact the 
> maintainer, if
> contact details can not be found (see MAINTAINERS), send a note to the
> OpenEmbedded Developer mailing list.
> Please try to comply with the following rules when committing changes to
> OpenEmbedded:
> 
>  * Split your changes into their logical subparts. It's easier to track 
> down
>    problems afterwards when developers have stuck to the "one change, one
>    patch" approach. This also makes it possible to cherrypick suitable 
> changes
>    into other branches (such as a stable branch).
> 
>  * Provide a clear commit message (see the [[commit log example|example]]):
>     - The first line of commit is a summary of the changes and start 
> with the
>       name of the affected recipe.
>     - Provide concise details of the change made and it's affect as
>       appropriate.
>     - If appropriate, mention the bug number(s) that the patch resolves.
>     - Give credit where credit is due. If you commit someone else's work 
> more
>       or less verbatim, you should use ''git commit --author 
> $mail-of-author''.
>       If pulling changes from somewhere like Poky or OpenMoko there is no
>       problem with that but mention where the changes came from.
>     - Include a Signed-off-by: line to provide the commit with a valid
>       certificate of origin [http://lwn.net/Articles/139916/ as per the 
> Linux kernel]
> 
> Other tips for making good commits:
> 
>  * Think twice before using an override, usually overrides can be    
> avoided, especially ones like this:
> 
>      do_compile() {
>          oe_runmake
>      }
>      do_compile_myfirstdisto() {
>          oe_runmake -D_GNU_SOURCE
>      }
> 
>    In 99% of the cases your fix will resolve issues in other distros rather
>    than breaking them. An override will only resolve the issue for a 
> subset of
>    users, forcing others to duplicate the effort of resolving the problem. 
>    If an override is really needed, its probably useful to document why its
>    been added and why most people wouldn't want to use it.
> 
>  * If working in your own branch, sync early, sync often. Nobody likes to
>    reinvent the wheel. Merging is easy with git, so don't hesitate to 
> run sync
>    just before your plane takes off and your wifi gets disconnected.
> 
> 

+1

Philip

--------------ms040107010809000602080604
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDMwNDE1
NDMzMFowIwYJKoZIhvcNAQkEMRYEFFat5t/bFz+nFgCqPtKcWXCf0ghAMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXYhTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXY
hTANBgkqhkiG9w0BAQEFAASCAQAxnOEzgCwUCBVktmZYpA/Slr7Hv4j7gYADqULuX9hPlR8YhU6L
VXaxaRq8h6UQZ79eJpbI7qBtAS5LZU6HtiPM/SVHk1KRp/PQSoihcXz+P1nu/TNu6KxKt5CpsmcH
N88Bj6lspKl0Tg/yG9qrckLQEI9PBz/KambJd71y7INdCmart+4Whd7qlgpgTGsbQRa6yAcRQjQk
MbP/7ip6QtaCwafoQPABmfKs3X6RcX7agum9FhdCPIcr+Af9QgGWCcOlh6oyObKNgBFkVwWEVvRe
ug1YEO/9+oU9toyo4apG0F40pXqw5RQTwDvq4w/nX6qD4+oLpe/KvNcTh265htm0AAAAAAAA

--------------ms040107010809000602080604--
