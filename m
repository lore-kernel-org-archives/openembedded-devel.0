Received: from mail-pz0-f193.google.com ([209.85.222.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OGGJO-0004gR-GY
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 20:54:14 +0200
Received: by pzk31 with SMTP id 31so1263517pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 11:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=E545yBFPDPvwkHhzyelRRSv9AtaQ0/WQYKrtZucLE1w=;
	b=ayP659ZubA7CrjKY2ZZ6qHDHcZR/af56FPHKqNcs3sqxalvKb4WnUbDSc+sUBus1vF
	5thGCRf8U3vzkKlgBmt7RFRdzw7jxTnVuNq0CaBuMsVnQYZVz5K8q2iTwpW2OFKJ+oVT
	vBLf7o5XEUscdAlQ+xTq1LGR6v8L7GA1dTyYM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bULsjzTEyo0l/sgx6vOH/RupUFzli2oB8dXlO6Dhzg68okmm1LmZ+KwCewDKuz2UDD
	M6GnbZA4gVWHnrl2QuzMWklDguHdJmAn7N0Hdk+s+5LSqf3/q0DcIKhv1Rgpspm3KmP7
	lFefq+mIgIXDB0zaAXyoH96YaJJ2ViQfTDBpU=
MIME-Version: 1.0
Received: by 10.140.248.8 with SMTP id v8mr3294365rvh.9.1274640604189; Sun, 23 
	May 2010 11:50:04 -0700 (PDT)
Received: by 10.141.51.17 with HTTP; Sun, 23 May 2010 11:50:04 -0700 (PDT)
In-Reply-To: <AANLkTinzfd9OTFGIFxcCCdaxgXZ3lJm1OorWVxg0njNG@mail.gmail.com>
References: <AANLkTikuptIZDURk9aJb5xqB22op3_cnR1OU7iQ0JfY0@mail.gmail.com>
	<hso7dv$2lh$1@dough.gmane.org>
	<AANLkTinzfd9OTFGIFxcCCdaxgXZ3lJm1OorWVxg0njNG@mail.gmail.com>
Date: Sun, 23 May 2010 15:50:04 -0300
Message-ID: <AANLkTimLcmTnl-zjJR9SVHRaX7GlKjhYT_IMiOy-eQtJ@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.193
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add lksctp tools
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
X-List-Received-Date: Sun, 23 May 2010 18:54:14 -0000
X-Groupsio-MsgNum: 19506
Content-Type: multipart/mixed; boundary=000e0cd116ba6dd6c20487476452

--000e0cd116ba6dd6c20487476452
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Attached a unique patch.

Thanks.

2010/5/16 Jo=C3=A3o Henrique Freitas <joaohf@gmail.com>:
> The same thing.
>
> ---
> =C2=A0recipes/lksctp-tools/lksctp-tools.inc =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A03 +--
> =C2=A0recipes/lksctp-tools/lksctp-tools_1.0.7.bb | =C2=A0 =C2=A04 ----
> =C2=A02 files changed, 1 insertions(+), 6 deletions(-)
>
> diff --git a/recipes/lksctp-tools/lksctp-tools.inc
> b/recipes/lksctp-tools/lksctp-tools.inc
> index 678531e..02ec988 100644
> --- a/recipes/lksctp-tools/lksctp-tools.inc
> +++ b/recipes/lksctp-tools/lksctp-tools.inc
> @@ -1,8 +1,7 @@
> =C2=A0DESCRIPTION =3D "The Linux Kernel Stream Control Transmission Proto=
col
> (lksctp) project"
> =C2=A0SECTION =3D "libs"
> =C2=A0PRIORITY =3D "optional"
> -LICENSE =3D "GPLv2"
> -#DEPENDS_virtclass-native =3D "python-native"
> +LICENSE =3D "LGPLv2"
>
> =C2=A0S =3D "${WORKDIR}/${BPN}-${PV}"
>
> diff --git a/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
> b/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
> index 34c2ce5..1d4faa3 100644
> --- a/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
> +++ b/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
> @@ -3,9 +3,5 @@ PR =3D "${INC_PR}.0"
>
> =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz=
"
>
> -PARALLEL_MAKE =3D ""
> -CCACHE =3D ""
> -
> -
> =C2=A0SRC_URI[md5sum] =3D "047562b40537eb3be5d5ec3ae0a2198b"
> =C2=A0SRC_URI[sha256sum] =3D
> "e920e89d110cff9847f1d86a1d7a23a156a8abcc9e65a35655d687fd08377595"
> --
> 1.7.0.4
>
>
>
> --
> -----------------------------------------------------------
> Jo=C3=A3o Henrique Freitas - joaohf_at_gmail.com
> Campinas-SP-Brasil
> BSD051283
> LPI 1
> http://www.joaohfreitas.eti.br
>



--=20
-----------------------------------------------------------
Jo=C3=A3o Henrique Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil
BSD051283
LPI 1
http://www.joaohfreitas.eti.br

--000e0cd116ba6dd6c20487476452
Content-Type: text/x-diff; charset=US-ASCII; name="lksctp-tools.patch"
Content-Disposition: attachment; filename="lksctp-tools.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g9k83m021

ZGlmZiAtLWdpdCBhL3JlY2lwZXMvbGtzY3RwLXRvb2xzL2xrc2N0cC10b29scy5pbmMgYi9yZWNp
cGVzL2xrc2N0cC10b29scy9sa3NjdHAtdG9vbHMuaW5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAuLjAyZWM5ODgKLS0tIC9kZXYvbnVsbAorKysgYi9yZWNpcGVzL2xrc2N0cC10
b29scy9sa3NjdHAtdG9vbHMuaW5jCkBAIC0wLDAgKzEsMjggQEAKK0RFU0NSSVBUSU9OID0gIlRo
ZSBMaW51eCBLZXJuZWwgU3RyZWFtIENvbnRyb2wgVHJhbnNtaXNzaW9uIFByb3RvY29sIChsa3Nj
dHApIHByb2plY3QiCitTRUNUSU9OID0gImxpYnMiCitQUklPUklUWSA9ICJvcHRpb25hbCIKK0xJ
Q0VOU0UgPSAiTEdQTHYyIgorCitTID0gIiR7V09SS0RJUn0vJHtCUE59LSR7UFZ9IgorCitJTkNf
UFIgPSAicjAiCisKK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIgorCitpbmhlcml0IGF1dG90b29s
cyBwa2djb25maWcgYmluY29uZmlnCisKK2V4cG9ydCBMREZMQUdTICs9ICItbGRsIgorCitkb19p
bnN0YWxsX2FwcGVuZF92aXJ0Y2xhc3MtbmF0aXZlKCkgeworCToKK30KKworREVCSUFOTkFNRV8k
e1BOfSA9ICJsa3NjdHAiCisKK1BBQ0tBR0VTID0rICIke1BOfS10b29scyIKK0ZJTEVTXyR7UE59
ID0gIiR7bGliZXhlY2Rpcn0vKiAke2xpYmRpcn0vbGliKiR7U09MSUJTfSBcCisgICAgICAgICAg
ICAke3N5c2NvbmZkaXJ9ICR7c2hhcmVkc3RhdGVkaXJ9ICR7bG9jYWxzdGF0ZWRpcn0gXAorICAg
ICAgICAgICAgJHtiYXNlX2xpYmRpcn0vKiR7U09MSUJTfSIKKworRklMRVNfJHtQTn0tZGV2ICs9
ICIke2JpbmRpcn0vKi1jb25maWciCitGSUxFU18ke1BOfS11dGlscyA9ICIiCmRpZmYgLS1naXQg
YS9yZWNpcGVzL2xrc2N0cC10b29scy9sa3NjdHAtdG9vbHNfMS4wLjcuYmIgYi9yZWNpcGVzL2xr
c2N0cC10b29scy9sa3NjdHAtdG9vbHNfMS4wLjcuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMC4uMWQ0ZmFhMwotLS0gL2Rldi9udWxsCisrKyBiL3JlY2lwZXMvbGtzY3RwLXRv
b2xzL2xrc2N0cC10b29sc18xLjAuNy5iYgpAQCAtMCwwICsxLDcgQEAKK3JlcXVpcmUgbGtzY3Rw
LXRvb2xzLmluYworUFIgPSAiJHtJTkNfUFJ9LjAiCisKK1NSQ19VUkkgPSAiJHtTT1VSQ0VGT1JH
RV9NSVJST1J9L2xrc2N0cC9sa3NjdHAtdG9vbHMtJHtQVn0udGFyLmd6IgorCitTUkNfVVJJW21k
NXN1bV0gPSAiMDQ3NTYyYjQwNTM3ZWIzYmU1ZDVlYzNhZTBhMjE5OGIiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZTkyMGU4OWQxMTBjZmY5ODQ3ZjFkODZhMWQ3YTIzYTE1NmE4YWJjYzllNjVhMzU2
NTVkNjg3ZmQwODM3NzU5NSIK

--000e0cd116ba6dd6c20487476452--
