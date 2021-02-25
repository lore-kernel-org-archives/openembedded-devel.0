Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.12236.1614264964096203268
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Feb 2021 06:56:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fzUSKqDD;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id d8so9360871ejc.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Feb 2021 06:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=roIGeeZVJftS+l43WFdkfJeeSHijQr0xH7emVbtPB0U=;
        b=fzUSKqDD07ddLHSG7ovxJGxuZt1MGvLNAnd+ROtK4W2jWIyiR8z63qYT1DXktfGMmr
         JwVG6atwaz2P64aF0LndH16h+crR8wM8n7UsSBYHVSJP6liPk84hoHPHLhcoH3v3J9A2
         XXJRZcs5uggkC4/rQxmuwKMsDWcblfBUva78tQAlfICYDmoBEwGnYe8Ss/3W/t5QiE+T
         GMUfEhtJfHzYwzq8mMqNjcdXMOrmVfS37H1X+nim/0y8HNvyfBHnswd9VLHN1FVow1A3
         wBYGTsqoqrF1EchbDuuCyhQl/e6rwiixjuO/jdyvWESHdHCXu9e7LwpNEogSV8xkkA0a
         vn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=roIGeeZVJftS+l43WFdkfJeeSHijQr0xH7emVbtPB0U=;
        b=sdnugE4gq31cTYF/2gATNHUqcKcYAer0ANbNcGlYpxkHBRkITHkFlyDI+conddP+sP
         JdncHhYLS9Wsh28p0HKA1gRrZhjQ3g+IwUeh1N079Q8mFKDtl0t5vPNX22gYEwpyRICS
         4aqNyKBYcZf5WDNEYlVmhibBs0PNr/EpijDhZb0cKiD2KnoijpFhXQ+grxhbCwYQt8Vh
         /BmPeuUl+zFOFGEVt2tKBH02BgCDXiQeqOIsW+Zyu1MKRsPhLl5S99zhYTKmNALLWXS1
         T+9ic3Ei9H539fhBZHMEjudiMFm4EKej8YZa3+0DXhRDl0xLHVsuco1nav8H97d4qi4m
         nDzQ==
X-Gm-Message-State: AOAM531fgNANuR5MpX/pdPz1t+s9OehAcQXPgViq0sxDtJfAGQYrQ9Kn
	n1ZtOtFDKOtoE+EbvYCE6fLEE7vScVaPTFGTVpg=
X-Google-Smtp-Source: ABdhPJz0x2+GU+njGxG6KFsuLrRJcpZ6/mOvUiSaV0/fpobfnD1wldjXBfSaVZp9JxgMRZJQzwTdWBwGaIRJzIlSwyQ=
X-Received: by 2002:a17:906:5902:: with SMTP id h2mr2907945ejq.137.1614264962371;
 Thu, 25 Feb 2021 06:56:02 -0800 (PST)
MIME-Version: 1.0
References: <20210216152349.30824-1-Rahul.Taya@kpit.com> <CA+chaQfrVCttH0nb55=eiwJva=GT0NZyitkVEfaFyigVj+RC8A@mail.gmail.com>
 <BMXPR01MB34313989023828E45EBFAE7BF29E9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB34313989023828E45EBFAE7BF29E9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 25 Feb 2021 15:55:50 +0100
Message-ID: <CA+chaQeuX0JXcWq1WhQEX9mkS67_-ZSpMhsJ-m0ow7JJ3boTgA@mail.gmail.com>
Subject: Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for CVE-2019-9674
To: Rahul Taya <Rahul.Taya@kpit.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a7d41005bc2a5999"

--000000000000a7d41005bc2a5999
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

normally you should fork meta-python2 and send a link to meta-python2
change I can cherry-pick, not the blob in otherwise empty repo.

But as I've said in previous reply, I've already manually applied your
change in meta-python2 master-next where it's now failing:

ERROR: python-native-2.7.18-r0 do_patch: Fuzz detected:

Applying patch CVE-2019-9674.patch
patching file Doc/library/zipfile.rst
Hunk #1 succeeded at 554 with fuzz 2 (offset -20 lines).


The context lines in the patches can be updated with devtool:

    devtool modify python-native
    devtool finish --force-patch-refresh python-native <layer_path>

Don't forget to review changes done by devtool!

ERROR: python-native-2.7.18-r0 do_patch: QA Issue: Patch log indicates
that patches do not apply cleanly. [patch-fuzz]


so I'll fix this as well, but next time please better test your
changes (nghttp2 patch also didn't apply, see my reply there, not sure
if you have fixed that in v2)


Regards,




On Thu, Feb 25, 2021 at 9:09 AM Rahul Taya <Rahul.Taya@kpit.com> wrote:

> Hi Martin,
>
> I removed the emoticons and uploaded the patch to my git repo pls access
> below link:
>
> https://github.com/Rahult9/upstream_patch/blob/main/CVE-2019-9674.patch
>
>
> Thanks and Regards,
> Rahul Taya
> ------------------------------
> *From:* Martin Jansa <martin.jansa@gmail.com>
> *Sent:* Thursday, February 18, 2021 10:58 PM
> *To:* Rahul Taya <Rahul.Taya@kpit.com>
> *Cc:* openembedded-devel <openembedded-devel@lists.openembedded.org>;
> Khem Raj <raj.khem@gmail.com>; Nisha Parrakat <Nisha.Parrakat@kpit.com>;
> Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
> *Subject:* Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for
> CVE-2019-9674
>
> "git am" doesn't like those emoticons in the .patch file..
>
> git am ~/py2/cur/16136689*
> error: cannot convert from 8bit to UTF-8
> fatal: could not parse patch
>
> either drop them or upload it to some git repo so I can cherry-pick it
> from there.
>
> On Thu, Feb 18, 2021 at 3:18 PM Rahul Taya <Rahul.Taya@kpit.com> wrote:
>
> For python and python-native added patch to fix
> CVE-2019-9674
>
> Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
> ---
>  recipes-devtools/python/python.inc            |  1 +
>  .../python/python/CVE-2019-9674.patch         | 83 +++++++++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 recipes-devtools/python/python/CVE-2019-9674.patch
>
> diff --git a/recipes-devtools/python/python.inc
> b/recipes-devtools/python/python.inc
> index a4ba0c5..787f23e 100644
> --- a/recipes-devtools/python/python.inc
> +++ b/recipes-devtools/python/python.inc
> @@ -8,6 +8,7 @@ INC_PR =3D "r1"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D203a6dbc802ee896020a47161e75=
9642"
>
>  SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.=
python.org%2Fftp%2Fpython%2F%24%257BPV%257D%2FPython-%24%257BPV%257D.tar.xz=
&data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cbba977d6d9fe44e3c15d08d8d43295c6%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637492661061864315%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&sdata=3DM6wXm5CcCKV9DNpCZFzn54Uls82AIl5ds1lDgCBTY38%3D&reserved=
=
=3D0>
> \
> +           file://CVE-2019-9674.patch \
>             "
>
>  SRC_URI[sha256sum] =3D
> "b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43"
> diff --git a/recipes-devtools/python/python/CVE-2019-9674.patch
> b/recipes-devtools/python/python/CVE-2019-9674.patch
> new file mode 100644
> index 0000000..647d9da
> --- /dev/null
> +++ b/recipes-devtools/python/python/CVE-2019-9674.patch
> @@ -0,0 +1,83 @@
> +From 3ba51d587f6897a45301ce9126300c14fcd4eba2 Mon Sep 17 00:00:00 2001
> +From: JunWei Song <sungboss2004@gmail.com>
> +Date: Wed, 11 Sep 2019 23:04:12 +0800
> +Subject: [PATCH] bpo-36260: Add pitfalls to zipfile module documentatio=
n
> + (#13378)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* bpo-36260: Add pitfalls to zipfile module documentation
> +
> +We saw vulnerability warning description (including zip bomb) in
> Doc/library/xml.rst file.
> +This gave us the idea of documentation improvement.
> +
> +So, we moved a little bit forward :P
> +And the doc patch can be found (pr).
> +
> +* fix trailing whitespace
> +
> +* =F0=9F=93=9C=F0=9F=A4=96 Added by blurb_it.
> +
> +* Reformat text for consistency.
> +
> +Upstream-Status: Backport[
> http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5.2-2=
ubuntu0~16.04.12.debian.tar.xz
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp:%2F%2Farchiv=
e.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fp%2Fpython3.5%2Fpython3.5_3.5.2-2ubun=
tu0~16.04.12.debian.tar.xz&data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cbba977d=
6d9fe44e3c15d08d8d43295c6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6374=
92661061864315%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3Dd19urO6APEkZb6B9c7il0Slws2rhM=
YaFV0%2FYnzXlKXU%3D&reserved=3D0>
> ]
> +CVE: CVE-2019-9674
> +Link:
> http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5.2-2=
ubuntu0~16.04.12.debian.tar.xz
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp:%2F%2Farchiv=
e.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fp%2Fpython3.5%2Fpython3.5_3.5.2-2ubun=
tu0~16.04.12.debian.tar.xz&data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cbba977d=
6d9fe44e3c15d08d8d43295c6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6374=
92661061874305%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DJwYkrj1hGsI2pQRU97lSDqHkKQIBV=
zFaTUIopntVqvo%3D&reserved=3D0>
> +Comment: From the original patch skipped changes for file
> +Misc/NEWS.d/next/Documentation/2019-06-04-09-29-00.bpo-36260.WrGuc-.rst
> +as this file is not present in our source code.
> +---
> + Doc/library/zipfile.rst                       | 41 +++++++++++++++++++
> + 1 files changed, 41 insertions(+)
> +
> +diff --git a/Doc/library/zipfile.rst b/Doc/library/zipfile.rst
> +index b421ea5..2e0a91d 100644
> +--- a/Doc/library/zipfile.rst
> ++++ b/Doc/library/zipfile.rst
> +@@ -574,4 +574,45 @@ Instances have the following attributes:
> +
> +    Size of the uncompressed file.
> +
> ++Decompression pitfalls
> ++----------------------
> ++
> ++The extraction in zipfile module might fail due to some pitfalls liste=
d
> below.
> ++
> ++From file itself
> ++~~~~~~~~~~~~~~~~
> ++
> ++Decompression may fail due to incorrect password / CRC checksum / ZIP
> format or
> ++unsupported compression method / decryption.
> ++
> ++File System limitations
> ++~~~~~~~~~~~~~~~~~~~~~~~
> ++
> ++Exceeding limitations on different file systems can cause decompressio=
n
> failed.
> ++Such as allowable characters in the directory entries, length of the
> file name,
> ++length of the pathname, size of a single file, and number of files, et=
c.
> ++
> ++Resources limitations
> ++~~~~~~~~~~~~~~~~~~~~~
> ++
> ++The lack of memory or disk volume would lead to decompression
> ++failed. For example, decompression bombs (aka `ZIP bomb`_)
> ++apply to zipfile library that can cause disk volume exhaustion.
> ++
> ++Interruption
> ++~~~~~~~~~~~~
> ++
> ++Interruption during the decompression, such as pressing control-C or
> killing the
> ++decompression process may result in incomplete decompression of the
> archive.
> ++
> ++Default behaviors of extraction
> ++~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ++
> ++Not knowing the default extraction behaviors
> ++can cause unexpected decompression results.
> ++For example, when extracting the same archive twice,
> ++it overwrites files without asking.
> ++
> ++
> ++.. _ZIP bomb: https://en.wikipedia.org/wiki/Zip_bomb
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fen.=
wikipedia.org%2Fwiki%2FZip_bomb&data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cbb=
a977d6d9fe44e3c15d08d8d43295c6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7=
C637492661061874305%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3D3hnU5mbEKRK4MYciikYhtHIM=
3Jf0QuIDPCJrG6Nih74%3D&reserved=3D0>
> + .. _PKZIP Application Note:
> https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpkw=
are.cachefly.net%2Fwebdocs%2Fcasestudies%2FAPPNOTE.TXT&data=3D04%7C01%7CRah=
ul.Taya%40kpit.com%7Cbba977d6d9fe44e3c15d08d8d43295c6%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637492661061884298%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3Dd=
pnrbk2pB1TxzEQEoEE8nKQuGWDxLr812e9%2FYBwYfHE%3D&reserved=3D0>
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only fo=
r
> the person to whom it is addressed. If you are not the intended recipien=
t,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>
>=20
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only fo=
r
> the person to whom it is addressed. If you are not the intended recipien=
t,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>

--000000000000a7d41005bc2a5999
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>normally you should fork meta-pytho=
n2 and send a link to meta-python2 change I can cherry-pick, not the blob i=
n otherwise empty repo.</div><div><br></div><div>But as I&#39;ve said in pr=
evious reply, I&#39;ve already manually applied your change in meta-python2=
 master-next where it&#39;s now failing:</div><div><br></div><div><pre clas=
s=3D"gmail-console-output" style=3D"box-sizing:inherit;white-space:pre-wrap=
;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51)">ERROR: python-native=
-2.7.18-r0 do_patch: Fuzz detected:

Applying patch CVE-2019-9674.patch
patching file Doc/library/zipfile.rst
Hunk #1 succeeded at 554 with fuzz 2 (offset -20 lines).


The context lines in the patches can be updated with devtool:

    devtool modify python-native
    devtool finish --force-patch-refresh python-native &lt;layer_path&gt;

Don&#39;t forget to review changes done by devtool!

ERROR: python-native-2.7.18-r0 do_patch: QA Issue: Patch log indicates tha=
t patches do not apply cleanly. [patch-fuzz]</pre><pre class=3D"gmail-conso=
le-output" style=3D"box-sizing:inherit;white-space:pre-wrap;margin-top:0px;=
margin-bottom:0px;color:rgb(51,51,51)"><br></pre><pre class=3D"gmail-consol=
e-output" style=3D"box-sizing:inherit;white-space:pre-wrap;margin-top:0px;m=
argin-bottom:0px;color:rgb(51,51,51)">so I&#39;ll fix this as well, but nex=
t time please better test your changes (nghttp2 patch also didn&#39;t apply=
, see my reply there, not sure if you have fixed that in v2)</pre><pre clas=
s=3D"gmail-console-output" style=3D"box-sizing:inherit;white-space:pre-wrap=
;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51)"><br></pre><pre class=
=
=3D"gmail-console-output" style=3D"box-sizing:inherit;white-space:pre-wrap=
;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51)">Regards,</pre></div>=
<div></div><div><br></div><div><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 25, 2021 at 9:09 AM Ra=
hul Taya &lt;<a href=3D"mailto:Rahul.Taya@kpit.com">Rahul.Taya@kpit.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0);background-color:rgb(255,255,255)">
Hi Martin,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0);background-color:rgb(255,255,255)">
I removed the emoticons and uploaded the patch to my git repo pls access b=
elow link:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<span title=3D"https://github.com/Rahult9/upstream_patch/blob/main/CVE-201=
9-9674.patch"><span><a href=3D"https://github.com/Rahult9/upstream_patch/bl=
ob/main/CVE-2019-9674.patch" id=3D"gmail-m_-2317439710916735757LPlnk" targe=
t=3D"_blank">https://github.com/Rahult9/upstream_patch/blob/main/CVE-2019-9=
674.patch</a></span></span><br>
</div>
<div></div>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"gmail-m_-2317439710916735757Signature">
<div>
<div></div>
<div name=3D"divtagdefaultwrapper">
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Thanks and R=
egards,</span></div>
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Rahul Taya</=
span><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"gmail-m_-2317439710916735757appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_-2317439710916735757divRplyFwdMsg" dir=3D"ltr"><font fa=
ce=3D"Calibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>Fr=
om:</b> Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=
=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
<b>Sent:</b> Thursday, February 18, 2021 10:58 PM<br>
<b>To:</b> Rahul Taya &lt;<a href=3D"mailto:Rahul.Taya@kpit.com" target=3D=
"_blank">Rahul.Taya@kpit.com</a>&gt;<br>
<b>Cc:</b> openembedded-devel &lt;<a href=3D"mailto:openembedded-devel@lis=
ts.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedde=
d.org</a>&gt;; Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;; Nisha Parrakat &lt;<a href=3D"mailto:N=
isha.Parrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;; =
Harpritkaur Bhandari &lt;<a href=3D"mailto:Harpritkaur.Bhandari@kpit.com" t=
arget=3D"_blank">Harpritkaur.Bhandari@kpit.com</a>&gt;<br>
<b>Subject:</b> Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix fo=
r CVE-2019-9674</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">&quot;git am&quot; doesn&#39;t like those emoticons in th=
e .patch file..
<div><br>
</div>
<div>git am ~/py2/cur/16136689*<br>
error: cannot convert from 8bit to UTF-8<br>
fatal: could not parse patch<br>
</div>
<div><br>
</div>
<div>either drop them or upload it to some git repo so I can cherry-pick i=
t from there.</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Thu, Feb 18, 2021 at 3:18 PM Rahul Taya &lt;<a href=3D=
"mailto:Rahul.Taya@kpit.com" target=3D"_blank">Rahul.Taya@kpit.com</a>&gt; =
wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
For python and python-native added patch to fix<br>
CVE-2019-9674<br>
<br>
Signed-off-by: Rahul Taya &lt;<a href=3D"mailto:Rahul.Taya@kpit.com" targe=
t=3D"_blank">Rahul.Taya@kpit.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/python.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 1 +<br>
=C2=A0.../python/python/CVE-2019-9674.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0| 83 +++++++++++++++++++<br>
=C2=A02 files changed, 84 insertions(+)<br>
=C2=A0create mode 100644 recipes-devtools/python/python/CVE-2019-9674.patc=
h<br>
<br>
diff --git a/recipes-devtools/python/python.inc b/recipes-devtools/python/=
python.inc<br>
index a4ba0c5..787f23e 100644<br>
--- a/recipes-devtools/python/python.inc<br>
+++ b/recipes-devtools/python/python.inc<br>
@@ -8,6 +8,7 @@ INC_PR =3D &quot;r1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D203a6dbc802ee896020a=
47161e759642&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://apc01.safelinks.protection.outl=
ook.com/?url=3Dhttp%3A%2F%2Fwww.python.org%2Fftp%2Fpython%2F%24%257BPV%257D=
%2FPython-%24%257BPV%257D.tar.xz&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com=
%7Cbba977d6d9fe44e3c15d08d8d43295c6%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637492661061864315%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DM6wXm5CcCKV9DNp=
CZFzn54Uls82AIl5ds1lDgCBTY38%3D&amp;reserved=3D0" rel=3D"noreferrer" target=
=
=3D"_blank">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a>
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2019-9674.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b62c0e7937551d0cc02b8fd5cb0f544f9405baf=
c9a54d3808ed4594812edef43&quot;<br>
diff --git a/recipes-devtools/python/python/CVE-2019-9674.patch b/recipes-=
devtools/python/python/CVE-2019-9674.patch<br>
new file mode 100644<br>
index 0000000..647d9da<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/python/CVE-2019-9674.patch<br>
@@ -0,0 +1,83 @@<br>
+From 3ba51d587f6897a45301ce9126300c14fcd4eba2 Mon Sep 17 00:00:00 2001<br=
>
+From: JunWei Song &lt;<a href=3D"mailto:sungboss2004@gmail.com" target=3D=
"_blank">sungboss2004@gmail.com</a>&gt;<br>
+Date: Wed, 11 Sep 2019 23:04:12 +0800<br>
+Subject: [PATCH] bpo-36260: Add pitfalls to zipfile module documentation<=
br>
+ (#13378)<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+* bpo-36260: Add pitfalls to zipfile module documentation<br>
+<br>
+We saw vulnerability warning description (including zip bomb) in Doc/libr=
ary/xml.rst file.<br>
+This gave us the idea of documentation improvement.<br>
+<br>
+So, we moved a little bit forward :P<br>
+And the doc patch can be found (pr).<br>
+<br>
+* fix trailing whitespace<br>
+<br>
+* =F0=9F=93=9C=F0=9F=A4=96 Added by blurb_it.<br>
+<br>
+* Reformat text for consistency.<br>
+<br>
+Upstream-Status: Backport[<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp:%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fp%=
2Fpython3.5%2Fpython3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz&amp;data=3D04=
%7C01%7CRahul.Taya%40kpit.com%7Cbba977d6d9fe44e3c15d08d8d43295c6%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637492661061864315%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;sdata=3Dd19urO6APEkZb6B9c7il0Slws2rhMYaFV0%2FYnzXlKXU%3D&amp;reserved=
=
=3D0" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubunt=
u/pool/main/p/python3.5/python3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz</a>=
]<br>
+CVE: CVE-2019-9674<br>
+Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dht=
tp:%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fp%2Fpython3.5%2Fpython=
3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz&amp;data=3D04%7C01%7CRahul.Taya%4=
0kpit.com%7Cbba977d6d9fe44e3c15d08d8d43295c6%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637492661061874305%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DJwYkrj=
1hGsI2pQRU97lSDqHkKQIBVzFaTUIopntVqvo%3D&amp;reserved=3D0" rel=3D"noreferre=
r" target=3D"_blank">
http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5.2-2ub=
untu0~16.04.12.debian.tar.xz</a><br>
+Comment: From the original patch skipped changes for file<br>
+Misc/NEWS.d/next/Documentation/2019-06-04-09-29-00.bpo-36260.WrGuc-.rst<b=
r>
+as this file is not present in our source code.<br>
+---<br>
+ Doc/library/zipfile.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 41 +++++++++++++++++++<br>
+ 1 files changed, 41 insertions(+)<br>
+<br>
+diff --git a/Doc/library/zipfile.rst b/Doc/library/zipfile.rst<br>
+index b421ea5..2e0a91d 100644<br>
+--- a/Doc/library/zipfile.rst<br>
++++ b/Doc/library/zipfile.rst<br>
+@@ -574,4 +574,45 @@ Instances have the following attributes:<br>
+<br>
+=C2=A0 =C2=A0 Size of the uncompressed file.<br>
+<br>
++Decompression pitfalls<br>
++----------------------<br>
++<br>
++The extraction in zipfile module might fail due to some pitfalls listed =
below.<br>
++<br>
++From file itself<br>
++~~~~~~~~~~~~~~~~<br>
++<br>
++Decompression may fail due to incorrect password / CRC checksum / ZIP fo=
rmat or<br>
++unsupported compression method / decryption.<br>
++<br>
++File System limitations<br>
++~~~~~~~~~~~~~~~~~~~~~~~<br>
++<br>
++Exceeding limitations on different file systems can cause decompression =
failed.<br>
++Such as allowable characters in the directory entries, length of the fil=
e name,<br>
++length of the pathname, size of a single file, and number of files, etc.=
<br>
++<br>
++Resources limitations<br>
++~~~~~~~~~~~~~~~~~~~~~<br>
++<br>
++The lack of memory or disk volume would lead to decompression<br>
++failed. For example, decompression bombs (aka `ZIP bomb`_)<br>
++apply to zipfile library that can cause disk volume exhaustion.<br>
++<br>
++Interruption<br>
++~~~~~~~~~~~~<br>
++<br>
++Interruption during the decompression, such as pressing control-C or kil=
ling the<br>
++decompression process may result in incomplete decompression of the arch=
ive.<br>
++<br>
++Default behaviors of extraction<br>
++~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
++<br>
++Not knowing the default extraction behaviors<br>
++can cause unexpected decompression results.<br>
++For example, when extracting the same archive twice,<br>
++it overwrites files without asking.<br>
++<br>
++<br>
++.. _ZIP bomb: <a href=3D"https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fen.wikipedia.org%2Fwiki%2FZip_bomb&amp;data=3D04%7C01%=
7CRahul.Taya%40kpit.com%7Cbba977d6d9fe44e3c15d08d8d43295c6%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C637492661061874305%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3D3hnU5mbEKRK4MYciikYhtHIM3Jf0QuIDPCJrG6Nih74%3D&amp;reserved=3D0" re=
l=3D"noreferrer" target=3D"_blank">
https://en.wikipedia.org/wiki/Zip_bomb</a><br>
+ .. _PKZIP Application Note: <a href=3D"https://apc01.safelinks.protectio=
n.outlook.com/?url=3Dhttps%3A%2F%2Fpkware.cachefly.net%2Fwebdocs%2Fcasestud=
ies%2FAPPNOTE.TXT&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cbba977d6d9fe=
44e3c15d08d8d43295c6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637492661=
061884298%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Ddpnrbk2pB1TxzEQEoEE8nKQuGWDxLr=
812e9%2FYBwYfHE%3D&amp;reserved=3D0" rel=3D"noreferrer" target=3D"_blank">
https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT</a><br>
--<br>
2.17.1<br>
<br>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.<br>
<br>
<br>
<br>
</blockquote>
</div>
</div>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.
</div>

</blockquote></div>

--000000000000a7d41005bc2a5999--
