Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web09.5334.1603139849944167786
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 13:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EJhjrCnp;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id u19so1456005ion.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2020 13:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CNnt9bIP2kEa4b3l2jfTBWxCJ6ce0qaRcTBvmRFrRuw=;
        b=EJhjrCnpOeE0r80zdUn7h0t6g78wGhSYrMS6N8JCs6ZQ1dYJT2oztITpV5f+t1Uk4L
         6JR2cRqicVE3ATHZxzWKLPvauvo+VzXwHLupuD8NM62dz39Vo34ldSLP+0ZL3aZ12JhJ
         ATWBBtczzVD/RzPkl0rJmwsJZp1VRo5tsFGQOYTXQCtPIHRPKD93YR5d0EdVrEz/nPJP
         9nQHNGOYG8xVp9pfTDxOmIBrboWrmbAqgaokHTOmZtPYHAGNxhR+X1SaFbVfNkYSXbBr
         k6iVK97GJl6dH0hqcKSCeNcZ+sv9MJzkxZuNJSc28fkLFqPoS7cXZ2oiwBSha8xeBAig
         um3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CNnt9bIP2kEa4b3l2jfTBWxCJ6ce0qaRcTBvmRFrRuw=;
        b=hBSoK43qC6ttwNFkFUA2P+BjV86JtxIJf1whqiTJStVmFWyT3iUo7wu4pslV5T7Qyv
         aItnwtRhuWHq005DrX5AEs4eNmQ+yE/ebnRfpSaKUj9Yi6jF6v7x2iZxhMXYKBP5mqC6
         w2uOYdu80IImmIMdwtypc3gAJMj4hKqyOeRwvq0N1OBBUwS/TNDuFLNz9AfMTWcHGbIY
         0/S4mYyHx6JrqTPLjnOooOuShLCbOvBKLF3SRmT4jgMpGhhpW/t/hhn1mB9uvYBHqDBD
         0IH23+OODSTFvqo+Ii/lzuB3rEb3ts1yetV+6NBjSqObxBNvNnmLiH7M5uQmDIAgTLc9
         NL1A==
X-Gm-Message-State: AOAM531iG52jdWcMSgF3PVLXD6EdQVLSO3doA8Y751EU4LTUOqLtaioh
	6Q4jRXGKgPzd0XjiZNOxBfXDOB7NUErS9xsSg10=
X-Google-Smtp-Source: ABdhPJyWV1lOJN6zv+mnGCnZVaeo8MekY3tL58Ysy4Ltci2qoxNmGV3qjaRYcfs7xBM9pLUEswvcxeDorD8w4CHuWOk=
X-Received: by 2002:a6b:b413:: with SMTP id d19mr1102974iof.10.1603139849282;
 Mon, 19 Oct 2020 13:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201016143742.23076-1-ticotimo@gmail.com> <CA+chaQctGbV_5AEqOoFvpmVHDijKKJCd6yX8kRTB+wutetqgLA@mail.gmail.com>
In-Reply-To: <CA+chaQctGbV_5AEqOoFvpmVHDijKKJCd6yX8kRTB+wutetqgLA@mail.gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Mon, 19 Oct 2020 13:37:16 -0700
Message-ID: <CANx9H-CoRfBdNrA-5LuQv8OqX4QbHp9Az=h6TdML7N_uWNqeCg@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH] conf/layer.conf: LAYERSERIES_COMPAT gatesgarth
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003de6d505b20c1517"

--0000000000003de6d505b20c1517
Content-Type: text/plain; charset="UTF-8"

Merged. Although I forgot to add your acked-by :/

On Mon, Oct 19, 2020 at 5:22 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> Currently the last layer in my mix for LuneOS which doesn't parse until
> this hits master branch.
>
> Please merge it soon.
>
> On Fri, Oct 16, 2020 at 4:37 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>> In preparation for the release of Yocto Project 3.2,
>> "gatesgarth", change development branch to be only
>> compatible with the new release.
>>
>> Signed-off-by: Tim Orling <ticotimo@gmail.com>
>> ---
>>  conf/layer.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/conf/layer.conf b/conf/layer.conf
>> index b25c9ef9..a5738d96 100644
>> --- a/conf/layer.conf
>> +++ b/conf/layer.conf
>> @@ -14,6 +14,6 @@ LAYERVERSION_meta-python2 = "1"
>>
>>  LAYERDEPENDS_meta-python2 = "core openembedded-layer"
>>
>> -LAYERSERIES_COMPAT_meta-python2 = "dunfell"
>> +LAYERSERIES_COMPAT_meta-python2 = "gatesgarth"
>>
>>  LICENSE_PATH += "${LAYERDIR}/licenses"
>> --
>> 2.25.0
>>
>>
>> 
>>
>>

--0000000000003de6d505b20c1517
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div>Merged. Although I forgot to ad=
d your acked-by :/<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, Oct 19, 2020 at 5:22 AM Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
Acked-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=
=
=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br><div><br></div><div>Currentl=
y the last layer in my mix for LuneOS which doesn&#39;t parse until this hi=
ts master branch.</div><div><br></div><div>Please merge it soon.</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, Oct 16, 2020 at 4:37 PM Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.=
com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">In preparation for the release of =
Yocto Project 3.2,<br>
&quot;gatesgarth&quot;, change development branch to be only<br>
compatible with the new release.<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=
=
=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
---<br>
=C2=A0conf/layer.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/conf/layer.conf b/conf/layer.conf<br>
index b25c9ef9..a5738d96 100644<br>
--- a/conf/layer.conf<br>
+++ b/conf/layer.conf<br>
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python2 =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_meta-python2 =3D &quot;core openembedded-layer&quot;<br=
>
<br>
-LAYERSERIES_COMPAT_meta-python2 =3D &quot;dunfell&quot;<br>
+LAYERSERIES_COMPAT_meta-python2 =3D &quot;gatesgarth&quot;<br>
<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
-- <br>
2.25.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div></div></div>

--0000000000003de6d505b20c1517--
