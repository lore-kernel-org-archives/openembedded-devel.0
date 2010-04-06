Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Nz8VY-0007kO-L0
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 15:07:58 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 58B8416601BD; Tue,  6 Apr 2010 07:04:36 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 06A0316604C5;
	Tue,  6 Apr 2010 07:04:35 -0600 (MDT)
Message-ID: <4BBB3162.80907@mlbassoc.com>
Date: Tue, 06 Apr 2010 07:04:34 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: Tom Rini <tom_rini@mentor.com>
References: <4BB35552.9070508@mlbassoc.com>	
	<v2q19c1b8a91003311006zc7a7eff8o9f2a88a1f42b6c1d@mail.gmail.com>	
	<4BB382AA.3040901@mlbassoc.com>
	<1270056997.6277.89.camel@trini-m4400>	
	<4BB75E89.6030708@mlbassoc.com>
	<1270312858.3653.44.camel@trini-m4400>	
	<4BB7795D.6050600@mlbassoc.com>
	<1270336288.3653.45.camel@trini-m4400>
	<4BB7EEE2.9060408@mlbassoc.com>
In-Reply-To: <4BB7EEE2.9060408@mlbassoc.com>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: FireFox on PowerPC
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
X-List-Received-Date: Tue, 06 Apr 2010 13:07:58 -0000
X-Groupsio-MsgNum: 18437
Content-Type: multipart/mixed; boundary="------------020508070104040607000802"

--------------020508070104040607000802
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2010 07:44 PM, Gary Thomas wrote:
> On 04/03/2010 05:11 PM, Tom Rini wrote:
>> On Sat, 2010-04-03 at 11:22 -0600, Gary Thomas wrote:
>>> On 04/03/2010 10:40 AM, Tom Rini wrote:
>>>> On Sat, 2010-04-03 at 09:28 -0600, Gary Thomas wrote:
>>>>
>>>>> That said, this seems to be a [Make] parallelism problem, not clear
>>>>> why/how.
>>>>> If I just rerun 'bitbake firefox' which restarts the compile step,
>>>>> it will
>>>>> run to completion. I do normally use -j4, but disabling this did
>>>>> not seem
>>>>> to make any difference.
>>>>>
>>>>> Note: the previous version I built (3.5.2) did not exhibit this
>>>>> behaviour.
>>>>
>>>> Well that's depressing since we just added the best we can tell correct
>>>> magic to build firefox with make -jN. If you put PARALLEL_MAKE = "" in
>>>> the .bb, does it complete this time?
>>>>
>>>
>>> No change, I'm afraid.
>>
>> Interesting. From log.do_compile, was make -jN taken out? I kinda fear
>> not...
>>
>
> I see only -j1 in the logs
>

I'm not getting anywhere with this.  True, it builds, but only
after a second attempt (the first always fails as reported).

Perhaps you'd like to try?  Just build firefox (3.6.2 is what
I'm using) for a PowerPC target (I use MACHINE=efika, DISTRO="angstrom-2008.1")
You'll need the attached patches to work around some of the va_list bugs.

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--------------020508070104040607000802
Content-Type: text/plain;
 name="0001-Fixes-to-build-on-PowerPC.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-Fixes-to-build-on-PowerPC.patch"

RnJvbSBlZWRjYzk1OGFkODllMTdkNDczN2YzOTQ4OTE5YjU0OTMzNWZkMjBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHYXJ5IFRob21hcyA8Z2FyeUBtbGJhc3NvYy5jb20+CkRhdGU6
IFR1ZSwgNiBBcHIgMjAxMCAwNzowMDo1NyAtMDYwMApTdWJqZWN0OiBbUEFUQ0hdIEZpeGVzIHRv
IGJ1aWxkIG9uIFBvd2VyUEMKCi0tLQogcmVjaXBlcy9tb3ppbGxhL2ZpbGVzL3Bvd2VycGMvanNh
dXRvY2ZnLmggICAgICAgICAgfCAgICAyICsrCiAuLi4vbW96aWxsYS9maXJlZm94LTMuNi4yL3Bv
d2VycGNfdmFfbGlzdC5wYXRjaCAgICB8ICAgMTQgKysrKysrKysrKysrKysKIHJlY2lwZXMvbW96
aWxsYS9maXJlZm94XzMuNi4yLmJiICAgICAgICAgICAgICAgICAgIHwgICAgMSArCiAzIGZpbGVz
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcmVjaXBlcy9tb3ppbGxhL2ZpcmVmb3gtMy42LjIvcG93ZXJwY192YV9saXN0LnBhdGNo
CgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy9tb3ppbGxhL2ZpbGVzL3Bvd2VycGMvanNhdXRvY2ZnLmgg
Yi9yZWNpcGVzL21vemlsbGEvZmlsZXMvcG93ZXJwYy9qc2F1dG9jZmcuaAppbmRleCA0MDhhNWU0
Li5iYzVkYTgwIDEwMDY0NAotLS0gYS9yZWNpcGVzL21vemlsbGEvZmlsZXMvcG93ZXJwYy9qc2F1
dG9jZmcuaAorKysgYi9yZWNpcGVzL21vemlsbGEvZmlsZXMvcG93ZXJwYy9qc2F1dG9jZmcuaApA
QCAtNTEsNCArNTEsNiBAQAogCiAjZGVmaW5lIEpTX0hBVkVfTE9OR19MT05HCiAKKyNkZWZpbmUg
SEFWRV9WQV9MSVNUX0FTX0FSUkFZCisKICNlbmRpZiAvKiBqc19jcHVjZmdfX18gKi8KZGlmZiAt
LWdpdCBhL3JlY2lwZXMvbW96aWxsYS9maXJlZm94LTMuNi4yL3Bvd2VycGNfdmFfbGlzdC5wYXRj
aCBiL3JlY2lwZXMvbW96aWxsYS9maXJlZm94LTMuNi4yL3Bvd2VycGNfdmFfbGlzdC5wYXRjaApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi4yYWU1NmU0Ci0tLSAvZGV2L251bGwK
KysrIGIvcmVjaXBlcy9tb3ppbGxhL2ZpcmVmb3gtMy42LjIvcG93ZXJwY192YV9saXN0LnBhdGNo
CkBAIC0wLDAgKzEsMTQgQEAKKy0tLSBtb3ppbGxhLTEuOS4xLk9SSUcveHBjb20vZ2x1ZS9uc1Rl
eHRGb3JtYXR0ZXIuY3BwCTIwMDktMDctMzAgMDk6MzA6MzUuMDAwMDAwMDAwIC0wNjAwCisrKysg
bW96aWxsYS0xLjkuMS94cGNvbS9nbHVlL25zVGV4dEZvcm1hdHRlci5jcHAJMjAxMC0wMy0yNCAx
NTo0ODoyNC4wMDAwMDAwMDAgLTA2MDAKK0BAIC03MCw3ICs3MCwxMCBAQAorICoqIE5vdGU6IG9u
IHNvbWUgcGxhdGZvcm1zIHZhX2xpc3QgaXMgZGVmaW5lZCBhcyBhbiBhcnJheSwKKyAqKiBhbmQg
cmVxdWlyZXMgYXJyYXkgbm90YXRpb24uCisgKi8KKy0KKysjaWYgZGVmaW5lZChfX3Bvd2VycGNf
XykKKysjZGVmaW5lIEhBVkVfVkFfTElTVF9BU19BUlJBWQorKyNlbmRpZgorKworICNpZmRlZiBI
QVZFX1ZBX0NPUFkKKyAjZGVmaW5lIFZBUkFSR1NfQVNTSUdOKGZvbywgYmFyKSAgICAgICAgVkFf
Q09QWShmb28sYmFyKQorICNlbGlmIGRlZmluZWQoSEFWRV9WQV9MSVNUX0FTX0FSUkFZKQpkaWZm
IC0tZ2l0IGEvcmVjaXBlcy9tb3ppbGxhL2ZpcmVmb3hfMy42LjIuYmIgYi9yZWNpcGVzL21vemls
bGEvZmlyZWZveF8zLjYuMi5iYgppbmRleCAxYzk3NWUwLi42MDRhYjgyIDEwMDY0NAotLS0gYS9y
ZWNpcGVzL21vemlsbGEvZmlyZWZveF8zLjYuMi5iYgorKysgYi9yZWNpcGVzL21vemlsbGEvZmly
ZWZveF8zLjYuMi5iYgpAQCAtMTQsNiArMTQsNyBAQCBTUkNfVVJJID0gImZ0cDovL2Z0cC5tb3pp
bGxhLm9yZy9wdWIvbW96aWxsYS5vcmcvZmlyZWZveC9yZWxlYXNlcy8ke1BWfS9zb3VyY2UvZgog
CWZpbGU6Ly9maXJlZm94LXBsdWdpbi5wYyBcCiAJZmlsZTovL2ZpcmVmb3gteHBjb20ucGMgXAog
CWZpbGU6Ly9uc3ByLnBjIFwKKyAgICAgICAgZmlsZTovL3Bvd2VycGNfdmFfbGlzdC5wYXRjaDtw
YXRjaD0xIFwKICIKIAogU1JDX1VSSVthcmNoaXZlLm1kNXN1bV0gPSAiYTE5NzJhMjIxNmFjNzEz
OWI5MmI3Mzc4YTMyOGVjOTMiCi0tIAoxLjYuMi41Cgo=

--------------020508070104040607000802--
