Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web08.14042.1608927563122170279
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 12:19:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n6BbB+kq;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: rfried.dev@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id a109so4428903otc.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 12:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=djWmWWHtjwihcWwp53spLuCsMyIpodbScrQT/svHH7g=;
        b=n6BbB+kqiApKBbY9G2aHIdm9GwaYx6NhSvvB1pNxVXdEiEPgqYesBhs3zimc+AkKzm
         C0DlLclTNdI6pemDwyvVgRr/XvJopb/I3IKownz2e3ZhH0UKBLhcvUqU2C2kRKvoExWY
         yUXq4iN5Wxoo59KuR7vmeMmlM8xYtrFqIR3OYlvA8zirMN9/8Wnjf8NL5SpZvu66srww
         HNcksDZ4k/7KeRnT33wKu6VNPQMrjjA/0m4bYjVj1H96T0ekuRBrYn7vAcQvHIQRjKkm
         wJmvJVvCgHxEc+B8BVWqNSDNAkzKy3p+sEn4Cm6+riYhCYCcljrR2GRNNf7Jb1ODunt+
         Q3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=djWmWWHtjwihcWwp53spLuCsMyIpodbScrQT/svHH7g=;
        b=STUpcintyOyA7aZnBKc80J/oSRTqGs3RVZwLGNp0qDa0BLu9QA6Gl6rW1j4suGyllR
         H4LYK+sFq1mmvKCRp1kf/D5m/4DjD/r6TLno+A4yU+iDM7uZ0CvBVd+J2L0JSoBrOhyg
         duBZ1nSzTNbyfQMgq5a27pX9uJOZXuJP3xZ1h3539fX2gf/dGyeSsQ5sMWBBNlaHTfwB
         KIpHFMP6+P1U/ADBVGCy6LI9TI+MeTibn2Qnj2M3V3VQE9QA8EiEQsu4ZpwW800cKGmO
         LwvvXk/B8wuTLr+cLGO0HzPn+qv5uyvm0fldoTe3rnmHph8sGwy6p2Hn+BAqtZXYNG19
         OGSw==
X-Gm-Message-State: AOAM5321DvBVO+zeY6WgOGi6TVs2HuIVAikuImz50RXzB1odKZZFEjLZ
	G7yIjzw+sZyJOuJsWQfm7457pxQnlbZV60hBmtE=
X-Google-Smtp-Source: ABdhPJzbzMWE9QDV6pi0lpt4ZQCgU9YVsvnm1n3anaM3go9di78M8JPD7DNDm5teg3YCDIQd68Dpe97PV+X7ZQF3ZMs=
X-Received: by 2002:a05:6830:1e14:: with SMTP id s20mr26408481otr.210.1608927562459;
 Fri, 25 Dec 2020 12:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20201225145637.25443-1-rfried.dev@gmail.com> <CAB2nKc-srKMvzQoypa38ZMm18XCCKWi=ouFecjPVjuMLKWELKQ@mail.gmail.com>
In-Reply-To: <CAB2nKc-srKMvzQoypa38ZMm18XCCKWi=ouFecjPVjuMLKWELKQ@mail.gmail.com>
From: "Ramon Fried" <rfried.dev@gmail.com>
Date: Fri, 25 Dec 2020 22:19:11 +0200
Message-ID: <CAGi-RULAu0ZgW5DvhPSJVwJL0hQgFaPw0GwT9K_eprUnY2W9ww@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] yaml-cpp: add new recipe
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 25, 2020 at 5:19 PM Vincent Prince
<vincent.prince.fr@gmail.com> wrote:
>
> Hi,
>
> I think PV is wrongly set to " +git${SRCPV}" as the 9a362 commit corresp=
onds exactly to the 0.6.4 version.
Yes, it was added by devtool, I removed the line.
> Also, I'm not sure FILES_${PN} and do_install_append is required as Yoct=
o should put those files directly to the right place?
It's supposed to, I don't recall why I added those line, I'll try
again without them. I think I didn't see them installed in SDK.
>
> Best regards,
> Vincent
>
> Le ven. 25 d=C3=A9c. 2020 =C3=A0 15:55, Ramon Fried <rfried.dev@gmail.co=
m> a =C3=A9crit :
>>
>> yaml-cpp is a YAML parser and emitter in C++
>> matching the YAML 1.2 spec.
>>
>> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
>> ---
>>  .../yaml-cpp/yaml-cpp_0.6.3.bb                | 24 +++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
>>
>> diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb b/meta-=
oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
>> new file mode 100644
>> index 000000000..48e9c6fba
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
>> @@ -0,0 +1,24 @@
>> +SUMMARY =3D "yaml-cpp parser and emitter library"
>> +DESCRIPTION =3D "yaml-cpp is a YAML parser and emitter in C++ matching=
 the YAML 1.2 spec."
>> +HOMEPAGE =3D "https://github.com/jbeder/yaml-cpp"
>> +SECTION =3D "devel"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6a8aaf0595c2efc1a9c2e0913e9=
c1a2c"
>> +
>> +PV =3D "+git${SRCPV}"
>> +# yaml-cpp releases are stored as archive files in github.
>> +# download the exact revision of release
>> +SRC_URI =3D "git://github.com/jbeder/yaml-cpp.git"
>> +SRCREV =3D "9a3624205e8774953ef18f57067b3426c1c5ada6"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit cmake
>> +
>> +FILES_${PN} =3D "${libdir}/libyaml-cpp.so.*"
>> +EXTRA_OECMAKE =3D "-DYAML_CPP_BUILD_TESTS=3DOFF -DYAML_BUILD_SHARED_LI=
BS=3DON -DYAML_CPP_BUILD_TOOLS=3DOFF"
>> +
>> +do_install_append() {
>> +    install -d ${D}${includedir}/yaml-cpp
>> +    cp -r ${S}/include/yaml-cpp ${D}${includedir}/yaml-cpp
>> +}
>> --
>> 2.17.1
>>
>>
>>=20
>>
