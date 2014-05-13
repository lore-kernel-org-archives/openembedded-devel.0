Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f182.google.com (unknown [209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5C665EE2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 00:30:17 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id sa20so10071860veb.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 17:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=aokYNN8o1Tja85h+iiZBn+BOUfKEcbScbEUOllCYTCQ=;
	b=HBiIUAx/W13tv/aGTfKKFnaGGgA4UIXRl/3cKHlf40KE5Nh1D+9Vf76g022Xe9Mj8c
	Px+y0hUNV2yPuCefXafRnUYXP/d6TSRl/84JSFT+n/eFtkc4Y8ws9aNemh4jZz851q5b
	rzjwUBQd446gb6tKslIvq+0f1nNFjNl1py/G8yk3pnlDveUnscmi+1c34yzuw5TIZS3p
	lUykL0ZqUsjcImS0bc9tivbEwK3eyjvNfpFuRDlLeUU2UxAd/PEa1PQzqNbsosEy6aUJ
	pNSWKUdVH9c15pmyUfARtTD/Yd0hUxt7BkDMeOEgG8UsY0NtoTVRriHZFbhXiuShE43w
	fKlw==
MIME-Version: 1.0
X-Received: by 10.221.44.73 with SMTP id uf9mr26137426vcb.9.1399940688782;
	Mon, 12 May 2014 17:24:48 -0700 (PDT)
Received: by 10.52.80.226 with HTTP; Mon, 12 May 2014 17:24:48 -0700 (PDT)
In-Reply-To: <CALbNGRTX4xmQL_-xgQutMkZJsw2Npq9gWaQoFNVSBDy0RFYaOg@mail.gmail.com>
References: <1399887698-19336-1-git-send-email-schnitzeltony@googlemail.com>
	<1399887698-19336-4-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRTX4xmQL_-xgQutMkZJsw2Npq9gWaQoFNVSBDy0RFYaOg@mail.gmail.com>
Date: Tue, 13 May 2014 02:24:48 +0200
Message-ID: <CALbNGRSmDf7TE4PjszcA6vJvfqXt7bcvf-1keXNiJN3=s-eEAw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC][meta-qt5 3/3] qtwayland: install created private headers
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
X-List-Received-Date: Tue, 13 May 2014 00:30:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2014 at 2:17 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, May 12, 2014 at 11:41 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> buildhistory diff:
>> --- a/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwayland/q=
twayland-dev/latest
>> +++ b/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwayland/q=
twayland-dev/latest
>> @@ -4,6 +4,6 @@ PKGV =3D 5.2.1+git0+f9ebbd6c61
>>  RPROVIDES =3D
>>  RDEPENDS =3D qtwayland
>>  RRECOMMENDS =3D eglibc-dev libgcc-dev libstdc++-dev libxkbcommon-dev qt=
base-dev qtdeclarative-dev wayland-dev xproto-dev zlib-dev
>> -PKGSIZE =3D 295533
>> +PKGSIZE =3D 537651
>>  FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la /usr=
/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/*.=
o /usr/lib/qtwayland/*.la /lib/*.la
>> -FILELIST =3D /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/private/q=
wlclientbufferintegration_p.h /usr/include/qt5/QtCompositor/5.3.0/QtComposi=
tor/private/qwlclientbufferintegrat
>> +FILELIST =3D /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/private/q=
wayland-server-hardware-integration.h /usr/include/qt5/QtCompositor/5.3.0/Q=
tCompositor/private/qwayland-server
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  recipes-qt/qt5/qtwayland_git.bb | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_=
git.bb
>> index ebdda82..8da8249 100644
>> --- a/recipes-qt/qt5/qtwayland_git.bb
>> +++ b/recipes-qt/qt5/qtwayland_git.bb
>> @@ -9,3 +9,8 @@ SRCREV =3D "f9ebbd6c618488f9b671f5504528ced3350754fb"
>>  SRC_URI +=3D " \
>>      file://0001-examples.pro-include-server-buffer-only-when-buildin.pa=
tch \
>>  "
>> +
>> +do_install_append() {
>> +       # do install files created by qtwaylandscanner
>> +       install ${B}/include/QtCompositor/5.2.1/QtCompositor/private/{qw=
ayland-server-*,*protocol*}.h ${D}${includedir}/${QT_DIR_NAME}/QtCompositor=
/5.2.1/QtCompositor/private
> Aargh: Wrong directory did test with /usr/include and expected
> includedir =3D /usr/include -> V2 will follow
I should stop for today -> my error here was caused by updating QT
installing to 5.3.0 - patch should work - no V2 - sorry for the noise
>
> Andreas

