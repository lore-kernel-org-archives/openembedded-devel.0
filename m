Return-Path: <gurrieristefano@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 13B04755F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 09:48:33 +0000 (UTC)
Received: by ioll68 with SMTP id l68so216217643iol.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 02:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=/bJmpHcaLO1lTlBlRe3AlcHTWcRFmiOvpMKOS9+Xxkg=;
	b=kdOtr9zYBjPn5b+osPOAVx4LcZ4KFxTaKVuc/yep4Hf3djswdcLhBHVLm70vAymUZz
	+c5EeksVVSrE0cefyqFd/zYu1wDKQ1+5CPCsrubmS6H5E3CtV3RzH7wyAWw6hJ+/Mokp
	DtmfaN/7obWEIumZAoYUmwD10M5M4bVKjRczLC2N5bWJ50ERBFnB7f+zoKZtlygsWvax
	A3jB9uxmnvxsEQG3gUnMcauxf5NF3P0Q7Ft0/nhFqu8Q4iODVIrrACpBFqoZthHEBS1v
	DZUX4DzcSzddgtjVM3mIg38LmH0OKoM1LXzd8STN9fin2wQ73uRFHv6o3iVFpQxPYNHv
	G0dw==
MIME-Version: 1.0
X-Received: by 10.107.135.95 with SMTP id j92mr35370694iod.148.1445939313269; 
	Tue, 27 Oct 2015 02:48:33 -0700 (PDT)
Received: by 10.107.137.228 with HTTP; Tue, 27 Oct 2015 02:48:33 -0700 (PDT)
In-Reply-To: <20151026163201.GA20355@mail.spox.systems>
References: <CAKpvFF1Us5xk3EFTUE1oo5xF14CNZOkJmHN5_uR9o8_CRxSmVQ@mail.gmail.com>
	<CAB25Ju4q9v8_WPXbmpj_dAy7oasaiyRM2fhN5Gyrr7ZexgSmxQ@mail.gmail.com>
	<CAKpvFF32BXGy2_qr=xRpxc4tf4EHN2pWS2X7dWWJ4+ebhSGDxQ@mail.gmail.com>
	<20151026163201.GA20355@mail.spox.systems>
Date: Tue, 27 Oct 2015 10:48:33 +0100
Message-ID: <CAKpvFF1jD2wYZ-koY-az+g+WUiA=H4_A=qY1Wfo582kYK2DbZg@mail.gmail.com>
From: Stefano Gurrieri <gurrieristefano@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: qtmultimedia + qt5.3.2 + yocto dizzy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Oct 2015 09:48:37 -0000
X-Groupsio-MsgNum: 58056
Content-Type: multipart/mixed; boundary=001a113eae0e22bb57052312fb1a

--001a113eae0e22bb57052312fb1a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I also think that maybe some Gstreamer plugin missing.
But, having a look at my image recipe everything seems installed.
In attach, you can find my image recipe.
According to you, what missing?

Thanks a lot for your help.
Kind regards,
Stefano

2015-10-26 17:32 GMT+01:00 Stephano Cetola <stephanoc@gmail.com>:

> On 10/23, Stefano Gurrieri wrote:
> > Hi Stephano,
> > thanks for your fast reply.
> >
> > I tried to follow this link, but without success.
> > Specifically, I tried to add:
> >
> > PACKAGECONFIG_append_pn-qtmultimedia=3D " gstreamer010" in my local.con=
f
> >
> > and I've added this part of code in qtmultimedia.inc recipe:
> >
> > do_configure_prepend() { # disable openal test if it isn't enabled by
> > PACKAGECONFIG sed -i 's/^qtCompileTest(openal)/OE_OPENAL_ENABLED:
> > qtCompileTest(openal)/g' ${S}/qtmultimedia.pro # disable gstreamer-0.10
> > test if it isn't enabled by PACKAGECONFIG sed -i 's/^\( *\)qtCompileTes=
t(
> > gstreamer)/\1OE_GSTREAMER010_ENABLED:qtCompileTest(gstreamer) {/g' ${S}
> > /qtmultimedia.pro}
> > and removed patches:
> >
> > SRC_URI +=3D "\
> >     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
> >
>  file://0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch \
> > "
> >
> > present in my original qtmultimedia.inc file.
> >
> > Then I bake my qt5-custom-image successfully. Now, on my target, in
> > /usr/lib/qt5/plugins/mediaservice, I see:
> > libgstaudiodecoder.so  libgstcamerabin.so  libgstmediacapture.so
> > libgstmediaplayer.so
> >
> > but when I try to run (for example) videowidget application or player
> > application, I see these error:
> >
> > GStreamer-CRITICAL **: gst_object_ref_sink: assertion 'G_IS_OBJECT
> > (object)' failed
>
> Hmmm, I have never seen this error. Sounds like some Gstreamer plugins
> may be missing.
>
> Have a look at this custom image:
>
> http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboard
>
> I have used that in the past to successfully test video. Perhaps there
> are some packages in that image that you are missing. Hope this helps.
>
>
> >
> >
> > Could you help me?
> > Thanks a lot.
> > Stefano
> >
> > 2015-10-22 22:47 GMT+02:00 Stephano Cetola <stephanoc@gmail.com>:
> >
> > > Ciao Stefano,
> > >
> > > Take a look at this thread:
> > >
> > > https://community.freescale.com/message/391750#391750
> > >
> > > You are missing libgstmediaplayer.so. That link should help get you
> > > the right packages installed.
> > >
> > >
> > >
> > > On Thu, Oct 22, 2015 at 7:23 AM, Stefano Gurrieri
> > > <gurrieristefano@gmail.com> wrote:
> > > > Goodmorning,
> > > > I tried to compile Qt5.3.2 in my Yocto dizzy successfully etc=E2=80=
=A6
> > > > =E2=80=A6 but when I try to run (on my target based on iMX6) a vide=
owidget
> > > > application or player application=E2=80=A6 I always have the same e=
rror:
> > > > defaultServiceProvider::requestService(): no service found for -
> > > > "org.qt-project.qt.mediaplayer"
> > > > and I can=E2=80=99t to see a video. In /usr/lib/qt5/plugins/mediase=
rvice I=E2=80=99ve
> > > only
> > > > libqtmedia_audioengine.so library. Missing gstreamer multimedia
> service
> > > > plugins?
> > > >
> > > > Could you please help me?
> > > >
> > > > Thanks a lot.
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

--001a113eae0e22bb57052312fb1a
Content-Type: text/plain; charset=US-ASCII; name="qt5-custom-common.inc"
Content-Disposition: attachment; filename="qt5-custom-common.inc"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ig96wiv60

U1lTVEVNRF9JTlNUQUxMID0gIiBcCiAgICBzeXN0ZW1kIFwKICAgIHN5c3RlbWQtY29tcGF0LXVu
aXRzIFwKICAgIHN5c3RlbWQtc3BlZWQtaGFja3MgXAogICAgdWRldi1zeXN0ZW1kIFwKICAgIHJz
eXNsb2ctc3lzdGVtZCBcCiIKClNZU1ZfSU5TVEFMTCA9ICIgXAogICAgdWRldiBcCiAgICBzeXN2
aW5pdCBcCiAgICBpbml0c2NyaXB0cyBcCiIKCkNPTU1PTl9JTlNUQUxMID0gIiBcCiAgICBiYXNl
LWZpbGVzIFwKICAgIGJhc2UtcGFzc3dkIFwKICAgIGJ1c3lib3ggXAogICAgJHtAYmFzZV9jb250
YWlucygiTUFDSElORV9GRUFUVVJFUyIsICJzeXN0ZW1kIiwgIiR7U1lTVEVNRF9JTlNUQUxMfSIs
ICIke1NZU1ZfSU5TVEFMTH0iLCBkKX0gXAogICAgcGFja2FnZWdyb3VwLWZzbC1nc3RyZWFtZXIg
XAogICAgcGFja2FnZWdyb3VwLWJhc2UgXAoiCgpJTUFHRV9GRUFUVVJFUyArPSAic3NoLXNlcnZl
ci1vcGVuc3NoIHNwbGFzaCAiCgpkb19yb290ZnNbZGVwZW5kc10gKz0gInZpcnR1YWwva2VybmVs
OmRvX3BvcHVsYXRlX3N5c3Jvb3QiCgppbmhlcml0IGNvcmUtaW1hZ2UK

--001a113eae0e22bb57052312fb1a
Content-Type: application/octet-stream; name="qt5-custom-image.bb"
Content-Disposition: attachment; filename="qt5-custom-image.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ig96wivi1

IyBST0oKCnJlcXVpcmUgcXQ1LWN1c3RvbS1jb21tb24uaW5jCgpUT1VDSCA9ICcgJHtAYmFzZV9j
b250YWlucygiTUFDSElORV9GRUFUVVJFUyIsICJ0b3VjaHNjcmVlbiIsICJ0c2xpYiB0c2xpYi1j
YWxpYnJhdGUgdHNsaWItdGVzdHMiLCAiIixkKX0nCgpJTUFHRV9JTlNUQUxMID0gIiBcCiAgICAk
e0NPTU1PTl9JTlNUQUxMfSBcCiAgICBcCiAgICAke1RPVUNIfSBcCiAgICBcCglnY2MgZysrIGJp
bnV0aWxzIGxpYmdjYyBsaWJnY2MtZGV2IGxpYnN0ZGMrKyBsaWJzdGRjKystZGV2IGxpYnN0ZGMr
Ky1zdGF0aWNkZXYgXAoJYXV0b2NvbmYgYXV0b21ha2UgY2NhY2hlIGNoa2NvbmZpZyBnbGliLW5l
dHdvcmtpbmcgZ2xpYm1tIFwKCXBhY2thZ2Vncm91cC1jb3JlLWJ1aWxkZXNzZW50aWFsIHBrZ2Nv
bmZpZyBcCglib29zdCBjbWFrZSB6bGliIGdsaWItMi4wIHBhY2thZ2Vncm91cC1mc2wtdG9vbHMt
dGVzdGFwcHMgXAogICAgZ3N0cmVhbWVyIFwKICAgIGdzdC1tZXRhLXZpZGVvIFwKICAgIGdzdC1m
c2wtcGx1Z2luIFwKICAgIGdzdC1wbHVnaW5zLWJhc2UtYXBwIFwKICAgIGdzdC1wbHVnaW5zLWJh
c2UgXAogICAgZ3N0LXBsdWdpbnMtZ29vZCBcCiAgICBnc3QtcGx1Z2lucy1nb29kLXJ0c3AgXAog
ICAgZ3N0LXBsdWdpbnMtZ29vZC11ZHAgXAogICAgZ3N0LXBsdWdpbnMtZ29vZC1ydHBtYW5hZ2Vy
IFwKICAgIGdzdC1wbHVnaW5zLWdvb2QtcnRwIFwKICAgIGdzdC1wbHVnaW5zLWdvb2QtdmlkZW80
bGludXgyIFwKICAgIHJ1YnkgXAogICAgY3B1ZnJlcXV0aWxzIFwKICAgIG5hbm8gXAogICAgZ2Ri
IFwKICAgIG9wZW5zc2gtc2Z0cC1zZXJ2ZXIgXAogICAgcGFja2FnZWdyb3VwLWZzbC10b29scy10
ZXN0YXBwcyBcCiAgICBwYWNrYWdlZ3JvdXAtZnNsLXRvb2xzLWJlbmNobWFyayBcCiAgICBpbXgt
dnB1IFwKICAgIGlteC10ZXN0IFwKCXF0YmFzZSBcCglxdGJhc2UtZGV2IFwgICAgCQogICAgcXRi
YXNlLWZvbnRzIFwKCXF0YmFzZS1ta3NwZWNzIFwKICAgIHF0YmFzZS1wbHVnaW5zIFwKICAgIHF0
YmFzZS10b29scyBcCiAgICBxdGJhc2UtZXhhbXBsZXMgXCAKICAgIHF0ZGVjbGFyYXRpdmUgXAog
ICAgcXRkZWNsYXJhdGl2ZS1wbHVnaW5zIFwKICAgIHF0ZGVjbGFyYXRpdmUtdG9vbHMgXAogICAg
cXRkZWNsYXJhdGl2ZS1leGFtcGxlcyBcCiAgICBxdGRlY2xhcmF0aXZlLXFtbHBsdWdpbnMgXAog
ICAgcXRtdWx0aW1lZGlhIFwKICAgIHF0bXVsdGltZWRpYS1wbHVnaW5zIFwKICAgIHF0bXVsdGlt
ZWRpYS1leGFtcGxlcyBcCiAgICBxdG11bHRpbWVkaWEtcW1scGx1Z2lucyBcCiAgICBxdHN2ZyBc
CiAgICBxdHN2Zy1wbHVnaW5zIFwKICAgIHF0c2Vuc29ycyBcCiAgICBxdGltYWdlZm9ybWF0cy1w
bHVnaW5zIFwKICAgIHF0c3lzdGVtcyBcCiAgICBxdHN5c3RlbXMtdG9vbHMgXAogICAgcXRzeXN0
ZW1zLWV4YW1wbGVzIFwKICAgIHF0c3lzdGVtcy1xbWxwbHVnaW5zIFwKICAgIHF0c2NyaXB0IFwK
ICAgIHF0M2QgXAogICAgcXQzZC1leGFtcGxlcyBcCiAgICBxdDNkLXFtbHBsdWdpbnMgXAogICAg
cXQzZC10b29scyBcCiAgICBxdHdlYmtpdCBcCiAgICBxdHdlYmtpdC1leGFtcGxlcy1leGFtcGxl
cyBcCiAgICBxdHdlYmtpdC1xbWxwbHVnaW5zIFwKICAgIHF0Z3JhcGhpY2FsZWZmZWN0cy1xbWxw
bHVnaW5zIFwKICAgIHF0Y29ubmVjdGl2aXR5LXFtbHBsdWdpbnMgXAogICAgcXRsb2NhdGlvbi1w
bHVnaW5zIFwKICAgIHF0bG9jYXRpb24tcW1scGx1Z2lucyBcCiAgICBjaW5lbWF0aWNleHBlcmll
bmNlIFwKICAgIGNhaXJvIHBhbmdvIGZvbnRjb25maWcgZnJlZXR5cGUgcHVsc2VhdWRpbyBkYnVz
IFwKICAgIGFsc2EtbGliIGFsc2EtdG9vbHMgYWxzYS1zdGF0ZSBhbHNhLXV0aWxzLWFsc2Fjb25m
IGZzbC1hbHNhLXBsdWdpbnMgXAogICAgaTJjLXRvb2xzIFwKCWNhbnV0aWxzIFwKCXN0cmFjZSBc
CglsZGQgXAoiCgoK

--001a113eae0e22bb57052312fb1a--
