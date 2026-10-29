Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7741.1793266032485708337
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fcSPllg9;
 spf=pass (domain: konsulko.com, ip: 209.85.210.178, mailfrom: leon.anavi@konsulko.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06b44bd01so1055591b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 02:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793266032; cv=none;
        d=google.com; s=arc-20260327;
        b=nnc8Jg8xFUSmdsRM2Qyr6fhGmUrSRS+xde8NyVzeyMiZF8EOiV6aEp59UWjS5WLyT0
         1Tq8tsnVqfLg1c0Ueuc9bVeFCHMNWgAVnPotPjJ78eu4eo2OP2M6TgEhhv3SgdM4z7hi
         QGIcXa4x43mGtC+jNF9JwntI6aQRC5ZoVvwJHHbphiykkEuoq0QutRenioeP8vEFl6Nu
         aGQ8vBVwkB39Z2P/2d5LlHiTjd5Bz7bXxCsy4R+dTUnnAFhKxo6dY0DszyUgYTmSdnUl
         hCXs6EtR+ltCF42C6GLRhIO2FQ2F+MRLbFz5zpAfhSNAnd2G993ejcKnnLz09qUK3loU
         xnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TvuCR2504NCqdzkfJh08njBZwIdSBGMCFQvP/szm9k4=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=E+a/e8A4VDkTdx8tGYy2wENSD8CCC3GY/Dof5CXgM+7FbpjAqGVClBCUDMSicuI3Gw
         BiBlK1vazWbjHBAGAC4pvWE9P6xGnMCiwHrQpJ5Tna6DOfL1IUN3DEPkTB88TBXBC4qU
         9YZUWUUdigPnXvugX0SO+T5AntmpiXj4VsyZZJSxFJk1/jq7KyQkFByQ8ZlNeaP2HFlQ
         ayQfvcPyDvQ4b7IlBgq+OUDrdNMOl9fZc+xofC2gpt4hSxsvQBk9q9hCJLq+9HRjWaQz
         sXDE8pvP3Pv3uOV45acQ47nCmHxiK+t5joX6Bk3MPPc99UYqF/KtJBgipmsB88aA9vrp
         UPDw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793266032; x=1793870832; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TvuCR2504NCqdzkfJh08njBZwIdSBGMCFQvP/szm9k4=;
        b=fcSPllg9W+tsGgae79/FTDtoqKtYANFSfRTIAekknaFT/XLm4zGm5aWeiKaqZkzLVP
         Ei+B4SSQc7c3tPT0ci00iWczBvG6RpUHsaKH3RJAR8tWCo5FHQpWhKi3LT+OeXZgUTGX
         iEQEd1HM2EB4XWjierj2YtLLDFoF8/b/qLNS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266032; x=1793870832;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TvuCR2504NCqdzkfJh08njBZwIdSBGMCFQvP/szm9k4=;
        b=VG5LqxaADbg1ogp7UkL8DaPwjuPjEGAEvBoq9XAxpIJ/aURhPEKU6L7qu0Br+qVnGk
         IVpZTsgvD6uQ4xXaZ6//qmosNM+FeLC/ofw86h+CepeJNv/UPyXZAnbabK8NkJkbJ93i
         5fazRZT1K/fe9PCF237hY3gofkStlg8Tk+w2qsvNDcT87OaGldh75cS/os5rb4Yg1Ubm
         Fjmjzni3N6mybRucMtDXyMNlpCKujgZ6Z64vBXj+pjMwv5N82ySLcE0ca1ONgcWBkNHU
         wdz1TKHXI3XO4IceMxjlBmsw5lJUZ0f71kVIQt27sSY6mpUtBnc+oFtrb/I21dSnrtxb
         o0Gg==
X-Gm-Message-State: AFq9FYLQz3AQsuscUVFrXOboFz6v2NKwCLlar3VuC3ypHUDCJAE9Ilbh
	rNgC28+MztX7Q5xT357QuN9Xok3xXzEJiFO2u1qfI4aj70LQMAB2Mxig3SBB25kM7P1weWBcvqF
	UVZ32yaN4S+RTug3YccPI1PAawNTJpEfbaS5vZXYnTg2Hz2Dizl/q18I=
X-Gm-Gg: AYBFou3yS8p8elc2yLCjJbVSfKgUEyGmWIbbuwK6ORk9lVe73eh6hzIlvw0SCW9E3An
	b0QEkFwahe2fIYpEvDgzABHe+O8T2apxvZCjXIXvclnE9wYiTr+Yn7JGzq+HPdah89T1ZXVSm+C
	oZ9lR9X+evagcThQhDUWwYvU3HtYWcRIL1/B/paL5t48gkcV/dEaBDyo7BJ9F5HfvZ6mY6lNgS5
	IX1UAG2nJ3t1tbnHCnLbTx2nJREoSOCt0o+VNIDEKS+NzAcNUTxaA4h7GRRNqhVC8lQcIlWwEjc
	h5cKPeGmri8KZBPcbKrizwlnS88HnHDJ9V2yYcpXGpDJLx/HBD5tneU7cY5XP91NMYVc4st4RLt
	IGQ1FGIT+rcUJu0VBlT9D/i5JMEg5tLUQiifvcZmLhEJ53tqFmkQ9DLdY7YGJeGrc/vmGk8SFpi
	J4uEZFRY3G2ZIl/EEsACJISIqZzlycS1wJZXPNIh9tZe6eyc0=
X-Received: by 2002:a05:6a20:9145:b0:3e2:a849:64bc with SMTP id
 adf61e73a8af0-3e902092671mr4690622637.9.1793266031757; Thu, 29 Oct 2026
 02:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
 <20261027092028.782979-9-leon.anavi@konsulko.com> <CAMKF1sqrUV_MxStm2f-DcPKNgUf4stADDbrtzZOjVzNqL-e0PQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqrUV_MxStm2f-DcPKNgUf4stADDbrtzZOjVzNqL-e0PQ@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Thu, 29 Oct 2026 11:26:58 +0200
X-Gm-Features: AclHuK-rH4YhGiLUq3g8QicskP_KkI-UutQVlJCYskuLatD9vLzrx16FHbG6YbQ
Message-ID: <CALtQ3O1GoQmyQE4-CXK-WEG5kdDKwOs7C2+Qnbpz1chtfCQOmA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 09/61] python3-jsonpatch: Upgrade 1.33
 -> 1.37
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cf9a6e065ef74869"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 09:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131656

--000000000000cf9a6e065ef74869
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Tue, Oct 27, 2026 at 6:57=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> Leon,
>
> This is the third time for this patch that I am reporting the same
> problem, this patch keeps coming as part of different PRs. Can you addres=
s
> it please ?
> bitbake -ccleanall python3-jsonpatch && bitbake python3-jsonpatch should
> show it.
>
> WARNING: python3-jsonpatch-1.37-r0 do_check_backend: QA Issue: inherits
> setuptools3 but has pyproject.toml specifying backend
> setuptools.build_meta, use the correct class [pep517-backend]
>
> see AB logs -
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1903/s=
teps/17/logs/warnings
>

Sorry for my oversight. I fixed four patches, including this one. I have
just sent v2 of all of them. For this patch, I replaced setuptools3 with
python_setuptools_build_meta to address the PEP 517 backend QA issue.

Best regards, Leon


>
>
>
> On Tue, Oct 27, 2026 at 2:20=E2=80=AFAM Leon Anavi via lists.openembedded=
.org
> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
>> Upgrade to release 1.37:
>>
>> - Clean up in-place output after write errors
>> - Reject invalid patch document containers
>> - Use UTF-8 for JSON command-line file I/O
>> - Handle source pointer objects in move location helpers
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>  .../{python3-jsonpatch_1.33.bb =3D> python3-jsonpatch_1.37.bb}    | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.33.bb
>> =3D> python3-jsonpatch_1.37.bb} (80%)
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-jsonpatch_1.33.bb b/meta-python/recipes-devtools/python/
>> python3-jsonpatch_1.37.bb
>> similarity index 80%
>> rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.33.b=
b
>> rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb
>> index 6a1715c6df..62c12327a2 100644
>> --- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
>> +++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D4f81c84f9a053e31fe9402a2a4e78864"
>>
>>  inherit pypi setuptools3
>>
>> -SRC_URI[sha256sum] =3D
>> "9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee731d004e212e1ee5030c"
>> +SRC_URI[sha256sum] =3D
>> "04288ef93e60084bcb118101cd9d53424e627b91bb47ec5a95c02ec3795f6d23"
>>
>>  RDEPENDS:${PN} +=3D " \
>>      python3-json \
>> --
>> 2.47.3
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#131473):
>> https://lists.openembedded.org/g/openembedded-devel/message/131473
>> Mute This Topic: https://lists.openembedded.org/mt/121956748/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000cf9a6e065ef74869
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Khem,<br><br></div><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Oct 27, 2026 at 6:57=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div>Leon,</div><div><br></div>=
<div>This is the third time for this patch that I am reporting the same pro=
blem, this patch keeps coming as part of different PRs. Can you address it =
please ?</div><div>bitbake -ccleanall=C2=A0<span style=3D"background-color:=
transparent">python3-jsonpatch &amp;&amp; bitbake=C2=A0</span><span style=
=3D"background-color:transparent">python3-jsonpatch should show it.</span><=
/div><div><br></div><div>WARNING: python3-jsonpatch-1.37-r0 do_check_backen=
d: QA Issue: inherits setuptools3 but has pyproject.toml specifying backend=
 setuptools.build_meta, use the correct class [pep517-backend]<br></div><di=
v><br></div><div>see AB logs -=C2=A0<a href=3D"https://autobuilder.yoctopro=
ject.org/valkyrie/#/builders/81/builds/1903/steps/17/logs/warnings" target=
=3D"_blank">https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/bui=
lds/1903/steps/17/logs/warnings</a></div></div></blockquote><div><br></div>=
<div>Sorry for my oversight. I fixed four patches, including this one. I ha=
ve just sent v2 of all of them. For this patch, I replaced setuptools3 with=
 python_setuptools_build_meta to address the PEP 517 backend QA issue.<br><=
br>Best regards, Leon</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div><br></div><div><br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, O=
ct 27, 2026 at 2:20=E2=80=AFAM Leon Anavi via <a href=3D"http://lists.opene=
mbedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;leon.anavi=3D=
<a href=3D"mailto:konsulko.com@lists.openembedded.org" target=3D"_blank">ko=
nsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Upgrade to release 1.37:<br>
<br>
- Clean up in-place output after write errors<br>
- Reject invalid patch document containers<br>
- Use UTF-8 for JSON command-line file I/O<br>
- Handle source pointer objects in move location helpers<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-jsonpatch_1.33.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-jsonpatch_1.33.bb</a> =3D&gt; <a href=3D"http://p=
ython3-jsonpatch_1.37.bb" rel=3D"noreferrer" target=3D"_blank">python3-json=
patch_1.37.bb</a>}=C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-jsonpatch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_=
1.33.bb</a> =3D&gt; <a href=3D"http://python3-jsonpatch_1.37.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-jsonpatch_1.37.bb</a>} (80%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
jsonpatch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1=
.33.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
jsonpatch_1.37.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1=
.37.bb</a><br>
similarity index 80%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-j=
sonpatch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.=
33.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-jso=
npatch_1.37.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.37=
.bb</a><br>
index 6a1715c6df..62c12327a2 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-jsonpat=
ch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.33.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-jsonpat=
ch_1.37.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.37.bb<=
/a><br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4f81c84f9a0=
53e31fe9402a2a4e78864&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-SRC_URI[sha256sum] =3D &quot;9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee7=
31d004e212e1ee5030c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;04288ef93e60084bcb118101cd9d53424e627b91bb47e=
c5a95c02ec3795f6d23&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-json \<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131473): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131473" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131473</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121956748/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121956748/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div>

--000000000000cf9a6e065ef74869--
