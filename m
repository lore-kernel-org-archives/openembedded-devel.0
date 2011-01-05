Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PaO1s-0006jg-EG
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 08:43:32 +0100
Received: by gxk20 with SMTP id 20so6461627gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 23:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=7O2PGZEaxgaNEc8KQYZX/BrI35FNGRmN5Ra/9hDgzDI=;
	b=CwMfIU1ryX/Uum7avUQwjhky/TkpvcV1cV5qNpF4PUdB+38xMUpOC5Byp0BC8fOxQk
	84frWL68KT/guEJXmtuYpHbz4YfAAKOdP7yBfYNvJFICUpXu1pajkKbNxtpi5lxsvv1v
	VCtcxG1z3KdyEhEIIq4QVtxcDxrwUf2lo/NqM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=tzwuyUvIsBB6IB0ONbnlZGzwjQhiBXVxd8zOEmiVhjnD5Ef7KI4FDx2Mb3WIVGCVTy
	rB/7gDzRMoxe30AbCeszcShGFYnUWuo8POp1YZkTtIX8ETudu9AL5OJ096gFiSXkdu/3
	x93gZSY+hr67POYhKdWUL+bxqqu0wjYREhBeU=
Received: by 10.90.104.20 with SMTP id b20mr335961agc.193.1294213388555; Tue,
	04 Jan 2011 23:43:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 4 Jan 2011 23:42:48 -0800 (PST)
In-Reply-To: <AANLkTim22AbOed09n1Ez6A2gtJhnjUDm3Ksv+tRDnn=8@mail.gmail.com>
References: <1294198349769396500@rkmorris.us>
	<AANLkTim22AbOed09n1Ez6A2gtJhnjUDm3Ksv+tRDnn=8@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Jan 2011 23:42:48 -0800
Message-ID: <AANLkTimbxOoZQRPQ+MsSNT++aXYnJsta8VmOA_Nbmc-k@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: H1940 Boot Issues -> Executable Build Problems?
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
X-List-Received-Date: Wed, 05 Jan 2011 07:43:32 -0000
X-Groupsio-MsgNum: 27716
Content-Type: multipart/mixed; boundary=001636163f3749d6420499148931

--001636163f3749d6420499148931
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

here is updated patch



On Tue, Jan 4, 2011 at 10:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jan 4, 2011 at 7:32 PM, Russell Morris <openembedded@rkmorris.us>=
 wrote:
>> Hi,
>>
>>
>>
>> A bit more info to try and help out here - as I'm fighting with this as =
best I can, but it's still kicking my butt ... :-).
>>
>>
>>
>> It really does look like the executable that is being created is not bui=
ld for the arm920t (armv4t). I have tried to run the executable on the targ=
et, and also with a modified version of qemu - and neither one works. If I =
tell qemu that the target is an arm920t the executable will not run, but if=
 I let it be the default qemu-arm it runs just fine.
>>
>>
>>
>> Has anyone else been able to get an OE build to run on an arm920t (armv4=
t) processor?
>>
>>
>
> OK you seem to be one patient guy :) Here is totally untested patch
> for gcc. Please apply it on top of your openembedded. Then use
> DISTRO=3Dminimal
> or any other distro that uses gcc 4.5 and build OE from scratch again
> and see if that helps and report back.
>
> Thanks
> -Khem
>

--001636163f3749d6420499148931
Content-Type: application/octet-stream; name="v4t.patch"
Content-Disposition: attachment; filename="v4t.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gijx7og31

ZGlmZiAtLWdpdCBhL3JlY2lwZXMvZ2NjL2djYy00LjUuaW5jIGIvcmVjaXBlcy9nY2MvZ2NjLTQu
NS5pbmMKaW5kZXggYmFjMTVlZi4uM2U2ZmI3NSAxMDA2NDQKLS0tIGEvcmVjaXBlcy9nY2MvZ2Nj
LTQuNS5pbmMKKysrIGIvcmVjaXBlcy9nY2MvZ2NjLTQuNS5pbmMKQEAgLTMyLDYgKzMyLDcgQEAg
U1JDX1VSSSA9ICJzdm46Ly9nY2MuZ251Lm9yZy9zdm4vZ2NjL2JyYW5jaGVzO21vZHVsZT0ke0JS
QU5DSH0gXAogCSAgIGZpbGU6Ly9hcm0tYnN3YXBzaTIucGF0Y2ggXAogCSAgIGZpbGU6Ly9NYWtl
ZmlsZS5pbi5wYXRjaCBcCiAJICAgZmlsZTovL2djYy1hcm12NC1wYXNzLWZpeC12NGJ4LXRvLWxk
LnBhdGNoIFwKKwkgICBmaWxlOi8vYXJtLWRlZmF1bHQtdG8tYXJtdjR0LnBhdGNoIFwKIAkgICBm
aWxlOi8vbGluYXJvL2djYy00LjUtbGluYXJvLXI5OTI5Ny5wYXRjaCBcCiAJICAgZmlsZTovL2xp
bmFyby9nY2MtNC41LWxpbmFyby1yOTkyOTgucGF0Y2ggXAogCSAgIGZpbGU6Ly9saW5hcm8vZ2Nj
LTQuNS1saW5hcm8tcjk5Mjk5LnBhdGNoIFwKZGlmZiAtLWdpdCBhL3JlY2lwZXMvZ2NjL2djYy00
LjUvYXJtLWRlZmF1bHQtdG8tYXJtdjR0LnBhdGNoIGIvcmVjaXBlcy9nY2MvZ2NjLTQuNS9hcm0t
ZGVmYXVsdC10by1hcm12NHQucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MC4uNTgwZmNjYgotLS0gL2Rldi9udWxsCisrKyBiL3JlY2lwZXMvZ2NjL2djYy00LjUvYXJtLWRl
ZmF1bHQtdG8tYXJtdjR0LnBhdGNoCkBAIC0wLDAgKzEsMTMgQEAKK0luZGV4OiBnY2MtNF81LWJy
YW5jaC9nY2MvY29uZmlnL2FybS9saW51eC1lYWJpLmgKKz09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKy0tLSBnY2MtNF81
LWJyYW5jaC5vcmlnL2djYy9jb25maWcvYXJtL2xpbnV4LWVhYmkuaAorKysrIGdjYy00XzUtYnJh
bmNoL2djYy9jb25maWcvYXJtL2xpbnV4LWVhYmkuaAorQEAgLTQ0LDcgKzQ0LDcgQEAKKyAgICBU
aGUgQVJNMTBURE1JIGNvcmUgaXMgdGhlIGRlZmF1bHQgZm9yIGFybXY1dCwgc28gc2V0CisgICAg
U1VCVEFSR0VUX0NQVV9ERUZBVUxUIHRvIGFjaGlldmUgdGhpcy4gICovCisgI3VuZGVmICBTVUJU
QVJHRVRfQ1BVX0RFRkFVTFQKKy0jZGVmaW5lIFNVQlRBUkdFVF9DUFVfREVGQVVMVCBUQVJHRVRf
Q1BVX2FybTEwdGRtaQorKyNkZWZpbmUgU1VCVEFSR0VUX0NQVV9ERUZBVUxUIFRBUkdFVF9DUFVf
YXJtOXRkbWkKKyAKKyAvKiBUQVJHRVRfQklHX0VORElBTl9ERUZBVUxUIGlzIHNldCBpbgorICAg
IGNvbmZpZy5nY2MgZm9yIGJpZyBlbmRpYW4gY29uZmlndXJhdGlvbnMuICAqLwo=

--001636163f3749d6420499148931--
