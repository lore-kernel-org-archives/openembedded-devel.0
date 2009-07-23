Received: from [209.85.210.193] (helo=mail-yx0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vishnudas@gmail.com>) id 1MU1jw-0002zL-VN
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jul 2009 19:05:57 +0200
Received: by yxe31 with SMTP id 31so1753834yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2009 09:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=16wNF5Y2+CwhF6f7WZewEbkIDmb9eY1jRgYfGjzZkqQ=;
	b=mz2JnbhHE379JNSj9HoFIY5j635T9z9Kvt9fqdji1FXXqI0Vw0xmKy5/nD3qq1GJT/
	1jJXF5UOmkHMEFfAtmGyxbjQ9szNW4ddAD8hBR8CS7yj9FfwTRFvrakF31F9UGc69vYU
	jGAd4mB8gcsnndTFgmrMQw+HoyH91yDt6MMtU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=wyz5sy9ArRiSezAFCwVSzjf2ACXcaXqrBca/hKk2v+oAp5exdp6fk402ubTLWgQRCX
	UMoAMuez1IRdEDiYtguCUanonpdp0joUt05VvNBarJuX+qNOU8y87iFdtK+0ite4t/5e
	heD6gK6cIEK7pdQStYa3FYCKV33qyfL6cTj3c=
MIME-Version: 1.0
Received: by 10.100.132.4 with SMTP id f4mr3125260and.109.1248367898545; Thu, 
	23 Jul 2009 09:51:38 -0700 (PDT)
Date: Thu, 23 Jul 2009 09:51:38 -0700
Message-ID: <d405a6580907230951t3bdccfd5h9f6c5b862c65831f@mail.gmail.com>
From: Vishnudas P <vishnudas@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] [Stable/2009] ti-dmai omapfb.h include path fix
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
X-List-Received-Date: Thu, 23 Jul 2009 17:05:57 -0000
X-Groupsio-MsgNum: 12058
Content-Type: multipart/mixed; boundary=0016e6434bca245214046f624ddd

--0016e6434bca245214046f624ddd
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi

This patch runs againt Stable/2009 and fixes the ti-dmai_svn.bb build
error due to wrong include path for omapfb.h in
dmai/packages/ti/sdo/dmai/linux/Display_fbdev.c

An unrelated change is also there.
ti-sdma-module is added to RRECOMMENDS_ti-dmai-apps.
This will put sdma module in the FS image when gstreamer-ti is in IMAGE_INSTALL.

Regards
Vishnudas

--0016e6434bca245214046f624ddd
Content-Type: application/octet-stream; 
	name="ti-dmai-include-path-fix-stable2009.patch"
Content-Disposition: attachment; 
	filename="ti-dmai-include-path-fix-stable2009.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fxgq6ugp0

ZGlmZiAtLWdpdCBhL3JlY2lwZXMvZHNwbGluay90aS1kbWFpX3N2bi5iYiBiL3JlY2lwZXMvZHNw
bGluay90aS1kbWFpX3N2bi5iYgppbmRleCBiY2JhZWE4Li44NzFjMmZjIDEwMDY0NAotLS0gYS9y
ZWNpcGVzL2RzcGxpbmsvdGktZG1haV9zdm4uYmIKKysrIGIvcmVjaXBlcy9kc3BsaW5rL3RpLWRt
YWlfc3ZuLmJiCkBAIC04LDYgKzgsNyBAQCBTUkNfVVJJID0gInN2bjovL2dmb3JnZS50aS5jb20v
c3ZuL2RtYWkvYnJhbmNoZXM7bW9kdWxlPUJSSUpFU0hfR0lUXzAyMjMwOTtwcm90bwogCSAgIGZp
bGU6Ly9kbWFpLWJ1aWx0LXdpdGgtYW5nc3Ryb20ucGF0Y2g7cGF0Y2g9MSBcCiAgICAgICAgICAg
IGZpbGU6Ly9sb2FkbW9kdWxlcy10aS1kbWFpLWFwcHMuc2ggXAogICAgICAgICAgICBmaWxlOi8v
dW5sb2FkbW9kdWxlcy10aS1kbWFpLWFwcHMuc2ggXAorICAgICAgICAgICBmaWxlOi8vb21hcGZi
LWluY2x1ZGUtcGF0aC1maXgucGF0Y2g7cGF0Y2g9MSBcCiAgICAiCiAKIFNSQ1JFViA9ICIzNiIK
QEAgLTE1LDcgKzE2LDcgQEAgU1JDUkVWID0gIjM2IgogUyA9ICIke1dPUktESVJ9L0JSSUpFU0hf
R0lUXzAyMjMwOS9kYXZpbmNpX211bHRpbWVkaWFfYXBwbGljYXRpb25faW50ZXJmYWNlL2RtYWki
CiAjIFllcywgdGhlIHhkYyBzdHVmZiBzdGlsbCBicmVha3Mgd2l0aCBhICcuJyBpbiBQV0QKIFBW
ID0gIjEyMCtzdm5yJHtTUkNSRVZ9IgotUFIgPSAicjE2IgorUFIgPSAicjE3IgogCiBUQVJHRVQg
PSAiYWxsIgogVEFSR0VUX25ldXJvcy1vc2QyID0gIiBkbTY0NDZfYWwgZG02NDQ2X2RiIgpAQCAt
NzUsNSArNzYsNSBAQCBQQUNLQUdFX0FSQ0ggPSAiJHtNQUNISU5FX0FSQ0h9IgogI2FkZCBydW4t
dGltZSBkZXBlbmRlbmNpZXMgLSBub3RlIGZvciBrZXJuZWwgbW9kdWxlIHdlIGNhbiBvbmx5IHVz
ZSBSUkVDT01NRU5EUywgc2luY2UgbW9kdWxlcyBtaWdodCBiZSBidWlsdCBpbnRvIHRoZSBrZXJu
ZWwKICMgYW5kIGZvciBub3cgd2UgbWFrZSBjb2RlY3MgUlJFQ09NTUVORFMgYXMgd2VsbCwgc2lu
Y2Ugbm90IGV2ZXJ5b25lIHdpbGwgaGF2ZSB0aGVtCiAjUkRFUEVORFNfdGktZG1haS1hcHBzICs9
ICJ0aS1jb2RlYy1jb21ib3MiCi1SUkVDT01NRU5EU190aS1kbWFpLWFwcHMgKz0gInRpLWNtZW0t
bW9kdWxlIHRpLWxwbS1tb2R1bGUgdGktZHNwbGluay1tb2R1bGUgdGktY29kZWMtY29tYm9zIgor
UlJFQ09NTUVORFNfdGktZG1haS1hcHBzICs9ICJ0aS1jbWVtLW1vZHVsZSB0aS1scG0tbW9kdWxl
IHRpLWRzcGxpbmstbW9kdWxlIHRpLWNvZGVjLWNvbWJvcyB0aS1zZG1hLW1vZHVsZSIKIApkaWZm
IC0tZ2l0IGEvcmVjaXBlcy9kc3BsaW5rL2ZpbGVzL29tYXBmYi1pbmNsdWRlLXBhdGgtZml4LnBh
dGNoIGIvcmVjaXBlcy9kc3BsaW5rL2ZpbGVzL29tYXBmYi1pbmNsdWRlLXBhdGgtZml4LnBhdGNo
Cm5ldyBmaWxlIG1vZGUgMTAwNzU1CmluZGV4IDAwMDAwMDAuLmVkNWU4YTkKLS0tIC9kZXYvbnVs
bAorKysgYi9yZWNpcGVzL2RzcGxpbmsvZmlsZXMvb21hcGZiLWluY2x1ZGUtcGF0aC1maXgucGF0
Y2gKQEAgLTAsMCArMSwxMSBAQAorLS0tIGRtYWkub3JpZy9wYWNrYWdlcy90aS9zZG8vZG1haS9s
aW51eC9EaXNwbGF5X2ZiZGV2LmMJMjAwOS0wNi0yOSAxNjoyODoxOC4wMDAwMDAwMDAgLTA2MDAK
KysrKyBkbWFpL3BhY2thZ2VzL3RpL3Nkby9kbWFpL2xpbnV4L0Rpc3BsYXlfZmJkZXYuYwkyMDA5
LTA2LTI5IDE2OjI4OjM1LjAwMDAwMDAwMCAtMDYwMAorQEAgLTQyLDcgKzQyLDcgQEAKKyAjaW5j
bHVkZSA8bGludXgvZmIuaD4KKyAKKyAjaWZkZWYgRG1haV9EZXZpY2Vfb21hcDM1MzAKKy0jaW5j
bHVkZSA8bWFjaC9vbWFwZmIuaD4KKysjaW5jbHVkZSA8bGludXgvb21hcGZiLmg+CisgI2VuZGlm
CisgI2luY2x1ZGUgPHhkYy9zdGQuaD4KKyAjaW5jbHVkZSA8dGkvc2RvL2RtYWkvQ3B1Lmg+Cg==

--0016e6434bca245214046f624ddd--
