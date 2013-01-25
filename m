Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TyjHa-0000i4-3O
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 14:25:26 +0100
Received: by mail-vc0-f169.google.com with SMTP id n10so241750vcn.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 05:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=HOu7DhU9bjEVs0CFGrlZttx7ZXh7oeLiUrBof4m+/9Y=;
	b=JjWRVC60OWmTGoTHXn1wWVBwv1T7DQIA/LNfsBr7jl7mJ+aj/5LsVQpufM2KbDCAqM
	GXphFbDimLt1K4PN2CH/AjNbcqLGzLnBTGNWKMgW7JSLR2ZL0vWleXvdnISdTkC+tUYS
	F4NN/5tbdiJ2Krir+gVUx58WriUbAC2x5N1qvHtvO2CL1AOr8J+eaP3KefwW5u5td6fr
	4qtDHUrDHX88q/WJqQxz2EqUJB4FmwNSJGadnUuLXIm/xQtwtMLM/wxC70z5PR/AQTno
	Y/+28oWom6t8z/gzObvgBuTT9S0ckD7aYrL8bulT8imHM5qiHavBe7SjkUBdNm1m6MJa
	8/xg==
MIME-Version: 1.0
X-Received: by 10.220.149.81 with SMTP id s17mr5871003vcv.31.1359119391534;
	Fri, 25 Jan 2013 05:09:51 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Fri, 25 Jan 2013 05:09:51 -0800 (PST)
In-Reply-To: <20130125120236.GE3200@jama>
References: <1359114536-3823-1-git-send-email-schnitzeltony@googlemail.com>
	<1359114536-3823-2-git-send-email-schnitzeltony@googlemail.com>
	<20130125120236.GE3200@jama>
Date: Fri, 25 Jan 2013 14:09:51 +0100
Message-ID: <CALbNGRS07haZbBwbx=aNNhkR-kcdX1qHWGCDOJHkU4KcADAoDQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-systemd 1/5] thunar: add RRECOMMENDS and RDEPENDS to ensure full functionality
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
X-List-Received-Date: Fri, 25 Jan 2013 13:25:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 1:02 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Jan 25, 2013 at 12:48:52PM +0100, Andreas M=C3=BCller wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb |    5 +++++
>>  1 files changed, 5 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb b/meta-xfce/r=
ecipes-xfce/thunar/thunar_1.6.2.bb
>> index 55b54d4..aec2db1 100644
>> --- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
>> +++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
>> @@ -3,6 +3,7 @@ SECTION =3D "x11"
>>  LICENSE =3D "GPLv2"
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079ba=
e19f"
>>  DEPENDS =3D "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm=
 dbus-glib startup-notification libnotify xfce4-panel"
>> +PR =3D "r1"
>>
>>  inherit xfce
>>
>> @@ -22,3 +23,7 @@ FILES_${PN} +=3D "${libdir}/thunarx-2/* \
>>  FILES_${PN}-dbg +=3D "${libdir}/thunarx-2/.debug/ \
>>                      ${libdir}/xfce4/panel/plugins/.debug/ \
>>                      ${libdir}/Thunar/.debug/"
>> +
>> +# RRECOMMENDS does not drag in charmaps (tested with opkg)
>> +RDEPENDS_${PN} =3D "eglibc-charmaps"
>
> what about uclibc builds?
Good point - I forgot to remove it does not fix my password problem in
win environments anyway. Will send V2 later this evening.

Andreas


