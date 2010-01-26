Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NZtMU-0004pI-G3
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 22:54:17 +0100
Received: by yxe5 with SMTP id 5so4107850yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2010 13:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=Vb5QIgDxBT7ChdHwJDBUl1MON0QGfyJ59RoDt2eRXCM=;
	b=YMXRZqPeQaP1Vcap022GMZq7o4N8pfgtjOBarbcSN76GNBti/b8Ew2O6Yt3AuiYemp
	xrys1sKz64nlSpzmdy9P5TyEONQGTqhpxaI/aibAWj2WKRnSzLNWiNVlnYf6N5HWpVzz
	VFY3fXANZ6tw6FtgxwaF98M0HXBPwue6euRqE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=TOZReUzahJ2/K+FofsMIiFtry7oy85+u43AJpnTX8V8f/S52pY9HKGx2TclrKGTQa0
	BsCh2Tga1bma24F6EEzPqHGTBKS6LUF5FGDJ0MeZkPX53fYn6xe3giWHhfoomAu/RsKj
	wBXpGOy2JahysSu7wEa0eR/R6rnHhCoi/RIGs=
MIME-Version: 1.0
Received: by 10.101.151.25 with SMTP id d25mr3320629ano.42.1264542712723; Tue, 
	26 Jan 2010 13:51:52 -0800 (PST)
Date: Tue, 26 Jan 2010 22:51:52 +0100
Message-ID: <ac9c93b11001261351n4a1475c3q46d6a441a66f2e5e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: small perl initialisation patch
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
X-List-Received-Date: Tue, 26 Jan 2010 21:54:17 -0000
X-Groupsio-MsgNum: 16244
Content-Type: multipart/mixed; boundary=001636c5c25931faa0047e184b31

--001636c5c25931faa0047e184b31
Content-Type: text/plain; charset=ISO-8859-1

HI all,

Attached is a patch for perl to improve initialisation.
From the commit message:

Perl file Lib/CPAN/FirstTime.pm can enter a dialog for continent which
never ends.
This problem is among others sometimes triggered by
libxml-namespacesupport-perl_1.10.bb
The patch forces the answer for manual configuration to "no" avoiding
that we run into this problem

As I am not really a perl wiz, I would like some more eyeballs to look
at this one.

And apologies for not inlining the patch, but gmail wraps and
configuring git send-email requires several perl modules that are not
on the opensuse feed

Appreciated your feedback

Frans

--001636c5c25931faa0047e184b31
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-perl-5.8.8-do-not-enter-manual-configuration.patch"
Content-Disposition: attachment; 
	filename="0001-perl-5.8.8-do-not-enter-manual-configuration.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g4x7zt700

RnJvbSA2ZTY5N2IxMGMzZDI1OGMwZjJiZGY1ZWMxYzc1NWUzMDg1ZTEzNDBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGcmFucyBNZXVsZW5icm9la3MgPGZyYW5zbWV1bGVuYnJvZWtz
QGdtYWlsLmNvbT4KRGF0ZTogVHVlLCAyNiBKYW4gMjAxMCAyMjoyMToyMSArMDEwMApTdWJqZWN0
OiBbUEFUQ0hdIHBlcmwgNS44Ljg6ICBkbyBub3QgZW50ZXIgbWFudWFsIGNvbmZpZ3VyYXRpb24K
ClBlcmwgZmlsZSBMaWIvQ1BBTi9GaXJzdFRpbWUucG0gY2FuIGVudGVyIGEgZGlhbG9nIGZvciBj
b250aW5lbnQgd2hpY2ggbmV2ZXIgZW5kcy4KVGhpcyBwcm9ibGVtIGlzIGFtb25nIG90aGVycyBz
b21ldGltZXMgdHJpZ2dlcmVkIGJ5IGxpYnhtbC1uYW1lc3BhY2VzdXBwb3J0LXBlcmxfMS4xMC5i
YgpUaGUgcGF0Y2ggZm9yY2VzIHRoZSBhbnN3ZXIgZm9yIG1hbnVhbCBjb25maWd1cmF0aW9uIHRv
ICJubyIgYXZvaWRpbmcgdGhhdCB3ZSBydW4gaW50byB0aGlzIHByb2JsZW0KLS0tCiByZWNpcGVz
L3BlcmwvcGVybC01LjguOC9maXJzdHRpbWUucGF0Y2ggfCAgIDE1ICsrKysrKysrKysrKysrKwog
cmVjaXBlcy9wZXJsL3BlcmwtbmF0aXZlXzUuOC44LmJiICAgICAgIHwgICAgMyArKy0KIHJlY2lw
ZXMvcGVybC9wZXJsXzUuOC44LmJiICAgICAgICAgICAgICB8ICAgIDMgKystCiAzIGZpbGVzIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcmVjaXBlcy9wZXJsL3BlcmwtNS44LjgvZmlyc3R0aW1lLnBhdGNoCgpkaWZmIC0tZ2l0IGEv
cmVjaXBlcy9wZXJsL3BlcmwtNS44LjgvZmlyc3R0aW1lLnBhdGNoIGIvcmVjaXBlcy9wZXJsL3Bl
cmwtNS44LjgvZmlyc3R0aW1lLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAuLmJkMDk1ODkKLS0tIC9kZXYvbnVsbAorKysgYi9yZWNpcGVzL3BlcmwvcGVybC01LjguOC9m
aXJzdHRpbWUucGF0Y2gKQEAgLTAsMCArMSwxNSBAQAorSW5kZXg6IHBlcmwtNS44LjgvbGliL0NQ
QU4vRmlyc3RUaW1lLnBtCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09CistLS0gcGVybC01LjguOC5vcmlnL2xpYi9DUEFO
L0ZpcnN0VGltZS5wbQorKysrIHBlcmwtNS44LjgvbGliL0NQQU4vRmlyc3RUaW1lLnBtCitAQCAt
NjgsOSArNjgsNyBAQCBkaWFsb2cgYW55dGltZSBsYXRlciBieSB0eXBpbmcgJ28gY29uZiBpCisg
CisgXTsKKyAKKy0gICAgbXkgJG1hbnVhbF9jb25mID0KKy0JRXh0VXRpbHM6Ok1ha2VNYWtlcjo6
cHJvbXB0KCJBcmUgeW91IHJlYWR5IGZvciBtYW51YWwgY29uZmlndXJhdGlvbj8iLAorLQkJCQkg
ICAgInllcyIpOworKyAgICBteSAkbWFudWFsX2NvbmYgPSAibm8iOworICAgICBteSAkZmFzdHJl
YWQ7CisgICAgIHsKKyAgICAgICBsb2NhbCAkXlc7CmRpZmYgLS1naXQgYS9yZWNpcGVzL3Blcmwv
cGVybC1uYXRpdmVfNS44LjguYmIgYi9yZWNpcGVzL3BlcmwvcGVybC1uYXRpdmVfNS44LjguYmIK
aW5kZXggNjBhNWNmNS4uYTljNjZlOCAxMDA2NDQKLS0tIGEvcmVjaXBlcy9wZXJsL3BlcmwtbmF0
aXZlXzUuOC44LmJiCisrKyBiL3JlY2lwZXMvcGVybC9wZXJsLW5hdGl2ZV81LjguOC5iYgpAQCAt
MTUsNyArMTUsOCBAQCBTUkNfVVJJID0gImh0dHA6Ly9mdHAuZnVuZXQuZmkvcHViL0NQQU4vc3Jj
L3BlcmwtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL25hdGl2ZS1uby1nZGJtaW5j
LnBhdGNoO3BhdGNoPTEgXAogICAgICAgICAgICBmaWxlOi8vbmF0aXZlLXBlcmxpbmMucGF0Y2g7
cGF0Y2g9MSBcCiAgICAgICAgICAgIGZpbGU6Ly9tYWtlZGVwZW5kLWRhc2gucGF0Y2g7cGF0Y2g9
MSBcCi0gICAgICAgICAgIGZpbGU6Ly9hc20tcGFnZWgtZml4LnBhdGNoO3BhdGNoPTEiCisgICAg
ICAgICAgIGZpbGU6Ly9hc20tcGFnZWgtZml4LnBhdGNoO3BhdGNoPTEgXAorICAgICAgICAgICBm
aWxlOi8vZmlyc3R0aW1lLnBhdGNoO3BhdGNoPTEiCiAKIFMgPSAiJHtXT1JLRElSfS9wZXJsLSR7
UFZ9IgogCmRpZmYgLS1naXQgYS9yZWNpcGVzL3BlcmwvcGVybF81LjguOC5iYiBiL3JlY2lwZXMv
cGVybC9wZXJsXzUuOC44LmJiCmluZGV4IGVkZDNhODMuLjIwMGU3MGMgMTAwNjQ0Ci0tLSBhL3Jl
Y2lwZXMvcGVybC9wZXJsXzUuOC44LmJiCisrKyBiL3JlY2lwZXMvcGVybC9wZXJsXzUuOC44LmJi
CkBAIC01LDcgKzUsNyBAQCBMSUNFTlNFID0gIkFydGlzdGljfEdQTCIKIFBSSU9SSVRZID0gIm9w
dGlvbmFsIgogIyBXZSBuZWVkIGdudWdyZXAgKGZvciAtSSkKIERFUEVORFMgPSAidmlydHVhbC9k
YiBwZXJsLW5hdGl2ZSBncmVwLW5hdGl2ZSIKLVBSID0gInIzMSIKK1BSID0gInIzMiIKIAogIyBN
YWpvciBwYXJ0IG9mIHZlcnNpb24KIFBWTSA9ICI1LjgiCkBAIC0zMCw2ICszMCw3IEBAIFNSQ19V
UkkgPSAiZnRwOi8vZnRwLmZ1bmV0LmZpL3B1Yi9DUEFOL3NyYy9wZXJsLSR7UFZ9LnRhci5neiBc
CiAgICAgICAgIGZpbGU6Ly82NF9kZWJpYW5fZW5jMnhzX2luYy5wYXRjaDtwYXRjaD0xIFwKICAg
ICAgICAgZmlsZTovL2FzbS1wYWdlaC1maXgucGF0Y2g7cGF0Y2g9MSBcCiAgICAgICAgIGZpbGU6
Ly9zaGFyZWQtbGRmbGFncy5wYXRjaDtwYXRjaD0xIFwKKyAgICAgICAgZmlsZTovL2ZpcnN0dGlt
ZS5wYXRjaDtwYXRjaD0xIFwKICAgICAgICAgZmlsZTovL2NvbmZpZy5zaCBcCiAgICAgICAgIGZp
bGU6Ly9jb25maWcuc2gtMzIgXAogICAgICAgICBmaWxlOi8vY29uZmlnLnNoLTMyLWxlIFwKLS0g
CjEuNi40LjIKCg==

--001636c5c25931faa0047e184b31--
