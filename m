Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RY6XD-0003vR-Iq
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 02:42:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB71a97C023806
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Dec 2011 17:36:10 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 6 Dec 2011 17:36:09 -0800
Message-ID: <4EDEC246.5080306@windriver.com>
Date: Wed, 7 Dec 2011 09:32:54 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1323141676.git.xiaofeng.yan@windriver.com>
	<db85bdb92ce1ffd1840f4fb719035d3b5692888e.1323141676.git.xiaofeng.yan@windriver.com>
	<4EDEABA5.2030505@linux.intel.com>
In-Reply-To: <4EDEABA5.2030505@linux.intel.com>
X-Originating-IP: [128.224.162.146]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	pB71a97C023806
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core][PATCH 04/10] gtk.inc: add feature based on directfb
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
X-List-Received-Date: Wed, 07 Dec 2011 01:43:00 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B412=E6=9C=8807=E6=97=A5 07:56, Saul Wold wrote:
> On 12/05/2011 09:58 PM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> gtk run over x11 at current OE-core. If gtk want to run over=20
>> directfb, then \
>> the configuration related to x11 should be disabled and directfb=20
>> should be enabled.
>>
>> [YOCTO #1674]
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> meta/recipes-gnome/gtk+/gtk+.inc | 16 ++++++++++++++--
>> 1 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-gnome/gtk+/gtk+.inc=20
>> b/meta/recipes-gnome/gtk+/gtk+.inc
>> index 39a4f4a..7fc55e2 100644
>> --- a/meta/recipes-gnome/gtk+/gtk+.inc
>> +++ b/meta/recipes-gnome/gtk+/gtk+.inc
>> @@ -12,11 +12,18 @@ SECTION =3D "libs"
>>
>> X11DEPENDS =3D "virtual/libx11 libxext libxcursor libxrandr libxdamage=
=20
>> libxrender libxcomposite"
>> DEPENDS =3D "glib-2.0 pango atk jpeg libpng gtk-doc-native=20
>> gdk-pixbuf-native docbook-utils-native \
>> - libgcrypt cairo gdk-pixbuf ${X11DEPENDS}"
>> + libgcrypt cairo gdk-pixbuf"
>> +
>> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'x11'=
,=20
>> '', d)} \
>> + ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
>> +
>> +PACKAGECONFIG[x11] =3D "--with-x=3Dyes=20
>> --with-gdktarget=3Dx11,--with-x=3Dno,${X11DEPENDS}"
>> +PACKAGECONFIG[directfb] =3D "--with-gdktarget=3Ddirectfb,,directfb"
>> +
>>
> This change with the change prior (Split X11 Dependencies) should be 1=20
> commit, while below should be a second commit, you are still mixing=20
> different items together in 1 commit.
>
>> inherit autotools pkgconfig
>>
>> -PACKAGES +=3D "libgail"
>> +PACKAGES +=3D "libgail gtk-demo"
>>
>> FILES_${PN} =3D "${bindir}/gtk-update-icon-cache \
>> ${bindir}/gtk-query-immodules-2.0 \
>> @@ -41,6 +48,11 @@ FILES_${PN}-dbg +=3D " \
>> ${libdir}/gtk-2.0/${LIBV}/engines/.debug/* \
>> ${libdir}/gtk-2.0/${LIBV}/printbackends/.debug/*"
>>
>> +FILES_gtk-demo =3D " \
>> + ${datadir}/gtk-2.0/demo/* \
>> + ${bindir}/gtk-demo \
>> + "
>> +
> This and the above PACKAGES +=3D change should be in a separate commit=20
> from the PACKAGECONFIG and DEPENDS changes above.
>
> Sau!
Yes, it looks better.
Thanks for your suggestion.
I will push it again after fixing.

Thanks
Yan
>
>> FILES_libgail =3D " \
>> ${libdir}/gtk-2.0/modules/libgail.so \
>> ${libdir}/gtk-2.0/modules/libferret.so \
>



