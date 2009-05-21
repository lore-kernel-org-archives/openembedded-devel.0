Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M7Auy-0000qO-6V
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 18:14:54 +0200
Received: by fxm20 with SMTP id 20so1163871fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2009 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=eFwbInX1ntEdLb4LUzpGCZmFWKAFtJEkdltuI0vWD5M=;
	b=LrcZ+RPoi0SDWR2vzY0CVnliNmcV9jwTfoZZlbQqwW31ieViYhSJ1/klN78WFTYBlo
	Qd1LIjPMLsEsRNcEvDKflDf6hRWI4ewT66BA9eKnYupuNzEARYlaMJeNuybj9A7T+lR4
	dIX88emfte8Yy+cuyl2yqS25MTYK2zkdgbNbA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xgOC64htgASVWy65KuTMm2RQg0kal1EQUU2Pjjgu/VZBNHW3wC2+EUnLgEBtpYC2CF
	LtcyCYL3Y0Ta6fto0s3SmYCiALOWqhwkulzsxY74bsNj6nplXTZCV+rH9hw8x653iyga
	OjNw/YttAu7zabfOElqnqaelBMJeM15RkCZk0=
MIME-Version: 1.0
Received: by 10.103.181.2 with SMTP id i2mr1463692mup.20.1242922035071; Thu, 
	21 May 2009 09:07:15 -0700 (PDT)
In-Reply-To: <gv3sse$qs0$1@ger.gmane.org>
References: <gv3n7s$1gg$1@ger.gmane.org>
	<1242917441-29996-1-git-send-email-ihar.hrachyshka@gmail.com>
	<fce2a370905210837w24570b90u33ee641630dfe19@mail.gmail.com>
	<gv3sse$qs0$1@ger.gmane.org>
Date: Thu, 21 May 2009 19:07:15 +0300
Message-ID: <fce2a370905210907i637dcf17m874ae162b423a5cb@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gst-plugins: fixed pattern for meta package dependencies.
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
X-List-Received-Date: Thu, 21 May 2009 16:15:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2009 at 6:44 PM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> On 21-05-09 17:37, Ihar Hrachyshka wrote:
>>
>> I just got that locale packages _don't_ end with 'locale'. Resending
>> reworked patch.
>
> *facepalm* I just realized the same *after* applying the patch. Oops...

Just fix it by yourself.

>
>>
>> On Thu, May 21, 2009 at 5:50 PM, Ihar Hrachyshka
>> <ihar.hrachyshka@gmail.com> =C2=A0wrote:
>>>
>>> This fixes package name matching so that gst-plugins-*-meta
>>> packages include all the plugin ones. The current matching
>>> implementation doesn't make meta packages depend on gst-plugins
>>> with 'locale' and 'dev' in their names (f.e. gstfbdevsink).
>>> Also use INC_PR for gstremer-plugins as requested on ML.
>>>
>>> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>
>>> ---
>>> =C2=A0recipes/gstreamer/gst-plugins-bad_0.10.11.bb =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 ++
>>> =C2=A0recipes/gstreamer/gst-plugins-bad_0.10.6.bb =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A03 ++-
>>> =C2=A0recipes/gstreamer/gst-plugins-base_0.10.17.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 ++
>>> =C2=A0recipes/gstreamer/gst-plugins-base_0.10.22.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 ++
>>> =C2=A0recipes/gstreamer/gst-plugins-base_0.10.23.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 ++
>>> =C2=A0recipes/gstreamer/gst-plugins-good_0.10.13.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-
>>> =C2=A0recipes/gstreamer/gst-plugins-good_0.10.14.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 ++
>>> =C2=A0recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb | =C2=A0 =C2=A03=
 ++-
>>> =C2=A0recipes/gstreamer/gst-plugins-ugly_0.10.10.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-
>>> =C2=A0recipes/gstreamer/gst-plugins-ugly_0.10.11.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 ++
>>> =C2=A0recipes/gstreamer/gst-plugins.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +++-
>>> =C2=A011 files changed, 21 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.11.bb
>>> b/recipes/gstreamer/gst-plugins-bad_0.10.11.bb
>>> index dbfe6a9..a90b88e 100644
>>> --- a/recipes/gstreamer/gst-plugins-bad_0.10.11.bb
>>> +++ b/recipes/gstreamer/gst-plugins-bad_0.10.11.bb
>>> @@ -1,5 +1,7 @@
>>> =C2=A0require gst-plugins.inc
>>>
>>> +PR =3D "${INC_PR}.1"
>>> +
>>> =C2=A0SRC_URI +=3D "file://vorbisenc.h file://vorbisdec.h \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ivorbis-thumb.patch;pa=
tch=3D1"
>>> =C2=A0DEPENDS +=3D "gst-plugins-base directfb"
>>> diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.6.bb
>>> b/recipes/gstreamer/gst-plugins-bad_0.10.6.bb
>>> index df7bf75..bfc7217 100644
>>> --- a/recipes/gstreamer/gst-plugins-bad_0.10.6.bb
>>> +++ b/recipes/gstreamer/gst-plugins-bad_0.10.6.bb
>>> @@ -1,5 +1,6 @@
>>> =C2=A0require gst-plugins.inc
>>> -PR =3D "r2"
>>> +
>>> +PR =3D "${INC_PR}.1"
>>>
>>> =C2=A0SRC_URI +=3D "file://vorbisenc.h file://vorbisdec.h \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gst-plugins-directfb-f=
ix.patch;patch=3D1;pnum=3D2 \
>>> diff --git a/recipes/gstreamer/gst-plugins-base_0.10.17.bb
>>> b/recipes/gstreamer/gst-plugins-base_0.10.17.bb
>>> index 0a1f17f..3b07668 100644
>>> --- a/recipes/gstreamer/gst-plugins-base_0.10.17.bb
>>> +++ b/recipes/gstreamer/gst-plugins-base_0.10.17.bb
>>> @@ -1,5 +1,7 @@
>>> =C2=A0require gst-plugins.inc
>>>
>>> +PR =3D "${INC_PR}.1"
>>> +
>>> =C2=A0PROVIDES +=3D "gst-plugins"
>>>
>>> =C2=A0# gst-plugins-base only builds the alsa plugin
>>> diff --git a/recipes/gstreamer/gst-plugins-base_0.10.22.bb
>>> b/recipes/gstreamer/gst-plugins-base_0.10.22.bb
>>> index 3086d93..bcbfd68 100644
>>> --- a/recipes/gstreamer/gst-plugins-base_0.10.22.bb
>>> +++ b/recipes/gstreamer/gst-plugins-base_0.10.22.bb
>>> @@ -1,5 +1,7 @@
>>> =C2=A0require gst-plugins.inc
>>>
>>> +PR =3D "${INC_PR}.1"
>>> +
>>> =C2=A0PROVIDES +=3D "gst-plugins"
>>>
>>> =C2=A0PR =3D "r2"
>>> diff --git a/recipes/gstreamer/gst-plugins-base_0.10.23.bb
>>> b/recipes/gstreamer/gst-plugins-base_0.10.23.bb
>>> index d3bfb6c..26dcfe3 100644
>>> --- a/recipes/gstreamer/gst-plugins-base_0.10.23.bb
>>> +++ b/recipes/gstreamer/gst-plugins-base_0.10.23.bb
>>> @@ -1,5 +1,7 @@
>>> =C2=A0require gst-plugins.inc
>>>
>>> +PR =3D "${INC_PR}.1"
>>> +
>>> =C2=A0PROVIDES +=3D "gst-plugins"
>>>
>>> =C2=A0# gst-plugins-base only builds the alsa plugin
>>> diff --git a/recipes/gstreamer/gst-plugins-good_0.10.13.bb
>>> b/recipes/gstreamer/gst-plugins-good_0.10.13.bb
>>> index b77d1fc..d077d06 100644
>>> --- a/recipes/gstreamer/gst-plugins-good_0.10.13.bb
>>> +++ b/recipes/gstreamer/gst-plugins-good_0.10.13.bb
>>> @@ -1,6 +1,6 @@
>>> =C2=A0require gst-plugins.inc
>>>
>>> -PR =3D "r1"
>>> +PR =3D "${INC_PR}.1"
>>>
>>> =C2=A0inherit gconf
>>>
>>> diff --git a/recipes/gstreamer/gst-plugins-good_0.10.14.bb
>>> b/recipes/gstreamer/gst-plugins-good_0.10.14.bb
>>> index d9f0349..d077d06 100644
>>> --- a/recipes/gstreamer/gst-plugins-good_0.10.14.bb
>>> +++ b/recipes/gstreamer/gst-plugins-good_0.10.14.bb
>>> @@ -1,5 +1,7 @@
>>> =C2=A0require gst-plugins.inc
>>>
>>> +PR =3D "${INC_PR}.1"
>>> +
>>> =C2=A0inherit gconf
>>>
>>> =C2=A0EXTRA_OECONF +=3D " --enable-experimental =C2=A0--enable-gst_v4l2
>>> --enable-gconftool =C2=A0--enable-external --with-check=3Dno"
>>> diff --git a/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
>>> b/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
>>> index 77c4184..40a4eb2 100644
>>> --- a/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
>>> +++ b/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
>>> @@ -1,7 +1,8 @@
>>> =C2=A0require gst-plugins.inc
>>> =C2=A0DEPENDS +=3D "gst-plugins-base libsidplay"
>>> =C2=A0PROVIDES +=3D "gst-plugin-sid"
>>> -PR =3D "r5"
>>> +
>>> +PR =3D "${INC_PR}.1"
>>>
>>> =C2=A0SRC_URI =3D "\
>>>
>>> http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-=
${PV}.tar.bz2
>>> \
>>> diff --git a/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
>>> b/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
>>> index 0678e22..9c28d20 100644
>>> --- a/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
>>> +++ b/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
>>> @@ -1,6 +1,6 @@
>>> =C2=A0require gst-plugins.inc
>>>
>>> -PR =3D "r1"
>>> +PR =3D "${INC_PR}.1"
>>>
>>> =C2=A0DEPENDS +=3D "gst-plugins-base mpeg2dec libsidplay"
>>>
>>> diff --git a/recipes/gstreamer/gst-plugins-ugly_0.10.11.bb
>>> b/recipes/gstreamer/gst-plugins-ugly_0.10.11.bb
>>> index 0624041..9c28d20 100644
>>> --- a/recipes/gstreamer/gst-plugins-ugly_0.10.11.bb
>>> +++ b/recipes/gstreamer/gst-plugins-ugly_0.10.11.bb
>>> @@ -1,5 +1,7 @@
>>> =C2=A0require gst-plugins.inc
>>>
>>> +PR =3D "${INC_PR}.1"
>>> +
>>> =C2=A0DEPENDS +=3D "gst-plugins-base mpeg2dec libsidplay"
>>>
>>> =C2=A0SRC_URI +=3D "\
>>> diff --git a/recipes/gstreamer/gst-plugins.inc
>>> b/recipes/gstreamer/gst-plugins.inc
>>> index bcb3e39..536555c 100644
>>> --- a/recipes/gstreamer/gst-plugins.inc
>>> +++ b/recipes/gstreamer/gst-plugins.inc
>>> @@ -3,6 +3,8 @@ DESCRIPTION =3D "Plugins for GStreamer"
>>> =C2=A0DEPENDS =3D "gstreamer libmikmod liboil libogg tremor libvorbis"
>>> =C2=A0DEPENDS +=3D "${@base_conditional('ENTERPRISE_DISTRO', '1', '', '=
libmad
>>> libid3tag', d)}"
>>>
>>> +INC_PR =3D "r5"
>>> +
>>> =C2=A0PACKAGES_DYNAMIC =3D "gst-plugin-*"
>>>
>>> =C2=A0SRC_URI =3D
>>> "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2"
>>> @@ -33,7 +35,7 @@ python populate_packages_prepend () {
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0metapkg_rdepends =3D []
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0packages =3D bb.data.getVar('PACKAGES', d, 1=
).split()
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0for pkg in packages[1:]:
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not pkg in blackl=
ist and not pkg in metapkg_rdepends
>>> and not pkg.count('dev') and not pkg.count( 'locale' ):
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not pkg in blackl=
ist and not pkg in metapkg_rdepends
>>> and not pkg.endswith('-dev') and not pkg.endswith('-locale'):
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0metapkg_rdepends.append(pkg)
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('RDEPENDS_' + metapkg, ' '.jo=
in(metapkg_rdepends),
>>> d)
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('DESCRIPTION_' + metapkg, pn =
+ ' meta package', d)
>>> --
>>> 1.6.3.1
>>>
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


