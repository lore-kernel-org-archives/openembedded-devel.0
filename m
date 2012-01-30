Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rs0lo-0002pI-Ne
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 00:36:20 +0100
Received: by lahc1 with SMTP id c1so2470074lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 15:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=2gYJRDt5lhMe6nAaPe0sNygdbcm/zOtxj/DwOEOmzsI=;
	b=Fuj5aoIcq08vBoOu6IJHcjwPmwiHszcuYoZizNxFEiEF23b+zc0pNLGjpei9/ZibF8
	jZ3zWXI4dNB2OEy+XCWgcTAAGXJFk+Dupw4zn8SAKj3PX406xp/aiOy71u4gRMaEp/Uq
	hjKxLBrtIruhdz4dUoWutSZkPU56L7vndnzKw=
Received: by 10.152.114.169 with SMTP id jh9mr9926912lab.20.1327966107331;
	Mon, 30 Jan 2012 15:28:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 30 Jan 2012 15:27:57 -0800 (PST)
In-Reply-To: <4F2712E6.2000302@gmail.com>
References: <1327954536-29427-1-git-send-email-tworaz666@gmail.com>
	<CALbNGRRFydx6qqfMUCGrTzLsvAp5N+N8K4ox_fJMZUf6cRZtSg@mail.gmail.com>
	<4F2712E6.2000302@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jan 2012 15:27:57 -0800
Message-ID: <CAMKF1sqOD0ejNgGJPZqZqyQYciTHabLi15Fkp12FKXphh1bnSg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH] Add recipe for xarchiver 0.5.2.
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
X-List-Received-Date: Mon, 30 Jan 2012 23:36:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 2:00 PM, Peter Tworek <tworaz666@gmail.com> wrote:
> On 01/30/2012 10:45 PM, Andreas M=C3=BCller wrote:
>>
>> On Mon, Jan 30, 2012 at 9:15 PM, Peter Tworek<tworaz666@gmail.com> =C2=
=A0wrote:
>>>
>>> Run tested on netbookpro.
>>>
>>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
>>> ---
>>> =C2=A0.../recipes-apps/xarchiver/xarchiver_0.5.2.bb =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 16
>>> ++++++++++++++++
>>> =C2=A01 files changed, 16 insertions(+), 0 deletions(-)
>>> =C2=A0create mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5=
.2.bb
>>>
>>> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
>>> b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
>>> new file mode 100644
>>> index 0000000..b2e5fb6
>>> --- /dev/null
>>> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
>>> @@ -0,0 +1,16 @@
>>> +DESCRIPTION =3D "Lightweight desktop independent, GTK+ archive manager=
"
>>> +HOMEPAGE =3D "http://xarchiver.sourceforge.net"
>>> +SECTION =3D "x11"
>>> +PR =3D "r0"
>>> +
>>> +LICENSE =3D "GPLv2"
>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
>>> +
>>> +DEPENDS =3D "gtk+ glib-2.0 xfce4-dev-tools"
>>
>> Do you need xfce4-dev-tools on the target or isn't
>> xfce4-dev-tools-native enough?
>
> Quick tested it and yeah, xfce4-dev-tools-native is enough. There are jus=
t
> needed for do_configure. Do you need another patch?

yes since they are picked from patchwork as it is. Please submit a V2


