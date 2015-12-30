Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE3C6067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 19:38:11 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id to4so184835998igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 11:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=KBPkxA4PifLFHj50a0ed4RAZ6n6oRjn3bffmBl6HIJU=;
	b=XqXhZPPZ7QpmtbHUsvZEV53PbHwbeGWsrzfNVeQ5dnGLkOo8ddTzQVFQXeXLw9Y0+p
	ILNnOgHbK20uV7wfVBRmzqZsHL3pBgVOGk8OACsifUZQgg+P6qPNLjvjdamGjRSggyVk
	WZsTc83v9Ji50Qi4cnNBweIzY/pMVLZC7gBd2w9xcP1gYUTMMYeg9HxGYmtaTELOSnfw
	Yiz3Ts90B8Z0QAcDrqIv+JF4SGRrAYpSrLNiFF1vy+L+ja/QOS0HoVSVGJLT3XKnEC7F
	q1JnUApnhYbYE8bkB3C6N39bcbxDRyHOLygLbg0g78xA9n4QNjIIElbb8FMXeLZKHVuX
	5lWA==
X-Received: by 10.50.150.5 with SMTP id ue5mr51140198igb.50.1451504292735;
	Wed, 30 Dec 2015 11:38:12 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	o80sm7624190ioe.15.2015.12.30.11.38.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Dec 2015 11:38:12 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <56837748.6020903@gmail.com>
	<CAMKF1spcVXiHxyPnTg=nYUOM_2yc2vU6x+VwG6unWH3wdNKeag@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <5684329F.3090206@gmail.com>
Date: Wed, 30 Dec 2015 14:38:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spcVXiHxyPnTg=nYUOM_2yc2vU6x+VwG6unWH3wdNKeag@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: chromium 40.0.2214.91 doesn't like gcc5.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Dec 2015 19:38:12 -0000
X-Groupsio-MsgNum: 59240
Content-Type: multipart/mixed; boundary="------------030700080908000706060102"

--------------030700080908000706060102
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Khem,

On 12/30/15 13:04, Khem Raj wrote:
> can you backport and report back
>
> https://chromium.googlesource.com/v8/v8/+/e28183b5977a2d2732f7f8b9a2f26637c9566585%5E%21/#F0

That diff includes 4 patches:
    Index: src/bignum.cc
    Index: src/compiler/ia32/code-generator-ia32.cc
    Index: src/compiler/x64/code-generator-x64.cc
    Index: test/cctest/compiler/test-js-typed-lowering.cc

All of these patches only apply to the code in the "v8" folder.

The 4th one doesn't apply because I can't find a
"test-js-typed-lowering.cc" file anywhere in our version 40 sources.

Although the files "v8/src/compiler/ia32/code-generator-ia32.cc" and
"v8/src/compiler/x64/code-generator-x64.cc" exist, these two patches
don't apply since the code in those files doesn't look anything like
what these patches are trying to patch.

The first patch does apply, with the file path change (add v8 to the
front), and a 2 line offset.

For some reason this bignum.cc source is found in both v8/src and
third_party/WebKit/Source/wtf/dtoa and, apart from some extra namespace
scope, is very similar (if not the same). So I added a second patch to
this diff to also correctly patch the code in third_party/... .

Replacing Max's solution for this one does cause this one file to
compile fine, but other -Werror=strict-overflow problems are simply
found later (see attached).

Combining both Max's patch and this one causes this part of the build to
succeed, but still causes the -Werror=uninitialized problem to happen as
I reported earlier:

|
../../third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cpp:234:8:
error: '<anonymous>.blink::TimelineThreadState::inKnownLayerTask' is
used uninitialized in this function [-Werror=uninitialized]

Best regards,
    Trevor

--------------030700080908000706060102
Content-Type: text/plain; charset=UTF-8;
 name="strict-overflow.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="strict-overflow.txt"

fCBGQUlMRUQ6IHg4Nl82NC1mb3J0cmVzcy1saW51eC1nKysgIC1tNjQgLW1hcmNoPWNvcmVpNyAt
bXR1bmU9Y29yZWk3IC1tZnBtYXRoPXNzZSAtbXNzZTQuMiAtLXN5c3Jvb3Q9L3ovbGF5ZXJpbmRl
eC1tYXN0ZXIvbWlubm93bWF4L3RtcC9zeXNyb290cy9pbnRlbC1jb3JlaTctNjQgLU1NRCAtTUYg
b2JqL3RoaXJkX3BhcnR5L1dlYktpdC9Tb3VyY2Uvd3RmL2R0b2Evd3RmLmJpZ251bS5vLmQgLURW
OF9ERVBSRUNBVElPTl9XQVJOSU5HUyAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1ERElTQUJMRV9O
QUNMIC1EQ0hST01JVU1fQlVJTEQgLURUT09MS0lUX1ZJRVdTPTEgLURVSV9DT01QT1NJVE9SX0lN
QUdFX1RSQU5TUE9SVCAtRFVTRV9BVVJBPTEgLURVU0VfQVNIPTEgLURVU0VfUEFOR089MSAtRFVT
RV9DQUlSTz0xIC1EVVNFX0RFRkFVTFRfUkVOREVSX1RIRU1FPTEgLURVU0VfTElCSlBFR19UVVJC
Tz0xIC1EVVNFX1gxMT0xIC1EVVNFX0NMSVBCT0FSRF9BVVJBWDExPTEgLURFTkFCTEVfT05FX0NM
SUNLX1NJR05JTiAtREVOQUJMRV9QUkVfU1lOQ19CQUNLVVAgLURVU0VfWEkyX01UPTIgLURFTkFC
TEVfUkVNT1RJTkc9MSAtREVOQUJMRV9XRUJSVEM9MSAtREVOQUJMRV9QRVBQRVJfQ0RNUyAtREVO
QUJMRV9DT05GSUdVUkFUSU9OX1BPTElDWSAtREVOQUJMRV9OT1RJRklDQVRJT05TIC1EVVNFX1VE
RVYgLURET05UX0VNQkVEX0JVSUxEX01FVEFEQVRBIC1ERU5BQkxFX1RBU0tfTUFOQUdFUj0xIC1E
RU5BQkxFX0VYVEVOU0lPTlM9MSAtREVOQUJMRV9QTFVHSU5TPTEgLURFTkFCTEVfU0VTU0lPTl9T
RVJWSUNFPTEgLURFTkFCTEVfVEhFTUVTPTEgLURFTkFCTEVfQVVUT0ZJTExfRElBTE9HPTEgLURF
TkFCTEVfQkFDS0dST1VORD0xIC1ERU5BQkxFX0dPT0dMRV9OT1c9MSAtRENMRF9WRVJTSU9OPTIg
LURDTEQyX0RBVEFfU09VUkNFPXN0YXRpYyAtREVOQUJMRV9QUklOVElORz0xIC1ERU5BQkxFX0JB
U0lDX1BSSU5USU5HPTEgLURFTkFCTEVfUFJJTlRfUFJFVklFVz0xIC1ERU5BQkxFX1NQRUxMQ0hF
Q0s9MSAtREVOQUJMRV9DQVBUSVZFX1BPUlRBTF9ERVRFQ1RJT049MSAtREVOQUJMRV9BUFBfTElT
VD0xIC1ERU5BQkxFX1NFVFRJTkdTX0FQUD0xIC1ERU5BQkxFX01BTkFHRURfVVNFUlM9MSAtREVO
QUJMRV9NRE5TPTEgLURFTkFCTEVfU0VSVklDRV9ESVNDT1ZFUlk9MSAtREVOQUJMRV9MT0FEX0NP
TVBMRVRJT05fSEFDS1M9MSAtRFdURl9JTVBMRU1FTlRBVElPTj0xIC1ERU5BQkxFX09QRU5UWVBF
X1ZFUlRJQ0FMPTEgLURFTkFCTEVfTEFZT1VUX1VOSVRfSU5fSU5MSU5FX0JPWEVTPTAgLURXVEZf
VVNFX0NPTkNBVEVOQVRFRF9JTVBVTFNFX1JFU1BPTlNFUz0xIC1ERU5BQkxFX0lOUFVUX01VTFRJ
UExFX0ZJRUxEU19VST0xIC1ERU5BQkxFX1dFQl9BVURJTz0xIC1EV1RGX1VTRV9XRUJBVURJT19G
Rk1QRUc9MSAtRFdURl9VU0VfREVGQVVMVF9SRU5ERVJfVEhFTUU9MSAtRFVfVVNJTkdfSUNVX05B
TUVTUEFDRT0wIC1EVV9FTkFCTEVfRFlMT0FEPTAgLURVX1NUQVRJQ19JTVBMRU1FTlRBVElPTiAt
RFVTRV9MSUJQQ0k9MSAtRFVTRV9HTElCPTEgLURVU0VfTlNTPTEgLURfX1NURENfQ09OU1RBTlRf
TUFDUk9TIC1EX19TVERDX0ZPUk1BVF9NQUNST1MgLUROREVCVUcgLUROVkFMR1JJTkQgLUREWU5B
TUlDX0FOTk9UQVRJT05TX0VOQUJMRUQ9MCAtRF9GT1JUSUZZX1NPVVJDRT0yIC1JZ2VuIC1JLi4v
Li4vdGhpcmRfcGFydHkvV2ViS2l0L1NvdXJjZSAtSS4uLy4uL3RoaXJkX3BhcnR5L1dlYktpdCAt
SS4uLy4uL3RoaXJkX3BhcnR5L2ljdS9zb3VyY2UvaTE4biAtSS4uLy4uL3RoaXJkX3BhcnR5L2lj
dS9zb3VyY2UvY29tbW9uIC1mc3RhY2stcHJvdGVjdG9yIC0tcGFyYW09c3NwLWJ1ZmZlci1zaXpl
PTQgLVdlcnJvciAtcHRocmVhZCAtZm5vLXN0cmljdC1hbGlhc2luZyAtV2FsbCAtV25vLXVudXNl
ZC1wYXJhbWV0ZXIgLVduby1taXNzaW5nLWZpZWxkLWluaXRpYWxpemVycyAtZnZpc2liaWxpdHk9
aGlkZGVuIC1waXBlIC1mUElDIC1CL3ovbGF5ZXJpbmRleC1tYXN0ZXIvbWlubm93bWF4L3RtcC93
b3JrL2NvcmVpNy02NC1mb3J0cmVzcy1saW51eC9jaHJvbWl1bS80MC4wLjIyMTQuOTEtcjAvY2hy
b21pdW0tNDAuMC4yMjE0LjkxL3RoaXJkX3BhcnR5L2JpbnV0aWxzL0xpbnV4X3g2NC9SZWxlYXNl
L2JpbiAtV25vLXVudXNlZC1sb2NhbC10eXBlZGVmcyAtbTY0IC1tYXJjaD14ODYtNjQgLU8yIC1m
bm8taWRlbnQgLWZkYXRhLXNlY3Rpb25zIC1mZnVuY3Rpb24tc2VjdGlvbnMgLWZ1bndpbmQtdGFi
bGVzIC1Xbm8tZXJyb3I9dW51c2VkLWxvY2FsLXR5cGVkZWZzIC1PMiAtcGlwZSAtZyAtZmVsaW1p
bmF0ZS11bnVzZWQtZGVidWctdHlwZXMgLWZ2aXNpYmlsaXR5LWlubGluZXMtaGlkZGVuIC1Xbm8t
YysrMHgtY29tcGF0IC1mbm8tZXhjZXB0aW9ucyAtZm5vLXJ0dGkgLWZuby10aHJlYWRzYWZlLXN0
YXRpY3MgLWZ2aXNpYmlsaXR5LWlubGluZXMtaGlkZGVuIC1Xc2lnbi1jb21wYXJlIC1Xbm8tYysr
MHgtY29tcGF0IC1zdGQ9Z251KysxMSAtV25vLW5hcnJvd2luZyAtV25vLWxpdGVyYWwtc3VmZml4
ICAtYyAuLi8uLi90aGlyZF9wYXJ0eS9XZWJLaXQvU291cmNlL3d0Zi9kdG9hL2JpZ251bS5jYyAt
byBvYmovdGhpcmRfcGFydHkvV2ViS2l0L1NvdXJjZS93dGYvZHRvYS93dGYuYmlnbnVtLm8KfCAu
Li8uLi90aGlyZF9wYXJ0eS9XZWJLaXQvU291cmNlL3d0Zi9kdG9hL2JpZ251bS5jYzogSW4gbWVt
YmVyIGZ1bmN0aW9uICd2b2lkIFdURjo6ZG91YmxlX2NvbnZlcnNpb246OkJpZ251bTo6QWxpZ24o
Y29uc3QgV1RGOjpkb3VibGVfY29udmVyc2lvbjo6QmlnbnVtJiknOgp8IC4uLy4uL3RoaXJkX3Bh
cnR5L1dlYktpdC9Tb3VyY2Uvd3RmL2R0b2EvYmlnbnVtLmNjOjcxNzozMTogZXJyb3I6IGFzc3Vt
aW5nIHNpZ25lZCBvdmVyZmxvdyBkb2VzIG5vdCBvY2N1ciB3aGVuIHNpbXBsaWZ5aW5nIGNvbmRp
dGlvbmFsIHRvIGNvbnN0YW50IFstV2Vycm9yPXN0cmljdC1vdmVyZmxvd10KfCAgICAgICAgICAg
ICAgZm9yIChpbnQgaSA9IDA7IGkgPCB6ZXJvX2RpZ2l0czsgKytpKSB7CnwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF4KfCAuLi8uLi90aGlyZF9wYXJ0eS9XZWJLaXQvU291cmNlL3d0
Zi9kdG9hL2JpZ251bS5jYzo3MTc6MzE6IGVycm9yOiBhc3N1bWluZyBzaWduZWQgb3ZlcmZsb3cg
ZG9lcyBub3Qgb2NjdXIgd2hlbiBzaW1wbGlmeWluZyBjb25kaXRpb25hbCB0byBjb25zdGFudCBb
LVdlcnJvcj1zdHJpY3Qtb3ZlcmZsb3ddCg==

--------------030700080908000706060102--
