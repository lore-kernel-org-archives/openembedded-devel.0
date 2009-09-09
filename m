Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1MlMdE-0007qC-Gf
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 14:50:43 +0200
Received: by fxm22 with SMTP id 22so713507fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Sep 2009 05:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=8VrNBk/o7v8hXdycznlzZ0BUGLupLULTwYsANnDXF1A=;
	b=R4Qqreifo1zz4cxSQNNciOHucK9qsbzt0TL6l/slXSm1YKUhFPLBuUPqoBCJ0sWeqE
	osa94D67GJrBmjIt5c5u+xVuNTKYjejyD5S+o4M+4OY0sVVh0dt8vh4mJjmPG+3+OGh0
	oyRate7HRtTM5T8rMO+0YzGojR3JSfqPrehhs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=I7F6wyyoxYmJRQa6gbrytX2LnLJ7zk42oYbAOmGSP6nBWh5juSwKUjTj9xX1g0dDPG
	MvrnpEy7PHT57k6lP/umNp2PSylvDlmyEmTQub7NiPntmkTwoSlOVBp8bzAmGPC46cgw
	V1Ga+cYuJr7ZDOSl0u1JimCZC7JaoSZ6hMopg=
MIME-Version: 1.0
Received: by 10.223.144.70 with SMTP id y6mr256804fau.12.1252500613040; Wed, 
	09 Sep 2009 05:50:13 -0700 (PDT)
Date: Wed, 9 Sep 2009 13:50:12 +0100
Message-ID: <91283b620909090550g380d2db6p54f47960ac9b92f4@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: stuart68@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Cannot get additional Qt libraries to be included within my image
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
X-List-Received-Date: Wed, 09 Sep 2009 12:50:43 -0000
X-Groupsio-MsgNum: 13031
Content-Type: multipart/mixed; boundary=0022158df8f71f0c0a0473248658

--0022158df8f71f0c0a0473248658
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am trying to build an image that includes gstreamer, gst-plugin-good/bad
and ugly, phonon, Qt4 Embedded and sqlite3.

Now, I am new to all of this, Linux and OE, btu I have been making good
progress and have a system up and running, but, I cannot get Qt to include
libraries like libphonon_gstreamer.

I have tried to change qt4-embedded.inc to add to the QT_CONFIG_FLAGS.
Please see attached. No other Qt file shave been altered.

I have also attached the file I use to compile our own code which is written
within Qt.

I am using org.embedded.dev, overo branch.

I have changed the standard omap3-console-image file which is also attached.

If you could provide any pointers to an answer that would be great.

Thanks,
Stuart

--0022158df8f71f0c0a0473248658
Content-Type: application/octet-stream; name="qt4-embedded.inc"
Content-Disposition: attachment; filename="qt4-embedded.inc"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fze2ca990

U1VNTUFSWSA9ICJRdCBpcyBhIHZlcnNhdGlsZSBjcm9zcy1wbGF0Zm9ybSBhcHBsaWNhdGlvbiBm
cmFtZXdvcmsgLS0gdGhpcyBpcyB0aGUgZW1iZWRkZWQgdmVyc2lvbi4iClNFQ1RJT04gPSAibGli
cyIKTElDRU5TRSA9ICJHUEwgUVBMIgpQUklPUklUWSA9ICJvcHRpb25hbCIKSE9NRVBBR0UgPSAi
aHR0cDovL3d3dy50cm9sbHRlY2guY29tIgpERVBFTkRTICs9ICJkaXJlY3RmYiB0c2xpYiIKSU5D
X1BSID0gInIxNSIKClFUX0JBU0VfTkFNRSA/PSAicXQ0LWVtYmVkZGVkIgpRVF9CQVNFX0xJQiAg
Pz0gImxpYnF0LWVtYmVkZGVkIgpRVF9ESVJfTkFNRSA9ICJxdG9waWEiClFUX0xJQklORklYID0g
IkUiCgpTUkNfVVJJID0gImZ0cDovL2Z0cC50cm9sbHRlY2guY29tL3F0L3NvdXJjZS9xdC1lbWJl
ZGRlZC1saW51eC1vcGVuc291cmNlLXNyYy0ke1BWfS50YXIuYnoyIFwKICAgICAgICAgICBmaWxl
Oi8vMDAwMS1jcm9zcy1jb21waWxlLnBhdGNoO3BhdGNoPTEgXAogICAgICAgICAgIGZpbGU6Ly8w
MDAyLWZpeC1yZXNpbml0LWRlY2xhcmF0aW9uLnBhdGNoO3BhdGNoPTEgXAogICAgICAgICAgIGZp
bGU6Ly8wMDAzLW5vLXRvb2xzLnBhdGNoO3BhdGNoPTEgXAogICAgICAgICAgIGZpbGU6Ly8wMDA0
LW5vLXFtYWtlLnBhdGNoO3BhdGNoPTEgXAogICAgICAgICAgIGZpbGU6Ly8wMDA2LWZyZWV0eXBl
LWhvc3QtaW5jbHVkZXMucGF0Y2g7cGF0Y2g9MSBcCiAgICAgICAgICAgZmlsZTovLzAwMDctb3Bl
bnNzbC1ob3N0LWluY2x1ZGVzLnBhdGNoO3BhdGNoPTEgXAogICAgICAgICAgIGZpbGU6Ly8wMDA4
LXF0LWxpYi1pbmZpeC5wYXRjaDtwYXRjaD0xIFwKICAgICAgICAgICBmaWxlOi8vMDAwOS1zdXBw
b3J0LTJicHAucGF0Y2g7cGF0Y2g9MSBcCiAgICAgICAgICAgZmlsZTovL2ZpeC1jb25maWctdGVz
dHMucGF0Y2g7cGF0Y2g9MSBcCiAgICAgICAgICAgZmlsZTovL2crKy5jb25mIFwKICAgICAgICAg
ICBmaWxlOi8vbGludXguY29uZiBcCiAgICAgICAgICAgIgpTID0gIiR7V09SS0RJUn0vcXQtZW1i
ZWRkZWQtbGludXgtb3BlbnNvdXJjZS1zcmMtJHtQVn0iCgpRVF9DT05GSUdfRkxBR1MgKz0gIiBc
CiAgICAtcXRsaWJpbmZpeCAke1FUX0xJQklORklYfSBcCiAgICAtcXQtZGVjb3JhdGlvbi1zdHls
ZWQgLXBsdWdpbi1kZWNvcmF0aW9uLWRlZmF1bHQgLXBsdWdpbi1kZWNvcmF0aW9uLXdpbmRvd3Mg
XAogICAgLXBsdWdpbi1nZngtdHJhbnNmb3JtZWQgLXBsdWdpbi1nZngtcXZmYiAtcGx1Z2luLWdm
eC12bmMgLXBsdWdpbi1nZngtZGlyZWN0ZmIgXAogICAgLXBsdWdpbi1tb3VzZS10c2xpYiAtcXQt
bW91c2UtcGMgLXF0LW1vdXNlLXF2ZmIgXAogICAgLXF0LWtiZC10dHkgLXF0LWtiZC11c2IgLXF0
LWtiZC1xdmZiIFwKICAgIC1zeXN0ZW0tc3FsaXRlIC1wbHVnaW4tc3FsLXNxbGl0ZSAtcGhvbm9u
IC1waG9ub24tYmFja2VuZCBcCiAgICAtbm8td2Via2l0IC1uby14bWxwYXR0ZXJucyAtbm8tcXQz
c3VwcG9ydCBcCiAgICAtc2hhcmVkIC1yZWxlYXNlIFwKICAgIC1EUVRfS0VZUEFEX05BVklHQVRJ
T04gXAogICAgIgoKcmVxdWlyZSBxdDQuaW5jCgppbmhlcml0IHF0NGUKCg==

--0022158df8f71f0c0a0473248658
Content-Type: application/octet-stream; name="source.inc"
Content-Disposition: attachment; filename="source.inc"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fze2e90r1

REVTQ1JJUFRJT04gPSAic291cmNlIGFwcGxpY2F0aW9uIGZvciBTaW1wbGUgQXVkaW8iCkxJQ0VO
U0UgPSAiSVAiCkRFUEVORFMgPSAicXQ0LWVtYmVkZGVkIGNkcGFyYW5vaWEgbGlibXVzaWNicmFp
bnoiCgppbmhlcml0IHFtYWtlMgoKUyA9ICIke1dPUktESVJ9LyR7UE59IgoKZG9fdW5wYWNrICgp
IHsKICAgICNjb3B5IGV2ZXJ5dGhpbmcgaW50byB0aGUgc291cmNlLTEuMC9zb3VyY2UgZGlyZWN0
b3J5CiAgICBjcCAtciB+L292ZXJvLW9lL3NvdXJjZSAke1N9ICAgCn0KZG9fY29tcGlsZV9wcmVw
ZW5kKCkgewogICAgZXhwb3J0IFdPUktJTkdfRElSPSR7U30KICAgIGV4cG9ydCBKU09OSE9NRT0k
V09SS0lOR19ESVIvSlNPTgogICAgZXhwb3J0IFFUU1RBVEVfRElSPSRXT1JLSU5HX0RJUi9idWls
ZF9kZXBlbmRlbmNpZXMvcXRzdGF0ZW1hY2hpbmUtMS4xLW9wZW5zb3VyY2UKICAgIG9lbm90ZSBS
dW5uaW5nIG91ciBjb21waWxlIHByZXBlbmQgd29ya2luZ19kaXIgaXMgJHtXT1JLSU5HX0RJUn0g
U0dOT1RFCn0KZG9faW5zdGFsbCgpIHsKICAgICAgICBpbnN0YWxsIC1kICR7RH0vb3B0L1NpbXBs
ZUF1ZGlvL2JpbgogICAgICAgIGluc3RhbGwgLW0gMDY0NCAke1dPUktESVJ9L3NvdXJjZS9zb3Vy
Y2Uvc291cmNlICR7RH0vb3B0L1NpbXBsZUF1ZGlvL2Jpbgp9CgpQQUNLQUdFX0FSQ0ggPSAiYWxs
IgoKRklMRVNfJHtQTn0gPSAiL29wdC9TaW1wbGVBdWRpby9iaW4iCg==

--0022158df8f71f0c0a0473248658
Content-Type: application/octet-stream; name="omap3-console-image.bb"
Content-Disposition: attachment; filename="omap3-console-image.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fze2h9vh2

IyBjb25zb2xlIGltYWdlIGZvciBvbWFwMyB3aXRoIFNpbXBsZSBBdWRpbyBhZGRpdGlvbnMKCiMg
c2VlIGNsYXNzZXMgZGlyZWN0b3J5IHRvIHNlZSB3aGF0IHdlIGNhbiBpbmhlcml0CmluaGVyaXQg
aW1hZ2UgCgojIHRoaXMgY2FuIGJlIGNoYW5nZWQgdG8gYmUgdGFzay1iYXNlLXNhCkRFUEVORFMg
PSAidGFzay1iYXNlIgoKSU1BR0VfRVhUUkFfSU5TVEFMTCA/PSAiIgoKQVVESU9fSU5TVEFMTCA9
ICIgXAogIGFsc2EtdXRpbHMgXAogIGFsc2EtdXRpbHMtYXBsYXkgXAogIGFsc2EtdXRpbHMtYW1p
eGVyIFwKICBhbmdzdHJvbS16ZXJvY29uZi1hdWRpbyBcCiAiCQoKQkFTRV9JTlNUQUxMID0gIiBc
CiAgdGFzay1iYXNlLWV4dGVuZGVkIFwKICIKCkZJUk1XQVJFX0lOU1RBTEwgPSAiIFwKIyAgbGlu
dXgtZmlybXdhcmUgXAogIGxpYmVydGFzLXNkLWZpcm13YXJlIFwKICBydDczLWZpcm13YXJlIFwK
ICB6ZDEyMTEtZmlybXdhcmUgXAogIGRpYjA3MDAtZmlybXdhcmUgXAogIgoKR0xFU19JTlNUQUxM
ID0gIiIKR0xFU19JTlNUQUxMX2FwcGVuZF9iZWFnbGVib2FyZCAgPSAiIGxpYmdsZXMtb21hcDMi
CgpUT09MU19JTlNUQUxMID0gIiBcCiAgYmFzaCBcCiAgYnppcDIgXAogIGRldm1lbTIgXAogIGRo
Y3AtY2xpZW50IFwKICBkb3Nmc3Rvb2xzIFwKICBmYmdyYWIgXAogIGZic2V0IFwKICBmYnNldC1t
b2RlcyBcCiAga3N5bW9vcHMgXAogIG1rZnMtamZmczIgXAogIG10ZC11dGlscyBcCiAgbmFubyBc
CiAgbnRwIG50cGRhdGUgXAogIG9wZW5zc2gtbWlzYyBcCiAgb3BlbnNzaC1zY3AgXAogIG9wZW5z
c2gtc3NoIFwKICBwcm9jcHMgXAogIHNvY2F0IFwKICBzdHJhY2UgXAogIHN1ZG8gXAogIHRhc2st
cHJvcGVyLXRvb2xzIFwKICB1LWJvb3QtdG9vbHMtZW52IFwKICIKCiMgSGVyZSB3ZSBjYW4gYWRk
IGFueXRoaW5nIHRoYXQgaXMgcmVxdWlyZWQgZm9yIHRoZSBTaW1wbGUgQXVkaW8gTGludXggY2hh
bmdlcwoKIyBUbyBhZGQgdGhlIGxpYnN0ZGMrKyB0byB0aGUgZGlzdHJvIHdlIHNob3VsZCBhZGQg
YSByZWNpcGUgZm9yIG91ciBDKysgYXBwbGljYXRpb24KIyBhbmQgdGhlbiBhZGQgdGhpcyB0byB0
aGUgSU1BR0VfSU5TVEFMTCwgT0Ugd2lsbCB0aGVuIGF1dG9tYXRpY2FsbHkgaW5jbHVkZSB0aGUg
bGlic3RkYysrClNJTVBMRV9BVURJTyA9ICIgXAogIGF1ZGlvZmlsZSBcCiAgZXNvdW5kIFwKICBj
ZHBhcmFub2lhIFwKICBkYnVzIFwKICBkb2NrYW1wIFwKICBmbGFjIFwKICBmZm1wZWcgXAogIGdz
dHJlYW1lciBcCiAgZ3N0LWZmbXBlZyBcCiAgZ3N0LXBsdWdpbnMtYmFkIFwKICBnc3QtcGx1Z2lu
cy1nb29kIFwKICBnc3QtcGx1Z2lucy11Z2x5IFwKICBoYWwgXAogIGxpZ2h0dHBkIFwKICBsaWdo
dHRwZC1tb2R1bGUtYWNjZXNzIFwKICBsaWdodHRwZC1tb2R1bGUtYWNjZXNzbG9nIFwKICBsaWdo
dHRwZC1tb2R1bGUtaW5kZXhmaWxlIFwKICBsaWdodHRwZC1tb2R1bGUtZGlybGlzdGluZyBcCiAg
bGlnaHR0cGQtbW9kdWxlLXN0YXRpY2ZpbGUgXAogIGxpYm1hZCBcCiAgbWFkcGxheSBcCiAgbGli
bXVzaWNicmFpbnogXAogIHF0NC1lbWJlZGRlZCBcCiAgc3FsaXRlMyBcCiAgd3NjYW4gXAogIHNv
dXJjZSBcCiIKSU1BR0VfSU5TVEFMTCArPSAiIFwKICAke0JBU0VfSU5TVEFMTH0gXAogICR7QVVE
SU9fSU5TVEFMTH0gXAogICR7RklSTVdBUkVfSU5TVEFMTH0gXAogICR7R0xFU19JTlNUQUxMfSBc
CiAgJHtJTUFHRV9FWFRSQV9JTlNUQUxMfSBcCiAgJHtUT09MU19JTlNUQUxMfSBcCiAgJHtTSU1Q
TEVfQVVESU99IFwKICIKCklNQUdFX1BSRVBST0NFU1NfQ09NTUFORCA9ICJjcmVhdGVfZXRjX3Rp
bWVzdGFtcCIKCiNST09URlNfUE9TVFBST0NFU1NfQ09NTUFORCArPSAnJHtAYmFzZV9jb25kaXRp
b25hbCgiRElTVFJPX1RZUEUiLCAicmVsZWFzZSIsICJ6YXBfcm9vdF9wYXNzd29yZDsgIiwgIiIs
ZCl9JwoKCg==

--0022158df8f71f0c0a0473248658--
