Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <arteqw@gmail.com>) id 1MjJ1J-0008Lx-Id
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 22:35:01 +0200
Received: by bwz6 with SMTP id 6so214713bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2009 13:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=1mOQYvrpbLxgrdhsfig1t4KT3Soy+JHCzOUzT0JbNFI=;
	b=kLQRvHNrU9Jh4c7IX7kwQjrpOY/lNhG/4IwfoBrZ9cZroRLTo+kD2BQC4Q1oWei4kK
	3BN/7UJwaWEhsPyyJ+pW4hxubn0WMdABN81nU6RKwSvSJlFA63rHt0p2PBZthYAFo+xf
	6fMMkmV7KWgdXlnkzsH+Nbn6ZzE/0Q0CF/owM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Ijx3xD/zQvD+dyVkdyUy9Bk/+2HUIPdF7Zg57UKlDNGFU39AWPacD5NUCzFUeBF8Cu
	4NA+k/sbaSOGR3jNualn4By0KD9oPYf6lB8JF8bZMQXwq+Ai63vdjtLu0J/7GFJPlNGN
	JpORGNFyPWliKNYhkIvaPDWDfdcQksdEHH4As=
MIME-Version: 1.0
Received: by 10.204.7.86 with SMTP id c22mr8256308bkc.113.1252008544658; Thu, 
	03 Sep 2009 13:09:04 -0700 (PDT)
In-Reply-To: <20090903113150.GA22344@rhein.zuhause.netz>
References: <431b13f90909021248y7e0cc019pfb388fe9b3d2fc8e@mail.gmail.com>
	<20090903113150.GA22344@rhein.zuhause.netz>
Date: Thu, 3 Sep 2009 22:09:04 +0200
Message-ID: <431b13f90909031309l2cf9bea0rae96d4b015776682@mail.gmail.com>
From: Artur Wronowski <arteqw@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] add nzbget and libpar2
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
X-List-Received-Date: Thu, 03 Sep 2009 20:35:01 -0000
X-Groupsio-MsgNum: 12941
Content-Type: multipart/mixed; boundary=00151758857a8f66b90472b1f43e

--00151758857a8f66b90472b1f43e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks Henning for you help.

 I send fixed patch with SSL support for nntp servers. I hope that is
better patch than my first ;-)

2009/9/3 Henning Heinold <heinold@inf.fu-berlin.de>:
> On Wed, Sep 02, 2009 at 09:48:46PM +0200, Artur Wronowski wrote:
>> Hello!
>>
>> This is my first patch to openembedded. I woud like add nzbget and libpa=
r2.
>>
>> +inherit autotools pkgconfig
>> +
>> +do_stage() {
>> + =C2=A0 =C2=A0 autotools_stage_all
>> +}
>> +
>
> You can use autotools_stage here, do avoid the extrad do_stage
>
>
>> diff --git a/recipes/nzbget/nzbget_0.6.0.bb b/recipes/nzbget/nzbget_0.6.=
0.bb
>> new file mode 100644
>> index 0000000..1f75124
>> --- /dev/null
>> +++ b/recipes/nzbget/nzbget_0.6.0.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION =3D "NZBGet is a command-line based binary newsgrabber for =
nzb files, written in C++"
>> +SECTION =3D "net"
>> +LICENSE =3D "GPL"
>> +HOMEPAGE =3D "http://nzbget.sourceforge.net/Main_Page"
>> +DEPENDS =3D "libsigc++-2.0 libpar2 ncurses libxml2"
>> +
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/nzbget/nzbget-stable/nzbget-${PV}.ta=
r.gz"
>> +# http://sourceforge.net/projects/nzbget/files/nzbget-stable/nzbget-0.6=
.0.tar.gz
>> +
>> +inherit autotools pkgconfig
>> +
>> +EXTRA_OECONF =3D "--disable-tls \
>
> Why is tls disabled here?
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-libcurses-libraries=
=3D${STAGING_LIBDIR} \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-libcurses-includes=3D=
${STAGING_INCDIR} \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-libpar2-includes=3D{S=
TAGING_INCDIR} \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-libpar2-libraries=3D{=
STAGING_INCDIR}"
>> +
>> +do_stage() {
>> + =C2=A0 =C2=A0 autotools_stage_all
>> +}
>
> autotools_stage again
>
>> diff --git a/recipes/nzbget/nzbget_0.7.0-testing.bb b/recipes/nzbget/nzb=
get_0.7.0-testing.bb
>> new file mode 100644
>> index 0000000..e0f9b5c
>> --- /dev/null
>> +++ b/recipes/nzbget/nzbget_0.7.0-testing.bb
>> @@ -0,0 +1,23 @@
>> +DESCRIPTION =3D "NZBGet is a command-line based binary newsgrabber for =
nzb files, written in C++"
>> +SECTION =3D "net"
>> +LICENSE =3D "GPL"
>> +HOMEPAGE =3D "http://nzbget.sourceforge.net/Main_Page"
>> +DEPENDS =3D "libsigc++-2.0 libpar2 ncurses libxml2"
>> +
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/nzbget/nzbget-stable/nzbget-${PV}-r3=
42.tar.gz"
>> +
>> +# http://sourceforge.net/projects/nzbget/files/nzbget-testing/nzbget-0.=
7.0-testing-r342.tar.gz
>> +
>> +inherit autotools pkgconfig
>> +
>> +EXTRA_OECONF =3D "--disable-tls \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-libcurses-libraries=
=3D${STAGING_LIBDIR} \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-libcurses-includes=3D=
${STAGING_INCDIR} \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-libpar2-includes=3D{S=
TAGING_INCDIR} \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-libpar2-libraries=3D{=
STAGING_INCDIR}"
>> +
>> +do_stage() {
>> + =C2=A0 =C2=A0 autotools_stage_all
>> +}
>> +
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Pozdrawiam, Artur
http://artekw.net / GG: 151817 / JID: artekw@jabberpl.org

--00151758857a8f66b90472b1f43e
Content-Type: text/x-patch; charset=US-ASCII; name="nzbget_and_dep_latest.patch"
Content-Disposition: attachment; filename="nzbget_and_dep_latest.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fz5xh3yd0

ZGlmZiAtLWdpdCBhL2NvbmYvY2hlY2tzdW1zLmluaSBiL2NvbmYvY2hlY2tzdW1zLmluaQppbmRl
eCAxMzc3ODE2Li4wZDNlODQ0IDEwMDY0NAotLS0gYS9jb25mL2NoZWNrc3Vtcy5pbmkKKysrIGIv
Y29uZi9jaGVja3N1bXMuaW5pCkBAIC0yODkzNCwzICsyODkzNCwxNCBAQCBzaGEyNTY9ZjU3YzRl
MzNlYjJjZGQ4N2E2YzJmMDFiZmE0Nzk0MzQwZmJlNjFlYTFhMWNmYzdkYWMzYjY2NzFlMWRkMjJh
ZgogbWQ1PTVmN2I4OGViYjJiY2Q3ZTgwNDQzMjg0ODJkMDc5NjYxCiBzaGEyNTY9ZjU3YzRlMzNl
YjJjZGQ4N2E2YzJmMDFiZmE0Nzk0MzQwZmJlNjFlYTFhMWNmYzdkYWMzYjY2NzFlMWRkMjJhZgog
CitbaHR0cDovL2Rvd25sb2Fkcy5zb3VyY2Vmb3JnZS5uZXQvcGFyY2hpdmUvbGlicGFyMi9saWJw
YXIyLTAuMi50YXIuZ3pdCittZDU9OTRjNmRmNGUzOGVmZTA4MDU2ZWNkZTJhMDRlMGJlOTEKK3No
YTI1Nj0wNzRmYmY4NDBmNzNiMWUxM2UwNDA1ZmNlMjYxMDc4YzgxYzhjMGE0ODU5ZTMwYTdiYmEx
MDUxMGY5MTk5OTA4CisKK1todHRwOi8vZG93bmxvYWRzLnNvdXJjZWZvcmdlLm5ldC9uemJnZXQv
bnpiZ2V0LXN0YWJsZS9uemJnZXQtMC42LjAudGFyLmd6XQorbWQ1PWViOTViMzkzMGFiZmZiNTcw
ZTM3YWY4ZDI4NGMxZjlkCitzaGEyNTY9YjBiYzg3NDBkYjdlZDllYTI2OWIyOWU5YTkzNmNiMmM0
ZGQ2MWE5MTFiODBiNjIzZmUxODcyOWI5NGRlMzAzMAorCitbaHR0cDovL2Rvd25sb2Fkcy5zb3Vy
Y2Vmb3JnZS5uZXQvbnpiZ2V0L256YmdldC1zdGFibGUvbnpiZ2V0LTAuNy4wLXRlc3RpbmctcjM0
Mi50YXIuZ3pdCittZDU9NDI1MGQ4MTY2OTY5MzY3YjRmZWZmNDIwNGI0MmVjYjkKK3NoYTI1Nj0z
N2M1OTVlNzhjNGE1Yzg2ZmExYzM5ZDRkYmEzOTc4NmQ5NTQ2YWUwYTA3OGI5MzY4MzJkZjlkMTdi
YWZiYTEwCmRpZmYgLS1naXQgYS9yZWNpcGVzL2xpYnBhcjIvbGlicGFyMl8wLjIuYmIgYi9yZWNp
cGVzL2xpYnBhcjIvbGlicGFyMl8wLjIuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMC4uYjMzN2M1ZgotLS0gL2Rldi9udWxsCisrKyBiL3JlY2lwZXMvbGlicGFyMi9saWJwYXIy
XzAuMi5iYgpAQCAtMCwwICsxLDE0IEBACitERVNDUklQVElPTiA9ICJQcm92aWRpbmcgYSB0b29s
IHRvIGFwcGx5IHRoZSBkYXRhLXJlY292ZXJ5IGNhcGFiaWxpdHkgY29uY2VwdHMgb2YgUkFJRC1s
aWtlIHN5c3RlbXMgdG8gdGhlIHBvc3RpbmcgJiByZWNvdmVyeSBvZiBtdWx0aS1wYXJ0IGFyY2hp
dmVzIG9uIFVzZW5ldC4iCitTRUNUSU9OID0gImxpYnMiCitMSUNFTlNFID0gIkdQTCIKK0hPTUVQ
QUdFID0gImh0dHA6Ly9wYXJjaGl2ZS5zb3VyY2Vmb3JnZS5uZXQvIgorREVQRU5EUyA9ICJsaWJz
aWdjKystMi4wIgorCitTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS9wYXJjaGl2ZS9s
aWJwYXIyL2xpYnBhcjItJHtQVn0udGFyLmd6IgorCitpbmhlcml0IGF1dG90b29scyBwa2djb25m
aWcKKworZG9fc3RhZ2UoKSB7CisJYXV0b3Rvb2xzX3N0YWdlX2FsbAorfQorCmRpZmYgLS1naXQg
YS9yZWNpcGVzL256YmdldC9uemJnZXRfMC42LjAuYmIgYi9yZWNpcGVzL256YmdldC9uemJnZXRf
MC42LjAuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uNzlmZjdjNAotLS0g
L2Rldi9udWxsCisrKyBiL3JlY2lwZXMvbnpiZ2V0L256YmdldF8wLjYuMC5iYgpAQCAtMCwwICsx
LDIyIEBACitERVNDUklQVElPTiA9ICJOWkJHZXQgaXMgYSBjb21tYW5kLWxpbmUgYmFzZWQgYmlu
YXJ5IG5ld3NncmFiYmVyIGZvciBuemIgZmlsZXMsIHdyaXR0ZW4gaW4gQysrIgorU0VDVElPTiA9
ICJuZXQiCitMSUNFTlNFID0gIkdQTCIKK0hPTUVQQUdFID0gImh0dHA6Ly9uemJnZXQuc291cmNl
Zm9yZ2UubmV0L01haW5fUGFnZSIKK0RFUEVORFMgPSAibGlic2lnYysrLTIuMCBsaWJwYXIyIG5j
dXJzZXMgbGlieG1sMiBvcGVuc3NsIgorUFIgPSAicjAiCisKK1NSQ19VUkkgPSAiJHtTT1VSQ0VG
T1JHRV9NSVJST1J9L256YmdldC9uemJnZXQtc3RhYmxlL256YmdldC0ke1BWfS50YXIuZ3oiCisK
K2luaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZworCitkb19zdGFnZSgpIHsKKwlhdXRvdG9vbHNf
c3RhZ2VfYWxsCit9CisKK0VYVFJBX09FQ09ORiA9ICItLXdpdGgtdGxzbGliPU9wZW5TU0wgXAor
CQktLXdpdGgtbGliY3Vyc2VzLWxpYnJhcmllcz0ke1NUQUdJTkdfTElCRElSfSBcCisJCS0td2l0
aC1saWJjdXJzZXMtaW5jbHVkZXM9JHtTVEFHSU5HX0lOQ0RJUn0gXAorCQktLXdpdGgtbGlicGFy
Mi1saWJyYXJpZXM9e1NUQUdJTkdfSU5DRElSfSBcCisJCS0td2l0aC1saWJwYXIyLWluY2x1ZGVz
PXtTVEFHSU5HX0lOQ0RJUn0gXAorCQktLXdpdGgtb3BlbnNzbC1saWJyYXJpZXM9e1NUQUdJTkdf
SU5DRElSfSBcCisJCS0td2l0aC1vcGVuc3NsLWluY2x1ZGVzPXtTVEFHSU5HX0lOQ0RJUn0iCmRp
ZmYgLS1naXQgYS9yZWNpcGVzL256YmdldC9uemJnZXRfMC43LjAtdGVzdGluZy5iYiBiL3JlY2lw
ZXMvbnpiZ2V0L256YmdldF8wLjcuMC10ZXN0aW5nLmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAuLjI4OWI1ODAKLS0tIC9kZXYvbnVsbAorKysgYi9yZWNpcGVzL256YmdldC9u
emJnZXRfMC43LjAtdGVzdGluZy5iYgpAQCAtMCwwICsxLDIyIEBACitERVNDUklQVElPTiA9ICJO
WkJHZXQgaXMgYSBjb21tYW5kLWxpbmUgYmFzZWQgYmluYXJ5IG5ld3NncmFiYmVyIGZvciBuemIg
ZmlsZXMsIHdyaXR0ZW4gaW4gQysrLiBUZXN0aW5nIHZlcnNpb24uIgorU0VDVElPTiA9ICJuZXQi
CitMSUNFTlNFID0gIkdQTCIKK0hPTUVQQUdFID0gImh0dHA6Ly9uemJnZXQuc291cmNlZm9yZ2Uu
bmV0L01haW5fUGFnZSIKK0RFUEVORFMgPSAibGlic2lnYysrLTIuMCBsaWJwYXIyIG5jdXJzZXMg
bGlieG1sMiBvcGVuc3NsIgorUFIgPSAicjAiCisKK1NSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9N
SVJST1J9L256YmdldC9uemJnZXQtc3RhYmxlL256YmdldC0ke1BWfS1yMzQyLnRhci5neiIKKwor
aW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnCisKK2RvX3N0YWdlKCkgeworCWF1dG90b29sc19z
dGFnZV9hbGwKK30KKworRVhUUkFfT0VDT05GID0gIi0td2l0aC10bHNsaWI9T3BlblNTTCBcCisJ
CS0td2l0aC1saWJjdXJzZXMtbGlicmFyaWVzPSR7U1RBR0lOR19MSUJESVJ9IFwKKwkJLS13aXRo
LWxpYmN1cnNlcy1pbmNsdWRlcz0ke1NUQUdJTkdfSU5DRElSfSBcCisJCS0td2l0aC1saWJwYXIy
LWxpYnJhcmllcz17U1RBR0lOR19JTkNESVJ9IFwKKwkJLS13aXRoLWxpYnBhcjItaW5jbHVkZXM9
e1NUQUdJTkdfSU5DRElSfSBcCisJCS0td2l0aC1vcGVuc3NsLWxpYnJhcmllcz17U1RBR0lOR19J
TkNESVJ9IFwKKwkJLS13aXRoLW9wZW5zc2wtaW5jbHVkZXM9e1NUQUdJTkdfSU5DRElSfSIK

--00151758857a8f66b90472b1f43e--
