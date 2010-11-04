Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1PDnzT-0006M3-Uo
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 01:47:45 +0100
Received: by qwd6 with SMTP id 6so674538qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 17:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=4ak8kZLbSr3kvZRq1Bxd3Gghttbi9GQ/4qfx0P3T85g=;
	b=B97jl/ZdBHOeTewOTWo6LF0aNVE8Pi/MbwHg/ecpHVKPMF4NItJw8c9QIVN1xAcViT
	l6dSL52r9E462mYUO4nTQHv8NR09WTSBbgnfXCJOEmjVj8Uz+LJUZHpKvSJyRxAw8S5a
	/XXykeyyO6Z6tkrpHWAOj/dR2z4Ca5RSx8x9Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MqmawUtaBkInz74TNpiBQs8W4id8JTJqXt5jVj0FUlmxiQLqBe3K8pmqLf3gK14OQ3
	40paozfNJLmHim+skLUe5GG0JRe8JMaq2lq/hIql42TzB2ypNxT6Tmq3BrOUnfZRHYnV
	ZPdAWetUhWmX9AciB8kdhpLhJ9xYgQhVpJ6nE=
MIME-Version: 1.0
Received: by 10.229.91.75 with SMTP id l11mr18189639qcm.24.1288831612024; Wed,
	03 Nov 2010 17:46:52 -0700 (PDT)
Received: by 10.229.8.210 with HTTP; Wed, 3 Nov 2010 17:46:51 -0700 (PDT)
In-Reply-To: <AANLkTi==Pf6K0p48n8cJhMnws6=43qGrX5HAPRgYyJaj@mail.gmail.com>
References: <AANLkTik9vuL4RR0x1mn_dSGXP2r2dn1RrgbOyxqYw+TD@mail.gmail.com>
	<AANLkTim-aV6bGmFZN3sg-w83ji1DGBvKJAh=DabPL-ij@mail.gmail.com>
	<AANLkTikOZCR47_Yd6Z7WoPSZZGW_65wTtzpxTPu89D1w@mail.gmail.com>
	<AANLkTi==Pf6K0p48n8cJhMnws6=43qGrX5HAPRgYyJaj@mail.gmail.com>
Date: Wed, 3 Nov 2010 17:46:51 -0700
Message-ID: <AANLkTimO6whzKHNQ2eCUagkg-HD7Ke2CzPv6r65-Fc0L@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problems building openldap and libtool
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
X-List-Received-Date: Thu, 04 Nov 2010 00:47:45 -0000
X-Groupsio-MsgNum: 25819
Content-Type: multipart/mixed; boundary=001636aa2bda68fd8504942f7eb5

--001636aa2bda68fd8504942f7eb5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 3, 2010 at 4:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Nov 3, 2010 at 4:36 PM, J. L. <vwyodapink@gmail.com> wrote:
>> On Wed, Nov 3, 2010 at 4:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Wed, Nov 3, 2010 at 3:55 PM, J. L. <vwyodapink@gmail.com> wrote:
>>>> I am having an issue of how libtool is building on my machine. I am
>>>> running Ubuntu 10.10 64bit Kernel 2.6.35-23-generic bitbake 1.10.1
>>>> overo branch. Here is what happens when building:
>>>>
>>>> Error for openldap
>>>> NOTE: package openldap-2.4.23-r2: task do_configure: Started
>>>> ERROR: Function do_configure failed
>>>> NOTE: Task failed: ('function do_configure failed',
>>>> '/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openld=
ap-2.4.23-r2/temp/log.do_configure.12815')
>>>> ERROR: Logfile of failure stored in:
>>>> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openlda=
p-2.4.23-r2/temp/log.do_configure.12815
>>>> Log data follows:
>>>> | cp: cannot stat
>>>> `/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/us=
r/share/libtool/ltmain.sh':
>>>> No such file or directory
>>>
>>> can you add DEPENDS +=3D "libtool" to openldap_2.4.23.bb and retry ?
>>
>> Still getting this error and I cleaned and rebuilt both recipes
>
> try this patch and remove that DEPENDS
>
> diff --git a/recipes/openldap/openldap_2.4.23.bb
> b/recipes/openldap/openldap_2.4.23.bb
> index 3ac15f6..8afd951 100644
> --- a/recipes/openldap/openldap_2.4.23.bb
> +++ b/recipes/openldap/openldap_2.4.23.bb
> @@ -188,7 +188,7 @@ DEPENDS =A0 =A0 =A0+=3D "${OPENLDAP_DEPENDS}"
> =A0CPPFLAGS_append =3D " -D_GNU_SOURCE"
>
> =A0do_configure() {
> - =A0 =A0 =A0 cp ${STAGING_DATADIR}/libtool/config/ltmain.sh ${S}/build
> + =A0 =A0 =A0 cp ${STAGING_ETCDIR_NATIVE}/libtool/config/ltmain.sh ${S}/b=
uild
> =A0 =A0 =A0 =A0rm -f ${S}/libtool
> =A0 =A0 =A0 =A0aclocal
> =A0 =A0 =A0 =A0libtoolize --force --copy
>
>
>>
>> ERROR: Logfile of failure stored in:
>> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-=
2.4.23-r2/temp/log.do_configure.2783
>> Log data follows:
>> | cp: cannot stat
>> `/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/=
share/libtool/ltmain.sh':
>> No such file or directory
>> | ERROR: Function do_configure failed
>> NOTE: package openldap-2.4.23-r2: task do_configure: Failed
>>
>>
>> libtool does not build to this location
>> /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/s=
hare/libtool/
>> it builds to here
>> tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tmp/sy=
sroots/x86_64-linux/usr/share/libtool/
>>
>> It seems to put home/vdubhack/overo-oe/tmp the incorrect way. instead
>> of being in front of the tmp/sysroot like most things
>>
>> same with aclocal and aclocal-1.11
>>
>> Thanks
>>
>> JL
>>>
>>>
>>> -khem
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Did as you asked and also deleted the tmp/ dir to just make sure was
nothing in there and rebuilt. And must not have done something right
as the patch failed with this:
ERROR: Logfile of failure stored in:
/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2.4=
.23-r2/temp/log.patch_do_patch.22762
Log data follows:
| ERROR: Error in executing python function in:
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/openldap/openldap_2.4.=
23.bb
| ERROR: Exception:<class 'oe.patch.CmdError'> Message:Command Error:
exit status: 1  Output:
| Applying patch test-fix.patch
| patching file recipes/openldap/openldap_2.4.23.bb
| Hunk #1 FAILED at 188.
| 1 out of 1 hunk FAILED -- rejects in file recipes/openldap/openldap_2.4.2=
3.bb
| Patch test-fix.patch does not apply (enforce with -f)
| ERROR: Printing the environment of the function
| ERROR: Function patch_do_patch failed
NOTE: package openldap-2.4.23-r2: task do_patch: Failed
 I have attached the patch and the .bb so you can see what and how I did it=
.

Thanks for the help so far.

JL

--001636aa2bda68fd8504942f7eb5
Content-Type: application/octet-stream; name="openldap_2.4.23.bb"
Content-Disposition: attachment; filename="openldap_2.4.23.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gg2x1n870

IyBPcGVuTERBUCwgYSBsaWNlbnNlIGZyZWUgKHNlZSBodHRwOi8vd3d3Lk9wZW5MREFQLm9yZy9s
aWNlbnNlLmh0bWwpCiMKREVTQ1JJUFRJT04gPSAiT3BlbkxEQVAgU29mdHdhcmUgaXMgYW4gb3Bl
biBzb3VyY2UgaW1wbGVtZW50YXRpb24gb2YgdGhlIExpZ2h0d2VpZ2h0IERpcmVjdG9yeSBBY2Nl
c3MgUHJvdG9jb2wuIgpIT01FUEFHRSA9ICJodHRwOi8vd3d3Lk9wZW5MREFQLm9yZy9saWNlbnNl
Lmh0bWwiClBSSU9SSVRZID0gIm9wdGlvbmFsIgojIFRoZSBPcGVuTERBUCBQdWJsaWMgTGljZW5z
ZSAtIHNlZSB0aGUgSE9NRVBBR0UgLSBkZWZpbmVzCiMgdGhlIGxpY2Vuc2UuICB3d3cub3Blbmxk
YXAub3JnIGNsYWltcyB0aGlzIGlzIE9wZW4gU291cmNlCiMgKHNlZSBodHRwOi8vd3d3Lm9wZW5s
ZGFwLm9yZyksIHRoZSBsaWNlbnNlIGFwcGVhcnMgdG8gYmUKIyBiYXNpY2FsbHkgQlNELiAgb3Bl
bnNvdXJjZS5vcmcgZG9lcyBub3QgcmVjb3JkIHRoaXMgbGljZW5zZQojIGF0IHByZXNlbnQgKHNv
IGl0IGlzIGFwcGFyZW50bHkgbm90IE9TSSBjZXJ0aWZpZWQpLgpMSUNFTlNFID0gIk9wZW5MREFQ
IgpTRUNUSU9OID0gImxpYnMiCgpMREFQX1ZFUiA9ICIke0AnLicuam9pbihiYi5kYXRhLmdldFZh
cignUFYnLGQsMSkuc3BsaXQoJy4nKVswOjJdKX0iClBSID0gInIyIgoKU1JDX1VSSSA9ICJmdHA6
Ly9mdHAub3BlbmxkYXAub3JnL3B1Yi9PcGVuTERBUC9vcGVubGRhcC1yZWxlYXNlLyR7UH0udGd6
IgpTUkNfVVJJICs9ICJmaWxlOi8vb3BlbmxkYXAtbTQtcHRocmVhZC5wYXRjaCIKU1JDX1VSSSAr
PSAiZmlsZTovL2luaXRzY3JpcHQiClNSQ19VUkkgKz0gImZpbGU6Ly90ZXN0LWZpeC5wYXRjaCIK
U1JDX1VSSVttZDVzdW1dID0gIjkwMTUwYjhjMGQwMTkyZTEwYjMwMTU3ZTY4ODQ0ZGRmIgpTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNWE1ZWRlOTFkNWU4YWIzYzdmNjM3NjIwYWEyOWEzYjk2ZWIzNDMx
OGE4YjI2YzhlZWYyZDJjNzg5ZmMwNTVlMyIKCiMgVGhlIG9yaWdpbmFsIHRvcC5tayB1c2VkIElO
U1RBTEwsIG5vdCBJTlNUQUxMX1NUUklQX1BST0dSQU0gd2hlbgojIGluc3RhbGxpbmcgLnNvIGFu
ZCBleGVjdXRhYmxlcywgdGhpcyBmYWlscyBpbiBjcm9zcyBjb21waWxhdGlvbgojIGVudmlyb25t
ZW50cwpTUkNfVVJJICs9ICJmaWxlOi8vaW5zdGFsbC1zdHJpcC5wYXRjaCIKCmluaGVyaXQgYXV0
b3Rvb2xzCgojIE9QVElPTlMKIyBUaGUgZm9sbG93aW5nIHR3byB2YXJpYWJsZXMgY2FuIGJlIHNl
dCBpbiBhIGRpc3RybyBvciBsb2NhbC5jb25mCiMgdG8gc3dpdGNoIGZlYXR1cmVzIG9uLiAgRWFj
aCBmZWF0dXJlIGZvbyBkZWZpbmVzIE9QRU5MREFQX09QVElPTl9mb28KIyBhbmQgT1BFTkxEQVBf
REVQRU5EU19mb28gaW4gdGhpcyBmaWxlIC0gdG8gaW5jbHVkZSBmZWF0dXJlIGZvbyBhZGQKIyB0
aGUgdHdvIHZhcmlhYmxlcyBpbnRvIHRoZSBzZXR0aW5nIG9mIHRoZSBvcHRpb25zIGJlbG93IChw
bGVhc2UgdXNlCiMgKz0gYmVjYXVzZSB0aGF0IG1lYW5zIHRoaXMgY2FuIGJlIGRvbmUgaW4gKmJv
dGgqIGRpc3Ryby5jb25mIGFuZAojIGxvY2FsLmNvbmYhCk9QRU5MREFQX09QVElPTlMgPz0gIiIK
T1BFTkxEQVBfREVQRU5EUyA/PSAiIgoKIyBDViBTRVRUSU5HUwojIFJlcXVpcmVkIHRvIHdvcmsg
cm91bmQgQUNfRlVOQ19NRU1DTVAgd2hpY2ggZ2V0cyB0aGUgd3JvbmcgYW5zd2VyCiMgd2hlbiBj
cm9zcyBjb21waWxpbmcgKHNob3VsZCBiZSBpbiBzaXRlPykKRVhUUkFfT0VDT05GICs9ICJhY19j
dl9mdW5jX21lbWNtcF93b3JraW5nPXllcyIKCiMgQ09ORklHIERFRklOSVRJT05TCiMgVGhlIGZv
bGxvd2luZyBpcyBuZWNlc3NhcnkgYmVjYXVzZSBpdCBjYW5ub3QgYmUgZGV0ZXJtaW5lZCBmb3Ig
YQojIGNyb3NzIGNvbXBpbGUgYXV0b21hZ2ljYWxseS4gIFNlbGVjdCBzaG91bGQgeWllbGQgZmlu
ZSBvbiBhbGwgT0UKIyBzeXN0ZW1zLi4uCkVYVFJBX09FQ09ORiArPSAiLS13aXRoLXlpZWxkaW5n
LXNlbGVjdD15ZXMiCiMgU2hhcmVkIGxpYnJhcmllcyBhcmUgbmljZS4uLgpFWFRSQV9PRUNPTkYg
Kz0gIi0tZW5hYmxlLWR5bmFtaWMiCiMKIyBEaXNhYmxlIFRMUyB0byByZW1vdmUgdGhlIG5lZWQg
Zm9yIG9wZW5zc2wvbGliY3J5cHRvCk9QRU5MREFQX09QVElPTl90bHMgID89ICItLXdpdGgtdGxz
IgojIHNldCB0aGUgZm9sbG93aW5nIHRvICJvcGVuc3NsIiB0byBidWlsZCB0bHMgc3VwcG9ydApP
UEVOTERBUF9ERVBFTkRTX3RscyA/PSAiZ251dGxzIgpFWFRSQV9PRUNPTkYgKz0gIiR7T1BFTkxE
QVBfT1BUSU9OX3Rsc30iCkRFUEVORFMgKz0gIiR7T1BFTkxEQVBfREVQRU5EU190bHN9IgojCiMg
RGlzYWJsZSBDeXJ1cyBTQVNMLCB3aGljaCBtYXkgb3IgbWF5IG5vdCBiZSB3b3JraW5nIGF0IHBy
ZXNlbnQuLi4KT1BFTkxEQVBfT1BUSU9OX3Nhc2wgID89ICItLXdpdGhvdXQtY3lydXMtc2FzbCIK
IyBzZXQgdGhlIGZvbGxvd2luZyB0byAiY3lydXMtc2FzbCIgdG8gYnVpbGQgU0FTTCBzdXBwb3J0
Ck9QRU5MREFQX0RFUEVORFNfc2FzbCA/PSAiIgpFWFRSQV9PRUNPTkYgKz0gIiR7T1BFTkxEQVBf
T1BUSU9OX3Nhc2x9IgpERVBFTkRTICs9ICIke09QRU5MREFQX0RFUEVORFNfc2FzbH0iCgojIFNM
QVBEIG9wdGlvbnMKIwojIFVOSVggY3J5cHQoMykgcGFzc3dkIHN1cHBvcnQ6CkVYVFJBX09FQ09O
RiArPSAiLS1lbmFibGUtY3J5cHQiCiMKIyBFbmFibGUgZHluYW1pYyBtb2R1bGUgbG9hZGluZy4g
IElmIHRoaXMgaXMgKmRpc2FibGVkKiB0aGUKIyBkZXBlbmRlbmN5IG9uIGxpYnRvb2wgaXMgcmVt
b3ZlZCAodG8gZGlzYWJsZSBzZXQgdGhlIGZvbGxvd2luZwojIHRvIHZhcmlhYmxlcyB0byAiIiBp
biBhIC5jb25mIGZpbGUpLgpPUEVOTERBUF9PUFRJT05fbW9kdWxlcyArPSAibHRfY3ZfZGxvcGVu
X3NlbGY9eWVzIC0tZW5hYmxlLW1vZHVsZXMiCk9QRU5MREFQX0RFUEVORFNfbW9kdWxlcyArPSAi
bGlidG9vbCIKRVhUUkFfT0VDT05GICs9ICIgJHtPUEVOTERBUF9PUFRJT05fbW9kdWxlc30iCkRF
UEVORFMgKz0gIiR7T1BFTkxEQVBfREVQRU5EU19tb2R1bGVzfSIKCiMgU0xBUEQgQkFDS0VORAoj
CiMgVGhlIGJhY2tlbmQgbXVzdCBiZSBzZXQgYnkgdGhlIGNvbmZpZ3VyYXRpb24uICBUaGlzIGNv
bnRyb2xzIHRoZQojIHJlcXVpcmVkIGRhdGFiYXNlLCB0aGUgZGVmYXVsdCBkYXRhYmFzZSwgYmRi
LCBpcyB0dXJuZWQgb2ZmIGJ1dAojIGNhbiBiZSB0dXJuZWQgYmFjayBvbiBhZ2FpbiBhbmQgaXQg
KmlzKiBiZWxvdyEgIFRoZSBtb25pdG9yIGJhY2tlbmQKIyBpcyBhbHNvIGRpc2FibGVkLiAgSWYg
eW91IHRyeSB0byBjaGFuZ2UgdGhlIGJhY2tlbmRzIGJ1dCBmYWlsIHRvCiMgZW5hYmxlIGEgc2lu
Z2xlIG9uZSB0aGUgYnVpbGQgd2lsbCBmYWlsIGluIGFuIG9idmlvdXMgd2F5LgojCkVYVFJBX09F
Q09ORiArPSAiLS1kaXNhYmxlLWJkYiAtLWRpc2FibGUtaGRiIC0tZGlzYWJsZS1tb25pdG9yIgoj
CiMgQmFja2VuZHM9ImJkYiBkbnNzcnYgaGRiIGxkYXAgbGRibSBtZXRhIG1vbml0b3IgbnVsbCBw
YXNzd2QgcGVybCBzaGVsbCBzcWwiCiMKIyBOb3RlIHRoYXQgbXVsdGlwbGUgYmFja2VuZHMgY2Fu
IGJlIGJ1aWx0LiAgVGhlIGxkYm0gYmFja2VuZCByZXF1aXJlcyBhCiMgYnVpbGQtdGltZSBjaG9p
Y2Ugb2YgZGF0YWJhc2UgQVBJLiAgVGhlIGJkYiBiYWNrZW5kIGZvcmNlcyB0aGlzIHRvIGJlCiMg
REI0LiAgVG8gdXNlIHRoZSBnZGJtIChvciBvdGhlcikgQVBJIHRoZSBCZXJrZWx5IGRhdGFiYXNl
IG1vZHVsZSBtdXN0CiMgYmUgcmVtb3ZlZCBmcm9tIHRoZSBidWlsZC4KbWQgPSAiJHtsaWJleGVj
ZGlyfS9vcGVubGRhcCIKIwojLS1lbmFibGUtYmRiICAgICAgICAgIGVuYWJsZSBCZXJrZWxleSBE
QiBiYWNrZW5kIG5vfHllc3xtb2QgeWVzCiMgVGhlIEJlcmtlbHkgREIgaXMgdGhlIHN0YW5kYXJk
IGNob2ljZS4gIFRoaXMgdmVyc2lvbiBvZiBPcGVuTERBUCByZXF1aXJlcwojIHRoZSB2ZXJzaW9u
IDQgaW1wbGVtZW50YXRpb24gb3IgYmV0dGVyLgojIFRvIGRpc2FibGUgdGhpcyBzZXQgYWxsIHRo
cmVlIG9mIHRoZSBmb2xsb3dpbmcgdmFyaWFibGVzIHRvIDxlbXB0eT4gaW4KIyBhIC5jb25mIGZp
bGUgKHRoaXMgd2lsbCBhbGxvdyBsZGJtIHRvIGJlIGJ1aWxkIHdpdGggZ2RibSkuCiNPUEVOTERB
UF9PUFRJT05fYmRiICAgPz0gIi0tZW5hYmxlLWJkYj1tb2QiCk9QRU5MREFQX0RFUEVORFNfYmRi
ICA/PSAiZGIiCkVYVFJBX09FQ09ORiArPSAiJHtPUEVOTERBUF9PUFRJT05fYmRifSIKREVQRU5E
UyArPSAiJHtPUEVOTERBUF9ERVBFTkRTX2JkYn0iCiMKIy0tZW5hYmxlLWRuc3NydiAgICAgICBl
bmFibGUgZG5zc3J2IGJhY2tlbmQgbm98eWVzfG1vZCBubwojIFRoaXMgaGFzIG5vIGRlcGVuZGVu
Y2llcy4KRVhUUkFfT0VDT05GICs9ICItLWVuYWJsZS1kbnNzcnY9bW9kIgojCiMtLWVuYWJsZS1o
ZGIgICAgICAgICAgZW5hYmxlIEhpZXJhcmNoaWNhbCBEQiBiYWNrZW5kIG5vfHllc3xtb2Qgbm8K
IyBUaGlzIGZvcmNlcyBsZGJtIHRvIHVzZSBCZXJrZWxleSB0b28sIHJlbW92ZSB0byB1c2UgZ2Ri
bQojT1BFTkxEQVBfT1BUSU9OX2hkYiAgID89ICItLWVuYWJsZS1oZGI9bW9kIgpPUEVOTERBUF9E
RVBFTkRTX2hkYiAgPz0gImRiIgpPUEVOTERBUF9QQUNLQUdFX2hkYiAgPz0gIiR7UE59LWJhY2tl
bmQtaGRiIgpFWFRSQV9PRUNPTkYgKz0gIiR7T1BFTkxEQVBfT1BUSU9OX2hkYn0iCkRFUEVORFMg
Kz0gIiR7T1BFTkxEQVBfREVQRU5EU19oZGJ9IgojCiMtLWVuYWJsZS1sZGFwICAgICAgICAgZW5h
YmxlIGxkYXAgYmFja2VuZCBub3x5ZXN8bW9kIG5vCiMgVGhpcyBoYXMgbm8gZGVwZW5kZW5jaWVz
CkVYVFJBX09FQ09ORiArPSAiLS1lbmFibGUtbGRhcD1tb2QiCiMKIy0tZW5hYmxlLWxkYm0gICAg
ICAgICBlbmFibGUgbGRibSBiYWNrZW5kIG5vfHllc3xtb2Qgbm8KIyBsZGJtIHJlcXVpcmVzIGZ1
cnRoZXIgc3BlY2lmaWNhdGlvbiBvZiB0aGUgdW5kZXJseWluZyBkYXRhYmFzZSBBUEksIGJlY2F1
c2UKIyBiZGIgaXMgZW5hYmxlZCBhYm92ZSB0aGlzIG11c3QgYmUgc2V0IHRvIGJlcmtlbGV5LCBo
b3dldmVyIHRoZSBjb25maWcKIyBkZWZhdWx0cyB0aGlzIGNvcnJlY3RseSBzbyAtLXdpdGgtbGRi
bS1hcGkgaXMgKm5vdCogc2V0LiAgVGhlIGJ1aWxkIHdpbGwKIyBmYWlsIGlmIGJkYiBpcyByZW1v
dmVkIChhYm92ZSkgYnV0IG5vdCBkYXRhYmFzZSBpcyBidWlsdCB0byBwcm92aWRlIHRoZQojIHN1
cHBvcnQgZm9yIGxkYm0gKGJlY2F1c2UgdGhlICdERVBFTkRTX2xkYm0nIGlzIGVtcHR5IGJlbG93
LikKIwojIFNvIHRvIHVzZSBnZGJtIHNldDoKT1BFTkxEQVBfT1BUSU9OX2xkYm0gPSAiLS1lbmFi
bGUtbGRibT1tb2QgLS13aXRoLWxkYm0tYXBpPWdkYm0iCk9QRU5MREFQX0RFUEVORFNfbGRibSA9
IGdkYm0KIyBBbmQgY2xlYXIgdGhlIGJkYiBhbmQgaGRiIHNldHRpbmdzLgpPUEVOTERBUF9PUFRJ
T05fbGRibSA/PSAiLS1lbmFibGUtbGRibT1tb2QiCk9QRU5MREFQX0RFUEVORFNfbGRibSA/PSAi
IgpFWFRSQV9PRUNPTkYgKz0gIiR7T1BFTkxEQVBfT1BUSU9OX2xkYm19IgpERVBFTkRTICs9ICIk
e09QRU5MREFQX0RFUEVORFNfbGRibX0iCiMKIy0tZW5hYmxlLW1ldGEgICAgICAgICBlbmFibGUg
bWV0YWRpcmVjdG9yeSBiYWNrZW5kIG5vfHllc3xtb2Qgbm8KIyBObyBkZXBlbmRlbmNpZXMKRVhU
UkFfT0VDT05GICs9ICItLWVuYWJsZS1tZXRhPW1vZCIKIwojLS1lbmFibGUtbW9uaXRvciAgICAg
IGVuYWJsZSBtb25pdG9yIGJhY2tlbmQgbm98eWVzfG1vZCB5ZXMKRVhUUkFfT0VDT05GICs9ICIt
LWVuYWJsZS1tb25pdG9yPW1vZCIKIwojLS1lbmFibGUtbnVsbCAgICAgICAgIGVuYWJsZSBudWxs
IGJhY2tlbmQgbm98eWVzfG1vZCBubwpFWFRSQV9PRUNPTkYgKz0gIi0tZW5hYmxlLW51bGw9bW9k
IgojCiMtLWVuYWJsZS1wYXNzd2QgICAgICAgZW5hYmxlIHBhc3N3ZCBiYWNrZW5kIG5vfHllc3xt
b2Qgbm8KRVhUUkFfT0VDT05GICs9ICIgLS1lbmFibGUtcGFzc3dkPW1vZCIKIwojLS1lbmFibGUt
cGVybCAgICAgICAgIGVuYWJsZSBwZXJsIGJhY2tlbmQgbm98eWVzfG1vZCBubwojICBUaGlzIHJl
cXVpcmVzIGEgbG9hZGFibGUgcGVybCBkeW5hbWljIGxpYnJhcnksIGlmIGVuYWJsZWQgd2l0aG91
dAojICBkb2luZyBzb21ldGhpbmcgYXBwcm9wcmlhdGUgKGJ1aWxkaW5nIHBlcmw/KSB0aGUgYnVp
bGQgd2lsbCBwaWNrCiMgIHVwIHRoZSBidWlsZCBtYWNoaW5lIHBlcmwgLSBub3QgZ29vZC4KT1BF
TkxEQVBfT1BUSU9OX3BlcmwgPz0gIi0tZW5hYmxlLXBlcmw9bW9kIgpPUEVOTERBUF9ERVBFTkRT
X3BlcmwgPz0gInBlcmwiCiNFWFRSQV9PRUNPTkYgKz0gIiR7T1BFTkxEQVBfT1BUSU9OX3Blcmx9
IgojREVQRU5EUyArPSAiJHtPUEVOTERBUF9ERVBFTkRTX3Blcmx9IgojCiMtLWVuYWJsZS1zaGVs
bCAgICAgICAgZW5hYmxlIHNoZWxsIGJhY2tlbmQgbm98eWVzfG1vZCBubwpFWFRSQV9PRUNPTkYg
Kz0gIi0tZW5hYmxlLXNoZWxsPW1vZCIKIwojLS1lbmFibGUtc3FsICAgICAgICAgIGVuYWJsZSBz
cWwgYmFja2VuZCBub3x5ZXN8bW9kIG5vCiMgc3FsIHJlcXVpcmVzIHNvbWUgc3FsIGJhY2tlbmQg
d2hpY2ggcHJvdmlkZXMgc3FsLmgsIHNxbGl0ZSogcHJvdmlkZXMKIyBzcWxpdGUuaCAod2hpY2gg
bWF5IGJlIGNvbXBhdGlibGUgYnV0IGhhc24ndCBiZWVuIHRyaWVkLikKT1BFTkxEQVBfT1BUSU9O
X3NxbCA/PSAiLS1lbmFibGUtc3FsPW1vZCIKT1BFTkxEQVBfREVQRU5EU19zcWwgPz0gInNxbCIK
I0VYVFJBX09FQ09ORiArPSAiJHtPUEVOTERBUF9PUFRJT05fc3FsfSIKI0RFUEVORFMgKz0gIiR7
T1BFTkxEQVBfREVQRU5EU19zcWx9IgojCiMtLWVuYWJsZS1keW5ncm91cCAgICAgRHluYW1pYyBH
cm91cCBvdmVybGF5IG5vfHllc3xtb2Qgbm8KIyAgVGhpcyBpcyBhIGRlbW8sIFByb3h5IENhY2hl
IGRlZmluZXMgaW5pdF9tb2R1bGUgd2hpY2ggY29uZmxpY3RzIHdpdGggdGhlCiMgIHNhbWUgc3lt
Ym9sIGluIGR5bmdyb3VwCiNFWFRSQV9PRUNPTkYgKz0gIi0tZW5hYmxlLWR5bmdyb3VwPW1vZCIK
IwojLS1lbmFibGUtcHJveHljYWNoZSAgIFByb3h5IENhY2hlIG92ZXJsYXkgbm98eWVzfG1vZCBu
bwpFWFRSQV9PRUNPTkYgKz0gIi0tZW5hYmxlLXByb3h5Y2FjaGU9bW9kIgpGSUxFU18ke1BOfS1v
dmVybGF5LXByb3h5Y2FjaGUgPSAiJHttZH0vcGNhY2hlLSouc28uKiIKUEFDS0FHRVMgKz0gIiR7
UE59LW92ZXJsYXktcHJveHljYWNoZSIKIwojIExPQ0FMIE9QVElPTiBPVkVSUklERVMKIyBUaGUg
ZGlzdHJvL2xjb2FsIG9wdGlvbnMgbXVzdCBiZSBhZGRlZCBpbiAqbGFzdCoKRVhUUkFfT0VDT05G
ICs9ICIke09QRU5MREFQX09QVElPTlN9IgpERVBFTkRTICAgICAgKz0gIiR7T1BFTkxEQVBfREVQ
RU5EU30iCgpDUFBGTEFHU19hcHBlbmQgPSAiIC1EX0dOVV9TT1VSQ0UiCgpkb19jb25maWd1cmUo
KSB7CgljcCAke1NUQUdJTkdfREFUQURJUn0vbGlidG9vbC9sdG1haW4uc2ggJHtTfS9idWlsZAoJ
cm0gLWYgJHtTfS9saWJ0b29sCglhY2xvY2FsCglsaWJ0b29saXplIC0tZm9yY2UgLS1jb3B5Cgln
bnUtY29uZmlnaXplCglhdXRvY29uZgoJb2VfcnVuY29uZgp9CgojRklYTUU6IHRoaXMgaXMgYSBo
YWNrLCBhdCBwcmVzZW50IGFuIG9wZW5sZGFwIGJ1aWxkIHdpbGwgcGljayB1cCB0aGUgaGVhZGVy
CiMgZmlsZXMgZnJvbSBzdGFnaW5nIHJhdGhlciB0aGFuIHRoZSBsb2NhbCBvbmVzIChiYWQgLUkg
b3JkZXIpLCBzbyByZW1vdmUKIyB0aGUgaGVhZGVycyAoZnJvbSBvcGVubGRhcC1vbGQueCkgYmVm
b3JlIGNvbXBpbGluZy4uLgpkb19jb21waWxlX3ByZXBlbmQoKSB7CgkoCWNkICR7U1RBR0lOR19J
TkNESVJ9CgkJcm0gLWYgbGRhcC5oIGxkYXBfKi5oCgkpCgkoCWNkICR7U1RBR0lOR19MSUJESVJ9
CgkJcm0gLWYgbGlibGRhcCogbGlibGJlcioKCSkKfQoKTEVBRF9TT05BTUUgPSAibGlibGRhcC0k
e0xEQVBfVkVSfS5zby4qIgoKIyBUaGUgZXhlY3V0YWJsZXMgZ28gaW4gYSBzZXBhcmF0ZSBwYWNr
YWdlLiAgVGhpcyBhbGxvd3MgdGhlCiMgaW5zdGFsbGF0aW9uIG9mIHRoZSBsaWJyYXJpZXMgd2l0
aCBubyBkYWVtb24gc3VwcG9ydC4KIyBFYWNoIG1vZHVsZSBhbHNvIGhhcyBpdHMgb3duIHBhY2th
Z2UgLSBzZWUgYWJvdmUuClBBQ0tBR0VTICs9ICIke1BOfS1zbGFwZCAke1BOfS1zbHVycGQgJHtQ
Tn0tYmluIgoKIyBQYWNrYWdlIGNvbnRlbnRzIC0gc2hpZnQgbW9zdCBzdGFuZGFyZCBjb250ZW50
cyB0byAtYmluCkZJTEVTXyR7UE59ID0gIiR7bGliZGlyfS9saWIqLnNvLiogJHtzeXNjb25mZGly
fS9vcGVubGRhcC9sZGFwLiogJHtsb2NhbHN0YXRlZGlyfS9vcGVubGRhcC1kYXRhIgpGSUxFU18k
e1BOfS1zbGFwZCA9ICIke3N5c2NvbmZkaXJ9L2luaXQuZCAke2xpYmV4ZWNkaXJ9L3NsYXBkICR7
c2JpbmRpcn0gJHtsb2NhbHN0YXRlZGlyfS9ydW4gXAoJJHtzeXNjb25mZGlyfS9vcGVubGRhcC9z
bGFwZC4qICR7c3lzY29uZmRpcn0vb3BlbmxkYXAvc2NoZW1hIFwKCSR7c3lzY29uZmRpcn0vb3Bl
bmxkYXAvREJfQ09ORklHLmV4YW1wbGUiCkZJTEVTXyR7UE59LXNsdXJwZCA9ICIke2xpYmV4ZWNk
aXJ9L3NsdXJwZCAke2xvY2Fsc3RhdGVkaXJ9L29wZW5sZGFwLXNsdXJwICR7bG9jYWxzdGF0ZWRp
cn0vcnVuIgpGSUxFU18ke1BOfS1iaW4gPSAiJHtiaW5kaXJ9IgpGSUxFU18ke1BOfS1kZXYgPSAi
JHtpbmNsdWRlZGlyfSAke2xpYmRpcn0vbGliKi5zbyAke2xpYmRpcn0vKi5sYSAke2xpYmRpcn0v
Ki5hICR7bGliZXhlY2Rpcn0vb3BlbmxkYXAvKi5hICR7bGliZXhlY2Rpcn0vb3BlbmxkYXAvKi5s
YSAke2xpYmV4ZWNkaXJ9L29wZW5sZGFwLyouc28iCkZJTEVTXyR7UE59LWRiZyArPSAiJHtsaWJl
eGVjZGlyfS9vcGVubGRhcC8uZGVidWciCgpkb19pbnN0YWxsX2FwcGVuZCgpIHsKCWluc3RhbGwg
LWQgJHtEfSR7c3lzY29uZmRpcn0vaW5pdC5kCgljYXQgJHtXT1JLRElSfS9pbml0c2NyaXB0ID4g
JHtEfSR7c3lzY29uZmRpcn0vaW5pdC5kL29wZW5sZGFwCgljaG1vZCA3NTUgJHtEfSR7c3lzY29u
ZmRpcn0vaW5pdC5kL29wZW5sZGFwCgkjIFRoaXMgaXMgZHVwbGljYXRlZCBpbiAvZXRjL29wZW5s
ZGFwIGFuZCBpcyBmb3Igc2xhcGQKCXJtIC1mICR7RH0ke2xvY2Fsc3RhdGVkaXJ9L29wZW5sZGFw
LWRhdGEvREJfQ09ORklHLmV4YW1wbGUKfQoKcGtnX3Bvc3RpbnN0XyR7UE59LXNsYXBkICgpIHsK
ICAgICAgICBpZiB0ZXN0IC1uICIke0R9IjsgdGhlbgogICAgICAgICAgICAgICAgRD0iLXIgJEQi
CiAgICAgICAgZmkKICAgICAgICB1cGRhdGUtcmMuZCAkRCBvcGVubGRhcCBkZWZhdWx0cwp9Cgpw
a2dfcHJlcm1fJHtQTn0tc2xhcGQgKCkgewogICAgICAgIGlmIHRlc3QgLW4gIiR7RH0iOyB0aGVu
CiAgICAgICAgICAgICAgICBEPSItciAkRCIKICAgICAgICBmaQogICAgICAgIHVwZGF0ZS1yYy5k
ICREIG9wZW5sZGFwIHJlbW92ZQp9CgpQQUNLQUdFU19EWU5BTUlDID0gIm9wZW5sZGFwLWJhY2tl
bmRzIG9wZW5sZGFwLWJhY2tlbmQtKiIKCnB5dGhvbiBwb3B1bGF0ZV9wYWNrYWdlc19wcmVwZW5k
ICgpIHsKCWJhY2tlbmRfZGlyICAgID0gYmIuZGF0YS5leHBhbmQoJyR7bGliZXhlY2Rpcn0vb3Bl
bmxkYXAnLCBkKQoJZG9fc3BsaXRfcGFja2FnZXMoZCwgYmFja2VuZF9kaXIsICdiYWNrXyhbYS16
XSopXC0uKlwuc29cLi4qJCcsICdvcGVubGRhcC1iYWNrZW5kLSVzJywgJ09wZW5MREFQICVzIGJh
Y2tlbmQnLCBleHRyYV9kZXBlbmRzPScnLCBhbGxvd19saW5rcz1UcnVlKQoKCW1ldGFwa2cgPSAi
b3BlbmxkYXAtYmFja2VuZHMiCgliYi5kYXRhLnNldFZhcignQUxMT1dfRU1QVFlfJyArIG1ldGFw
a2csICIxIiwgZCkKCWJiLmRhdGEuc2V0VmFyKCdGSUxFU18nICsgbWV0YXBrZywgIiIsIGQpCglt
ZXRhcGtnX3JkZXBlbmRzID0gW10KCXBhY2thZ2VzID0gYmIuZGF0YS5nZXRWYXIoJ1BBQ0tBR0VT
JywgZCwgMSkuc3BsaXQoKQoJZm9yIHBrZyBpbiBwYWNrYWdlc1sxOl06CgkJaWYgcGtnLmNvdW50
KCJvcGVubGRhcC1iYWNrZW5kLSIpIGFuZCBub3QgcGtnIGluIG1ldGFwa2dfcmRlcGVuZHMgYW5k
IG5vdCBwa2cuY291bnQoIi1kZXYiKSBhbmQgbm90IHBrZy5jb3VudCgiLWRiZyIpIGFuZCBub3Qg
cGtnLmNvdW50KCJzdGF0aWMiKSBhbmQgbm90IHBrZy5jb3VudCgibG9jYWxlIik6CgkJCW1ldGFw
a2dfcmRlcGVuZHMuYXBwZW5kKHBrZykKCWJiLmRhdGEuc2V0VmFyKCdSREVQRU5EU18nICsgbWV0
YXBrZywgJyAnLmpvaW4obWV0YXBrZ19yZGVwZW5kcyksIGQpCgliYi5kYXRhLnNldFZhcignREVT
Q1JJUFRJT05fJyArIG1ldGFwa2csICdPcGVuTERBUCBiYWNrZW5kcyBtZXRhIHBhY2thZ2UnLCBk
KQoJcGFja2FnZXMuYXBwZW5kKG1ldGFwa2cpCgliYi5kYXRhLnNldFZhcignUEFDS0FHRVMnLCAn
ICcuam9pbihwYWNrYWdlcyksIGQpCn0K

--001636aa2bda68fd8504942f7eb5
Content-Type: text/x-patch; charset=US-ASCII; name="test-fix.patch"
Content-Disposition: attachment; filename="test-fix.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gg2x23ae1

ZGlmZiAtLWdpdCBhL3JlY2lwZXMvb3BlbmxkYXAvb3BlbmxkYXBfMi40LjIzLmJiCmIvcmVjaXBl
cy9vcGVubGRhcC9vcGVubGRhcF8yLjQuMjMuYmIKaW5kZXggM2FjMTVmNi4uOGFmZDk1MSAxMDA2
NDQKLS0tIGEvcmVjaXBlcy9vcGVubGRhcC9vcGVubGRhcF8yLjQuMjMuYmIKKysrIGIvcmVjaXBl
cy9vcGVubGRhcC9vcGVubGRhcF8yLjQuMjMuYmIKQEAgLTE4OCw3ICsxODgsNyBAQCBERVBFTkRT
ICAgICAgKz0gIiR7T1BFTkxEQVBfREVQRU5EU30iCiBDUFBGTEFHU19hcHBlbmQgPSAiIC1EX0dO
VV9TT1VSQ0UiCgogZG9fY29uZmlndXJlKCkgewotICAgICAgIGNwICR7U1RBR0lOR19EQVRBRElS
fS9saWJ0b29sL2NvbmZpZy9sdG1haW4uc2ggJHtTfS9idWlsZAorICAgICAgIGNwICR7U1RBR0lO
R19FVENESVJfTkFUSVZFfS9saWJ0b29sL2NvbmZpZy9sdG1haW4uc2ggJHtTfS9idWlsZAogICAg
ICAgcm0gLWYgJHtTfS9saWJ0b29sCiAgICAgICBhY2xvY2FsCiAgICAgICBsaWJ0b29saXplIC0t
Zm9yY2UgLS1jb3B5Cg==

--001636aa2bda68fd8504942f7eb5--
