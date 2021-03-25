Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.508.1616693536372012356
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 10:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tpjVXds0;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id hq27so4249302ejc.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 10:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Vfw/qcY8V8zfkN/Fo8DR74MLaDsiNwwiMcNOqJEriPk=;
        b=tpjVXds0hncZlHbX4gnyQRJF91iChmMJvFZrxQ3TBEp7QMWHe5d3M/Eg2bMGpIVOnm
         KTjYTtDAmlYLOLPpC/q5VS1YYlRn7kJ+Qrb7FKEj+v4cZwg35aVevcGyoLoDsddkQSNE
         uY1FWNOoG8US4uKHDreXr1bAgk5i6BXF7HVB99GMt1MZtmi26YpRYvWf6xDZAy63Vx6P
         PgxbcqNmmwqqQmCzAsJxBTO7eA/ZcacXfkOXTr9V/vew+aKNn5Ym/KLgrE71ltMsGT2e
         ilJMbw9kyD0CPMvWj82Kj0Yur9gMvuHSBJrAlagfQOCpIAFXk/wwE32HTbRXoD7TZ7/2
         G1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Vfw/qcY8V8zfkN/Fo8DR74MLaDsiNwwiMcNOqJEriPk=;
        b=iQeY/XYFNusCrOczURD1/PRNM9Tk16vBXxY1IqRIhLoenaLeygrjlDQVYqsPdPEoT7
         xFlTHc11W1RpV1mVb6GS3zRxZ2yaApb4NjNbVrO3jGIr8GXrdWSHU/dklm3IATOO7nTX
         G5EBTIsYHm9JOQSpohqQ7r3aIbDak/qun16Lb/1HwzRud4TgRf1deWSXRPxAM7iy8bVx
         t1hm0P8pwSVsxS4/SPpB+JOrXyYGtSzPxc09o0uSrQOuEb/ntOyca6OFfLGHFmm9eQ1n
         daUGg5pUoYEu2K6YYki7DjtF4KsGThvVszVlmt7rB33Dc+nu/TR6WeHZwKfhZntq+/j9
         EvEA==
X-Gm-Message-State: AOAM532ekpqxKub8gyD6wX7yrpx/6FEDayYSmCaFn2Zeiha5AZ76zVGq
	wqqEE9ZKQyxvukUJf7qsPbYu5QQyiPH85TVcxJURKki4
X-Google-Smtp-Source: ABdhPJxmN5B1+5x9CV0S1LS62Ai88udOUb7fdrEudvhCilQW0AWoFq4D33qHxGB6n85qMXOsk0R9wAKXQcUBxq6AflI=
X-Received: by 2002:a17:907:76c7:: with SMTP id kf7mr10611409ejc.470.1616693534654;
 Thu, 25 Mar 2021 10:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210324164659.390543-1-Martin.Jansa@gmail.com> <20210324164659.390543-4-Martin.Jansa@gmail.com>
In-Reply-To: <20210324164659.390543-4-Martin.Jansa@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 25 Mar 2021 18:32:03 +0100
Message-ID: <CA+chaQcgtPWQRLGgNgycLPo1=DCq_sd-W4yJn5TPoO+8MW-jxA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 4/4] mysql-python, lio-utils, openlmi-tools: add conditional PNBLACKLIST like meta-python2 does
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d8042c05be5fcba9"

--000000000000d8042c05be5fcba9
Content-Type: text/plain; charset="UTF-8"

The packagegroup-meta-oe.bb part of this is wrong, will fix and send v2
shortly.

On Wed, Mar 24, 2021 at 5:47 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> * it depends on target python(2) recipes from meta-python2 which are
> restricted with this
>   conditional since:
>
> https://git.openembedded.org/meta-python2/commit/?h=hardknott&id=10c65fc18998d302f34634ffceaf31ab335056dd
>
> * telepathy-idle and cherokee from:
>   meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
>   meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
>   also depend on meta-python2, but use only pythonnative from there, so
> they aren't blacklisted.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 6 +++---
>  meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb            | 2 ++
>  meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb   | 2 ++
>  meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb         | 2 ++
>  4 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index e9fcf71a76..0328478ae7 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -220,7 +220,7 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
>  "
>
>  RDEPENDS_packagegroup-meta-oe-dbs-python2 ="\
> -    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2",
> "mysql-python", "", d)} \
> +    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2",
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes',
> 'mysql-python', '', d}", "", d)} \
>  "
>
>  RDEPENDS_packagegroup-meta-oe-devtools ="\
> @@ -439,7 +439,7 @@ RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64
> = "upm libleak mraa sysdig
>  RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm libleak mraa
> sysdig tiptop"
>
>  RDEPENDS_packagegroup-meta-oe-extended-python2 ="\
> -    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2",
> "openlmi-tools", "", d)} \
> +    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2",
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes',
> 'openlmi-tools', '', d}", "", d)} \
>  "
>
>  RDEPENDS_packagegroup-meta-oe-gnome ="\
> @@ -916,7 +916,7 @@ RDEPENDS_packagegroup-meta-oe-support_append_x86 = "
> mcelog mce-inject mce-test
>  RDEPENDS_packagegroup-meta-oe-support_append_x86-64 = " mcelog mce-inject
> mce-test open-vm-tools vboxguestdrivers"
>
>  RDEPENDS_packagegroup-meta-oe-support-python2 ="\
> -    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2",
> "lio-utils", "", d)} \
> +    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2",
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'lio-utils',
> '', d}", "", d)} \
>  "
>
>  RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
> diff --git a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
> b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
> index 4617da8e1b..43fc69073f 100644
> --- a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
> +++ b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
> @@ -16,6 +16,8 @@ SRC_URI[sha256sum] =
> "811040b647e5d5686f84db415efd697e6250008b112b6909ba77ac059e
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> +PNBLACKLIST[mysql-python] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +
>  inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2",
> "setuptools", "", d)}
>
>  python() {
> diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
> b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
> index 04f82d2bcd..6009cd0304 100644
> --- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
> +++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
> @@ -7,6 +7,8 @@ SECTION = "System/Management"
>
>  inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2",
> "setuptools", "", d)}
>
> +PNBLACKLIST[openlmi-tools] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +
>  DEPENDS = "python-native python-pywbem-native python-m2crypto
> python-pywbem"
>
>  SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
> diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> index 0fb4a6e516..4891fd187d 100644
> --- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> +++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> @@ -55,6 +55,8 @@ do_install() {
>      install -m 755 ${S}/conf/lio_start.default
> ${D}/etc/target/lio_start.sh
>  }
>
> +PNBLACKLIST[lio-utils] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +
>  RDEPENDS_${PN} += "python-stringold python-subprocess python-shell \
>      python-datetime python-textutils python-crypt python-netclient
> python-email \
>      bash"
> --
> 2.30.2
>
>

--000000000000d8042c05be5fcba9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The <a href=3D"http://packagegroup-meta-oe.bb" target=3D"_=
blank">packagegroup-meta-oe.bb</a> part of this is wrong, will fix and send=
 v2 shortly.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Mar 24, 2021 at 5:47 PM Martin Jansa &lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* it de=
pends on target python(2) recipes from meta-python2 which are restricted wi=
th this<br>
=C2=A0 conditional since:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-python2/commit/?h=3Dhar=
dknott&amp;id=3D10c65fc18998d302f34634ffceaf31ab335056dd" rel=3D"noreferrer=
" target=3D"_blank">https://git.openembedded.org/meta-python2/commit/?h=3Dh=
ardknott&amp;id=3D10c65fc18998d302f34634ffceaf31ab335056dd</a><br>
<br>
* telepathy-idle and cherokee from:<br>
=C2=A0 meta-oe/recipes-connectivity/telepathy/<a href=3D"http://telepathy-i=
dle_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">telepathy-idle_0.2.0.bb<=
/a><br>
=C2=A0 meta-webserver/recipes-httpd/cherokee/<a href=3D"http://cherokee_git=
.bb" rel=3D"noreferrer" target=3D"_blank">cherokee_git.bb</a><br>
=C2=A0 also depend on meta-python2, but use only pythonnative from there, s=
o they aren&#39;t blacklisted.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a> |=
 6 +++---<br>
=C2=A0meta-oe/recipes-dbs/mysql/<a href=3D"http://mysql-python_1.2.5.bb" re=
l=3D"noreferrer" target=3D"_blank">mysql-python_1.2.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0meta-oe/recipes-extended/openlmi/<a href=3D"http://openlmi-tools_0.10=
.5.bb" rel=3D"noreferrer" target=3D"_blank">openlmi-tools_0.10.5.bb</a>=C2=
=A0 =C2=A0| 2 ++<br>
=C2=A0meta-oe/recipes-support/lio-utils/<a href=3D"http://lio-utils_4.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">lio-utils_4.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A04 files changed, 9 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegr=
oup-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.b=
b</a> b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-m=
eta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=
<br>
index e9fcf71a76..0328478ae7 100644<br>
--- a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a><b=
r>
+++ b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a><b=
r>
@@ -220,7 +220,7 @@ RDEPENDS_packagegroup-meta-oe-dbs =3D&quot;\<br>
=C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS_packagegroup-meta-oe-dbs-python2 =3D&quot;\<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&quot;BBFILE_COLLECTIONS&quot;, &quot;m=
eta-python2&quot;, &quot;mysql-python&quot;, &quot;&quot;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&quot;BBFILE_COLLECTIONS&quot;, &quot;m=
eta-python2&quot;, &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_MIGRATE_TO_PY=
THON3&#39;, &#39;yes&#39;, &#39;mysql-python&#39;, &#39;&#39;, d}&quot;, &q=
uot;&quot;, d)} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS_packagegroup-meta-oe-devtools =3D&quot;\<br>
@@ -439,7 +439,7 @@ RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 =
=3D &quot;upm libleak mraa sysdig<br>
=C2=A0RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 =3D &quot;upm l=
ibleak mraa sysdig tiptop&quot;<br>
<br>
=C2=A0RDEPENDS_packagegroup-meta-oe-extended-python2 =3D&quot;\<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&quot;BBFILE_COLLECTIONS&quot;, &quot;m=
eta-python2&quot;, &quot;openlmi-tools&quot;, &quot;&quot;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&quot;BBFILE_COLLECTIONS&quot;, &quot;m=
eta-python2&quot;, &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_MIGRATE_TO_PY=
THON3&#39;, &#39;yes&#39;, &#39;openlmi-tools&#39;, &#39;&#39;, d}&quot;, &=
quot;&quot;, d)} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS_packagegroup-meta-oe-gnome =3D&quot;\<br>
@@ -916,7 +916,7 @@ RDEPENDS_packagegroup-meta-oe-support_append_x86 =3D &q=
uot; mcelog mce-inject mce-test<br>
=C2=A0RDEPENDS_packagegroup-meta-oe-support_append_x86-64 =3D &quot; mcelog=
 mce-inject mce-test open-vm-tools vboxguestdrivers&quot;<br>
<br>
=C2=A0RDEPENDS_packagegroup-meta-oe-support-python2 =3D&quot;\<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&quot;BBFILE_COLLECTIONS&quot;, &quot;m=
eta-python2&quot;, &quot;lio-utils&quot;, &quot;&quot;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&quot;BBFILE_COLLECTIONS&quot;, &quot;m=
eta-python2&quot;, &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_MIGRATE_TO_PY=
THON3&#39;, &#39;yes&#39;, &#39;lio-utils&#39;, &#39;&#39;, d}&quot;, &quot=
;&quot;, d)} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS_packagegroup-meta-oe-support_remove_arm =3D&quot;numactl&quo=
t;<br>
diff --git a/meta-oe/recipes-dbs/mysql/<a href=3D"http://mysql-python_1.2.5=
.bb" rel=3D"noreferrer" target=3D"_blank">mysql-python_1.2.5.bb</a> b/meta-=
oe/recipes-dbs/mysql/<a href=3D"http://mysql-python_1.2.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">mysql-python_1.2.5.bb</a><br>
index 4617da8e1b..43fc69073f 100644<br>
--- a/meta-oe/recipes-dbs/mysql/<a href=3D"http://mysql-python_1.2.5.bb" re=
l=3D"noreferrer" target=3D"_blank">mysql-python_1.2.5.bb</a><br>
+++ b/meta-oe/recipes-dbs/mysql/<a href=3D"http://mysql-python_1.2.5.bb" re=
l=3D"noreferrer" target=3D"_blank">mysql-python_1.2.5.bb</a><br>
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] =3D &quot;811040b647e5d5686f84db415efd=
697e6250008b112b6909ba77ac059e<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<br>
+PNBLACKLIST[mysql-python] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+<br>
=C2=A0inherit ${@bb.utils.contains(&quot;BBFILE_COLLECTIONS&quot;, &quot;me=
ta-python2&quot;, &quot;setuptools&quot;, &quot;&quot;, d)}<br>
<br>
=C2=A0python() {<br>
diff --git a/meta-oe/recipes-extended/openlmi/<a href=3D"http://openlmi-too=
ls_0.10.5.bb" rel=3D"noreferrer" target=3D"_blank">openlmi-tools_0.10.5.bb<=
/a> b/meta-oe/recipes-extended/openlmi/<a href=3D"http://openlmi-tools_0.10=
.5.bb" rel=3D"noreferrer" target=3D"_blank">openlmi-tools_0.10.5.bb</a><br>
index 04f82d2bcd..6009cd0304 100644<br>
--- a/meta-oe/recipes-extended/openlmi/<a href=3D"http://openlmi-tools_0.10=
.5.bb" rel=3D"noreferrer" target=3D"_blank">openlmi-tools_0.10.5.bb</a><br>
+++ b/meta-oe/recipes-extended/openlmi/<a href=3D"http://openlmi-tools_0.10=
.5.bb" rel=3D"noreferrer" target=3D"_blank">openlmi-tools_0.10.5.bb</a><br>
@@ -7,6 +7,8 @@ SECTION =3D &quot;System/Management&quot;<br>
<br>
=C2=A0inherit ${@bb.utils.contains(&quot;BBFILE_COLLECTIONS&quot;, &quot;me=
ta-python2&quot;, &quot;setuptools&quot;, &quot;&quot;, d)}<br>
<br>
+PNBLACKLIST[openlmi-tools] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+<br>
=C2=A0DEPENDS =3D &quot;python-native python-pywbem-native python-m2crypto =
python-pywbem&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://fedorahosted.org/released/$%7BBPN=
%7D/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://fedorahos=
ted.org/released/${BPN}/${BP}.tar.gz</a> \<br>
diff --git a/meta-oe/recipes-support/lio-utils/<a href=3D"http://lio-utils_=
4.1.bb" rel=3D"noreferrer" target=3D"_blank">lio-utils_4.1.bb</a> b/meta-oe=
/recipes-support/lio-utils/<a href=3D"http://lio-utils_4.1.bb" rel=3D"noref=
errer" target=3D"_blank">lio-utils_4.1.bb</a><br>
index 0fb4a6e516..4891fd187d 100644<br>
--- a/meta-oe/recipes-support/lio-utils/<a href=3D"http://lio-utils_4.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">lio-utils_4.1.bb</a><br>
+++ b/meta-oe/recipes-support/lio-utils/<a href=3D"http://lio-utils_4.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">lio-utils_4.1.bb</a><br>
@@ -55,6 +55,8 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0install -m 755 ${S}/conf/lio_start.default ${D}/etc/tar=
get/lio_start.sh<br>
=C2=A0}<br>
<br>
+PNBLACKLIST[lio-utils] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_MIG=
RATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of sup=
port for long time, read <a href=3D"https://www.python.org/doc/sunset-pytho=
n-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/sunse=
t-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferrer=
" target=3D"_blank">https://python3statement.org/</a> and if you really hav=
e to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quot;=
yes&quot;&#39;, d)}&quot;<br>
+<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;python-stringold python-subprocess python-s=
hell \<br>
=C2=A0 =C2=A0 =C2=A0python-datetime python-textutils python-crypt python-ne=
tclient python-email \<br>
=C2=A0 =C2=A0 =C2=A0bash&quot;<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div>

--000000000000d8042c05be5fcba9--
