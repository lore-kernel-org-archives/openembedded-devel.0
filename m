Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11231.1793278647536609910
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 05:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RBiRJ9Ha;
 spf=pass (domain: konsulko.com, ip: 209.85.215.172, mailfrom: leon.anavi@konsulko.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1073882a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793278647; cv=none;
        d=google.com; s=arc-20260327;
        b=CIWJMASMxlP7+eSb6FYst5X5a9IZB0kTG7FXYc3GB97B3mNsiwHioNtzGS76o+WMmC
         ED2fPxA+tGD3h5bkd2TJFD21o1NPIyEGb27+rpZMltLiCK0iZ2d4pVYptkPoRbcJgDfp
         RdEH9QyNV87NxxqvDuF9Ulh1NlX6XRcBzKxHY0d8DZ2JFKCIFA7PhHTRnJ5hECUN7K2o
         odcv3z+CsfIJTQpwr4p4v/fTYYpoMCcYaes+pfIXwvpwsOrQ3Fkid5bXXuvwJlWoa0j0
         OMAjc9LPtLdM9PFyYrWoEsUbaLP7n1RaFxChGUwgb9ktrsO0MEof1RqWZJoEsdwI4SMf
         VT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XQL0DW42U8nW1N07zC/9MIXTiLhyitH4am3CsqgRKuM=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=PHh4ij8OWJ49ewdPNkc6bisQvk7dyAUrsEK/3a/GdzsYaryXsJesmALONRt52xX1Zf
         JY6LiOEeJCUkOG+I9UjEmJDCzg0Re63VkgxGQnjtvFlq859T3kFfgpDR0znwBoNAtEmE
         ezDYTFdpCxztg5zarmSDBUEoY3f00PEQxdoYKdWFrto95muXUJ29z768vIjw4/1JlvHp
         +9HuaF4CXunaI6dg4MExO6E5GY9XfB89+77GRrSOrU4LO4u8FifLJ/YXlhSKAYjr1MI4
         gI2LnCY40fZD2aKTUE/WQHZs78h50HbuvyGcVxUOMc2aq5A/BEzikLlRzdtDMnDEEJuu
         7/jA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793278647; x=1793883447; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQL0DW42U8nW1N07zC/9MIXTiLhyitH4am3CsqgRKuM=;
        b=RBiRJ9HaiqiUk+89cjyEdYioNOANsZACr63dLApnZZvbSbOsEgF8hy1hujREtyXJiS
         3JGQsnuxY0Fy3ihBx0kmTC48zcG2dETcJo6zl2Gd9fA9NbhrcyEptZe3cmOyDrp/Wp68
         10pS6G/6nh98oyGvcPI1qkTyE++uYlJzEi4+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278647; x=1793883447;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XQL0DW42U8nW1N07zC/9MIXTiLhyitH4am3CsqgRKuM=;
        b=v3NNrzfDAEsUX3AM3XVqZoaJxOd0jVxvoJlewGW1dzEEKM3U1PhlPtSmLmQQxmzN21
         Kje1fPJcq248YlfhkR/ffvWUempSqS4SsNZb4qVAQYsNqG+JjwjgEBXQHyfGibV3aMjY
         GE1Ajg95xOveIPlkG7EfefE6PmqMDU8mGEMOYjfLy2Xvm4zhGsXPd+oZNNpLQDZLpPqd
         5NmiYSQqxd2/rqr58WONeRqOXXuHso5gPv0TT4Vkmfs9vKxOB4Esyp6RmDpM5Z/5obcE
         59lYBmc8wCEvfaUj80g5IPqste7j0Bu1VjBaBavZRRA3FoGZ8/gzm1k2C1h4VYJq7DCP
         G6rg==
X-Gm-Message-State: AFq9FYLY+ra/PuclhovKvKdEtxNMkE69iCUbX18pxMLyr7M/RubwNOUR
	RWtUueU8TswA4oGxiZmEeVItwUn7TCmaD6SxWOhb5UdIU2ImUDQQu2wtqPqQ9P1kT0EpzG/lMol
	bn9a8bkmzgV3gy0w99rS3xwD3FJWu6Johnov0OV2pyg==
X-Gm-Gg: AYBFou3fiW7DWuUP6sqAVTPJDz/9r8GXPlt/9GuXp2BwtGYLGCT+5eDkWpBii9vta/t
	4KKizFnaelQV+k7wqoGqEe/ik8kSTbjY3qEq+zA6ZJKX/RTvV61rjI7+EcEKFYQWM88XVF4A4j5
	4M/ilG9RtUVZkvT5qNIPAHP/fyhT2xP01l/Jes3NDSsnJ1h6Az7KCNtmBq7m9NkzVPnmB7DCrh0
	I0NGRQBgUaHeWznfejawB0D8Ev34deSd+k/jjcLcFNsdDYDjFUsi9yK0thQkEcVOSnlSpEFQyaM
	PTfN5e43mnjtoB9ssdg8Znufo4XK8I4WdmcYusdB/lxEESwq8GDoXSelnS7f3F1bmbibTsV8AZN
	zjtYwCvVMPPAmpXRf1V2NEvmqWMVxYZUNQBNir2Hgi8+Mpk7/ldQaMZvySFIgIm6MEArKJjQuvG
	WKA9fXmytKl0TXBu8gARArwZoAph84eiIPNPh/hG2vOLwAOCM=
X-Received: by 2002:a05:6a20:244e:b0:3e1:af52:6d06 with SMTP id
 adf61e73a8af0-3e9023bdcb8mr4962549637.52.1793278646668; Thu, 29 Oct 2026
 05:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
 <20261027092028.782979-43-leon.anavi@konsulko.com> <CAMKF1srRNVMxd7ZJZDUPz38uR2UZu-uRm6j7gwu2ngOBG6ADLA@mail.gmail.com>
In-Reply-To: <CAMKF1srRNVMxd7ZJZDUPz38uR2UZu-uRm6j7gwu2ngOBG6ADLA@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Thu, 29 Oct 2026 14:57:14 +0200
X-Gm-Features: AclHuK_9ZbxWVXfMDjWckm1S9qR9eWspJlDLE0bGtp2WvCwk27RjWG8HlEI__XQ
Message-ID: <CALtQ3O2vzFJ8eNsT7tNyxPfKiDAfkLxi7u=bvuwhKJRQf1Daow@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 43/61] python3-starlette: Upgrade 1.6.0
 -> 1.10.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b7e48e065efa38c0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 12:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131664

--000000000000b7e48e065efa38c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Tue, Oct 27, 2026 at 10:05=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:

> fails ptests
>
> Failed ptests:
> {'python3-starlette': 'START: ptest-runner\n'
>                       '2026-10-27T18:51\n'
>                       '\n'
>                       'ImportError while importing test module '
>
> "'/usr/lib/python3-starlette/ptest/tests/middleware/test_opentelemetry.py=
'.\n"
>                       'Hint: make sure your test modules/packages have
> valid '
>                       'Python names.\n'
>                       'Traceback:\n'
>                       '../../python3.14/importlib/__init__.py:88: in '
>                       'import_module\n'
>                       '    return _bootstrap._gcd_import(name[level:], '
>                       'package, level)\n'
>                       '           '
>
> '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                       'tests/middleware/test_opentelemetry.py:8: in
> <module>\n'
>                       '    from opentelemetry import metrics, trace\n'
>                       'E   ModuleNotFoundError: No module named '
>                       "'opentelemetry'\n"
>                       'ERROR: '
>
> 'tests/middleware/test_opentelemetry.py:tests/middleware/test_opentelemet=
ry.py\n'
>
> '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n'
>                       'Testsuite summary\n'
>                       '# TOTAL: 1\n'
>                       '# PASS: 0\n'
>                       '# SKIP: 0\n'
>                       '# XFAIL: 0\n'
>                       '# FAIL: 0\n'
>                       '# XPASS: 0\n'
>                       '# ERROR: 1\n'
>                       '\n'
>                       'ERROR: Exit status is 2\n'
>                       'DURATION: 2\n'}
>
> ptests which had no test results:
> ['python3-starlette']
>
>
Thank you for the code review. To solve this, I extended the runtime
dependencies for ptest with python3-opentelemetry-api,
python3-opentelemetry-sdk and python3-opentelemetry-semantic-conventions. I
added separate recipes for each of these dependencies and sent them with v2
of this patch.

Best regards, Leon


>
> On Tue, Oct 27, 2026 at 2:21=E2=80=AFAM Leon Anavi via lists.openembedded=
.org
> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
>> Upgrade to release 1.10.0:
>>
>> Leaner URL-encoded form parsing:
>>
>> Starlette 1.10.0 parses URL-encoded forms with less memory and CPU, no
>> longer drops the last field when a stream ends early, and lets you
>> compare FormData that holds several uploads under one key.
>>
>> - Forms with many fields parse faster and use less memory (#3724).
>>   FormParser builds each field in the parser callbacks instead of
>>   queueing every event and replaying it. On CodSpeed, 1000 fields
>>   went from 42.8 ms to 34.9 ms and from 63.5 KB to 54.5 KB, and the
>>   max_fields limit case went from 6,880 B to 864 B.
>> - The last field is kept when the request stream ends without an
>>   empty chunk (#3599). The parser is now finalized once the stream
>>   is exhausted, so custom streams that never yield a final b"" no
>>   longer lose their last field.
>> - FormData with repeated uploads can be compared (#3619). Comparing
>>   two FormData objects with several UploadFile values under the
>>   same key used to raise TypeError.
>>
>> Behaviour changes:
>>
>> - Multidict equality keeps the order of values under a repeated key
>>   (#3619). Keys can still appear in any order, but
>>   QueryParams("a=3D1&a=3D2") and QueryParams("a=3D2&a=3D1") are no longe=
r
>>   equal, matching what getlist() returns.
>> - starlette.formparsers.FormMessage is deprecated (#3724). The
>>   parser no longer uses it, and FormParser.messages is gone.
>>   Calling FormMessage(...) emits a StarletteDeprecationWarning.
>>
>> Routing and URL generation:
>>
>> - Path parameter values that look like a placeholder are kept as
>>   they are (#3725). url_path_for("route", category=3D"{id}", id=3D"42")
>>   on /{category}/{id} now returns /{id}/42 instead of /42/42.
>>   Substitution also got faster, from 549 ns to 520 ns with two
>>   parameters and from 1,078 ns to 779 ns with five.
>> - Route matching does less work per request (#3665, #3722). Match
>>   members are compared by identity, cutting up to 4.9% of the
>>   instructions per dispatch in the routing benchmarks.
>> - WSGIMiddleware strips root_path only at a path segment boundary
>>   (#3718). A request to /application under a root_path of /app no
>>   longer becomes /lication.
>> - FloatConvertor reports NaN and infinity correctly (#3716). NaN
>>   was reported as a negative float.
>>
>> Middleware, responses and config:
>>
>> - Handled exceptions no longer keep requests alive (#3205).
>>   Starlette clears the traceback after an exception handler runs,
>>   so an exception instance reused across requests, such as a
>>   module-level HTTPException, no longer pins per-request objects in
>>   memory.
>> - Middlewares accept http.response.start without headers (#3721).
>>   BaseHTTPMiddleware, GZipMiddleware and SessionMiddleware default
>>   the omitted field to an empty list instead of raising KeyError.
>> - FileResponse ignores Range on methods other than GET and HEAD
>>   (#3679). A POST endpoint that returns a file now sends the full
>>   file, as RFC 9110 requires.
>> - Config strips one pair of matching outer quotes from env file
>>   values (#3720). KEY=3D'say "hi"' now reads as say "hi" instead of
>>   say "hi.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>  .../{python3-starlette_1.6.0.bb =3D> python3-starlette_1.10.0.bb} | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-python/recipes-devtools/python/{python3-starlette_1.6.0.bb
>> =3D> python3-starlette_1.10.0.bb} (92%)
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-starlette_1.6.0.bb b/meta-python/recipes-devtools/python/
>> python3-starlette_1.10.0.bb
>> similarity index 92%
>> rename from meta-python/recipes-devtools/python/
>> python3-starlette_1.6.0.bb
>> rename to meta-python/recipes-devtools/python/python3-starlette_1.10.0.b=
b
>> index 45ba3a5311..dcd103bd87 100644
>> --- a/meta-python/recipes-devtools/python/python3-starlette_1.6.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-starlette_1.10.0.bb
>> @@ -2,7 +2,7 @@ SUMMARY =3D "Starlette is a lightweight ASGI
>> framework/toolkit, which is ideal for
>>  LICENSE =3D "BSD-3-Clause"
>>  LIC_FILES_CHKSUM =3D
>> "file://LICENSE.md;md5=3D11e8c8dbfd5fa373c703de492140ff7a"
>>
>> -SRC_URI[sha256sum] =3D
>> "d4e3ac5e546444960c710297a3c9fc3f7ebae1b7e963f3d36173b49da535be9b"
>> +SRC_URI[sha256sum] =3D
>> "b8399098d4c1e3522734f7235dc79b1fc967f96cf139c81e0fa30479e0685f9b"
>>
>>  inherit pypi python_hatchling ptest
>>
>> --
>> 2.47.3
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#131507):
>> https://lists.openembedded.org/g/openembedded-devel/message/131507
>> Mute This Topic: https://lists.openembedded.org/mt/121956786/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000b7e48e065efa38c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Khem,<br><br></div><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Oct 27, 2026 at 10:05=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr">fails ptests<div><br></div><di=
v>Failed ptests:<br>{&#39;python3-starlette&#39;: &#39;START: ptest-runner\=
n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;2026-10-27T18:51\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;\n&#39;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Imp=
ortError while importing test module &#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;/usr/lib/python=
3-starlette/ptest/tests/middleware/test_opentelemetry.py&#39;.\n&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;Hint: make sure your test modules/packages have valid &#39;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;Python names.\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Traceback:\n&#39;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;../../pyth=
on3.14/importlib/__init__.py:88: in &#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;import_module\n&#39;<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39; =C2=A0 =C2=A0return _bootstrap._gcd_import(name[level:], &#39;=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;package, level)\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;tests/middleware/test_opentelemetry.py:8: in &lt;mod=
ule&gt;\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39; =C2=A0 =C2=A0from opentelemetry import metrics, =
trace\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;E =C2=A0 ModuleNotFoundError: No module named &#39;<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;&#39;opentelemetry&#39;\n&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;ERROR: &#39;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;tests/middleware/test_opentelemetry.py:tests/middleware/test_openteleme=
try.py\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Testsuite summary\n&#39;<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;# TOTAL: 1\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;# PASS: 0\n&#39;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;# SKIP: 0\=
n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;# XFAIL: 0\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;# FAIL: 0\n&#39;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
# XPASS: 0\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;# ERROR: 1\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;\n&#39;<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;ERROR: Exit status is 2\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;DURATION: 2\n&#39;}<br><br>ptes=
ts which had no test results:<br>[&#39;python3-starlette&#39;]<br><br></div=
></div></blockquote><br>Thank you for the code review. To solve this, I ext=
ended the runtime dependencies for ptest with python3-opentelemetry-api, py=
thon3-opentelemetry-sdk and python3-opentelemetry-semantic-conventions. I a=
dded separate recipes for each of these dependencies and sent them with v2 =
of this patch.<br><br>Best regards, Leon<div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 27=
, 2026 at 2:21=E2=80=AFAM Leon Anavi via <a href=3D"http://lists.openembedd=
ed.org" target=3D"_blank">lists.openembedded.org</a> &lt;leon.anavi=3D<a hr=
ef=3D"mailto:konsulko.com@lists.openembedded.org" target=3D"_blank">konsulk=
o.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Upgrade to release 1.10.0:<br>
<br>
Leaner URL-encoded form parsing:<br>
<br>
Starlette 1.10.0 parses URL-encoded forms with less memory and CPU, no<br>
longer drops the last field when a stream ends early, and lets you<br>
compare FormData that holds several uploads under one key.<br>
<br>
- Forms with many fields parse faster and use less memory (#3724).<br>
=C2=A0 FormParser builds each field in the parser callbacks instead of<br>
=C2=A0 queueing every event and replaying it. On CodSpeed, 1000 fields<br>
=C2=A0 went from 42.8 ms to 34.9 ms and from 63.5 KB to 54.5 KB, and the<br=
>
=C2=A0 max_fields limit case went from 6,880 B to 864 B.<br>
- The last field is kept when the request stream ends without an<br>
=C2=A0 empty chunk (#3599). The parser is now finalized once the stream<br>
=C2=A0 is exhausted, so custom streams that never yield a final b&quot;&quo=
t; no<br>
=C2=A0 longer lose their last field.<br>
- FormData with repeated uploads can be compared (#3619). Comparing<br>
=C2=A0 two FormData objects with several UploadFile values under the<br>
=C2=A0 same key used to raise TypeError.<br>
<br>
Behaviour changes:<br>
<br>
- Multidict equality keeps the order of values under a repeated key<br>
=C2=A0 (#3619). Keys can still appear in any order, but<br>
=C2=A0 QueryParams(&quot;a=3D1&amp;a=3D2&quot;) and QueryParams(&quot;a=3D2=
&amp;a=3D1&quot;) are no longer<br>
=C2=A0 equal, matching what getlist() returns.<br>
- starlette.formparsers.FormMessage is deprecated (#3724). The<br>
=C2=A0 parser no longer uses it, and FormParser.messages is gone.<br>
=C2=A0 Calling FormMessage(...) emits a StarletteDeprecationWarning.<br>
<br>
Routing and URL generation:<br>
<br>
- Path parameter values that look like a placeholder are kept as<br>
=C2=A0 they are (#3725). url_path_for(&quot;route&quot;, category=3D&quot;{=
id}&quot;, id=3D&quot;42&quot;)<br>
=C2=A0 on /{category}/{id} now returns /{id}/42 instead of /42/42.<br>
=C2=A0 Substitution also got faster, from 549 ns to 520 ns with two<br>
=C2=A0 parameters and from 1,078 ns to 779 ns with five.<br>
- Route matching does less work per request (#3665, #3722). Match<br>
=C2=A0 members are compared by identity, cutting up to 4.9% of the<br>
=C2=A0 instructions per dispatch in the routing benchmarks.<br>
- WSGIMiddleware strips root_path only at a path segment boundary<br>
=C2=A0 (#3718). A request to /application under a root_path of /app no<br>
=C2=A0 longer becomes /lication.<br>
- FloatConvertor reports NaN and infinity correctly (#3716). NaN<br>
=C2=A0 was reported as a negative float.<br>
<br>
Middleware, responses and config:<br>
<br>
- Handled exceptions no longer keep requests alive (#3205).<br>
=C2=A0 Starlette clears the traceback after an exception handler runs,<br>
=C2=A0 so an exception instance reused across requests, such as a<br>
=C2=A0 module-level HTTPException, no longer pins per-request objects in<br=
>
=C2=A0 memory.<br>
- Middlewares accept http.response.start without headers (#3721).<br>
=C2=A0 BaseHTTPMiddleware, GZipMiddleware and SessionMiddleware default<br>
=C2=A0 the omitted field to an empty list instead of raising KeyError.<br>
- FileResponse ignores Range on methods other than GET and HEAD<br>
=C2=A0 (#3679). A POST endpoint that returns a file now sends the full<br>
=C2=A0 file, as RFC 9110 requires.<br>
- Config strips one pair of matching outer quotes from env file<br>
=C2=A0 values (#3720). KEY=3D&#39;say &quot;hi&quot;&#39; now reads as say =
&quot;hi&quot; instead of<br>
=C2=A0 say &quot;hi.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-starlette_1.6.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-starlette_1.6.0.bb</a> =3D&gt; <a href=3D"http:/=
/python3-starlette_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
starlette_1.10.0.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-starlette_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-starlette=
_1.6.0.bb</a> =3D&gt; <a href=3D"http://python3-starlette_1.10.0.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-starlette_1.10.0.bb</a>} (92%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
starlette_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-starlette_=
1.6.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-starlette_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-starlet=
te_1.10.0.bb</a><br>
similarity index 92%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-s=
tarlette_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-starlette_1=
.6.0.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-sta=
rlette_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-starlette_1.=
10.0.bb</a><br>
index 45ba3a5311..dcd103bd87 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-starlet=
te_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-starlette_1.6.0.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-starlet=
te_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-starlette_1.10.0=
.bb</a><br>
@@ -2,7 +2,7 @@ SUMMARY =3D &quot;Starlette is a lightweight ASGI framework=
/toolkit, which is ideal for<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3D11e8c8dbfd5fa373c7=
03de492140ff7a&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;d4e3ac5e546444960c710297a3c9fc3f7ebae1b7e963f=
3d36173b49da535be9b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;b8399098d4c1e3522734f7235dc79b1fc967f96cf139c=
81e0fa30479e0685f9b&quot;<br>
<br>
=C2=A0inherit pypi python_hatchling ptest<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131507): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131507" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131507</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121956786/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121956786/1997914</a><br>
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

--000000000000b7e48e065efa38c0--
