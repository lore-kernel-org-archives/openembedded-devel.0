Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <ilya.yanok@gmail.com>) id 1J8mhr-0004ic-Ks
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Dec 2007 02:11:12 +0100
Received: by wa-out-1112.google.com with SMTP id l24so6906040waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Dec 2007 17:05:08 -0800 (PST)
Received: by 10.142.225.11 with SMTP id x11mr3398506wfg.141.1198976707528;
	Sat, 29 Dec 2007 17:05:07 -0800 (PST)
Received: by 10.143.40.7 with HTTP; Sat, 29 Dec 2007 17:05:06 -0800 (PST)
Message-ID: <9ba889b00712291705w4121cbf5h104be237385ad0c4@mail.gmail.com>
Date: Sun, 30 Dec 2007 04:05:06 +0300
From: "Ilya Yanok" <ilya.yanok@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	"=?ISO-8859-1?Q?Robert_W=F6rle?=" <robert@linuxdevelopment.de>
In-Reply-To: <47714E22.3030502@linuxdevelopment.de>
MIME-Version: 1.0
References: <9ba889b00712231913y6e07f05ci23cb36444c325a40@mail.gmail.com>
	<476F6461.3070105@linuxdevelopment.de>
	<9ba889b00712240344w76b8b5abha78ef8376930be9c@mail.gmail.com>
	<47714E22.3030502@linuxdevelopment.de>
Subject: Re: [RFC] AVR32 stuff
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
X-List-Received-Date: Sun, 30 Dec 2007 01:11:12 -0000
X-Groupsio-MsgNum: 3767
Content-Type: multipart/mixed; 
	boundary="----=_Part_22961_18807630.1198976706561"

------=_Part_22961_18807630.1198976706561
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Robert,

2007/12/25, Robert W=F6rle <robert@linuxdevelopment.de>:
> Are you on irc ? am there at #oe at irc.freenode.com most of the time.
> you will find me by searching for
> rob_w
Yes. I'm there but not always. My nick is yanok.

> Would you like to send me local.conf ? and did you do any chances to oe
local.conf is pretty simple:
MACHINE =3D "at32stk1000"
DISTRO =3D "oavr32-uclibc"
BUILD_ARCH =3D "i686"
PREFERRED_VERSION_linux =3D "2.6.23"
DEBUG_OPTIMIZATION =3D "-O0 -g"

Ok, I defined my own distro oavr32-uclibc (actually a pair
oavr32/oavr32-uclibc but former is unusable as there is no glibc on
avr32 AFAIK) based on generic/generic-uclibc distros. Changes are
mainly toolchain components preferred versions. I've attached these
files.

PREFERRED_VERSION_linux =3D "2.6.23" is just hack to get some kernel
compile as for now I prefer to compile the kernel outside oe. In the
right case we should provide new kernel recipe (something like
linux-avr32) and choose it via PREFERRED_PROVIDER_virtual/kernel =3D
"linux-avr32" from machine configuration.

> to build cleanly ?
Actually a lot of.

> The segfault will be easy to debug. Did you use the basic minimal image ?
Yes, the one created by bitbake minimal-image

> Did you also boot the kernel from the minimal image or are you using the
> atmel kernel.
As I said before I compile the kernel by hand but ...

> A segfault right at the init stage many times is due to a differend libc
> used of the kernel and the init process ( in our case busybox )
I believe kernel don't use libc at all. It may be incompatibility in
compilers ABIs but I tried to recompile the kernel with compiler built
by oe and get the same result (I don't get many segfaults really,
there is only one and then system hangs).

With best regards,
                           Ilya.

------=_Part_22961_18807630.1198976706561
Content-Type: application/octet-stream; name=oavr32.conf
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fasvq5z4
Content-Disposition: attachment; filename=oavr32.conf

Iy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiNAVFlQRTogRGlzdHJpYnV0aW9uCiNATkFNRTogR2VuZXJp
YwojQERFU0NSSVBUSU9OOiBHZW5lcmljIEVtYmVkZGVkIExpbnV4IERpc3RyaWJ1dGlvbiBDb25m
aWd1cmF0aW9uCiMKI0BDT01NRU5UOiBUaGlzIGRpc3RyaWJ1dGlvbiBjb25maWd1cmF0aW9uIHNl
cnZlcyBhcyBhIHN0YXJ0aW5nIHBvaW50IGZvcgojQENPTU1FTlQ6IHRoZSBpbnRlZ3JhdGlvbiBv
ZiBuZXcgdGFyZ2V0IHBsYXRmb3JtcywgbWFjaGluZXMsIG9yIGRpc3RyaWJ1dGlvbnMuCiNAQ09N
TUVOVDogSXQgYmFzZXMgb24gY29uc2VydmF0aXZlIHNldHRpbmdzIGFuZCBzaG91bGQgYWx3YXlz
IGJlIGJ1aWxkYWJsZS4KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgojCiMgSGVhZGVyCiMKRElTVFJP
X05BTUUgPSAiT3BlbkFWUjMyLWdsaWJjIgpESVNUUk9fVkVSU0lPTiA9ICIuZGV2LXNuYXBzaG90
LSR7U1JDREFURX0iCiNESVNUUk9fVFlQRSA9ICJyZWxlYXNlIgpESVNUUk9fVFlQRSA9ICJkZWJ1
ZyIKCiMKIyBOYW1pbmcgc2NoZW1lcwojCklOSEVSSVQgKz0gImRlYmlhbiBtdWx0aW1hY2hpbmUi
CgojCiMgUGFja2FnaW5nIGFuZCBvdXRwdXQgZm9ybWF0CiMKSU5IRVJJVCArPSAicGFja2FnZV9p
cGsiCklNQUdFX0ZTVFlQRVMgPz0gInRhci5neiBleHQyLmd6IGpmZnMyIgoKIwojIEtlcm5lbAoj
CktFUk5FTCA9ICJrZXJuZWwyNiIKTUFDSElORV9LRVJORUxfVkVSU0lPTiA9ICIyLjYiCgojCiMg
QmludXRpbHMgJiBDb21waWxlcgojClBSRUZFUlJFRF9QUk9WSURFUlMgKz0gIiB2aXJ0dWFsLyR7
VEFSR0VUX1BSRUZJWH1nY2MtaW5pdGlhbDpnY2MtY3Jvc3MtaW5pdGlhbCIKUFJFRkVSUkVEX1BS
T1ZJREVSUyArPSAiIHZpcnR1YWwvJHtUQVJHRVRfUFJFRklYfWdjYzpnY2MtY3Jvc3MiClBSRUZF
UlJFRF9QUk9WSURFUlMgKz0gIiB2aXJ0dWFsLyR7VEFSR0VUX1BSRUZJWH1nKys6Z2NjLWNyb3Nz
IgoKUFJFRkVSUkVEX1ZFUlNJT05fZ2NjID89ICI0LjIuMSIKUFJFRkVSUkVEX1ZFUlNJT05fZ2Nj
LWNyb3NzID89ICI0LjIuMSIKUFJFRkVSUkVEX1ZFUlNJT05fZ2NjLWNyb3NzLWluaXRpYWwgPz0g
IjQuMi4xIgpQUkVGRVJSRURfVkVSU0lPTl9iaW51dGlscyA/PSAiMi4xNyIKUFJFRkVSUkVEX1ZF
UlNJT05fYmludXRpbHMtY3Jvc3MgPz0gIjIuMTciClBSRUZFUlJFRF9QUk9WSURFUl92aXJ0dWFs
LyR7VEFSR0VUX1BSRUZJWH1iaW51dGlscyA9ICJiaW51dGlscy1jcm9zcyIKCiMKIyBUYXJnZXQg
T1MgJiBGUFUgc3lzdGVtCiMgClRBUkdFVF9PUyA9ICJsaW51eCIKVEFSR0VUX0ZQVV9hcm0gPSAi
c29mdCIKVEFSR0VUX0ZQVV9hcm1lYiA9ICJzb2Z0IgoKUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1
YWwvbGliaWNvbnYgPSAiZ2xpYmMiClBSRUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsL2xpYmludGwg
PSAiZ2xpYmMiClBSRUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsL2xpYmMgPSAiZ2xpYmMiClBSRUZF
UlJFRF9QUk9WSURFUl92aXJ0dWFsLyR7VEFSR0VUX1BSRUZJWH1saWJjLWZvci1nY2MgPSAiZ2xp
YmMtaW50ZXJtZWRpYXRlIgpQUkVGRVJSRURfVkVSU0lPTl9saW51eC1saWJjLWhlYWRlcnMgPz0g
IjIuNi4yMyIKUFJFRkVSUkVEX1ZFUlNJT05fZ2xpYmMgPz0gIjIuNSIKUFJFRkVSUkVEX1ZFUlNJ
T05fZ2xpYmMtaW50ZXJtZWRpYXRlID89ICIyLjUiCgojCiMgQm9vdHN0cmFwICYgSW5pdAojClBS
RUZFUlJFRF9QUk9WSURFUl90YXNrLWJvb3RzdHJhcCA9ICJ0YXNrLWJvb3RzdHJhcCIKcmVxdWly
ZSBjb25mL2Rpc3Ryby9pbmNsdWRlL3NhbmUtc3JjZGF0ZXMuaW5jCnJlcXVpcmUgY29uZi9kaXN0
cm8vaW5jbHVkZS9zYW5lLXNyY3JldnMuaW5jCgojCiMgRnJhbWVidWZmZXIgJiBYCiMKUFJFRkVS
UkVEX1BST1ZJREVSX3ZpcnR1YWwvbGlieDExID89ICJkaWV0LXgxMSIKUFJFRkVSUkVEX1BST1ZJ
REVSX3RzbGliID89ICJ0c2xpYiIKcmVxdWlyZSBjb25mL2Rpc3Ryby9pbmNsdWRlL3ByZWZlcnJl
ZC14b3JnLXZlcnNpb25zLVgxMVI3LjIuaW5jCgojCiMgR1BFCiMKcmVxdWlyZSBjb25mL2Rpc3Ry
by9pbmNsdWRlL3ByZWZlcnJlZC1ncGUtdmVyc2lvbnMtMi44LmluYwoKIwojIE9waWUKIwpRVEVf
VkVSU0lPTiA9ICIyLjMuMTAiClBBTE1UT1BfVVNFX01VTFRJVEhSRUFERURfUVRFID0gInllcyIK
cmVxdWlyZSBjb25mL2Rpc3Ryby9pbmNsdWRlL3ByZWZlcnJlZC1vcGllLXZlcnNpb25zLmluYwoK
IwojIEVubGlnaHRlbm1lbnQKIwpyZXF1aXJlIGNvbmYvZGlzdHJvL2luY2x1ZGUvcHJlZmVycmVk
LWUtdmVyc2lvbnMuaW5jCg==

------=_Part_22961_18807630.1198976706561
Content-Type: application/octet-stream; name=oavr32-uclibc.conf
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fasvr5dx
Content-Disposition: attachment; filename=oavr32-uclibc.conf

Iy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiNAVFlQRTogRGlzdHJpYnV0aW9uCiNATkFNRTogR2VuZXJp
YyB1Q2xpYkMKI0BERVNDUklQVElPTjogR2VuZXJpYyB1Q2xpYkMgRW1iZWRkZWQgTGludXggRGlz
dHJpYnV0aW9uIENvbmZpZ3VyYXRpb24KIwojQENPTU1FTlQ6IFRoaXMgZGlzdHJpYnV0aW9uIGNv
bmZpZ3VyYXRpb24gc2VydmVzIGFzIGEgc3RhcnRpbmcgcG9pbnQgZm9yCiNAQ09NTUVOVDogdGhl
IGludGVncmF0aW9uIG9mIG5ldyB0YXJnZXQgcGxhdGZvcm1zLCBtYWNoaW5lcywgb3IgZGlzdHJp
YnV0aW9ucy4KI0BDT01NRU5UOiBJdCBiYXNlcyBvbiBjb25zZXJ2YXRpdmUgc2V0dGluZ3MgYW5k
IHNob3VsZCBhbHdheXMgYmUgYnVpbGRhYmxlLgojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCnJlcXVp
cmUgY29uZi9kaXN0cm8vb2F2cjMyLmNvbmYKCiMKIyBIZWFkZXIKIwpESVNUUk9fTkFNRSA9ICJP
cGVuQVZSMzItdUNsaWJDIgoKIwojIFRhcmdldCBPUyAmIEZQVSBzeXN0ZW0KIwpUQVJHRVRfT1Mg
PSAibGludXgtdWNsaWJjIgpQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9saWJpY29udiA9ICJs
aWJpY29udiIKUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvbGliaW50bCA9ICJnZXR0ZXh0IgpQ
UkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9saWJjID0gInVjbGliYyIKUFJFRkVSUkVEX1BST1ZJ
REVSX3ZpcnR1YWwvJHtUQVJHRVRfUFJFRklYfS1saWJjLWZvci1nY2MgPSAidWNsaWJjIgpQUkVG
RVJSRURfUFJPVklERVJfdmlydHVhbC8ke1RBUkdFVF9BUkNIfS0ke1RBUkdFVF9PU30tbGliYy1m
b3ItZ2NjID0gInVjbGliYyIKClBSRUZFUlJFRF9WRVJTSU9OX3VjbGliYyA/PSAiMC45LjI5Igo=

------=_Part_22961_18807630.1198976706561--
