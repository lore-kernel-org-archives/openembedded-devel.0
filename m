Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web09.36360.1606142810476195909
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 06:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=udRS9mx8;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id y4so17352573edy.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 06:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5O3uoMPvRjFp8qY/1C/VVMMeoJEj7sQC6b7uFoSPyR8=;
        b=udRS9mx8d6GS60wZq0M4cX36yTdnHOs2HR1NwHpmI5o/fSrjLySOS6Jcze7eJrOAgk
         UxI2crYYsDjdjH7jEw+TnKZuwtDznyXER54+AM5LnK+xcgTMCY0sXfEPoPgsVXqLURAZ
         ukgaGav8sZLp/xufkd4o6DrxxsE8KzdsFObR6289AqPqYz3KYtfkuYEQOOhBz+4wSowJ
         8J2se+Jnt6V2Rr4wV6b81Pp+AO0642O9rB7izodddqbaT9Co4eKOPmkUYzDQ9WhGB80n
         jgO82wb4cHrD6ovoMfaxnwbqgmOahgeliGeGt/kAHEtMd2K3Lzohw3Fgib1WXNDdVt3g
         5/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5O3uoMPvRjFp8qY/1C/VVMMeoJEj7sQC6b7uFoSPyR8=;
        b=mSGSBhVxmRAblKVYNpjFvoM7M50iaeEQIyFVuKYmXlZZHnaxYE3UsK2fK/IRcRVuo9
         oQLnipqrDARBWe1vnZnYZsQMTp9CdpGjyRnx7Yn/aq2h2HDJ6YqtX0MSQw9B88NZOJC9
         T619KYn/7fGEEF/kK6HOZ7hc9cdlF7L7IKYLiyib+MdX5V/J28904w8KHTTbBDLqZFhr
         TnLWl8bCV+WSLcbUpakQ31gkdRFsBk3TItSNUe+vzSuxC0DrmolX2+p9JkyfW4o7Oyzd
         F0g2KixRfbf/RV6qHF6TfD4ZtvL8bqgPiALT04OjAtHXqK/P3QsmEnugnOsUcbX7zLJg
         mu7g==
X-Gm-Message-State: AOAM531Sqv41q6gXutrLRCFZvyaHxAT5A8YBmvV3eblxATFWRkqRk8c3
	5gFnpRxyPsAC02ikGX9Tfbzifd233f9m967Cm0M=
X-Google-Smtp-Source: ABdhPJwNrLmhcuKY9lFwUJ6z4beOFktCLXcweY+9qlsAsvB+7lu5RCOtRHXb+0D723CYdKTOZt8o3ZrVZBTiPVv0rdY=
X-Received: by 2002:a50:a40c:: with SMTP id u12mr34709567edb.337.1606142808681;
 Mon, 23 Nov 2020 06:46:48 -0800 (PST)
MIME-Version: 1.0
References: <20201119155823.2741395-1-raj.khem@gmail.com>
In-Reply-To: <20201119155823.2741395-1-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 23 Nov 2020 15:46:36 +0100
Message-ID: <CA+chaQd27zuYdE4Op9JrRtBFiEWEKCAyQ=o-FcRHi8dWtrYBeA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] thingsboard-gateway: Move under dynamic layers
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000091f0af05b4c7430c"

--00000000000091f0af05b4c7430c
Content-Type: text/plain; charset="UTF-8"

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

BTW: "python3-jsonpath-rw: Add recipe for v1.4.0" commit is also only in
master-next branch (and after this), so thingsboard-gateway_2.5.2.bb is
broken in master completely (not only when meta-python layer isn't
included).

On Thu, Nov 19, 2020 at 4:58 PM Khem Raj <raj.khem@gmail.com> wrote:

> Depends on meta-python therefore move it here so it does not impact non
> meta-python users
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../thingsboard-gateway/thingsboard-gateway/bacnet.json           | 0
>  .../thingsboard-gateway/thingsboard-gateway/ble.json              | 0
>  .../thingsboard-gateway/thingsboard-gateway/can.json              | 0
>  .../thingsboard-gateway/thingsboard-gateway/custom_serial.json    | 0
>  .../thingsboard-gateway/thingsboard-gateway/logs.conf             | 0
>  .../thingsboard-gateway/thingsboard-gateway/modbus.json           | 0
>  .../thingsboard-gateway/thingsboard-gateway/modbus_serial.json    | 0
>  .../thingsboard-gateway/thingsboard-gateway/mqtt.json             | 0
>  .../thingsboard-gateway/thingsboard-gateway/odbc.json             | 0
>  .../thingsboard-gateway/thingsboard-gateway/opcua.json            | 0
>  .../thingsboard-gateway/thingsboard-gateway/request.json          | 0
>  .../thingsboard-gateway/thingsboard-gateway/rest.json             | 0
>  .../thingsboard-gateway/thingsboard-gateway/snmp.json             | 0
>  .../thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml       | 0
>  .../thingsboard-gateway/thingsboard-gateway.service               | 0
>  .../thingsboard-gateway/thingsboard-gateway_2.5.2.bb              | 0
>  16 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
> (100%)
>  rename meta-oe/{ =>
> dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/
> thingsboard-gateway_2.5.2.bb (100%)
>
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
> similarity index 100%
> rename from
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/
> thingsboard-gateway_2.5.2.bb
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/
> thingsboard-gateway_2.5.2.bb
> similarity index 100%
> rename from meta-oe/recipes-connectivity/thingsboard-gateway/
> thingsboard-gateway_2.5.2.bb
> rename to
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/
> thingsboard-gateway_2.5.2.bb
> --
> 2.29.2
>
>
> 
>
>

--00000000000091f0af05b4c7430c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a>&gt;<br><div><br></div><div>BTW: &quot=
;python3-jsonpath-rw: Add recipe for v1.4.0&quot; commit is also only in ma=
ster-next branch (and after this), so=C2=A0<a href=3D"http://thingsboard-ga=
teway_2.5.2.bb">thingsboard-gateway_2.5.2.bb</a> is broken in master comple=
tely (not only when meta-python layer isn&#39;t included).</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov=
 19, 2020 at 4:58 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Depends on meta-python therefore move it here so it does not=
 impact non<br>
meta-python users<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/bacnet.json=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/ble.json=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/can.json=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/custom_serial.json=C2=A0=
 =C2=A0 | 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/logs.conf=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/modbus.json=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/modbus_serial.json=C2=A0=
 =C2=A0 | 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/mqtt.json=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/odbc.json=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/opcua.json=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/request.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/rest.json=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/snmp.json=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../thingsboard-gateway/thingsboard-gateway.service=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../thingsboard-gateway/<a href=3D"http://thingsboard-gateway_2.5.2.=
bb" rel=3D"noreferrer" target=3D"_blank">thingsboard-gateway_2.5.2.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A016 files changed, 0 insertions(+), 0 deletions(-)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/bacnet.json (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/ble.json (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/can.json (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/logs.conf (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/modbus.json (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/mqtt.json (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/odbc.json (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/opcua.json (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/request.json (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/rest.json (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/snmp.json (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml (100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service (=
100%)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-connect=
ivity/thingsboard-gateway/<a href=3D"http://thingsboard-gateway_2.5.2.bb" r=
el=3D"noreferrer" target=3D"_blank">thingsboard-gateway_2.5.2.bb</a> (100%)=
<br>
<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/bacnet.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivi=
ty/thingsboard-gateway/thingsboard-gateway/bacnet.json<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/bacnet.json<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/bacnet.json<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/ble.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/=
thingsboard-gateway/thingsboard-gateway/ble.json<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/ble.json<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/ble.json<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/can.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/=
thingsboard-gateway/thingsboard-gateway/can.json<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/can.json<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/can.json<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/custom_serial.json b/meta-oe/dynamic-layers/meta-python/recipes-con=
nectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/custom_serial.json<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/custom_serial.json<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/logs.conf b/meta-oe/dynamic-layers/meta-python/recipes-connectivity=
/thingsboard-gateway/thingsboard-gateway/logs.conf<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/logs.conf<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/logs.conf<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/modbus.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivi=
ty/thingsboard-gateway/thingsboard-gateway/modbus.json<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/modbus.json<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/modbus.json<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/modbus_serial.json b/meta-oe/dynamic-layers/meta-python/recipes-con=
nectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/modbus_serial.json<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/modbus_serial.json<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/mqtt.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity=
/thingsboard-gateway/thingsboard-gateway/mqtt.json<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/mqtt.json<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/mqtt.json<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/odbc.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity=
/thingsboard-gateway/thingsboard-gateway/odbc.json<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/odbc.json<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/odbc.json<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/opcua.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivit=
y/thingsboard-gateway/thingsboard-gateway/opcua.json<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/opcua.json<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/opcua.json<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/request.json b/meta-oe/dynamic-layers/meta-python/recipes-connectiv=
ity/thingsboard-gateway/thingsboard-gateway/request.json<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/request.json<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/request.json<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/rest.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity=
/thingsboard-gateway/thingsboard-gateway/rest.json<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/rest.json<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/rest.json<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/snmp.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity=
/thingsboard-gateway/thingsboard-gateway/snmp.json<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/snmp.json<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/snmp.json<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/tb_gateway.yaml b/meta-oe/dynamic-layers/meta-python/recipes-connec=
tivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/tb_gateway.yaml<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/tb_gateway.yaml<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/thingsboard-gateway.service b/meta-oe/dynamic-layers/meta-python/re=
cipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gate=
way.service<br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-g=
ateway/thingsboard-gateway.service<br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/thingsboard-gateway.service<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/<a href=3D"h=
ttp://thingsboard-gateway_2.5.2.bb" rel=3D"noreferrer" target=3D"_blank">th=
ingsboard-gateway_2.5.2.bb</a> b/meta-oe/dynamic-layers/meta-python/recipes=
-connectivity/thingsboard-gateway/<a href=3D"http://thingsboard-gateway_2.5=
.2.bb" rel=3D"noreferrer" target=3D"_blank">thingsboard-gateway_2.5.2.bb</a=
><br>
similarity index 100%<br>
rename from meta-oe/recipes-connectivity/thingsboard-gateway/<a href=3D"ht=
tp://thingsboard-gateway_2.5.2.bb" rel=3D"noreferrer" target=3D"_blank">thi=
ngsboard-gateway_2.5.2.bb</a><br>
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsbo=
ard-gateway/<a href=3D"http://thingsboard-gateway_2.5.2.bb" rel=3D"noreferr=
er" target=3D"_blank">thingsboard-gateway_2.5.2.bb</a><br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000091f0af05b4c7430c--
