Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1MfgCD-0005uB-A0
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 22:31:17 +0200
Received: by fxm24 with SMTP id 24so1529388fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 13:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=kcy7qj/LC9e9gkFmHLFHm5EcSlBpYO8gELij4rwLnm0=;
	b=Y9gK3tZqlRhh7CBCjWj4qMbasopqCwMEflfIqUg/4yrDOcuT7N9Wa4Z8ysa51eozJ1
	a0tq9itIHH2KYudMTTa1w/zTJo5N/IYZFQ1EkypV2hxuKEx94vzf1HEUjC23DMId66Cl
	LSiVioAFM0TLaSDObQjlleXIqlBZRQp+Rc19Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WeD3hW/a/ddFiG7GO5zbR+0R6dL+7z19XmzBAo4JjEWOtqetpssqjCXVSD5PA9PT/P
	ZLF8RnO0rfphEwtADtgoC4jivlofya0dZjLr1ShumHQqalmRippQB8mGPhYMsjzUP1O0
	mnsIW6ZhJJ6vfxb7KAJDEjzqXTRky6SYLOEzA=
MIME-Version: 1.0
Received: by 10.103.84.6 with SMTP id m6mr2160755mul.26.1251144808941; Mon, 24 
	Aug 2009 13:13:28 -0700 (PDT)
In-Reply-To: <20090824183057.GA6369@rhein.zuhause.netz>
References: <91283b620908241055p6b67a7edy44a3dee2f88e2b40@mail.gmail.com>
	<20090824183057.GA6369@rhein.zuhause.netz>
Date: Mon, 24 Aug 2009 21:13:28 +0100
Message-ID: <91283b620908241313y12559faei9c215560c103c508@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Qt problems
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
X-List-Received-Date: Mon, 24 Aug 2009 20:31:17 -0000
X-Groupsio-MsgNum: 12718
Content-Type: multipart/mixed; boundary=0016e65ae914e647ea0471e8d961

--0016e65ae914e647ea0471e8d961
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Here are the bb files.

qt4-embedded is the standard bb file.

libmusicbrainz is the latest version of this software - to get this to work
I had to use oe_soinstall to include libstdc++.so.6

dockamp is my own software which is the code written on Fedora Linux. I
chnaged a lot of the include paths as it could not locate the files. For
example:

#include
</home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkReply>
#include
</home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkAccessManager>
#include
</home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkRequest>

these were originally
#include <QNetworkReply>
etc...

and then for Qt libraries I had to change:

QT += QtDBusE QtNetworkE QtSqlE phononE QtXmlE

from

QT += dbus network sql phonon xml

I have been told that qmake should take care of this.

Thanks,
Stuart

2009/8/24 Henning Heinold <heinold@inf.fu-berlin.de>

> Hi,
>
> wihtout the recipe there is no chance to help you.
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

--0016e65ae914e647ea0471e8d961
Content-Type: application/octet-stream; name="dockamp.inc"
Content-Disposition: attachment; filename="dockamp.inc"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fyrn1bxd0

REVTQ1JJUFRJT04gPSAiZG9ja2FtcCBhcHBsaWNhdGlvbiBmb3IgU2ltcGxlIEF1ZGlvIgpMSUNF
TlNFID0gIklQIgpERVBFTkRTID0gInF0NC1lbWJlZGRlZCBjZHBhcmFub2lhIGxpYm11c2ljYnJh
aW56IgoKaW5oZXJpdCBxbWFrZTIKClNSQ19VUkkgPSAiZmlsZTovL2RvY2thbXAucHJvIgoKUyA9
ICIke1dPUktESVJ9IgoKI2V4cG9ydCBQQVRIKz0iJHtPVkVST1RPUH0vdG1wL3N0YWdpbmcvYXJt
djdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvdXNyL2xpYiIKCmRvX3VucGFjayAoKSB7CiAgICAg
ICAgI2NvcHkgdGhlIGRvY2thbXAucHJvIGZpbGUKICAgICAgICBjcCB+L292ZXJvLW9lL3Rlc3Qv
ZG9ja2FtcC5wcm8gJHtTfQogICAgICAgICNjb3B5IGV2ZXJ5dGhpbmcgaW50byB0aGUgZG9ja2Ft
cC0xLjAgZGlyZWN0b3J5CiAgICAgICAgY3AgLXIgfi9vdmVyby1vZS90ZXN0ICR7U30vJHtQfSAg
ICAKfQpkb19jb21waWxlX3ByZXBlbmQgKCkgewogICAgICAgIGV4cG9ydCBXT1JLSU5HX0RJUj0k
e1dPUktESVJ9LyR7UH0KICAgICAgICBleHBvcnQgSlNPTkhPTUU9JFdPUktJTkdfRElSL0pTT04K
ICAgICAgICBleHBvcnQgUVRTVEFURV9ESVI9JFdPUktJTkdfRElSL2J1aWxkX2RlcGVuZGVuY2ll
cy9xdHN0YXRlbWFjaGluZS0xLjEtb3BlbnNvdXJjZQogICAgICAgIG9lbm90ZSBSdW5uaW5nIG91
ciBjb25maWd1cmUgcHJlcGVuZCB3b3JraW5nX2RpciBpcyAkV09SS0lOR19ESVIKfQpkb19jb21w
aWxlKCkgewogICAgb2Vub3RlIFJ1bm5pbmcgb3VyIHFtYWtlIHdvcmsgZGlyIGlzICRXT1JLSU5H
X0RJUgogICAgY2QgJHtXT1JLSU5HX0RJUn0KICAgIHFtYWtlMiAke1dPUktJTkdfRElSfS9kb2Nr
YW1wLnBybwogICAgb2Vub3RlIFJ1bm5pbmcgb3VyIGxpYmluc3RhbGwgU0dOT1RFCiAgICBvZV9s
aWJpbnN0YWxsIC1zIGxpYlF0R3VpRSAke09WRVJPVE9QfS90bXAvd29yay9hcm12N2EtYW5nc3Ry
b20tbGludXgtZ251ZWFiaS9xdDQtZW1iZWRkZWQtNC41LjItcjE0LjEvcXQtZW1iZWRkZWQtbGlu
dXgtb3BlbnNvdXJjZS1zcmMtNC41LjIvbGliCiAgICBvZW5vdGUgUnVubmluZyBvdXIgbWFrZSBj
dXJyZW50IGRpciBpcyAkUFdECiAgICBjZCAke1dPUktJTkdfRElSfQogICAgbWFrZQogICAgb2Vu
b3RlIEZpbmlzaGVkIG91ciBxbWFrZQp9CmRvX2luc3RhbGwoKSB7CiAgICAgICAgaW5zdGFsbCAt
ZCAke0R9L29wdAogICAgICAgIGluc3RhbGwgLW0gMDY0NCAke1N9L2RvY2thbXAvZG9ja2FtcCAk
e0R9L29wdAp9CgpQQUNLQUdFX0FSQ0ggPSAiYWxsIgoKRklMRVNfJHtQTn0gPSAiL29wdCIK

--0016e65ae914e647ea0471e8d961
Content-Type: application/octet-stream; name="dockamp_1.0.bb"
Content-Disposition: attachment; filename="dockamp_1.0.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fyrn1v9x1

cmVxdWlyZSBkb2NrYW1wLmluYwppbmhlcml0IHF0NGUKCg==

--0016e65ae914e647ea0471e8d961
Content-Type: application/octet-stream; name="libmusicbrainz_3.0.2.bb"
Content-Disposition: attachment; filename="libmusicbrainz_3.0.2.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fyrn20i82

REVGQVVMVF9QUkVGRVJFTkNFID0gIjEiCgpERVNDUklQVElPTiA9ICJUaGUgTXVzaWNCcmFpbnog
Y2xpZW50IGlzIGEgbGlicmFyeSB3aGljaCBjYW4gYmUgYnVpbHQgaW50byBvdGhlciBwcm9ncmFt
cy4gXApJdCBhbGxvd3MgeW91IHRvIGFjY2VzcyB0aGUgZGF0YSBoZWxkIG9uIHRoZSBNdXNpY0Jy
YWlueiBzZXJ2ZXIuIgpIT01FUEFHRSA9ICJodHRwOi8vbXVzaWNicmFpbnoub3JnIgpMSUNFTlNF
ID0gIkxHUEwiCkRFUEVORFMgPSAiZXhwYXQgbmVvbiIKClNSQ19VUkkgPSAiaHR0cDovL2Z0cC5t
dXNpY2JyYWluei5vcmcvbGlibXVzaWNicmFpbnotMy4wLjIudGFyLmd6IgoKaW5oZXJpdCBjbWFr
ZSBwa2djb25maWcKCmRvX2NvbmZpZ3VyZV9wcmVwZW5kKCkgewogICAgb2Vub3RlIGRvaW5nIHBy
ZXBlbmQgb2YgY29uZmlndXJlIFNHTk9URQogICAgCiAgICBvZV9zb2luc3RhbGwgfi9vdmVyby1v
ZS90bXAvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS9nY2MtY3Jvc3MtNC4zLjMt
cjUuMS9pbnN0YWxsL2xpYnN0ZGMrKy91c3IvbGliL2xpYnN0ZGMrKy5zby42IFwKICAgICAgICAg
ICAgICAgICAvaG9tZS9zdHVhcnQvb3Zlcm8tb2UvdG1wL2Nyb3NzL2FybXY3YS9hcm0tYW5nc3Ry
b20tbGludXgtZ251ZWFiaS9saWIKfQoKZG9fc3RhZ2UoKSB7CglhdXRvdG9vbHNfc3RhZ2VfYWxs
Cn0KCg==

--0016e65ae914e647ea0471e8d961
Content-Type: application/octet-stream; name="qt4-embedded_4.5.2.bb"
Content-Disposition: attachment; filename="qt4-embedded_4.5.2.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fyrn2s3t3

cmVxdWlyZSBxdDQtZW1iZWRkZWQuaW5jCgpQUiA9ICIke0lOQ19QUn0uMSIKCkxJQ0VOU0UgPSAi
TEdQTHYyLjEgR1BMdjMiClNSQ19VUkkgKz0gImZpbGU6Ly8wMDEwLW5vLXNpbXBsZWRlY29yYXRp
b24tZXhhbXBsZS5wYXRjaDtwYXRjaD0xIFwKICAgICAgICAgICAgZmlsZTovL2hhY2stb3V0LXBn
X2NvbmZpZy5wYXRjaDtwYXRjaD0xIgo=

--0016e65ae914e647ea0471e8d961--
