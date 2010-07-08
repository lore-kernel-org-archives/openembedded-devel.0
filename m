Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OXAsx-00065I-Vz
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 12:32:48 +0200
Received: by iwn34 with SMTP id 34so2031348iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 03:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type;
	bh=VkKNs4xQfWtJawvB8RcZxgO/LvL3ikpxwPub0ioownI=;
	b=w4mRAZAWJdQ7WBdzAlWo9x9i9yw7gas10HeycxiD8QYYV6sauaMXGQIEou90Z28gsj
	97JbjtNQ4hDrJmQ8unbhQWxOjVBgktlqhKvcTUHc4xwjVflVWYWt76JvbTHQUW5E/eMx
	UOQpntfDzfc/nehPPOvWIt5ayv6yOsXZbr1FI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=b7yraNxQ+IgZ2ROi4H0CuSzeisu5AGXKON2VqNu1TS8FcbuHXDqGNDL/8oLD+V/6XX
	gip8/8v74haaL0hvuOKiwxbsuJKDQgu7qvIZawlyuUp1LHHzcyzmk/9NpqaUjfJ/Thp9
	OP45HI304huEdoaa1VWYxBL4XAYYI/GJzT+Uk=
Received: by 10.231.32.132 with SMTP id c4mr8970949ibd.84.1278629748357; Thu, 
	08 Jul 2010 15:55:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 8 Jul 2010 15:55:28 -0700 (PDT)
In-Reply-To: <20100708221633.GE23169@mx.loc>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com> 
	<1278444743-4924-4-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTimnWBxCFMLlns8Q8LJ-3BvpWqqTNkqZ8ZlWbQdo@mail.gmail.com> 
	<1278622050.15825.18.camel@lenovo.internal.reciva.com>
	<AANLkTinf_zr9QQdPJyevN-ve62_Pqi3WDNygAgABPt32@mail.gmail.com> 
	<1278624574.15825.30.camel@lenovo.internal.reciva.com>
	<AANLkTikn4ygx6v-P4WvZWHvxD9rQAq5kyDuMdolDPbdn@mail.gmail.com> 
	<1278624869.15825.35.camel@lenovo.internal.reciva.com>
	<AANLkTikuNN4qw76uAXxlmIhIlOJVTxjRD8vN7lg7kRyf@mail.gmail.com> 
	<20100708221633.GE23169@mx.loc>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jul 2010 15:55:28 -0700
Message-ID: <AANLkTilg2lk8YMpOSAOZrQ7cqaxvOFRpnuFhSv840yzq@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][v3 3/4] uClibc: redo configuration
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
X-List-Received-Date: Fri, 09 Jul 2010 10:32:49 -0000
X-Groupsio-MsgNum: 20839
Content-Type: multipart/mixed; boundary=0022152d83f5f339cc048ae82f4c

--0022152d83f5f339cc048ae82f4c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 8, 2010 at 3:16 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On Thu, Jul 08, 2010 at 03:03:04PM -0700, Khem Raj wrote:
>>On Thu, Jul 8, 2010 at 2:34 PM, Phil Blundell <philb@gnu.org> wrote:
>>> On Thu, 2010-07-08 at 14:31 -0700, Khem Raj wrote:
>>>> On Thu, Jul 8, 2010 at 2:29 PM, Phil Blundell <philb@gnu.org> wrote:
>>>> > On Thu, 2010-07-08 at 14:03 -0700, Khem Raj wrote:
>>>> >> If I am not wrong you can still do interworking and not have bx (us=
ing
>>>> >> mov pc,lr)
>>>> >
>>>> > That's not an interworking instruction in ARMv4T, and I don't think =
it
>>>> > is in ARMv5TE either. =A0You might be thinking of pop {pc}, which is
>>>> > interworking in ARMv5TE, but even this is not interworking in v4t.
>>>>
>>>> tst lr, #1
>>>> moveq pc, lr
>>>> bx lr
>>>>
>>>> Thats how its done on armv4 for EABI
>>>
>>> Right, but the MOV in that case is not an interworking instruction; it'=
s
>>> just a way to avoid executing BX when you don't actually need to switch
>>> mode, so that you can create a library which still works in an ARM-only
>>> environment.
>>>
>>> The final BX in that sequence is mandatory in order for it to actually
>>> function as an interworking return.
>>
>>right you are. yes bx is always needed for thumb interworking. So I guess
>>for uclibc we can rely on THUMB_INTERWORK distro feature if set correctly=
.
>
> AFAIR eabi implies thumb, thumb makes interwork possible, interwork
> imples bx but my memory could fail me on this.

eabi does not imply thumb. EABI is supported on armv4 which does not have
thumb.

>
> Can you, khem, think of a set of "thumb" and "interwork" (and
> potentially "bx" for HW that supports it, like IIRC all e.g. cortex
> onward based designs) in DISTRO_FEATURES and MACHINE_FEATURES that can
> be used generically?
>
> A first step would be to just resuse the infrastructure in this thread,
> later on we could think about some sort of combined_feature mechanism to
> properly setup arm ontop of this proposed infrastructure.

I think we need thumb_interwork distro_feature which we could use here
here is a patch that distros would need.




>
> cheers,
>

--0022152d83f5f339cc048ae82f4c
Content-Type: application/octet-stream; name=diff
Content-Disposition: attachment; filename=diff
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gbe73piw1

ZGlmZiAtLWdpdCBhL2NvbmYvZGlzdHJvL2luY2x1ZGUvc2FuZS10b29sY2hhaW4uaW5jIGIvY29u
Zi9kaXN0cm8vaW5jbHVkZS9zYW5lLXRvb2xjaGFpbi5pbmMKaW5kZXggNmI2YjE3MC4uNzg1OTFl
MiAxMDA2NDQKLS0tIGEvY29uZi9kaXN0cm8vaW5jbHVkZS9zYW5lLXRvb2xjaGFpbi5pbmMKKysr
IGIvY29uZi9kaXN0cm8vaW5jbHVkZS9zYW5lLXRvb2xjaGFpbi5pbmMKQEAgLTg2LDcgKzg2LDEz
IEBAIEFSTV9JTlNUUlVDVElPTl9TRVQgPSAiJHtQUkVGRVJSRURfQVJNX0lOU1RSVUNUSU9OX1NF
VH0iCiAjICAgIGJ1dCByZXF1aXJlcyBtb3JlIGluc3RydWN0aW9ucyAoMTQwJSBmb3IgNzAlIHNt
YWxsZXIgY29kZSkgc28gbWF5IGJlCiAjICAgIHNsb3dlci4KIAotVEhVTUJfSU5URVJXT1JLID0g
InllcyIKKyMgYXJtdjQgZG9lcyBub3QgaGF2ZSB0aHVtYiBpbnN0cnVjdGlvbiBzZXQgdGhlcmVm
b3JlIG5vIGludGVyd29ya2luZyBpbnN0cnVjdGlvbnMKKyMgc28gaWYgbWFjaGluZSBpcyBiYXNl
ZCBvbiBhcm12NCB3ZSBkb250IGhhdmUgY2hvaWNlLgorCitUSFVNQl9JTlRFUldPUktfYXJtdjQg
PSAibm8iCisKK1RIVU1CX0lOVEVSV09SSyA/PSAieWVzIgorCiAjICJ5ZXMiICJubyIKICMgICAg
V2hldGhlciB0byBjb21waWxlIHdpdGggY29kZSB0byBhbGxvdyBpbnRlcndvcmtpbmcgYmV0d2Vl
biB0aGUgdHdvCiAjICAgIGluc3RydWN0aW9uIHNldHMuICBUaGlzIGFsbG93cyB0aHVtYiBjb2Rl
IHRvIGJlIGV4ZWN1dGVkIG9uIGEgcHJpbWFyaWx5CmRpZmYgLS1naXQgYS9jb25mL2Rpc3Ryby9t
aW5pbWFsLXVjbGliYy5jb25mIGIvY29uZi9kaXN0cm8vbWluaW1hbC11Y2xpYmMuY29uZgppbmRl
eCA0NDgwNWNmLi4zNWM3N2M4IDEwMDY0NAotLS0gYS9jb25mL2Rpc3Ryby9taW5pbWFsLXVjbGli
Yy5jb25mCisrKyBiL2NvbmYvZGlzdHJvL21pbmltYWwtdWNsaWJjLmNvbmYKQEAgLTQ0LDMgKzQ0
LDQgQEAgRElTVFJPX0ZFQVRVUkVTICs9ICJwYW0iCiBESVNUUk9fRkVBVFVSRVMgKz0gImxhcmdl
ZmlsZSIKICMgZ2xpYi0yLjAgbm5lZHMgaXB2NiBhbmQgdGhlcmUgaXMgbm8ga25vYiB0byBjb250
cm9sIGl0CiBESVNUUk9fRkVBVFVSRVMgKz0gImlwdjQgaXB2NiIKK0RJU1RST19GRUFUVVJFU19h
cHBlbmRfYXJtID0gJyAke0BbInRodW1iLWludGVyd29ya2luZyIsIiJdW2JiLmRhdGEuZ2V0VmFy
KCdUSFVNQl9JTlRFUldPUktJTkcnLCBkLCAxKSA9PSAieWVzIl19JwpkaWZmIC0tZ2l0IGEvY29u
Zi9kaXN0cm8vbWluaW1hbC5jb25mIGIvY29uZi9kaXN0cm8vbWluaW1hbC5jb25mCmluZGV4IGU0
MDBjMTQuLmVhOWY0NjcgMTAwNjQ0Ci0tLSBhL2NvbmYvZGlzdHJvL21pbmltYWwuY29uZgorKysg
Yi9jb25mL2Rpc3Ryby9taW5pbWFsLmNvbmYKQEAgLTE2LDcgKzE2LDcgQEAgRElTVFJPX1ZFUlNJ
T04gPSAiZGV2LXNuYXBzaG90LSR7U1JDREFURX0iCiBESVNUUk9fVFlQRSA/PSAiZGVidWciCiAK
ICMgRW5zdXJlIHNvbWUgZm9ybSBvZiByZWxlYXNlIGNvbmZpZywgc28gZXJyb3Igb3V0IGlmIHNv
bWVvbmUgdGhpbmtzIGhlIGtub3dzIGJldHRlcgotRElTVFJPX0NIRUNLIDo9ICIke0BiYi5kYXRh
LmdldFZhcignRElTVFJPX1ZFUlNJT04nLGQsMSkgb3IgYmIuZmF0YWwoJ1JlbW92ZSB0aGlzIGxp
bmUgb3Igc2V0IGEgZHVtbXkgRElTVFJPX1ZFUlNJT04iKQorRElTVFJPX0NIRUNLIDo9ICIke0Bi
Yi5kYXRhLmdldFZhcignRElTVFJPX1ZFUlNJT04nLGQsMSkgb3IgYmIuZmF0YWwoJ1JlbW92ZSB0
aGlzIGxpbmUgb3Igc2V0IGEgZHVtbXkgRElTVFJPX1ZFUlNJT04nKX0iCiAKICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCiAjIEZFQVRVUkUgU0VMRUNUSU9OCkBAIC0zNCw2ICszNCw4IEBAIERJU1RST19G
RUFUVVJFUyArPSAiZWFiaSIKIAogRElTVFJPX0ZFQVRVUkVTICs9ICJtcGx0IgogCitESVNUUk9f
RkVBVFVSRVNfYXBwZW5kX2FybSA9ICcgJHtAWyJ0aHVtYi1pbnRlcndvcmtpbmciLCIiXVtiYi5k
YXRhLmdldFZhcignVEhVTUJfSU5URVJXT1JLSU5HJywgZCwgMSkgPT0gInllcyJdfScKKwogIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKICMgTElCUkFSWSBOQU1FUwogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK

--0022152d83f5f339cc048ae82f4c--
