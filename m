Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id BF1D975894
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 23:41:07 +0000 (UTC)
Received: by wmll128 with SMTP id l128so23180760wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 16:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=o/zrmx0MrR5jTPK8Q+wUX6BJ/yEOqyCgaLepIJPniI4=;
	b=LNnl79eCJ79cxw0pNnFX4GJe43eqJViYejWElVpAnLvB/G+uEgLqWLrVhxA/Joe6Ek
	dfcPApNpKAc0nN7AxJMed+av75LK0BUX4H4BhqhzPkHmtYMerVhJRfhnWcracjbELGuN
	CRvqrgVGTP5aKuo0S27epqpk9K1QdgQGZq5PV9tyRoOY/0ujknIfkIu9IHaJ8lSNnw3t
	o5ylwo8XDg6oxe21eWsJqGqaRaiT45IjJ/JPxfD7dw5zPkGZjGY9mtEx1C7bxj3hBy0H
	h4Hb3b1JgiAsM6Qzk23822z2/3yGCqCNs4QFIalX5POgmBDQp8DVVIHVRDF4Nk3IPHdV
	V6tw==
MIME-Version: 1.0
X-Received: by 10.28.23.66 with SMTP id 63mr727604wmx.4.1446248466719; Fri, 30
	Oct 2015 16:41:06 -0700 (PDT)
Received: by 10.194.140.38 with HTTP; Fri, 30 Oct 2015 16:41:06 -0700 (PDT)
In-Reply-To: <CALbNGRS-8OJ=XiWQcKjQeKZ9BBvBwUZMJ_yXr2HZ=DKL+S7Eqg@mail.gmail.com>
References: <1446232789-12178-1-git-send-email-armccurdy@gmail.com>
	<CALbNGRS-8OJ=XiWQcKjQeKZ9BBvBwUZMJ_yXr2HZ=DKL+S7Eqg@mail.gmail.com>
Date: Fri, 30 Oct 2015 16:41:06 -0700
Message-ID: <CAJ86T=WxQUoJmsbQBwWXwRosHJorbM4Kkmr7K2CJRavyJVZaNQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ninja-native: add initial recipe, ninja 1.6.0
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
X-List-Received-Date: Fri, 30 Oct 2015 23:41:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 12:31 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Oct 30, 2015 at 8:19 PM, Andre McCurdy <armccurdy@gmail.com> wrot=
e:
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  .../recipes-devtools/ninja/ninja-native_1.6.0.bb   | 25 +++++++++++++++=
+++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb
>>
>> diff --git a/meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb b/meta=
-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb
>> new file mode 100644
>> index 0000000..c00710a
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY =3D "Ninja is a small build system with a focus on speed."
>> +HOMEPAGE =3D "http://martine.github.com/ninja/"
>> +LICENSE =3D "Apache-2.0"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da81586a64ad4e476c791cda7e2f2=
c52e"
>> +
>> +DEPENDS =3D "re2c-native"
>> +
>> +inherit native
>> +
>> +SRCREV=3D"484c16336f19bd8970bb6e75322d61b92a229899"
>> +
>> +SRC_URI =3D "git://github.com/martine/ninja.git;branch=3Drelease"
>> +
>> +S=3D"${WORKDIR}/git"
>> +
>> +do_configure[noexec] =3D "1"
>> +
>> +do_compile() {
>> +    python ${S}/configure.py --bootstrap
>> +}
>> +
>> +do_install() {
>> +    install -d ${D}${bindir}
>> +    install -m 0755 ${S}/ninja ${D}${bindir}/
>> +}
>> --
>> 1.9.1
>>
> Yes ninja-native needs a more central place. Currently we have it (at
> least - I checked my environment only) in
>
> meta-qt5
> meta-browser
> meta-tizen
>
> Once applied: Would you send patches to the other layers?

Those layers all currently use older versions of ninja.

Since I can't easily test all the packages in these layers, it's
probably best if the respective layer maintainers take care of
removing their own ninja-native recipes at their own pace (ie once
they've tested against ninja 1.6.0 in meta-oe and confirmed that
everything works as expected).


> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

