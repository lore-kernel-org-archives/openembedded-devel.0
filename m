Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28177.1793131511592438745
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 13:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kOQdzdZt;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ac525c1f05so2351877b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 13:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793131510; cv=none;
        d=google.com; s=arc-20260327;
        b=Xs2HIKXm+8Vgsnv144MiMjQy/B+QP8bvJJvLRnBTYJLCgCRD5BfjfkakxQD+sQOhKp
         UysrU9qZIzl4WM2ic9bwthy3TADmCJuX1x8pwatOwciXiNFyvxJ0189dKV0YFFRQ1G82
         pfKVH6AQBfhiDzsfDWpEEUblFWG++zMah9YDkGtFZ7WKxk76edsavgHA8oKsmIeoMFQs
         CyTspJvvujAfPyaydDIPU8ChSM1D8/BtH7vrJaYEjNIhQj1WZd7NH22/9bpqm4SRI5rj
         vNY2tAnm5bP10X8FVm2abdmA6bQHkr6M7SlbjYwdOGcDuhTvtTT4xl3GPUuzRniQltx0
         MCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RwLQQZxcJ4cYFAHly9VX8GxLd+04ZgVtc5Wm98swv5Y=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=nmX99WMsQbXMRJ0nSQmsV+omyckfhJAeWQVHZcXxqP3QW4VPEPnx/qmsofKvbJQvPo
         ocn5RHY9H4fByqQxFzKcaX66gIwqPJFYiYO+pSI1DqkXwzyekUqBsy5uc7C0VJ1qM5gC
         W7ltwNn0L9NMiYEmRCuvKfTu5LJWP4DoDr8bVTKRoykbF/VIAh0JhSDU06fhVKlIHWkz
         g/ZVE6N1ej+g1mVe62iFJlkDCwEFFn0Aje7oWfSqJimNItzQqEnw1+DNDR27ZXl4kLdr
         h4ou1wHGgy6in4H4j5qHPCG3ULnIWs7dSV4tsRH/XkqhUGyIfDNRkMJGRWRfuzam3VKU
         E+JQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793131510; x=1793736310; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwLQQZxcJ4cYFAHly9VX8GxLd+04ZgVtc5Wm98swv5Y=;
        b=kOQdzdZt+1/UylGn2jwGvkl5JmA2pkEBL4QylcPzN8aKTN+dTnjwzQfT882w4NYyx/
         EqhVSJNNXFEE1MrDYuDv6h4btzolb4yWH/5xVukgRfg0cuM+ex4nGig+UmWZezilnXYy
         t7exPZ8T8VAs1ZrtoNWahZKU+QRH+KddGIL34Old1OVWDr21T5r0ceqDlTYLkqYMQ2DH
         2RLAg04LqVdnlZ7hht57TUloEGsqggiEbmyvTY4/zvpvgr/V6FhbNTrKoI7SEb3nh0QH
         pmhaiuwng0Z3j5qNdG18dGXLEPqqUBi1eetSkcqlMFeo+aFy/XeShen6fk37dcAPqdqG
         onAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793131510; x=1793736310;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RwLQQZxcJ4cYFAHly9VX8GxLd+04ZgVtc5Wm98swv5Y=;
        b=zflF4xQ6RW4NfVazMJnZM7PiWbf8Jvyguud//RH4R7wMGt9EPnoh6o/+z9WbfZwFPb
         j/J+6oC2YvLwmb2HLAjvF/ZqZf0Owi0MVaZZBux6zWnz21J457Dc0LxOoaaYEodhYsCJ
         crC7QqKalbkeR+1yZHCLj3lqPlNfeDt7g4oVggOsJjqSFS7cMlc16N7Y4EXrlnpMc/Tm
         kTpOi84A3tTgTG7MoNFbJiVD9kQv8BXeQdUd53625ZALXBP9C5pvYDPs5nX2Guolh6h6
         uPklHLcqY5QdFy+2w9tI8rrT8lY9LW6Krk3S0MIrVlaW3kJBX1uV29QTd7y44dboPSZz
         XK2g==
X-Gm-Message-State: AFq9FYIBLlWjA1OG6S4km7FbYfDy73Wjl6vsDpTPC1Vo88wZ2WXiD7Gc
	UX7kUCmGZ6Tp+VIOEgg9wooUOzD2b82xYydstn+kzHLG4nvUfQUcg5y6CTYmZz5UgA2Uzc7sDgi
	MyN0FKRGz43KUCnCVJzMS6CyDwRft/uUuwhk/V9Zpbw==
X-Gm-Gg: AYBFou2AHVauv2Il+Kju2WqzHsw0RUa3fnXfEoeTIUv3V2mZvi2N41N7iRWsI2lyffu
	pw5qOiYtnmwIKTvFruHskuZjaMq5dXXERAc3WVDUajG/7q0zGsQVrK65jDQZ0C/fn5TAaicxLEd
	6BAoMQVrSMTIgdsXA3x4GAbqTAOHA+/E8DoZf8Fwi0ceJ0WDh8/NPK365S0LB0xT0aXiM9AEbts
	PtH0bUDnrmviC/UEhkxajFnTR5wbX35Q7j0bKetzSK89wM+POOfr+Ygau5O44sMGKO2URC3TI+Q
	rpHWQyyhlqF2NJnd1eBxFJ95udw/7sb5nM8rJMExBqy0NR8mcuua6E1qN55I2PFXakoLkDDQuj7
	o9z0cD4CxVaHBlsIs+hVVwA47XrZOjGf9mfrTZS5hCoYtR79WZvVvEU9o1nXOb/lHH9swefCgS5
	ekxZ77DNxSrhj1TFs0ZvyOE2aWKnNXGOd2TkApBq683+lxLNQ0ZGg4CLVFWIyTaRnw31GQojZp8
	DJvCa8GbYas/Y9n/OBJyaKtWxjklL/5QR7SnTZR4MKtuUcMI+UhZxuPR4jzW7rCjEiEyo3AZgBY
	Ma+R26cjgaCm9tHHeh0H3fCCDp1TjAUScJ/hSB0UqjZpk3ROhGyIKSPGAlMoeUfD
X-Received: by 2002:a05:690c:60c1:b0:8b1:e7c:cdcb with SMTP id
 00721157ae682-8b1b5c4b654mr748987b3.23.1793131510348; Tue, 27 Oct 2026
 13:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261027092028.782979-1-leon.anavi@konsulko.com> <20261027092028.782979-43-leon.anavi@konsulko.com>
In-Reply-To: <20261027092028.782979-43-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Oct 2026 13:04:43 -0700
X-Gm-Features: AclHuK-w0cOuaUCCub5LjnfPMdMB2tRPeBlAkJg-ZYW1qb9O_ELrOdWUb8z7ows
Message-ID: <CAMKF1srRNVMxd7ZJZDUPz38uR2UZu-uRm6j7gwu2ngOBG6ADLA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 43/61] python3-starlette: Upgrade 1.6.0
 -> 1.10.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b5c9ef065ed7f611"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 20:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131545

--000000000000b5c9ef065ed7f611
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails ptests

Failed ptests:
{'python3-starlette': 'START: ptest-runner\n'
                      '2026-10-27T18:51\n'
                      '\n'
                      'ImportError while importing test module '

"'/usr/lib/python3-starlette/ptest/tests/middleware/test_opentelemetry.py'.=
\n"
                      'Hint: make sure your test modules/packages have
valid '
                      'Python names.\n'
                      'Traceback:\n'
                      '../../python3.14/importlib/__init__.py:88: in '
                      'import_module\n'
                      '    return _bootstrap._gcd_import(name[level:], '
                      'package, level)\n'
                      '           '

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
                      'tests/middleware/test_opentelemetry.py:8: in
<module>\n'
                      '    from opentelemetry import metrics, trace\n'
                      'E   ModuleNotFoundError: No module named '
                      "'opentelemetry'\n"
                      'ERROR: '

'tests/middleware/test_opentelemetry.py:tests/middleware/test_opentelemetry=
.py\n'

'=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n'
                      'Testsuite summary\n'
                      '# TOTAL: 1\n'
                      '# PASS: 0\n'
                      '# SKIP: 0\n'
                      '# XFAIL: 0\n'
                      '# FAIL: 0\n'
                      '# XPASS: 0\n'
                      '# ERROR: 1\n'
                      '\n'
                      'ERROR: Exit status is 2\n'
                      'DURATION: 2\n'}

ptests which had no test results:
['python3-starlette']


On Tue, Oct 27, 2026 at 2:21=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 1.10.0:
>
> Leaner URL-encoded form parsing:
>
> Starlette 1.10.0 parses URL-encoded forms with less memory and CPU, no
> longer drops the last field when a stream ends early, and lets you
> compare FormData that holds several uploads under one key.
>
> - Forms with many fields parse faster and use less memory (#3724).
>   FormParser builds each field in the parser callbacks instead of
>   queueing every event and replaying it. On CodSpeed, 1000 fields
>   went from 42.8 ms to 34.9 ms and from 63.5 KB to 54.5 KB, and the
>   max_fields limit case went from 6,880 B to 864 B.
> - The last field is kept when the request stream ends without an
>   empty chunk (#3599). The parser is now finalized once the stream
>   is exhausted, so custom streams that never yield a final b"" no
>   longer lose their last field.
> - FormData with repeated uploads can be compared (#3619). Comparing
>   two FormData objects with several UploadFile values under the
>   same key used to raise TypeError.
>
> Behaviour changes:
>
> - Multidict equality keeps the order of values under a repeated key
>   (#3619). Keys can still appear in any order, but
>   QueryParams("a=3D1&a=3D2") and QueryParams("a=3D2&a=3D1") are no longer
>   equal, matching what getlist() returns.
> - starlette.formparsers.FormMessage is deprecated (#3724). The
>   parser no longer uses it, and FormParser.messages is gone.
>   Calling FormMessage(...) emits a StarletteDeprecationWarning.
>
> Routing and URL generation:
>
> - Path parameter values that look like a placeholder are kept as
>   they are (#3725). url_path_for("route", category=3D"{id}", id=3D"42")
>   on /{category}/{id} now returns /{id}/42 instead of /42/42.
>   Substitution also got faster, from 549 ns to 520 ns with two
>   parameters and from 1,078 ns to 779 ns with five.
> - Route matching does less work per request (#3665, #3722). Match
>   members are compared by identity, cutting up to 4.9% of the
>   instructions per dispatch in the routing benchmarks.
> - WSGIMiddleware strips root_path only at a path segment boundary
>   (#3718). A request to /application under a root_path of /app no
>   longer becomes /lication.
> - FloatConvertor reports NaN and infinity correctly (#3716). NaN
>   was reported as a negative float.
>
> Middleware, responses and config:
>
> - Handled exceptions no longer keep requests alive (#3205).
>   Starlette clears the traceback after an exception handler runs,
>   so an exception instance reused across requests, such as a
>   module-level HTTPException, no longer pins per-request objects in
>   memory.
> - Middlewares accept http.response.start without headers (#3721).
>   BaseHTTPMiddleware, GZipMiddleware and SessionMiddleware default
>   the omitted field to an empty list instead of raising KeyError.
> - FileResponse ignores Range on methods other than GET and HEAD
>   (#3679). A POST endpoint that returns a file now sends the full
>   file, as RFC 9110 requires.
> - Config strips one pair of matching outer quotes from env file
>   values (#3720). KEY=3D'say "hi"' now reads as say "hi" instead of
>   say "hi.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-starlette_1.6.0.bb =3D> python3-starlette_1.10.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-starlette_1.6.0.bb
> =3D> python3-starlette_1.10.0.bb} (92%)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-starlette_1.6.0.bb b/meta-python/recipes-devtools/python/
> python3-starlette_1.10.0.bb
> similarity index 92%
> rename from meta-python/recipes-devtools/python/python3-starlette_1.6.0.b=
b
> rename to meta-python/recipes-devtools/python/python3-starlette_1.10.0.bb
> index 45ba3a5311..dcd103bd87 100644
> --- a/meta-python/recipes-devtools/python/python3-starlette_1.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-starlette_1.10.0.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Starlette is a lightweight ASGI
> framework/toolkit, which is ideal for
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3D11e8c8dbfd5fa373c703de492140ff7a"
>
> -SRC_URI[sha256sum] =3D
> "d4e3ac5e546444960c710297a3c9fc3f7ebae1b7e963f3d36173b49da535be9b"
> +SRC_URI[sha256sum] =3D
> "b8399098d4c1e3522734f7235dc79b1fc967f96cf139c81e0fa30479e0685f9b"
>
>  inherit pypi python_hatchling ptest
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131507):
> https://lists.openembedded.org/g/openembedded-devel/message/131507
> Mute This Topic: https://lists.openembedded.org/mt/121956786/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b5c9ef065ed7f611
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">fails ptests<div><br></div><div>Failed ptests:<br>{&#39;py=
thon3-starlette&#39;: &#39;START: ptest-runner\n&#39;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;2026-10-27=
T18:51\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;ImportError while importing tes=
t module &#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;&#39;/usr/lib/python3-starlette/ptest/tests/midd=
leware/test_opentelemetry.py&#39;.\n&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Hint: make sure your =
test modules/packages have valid &#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Python names.\n&#39;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;Traceback:\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;../../python3.14/importlib/__init__.py=
:88: in &#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;import_module\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; =C2=A0 =C2=A0ret=
urn _bootstrap._gcd_import(name[level:], &#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;package, level)\n=
&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n&#39;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/midd=
leware/test_opentelemetry.py:8: in &lt;module&gt;\n&#39;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; =C2=A0=
 =C2=A0from opentelemetry import metrics, trace\n&#39;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;E =C2=A0 M=
oduleNotFoundError: No module named &#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;opentelemetry&#=
39;\n&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;ERROR: &#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/middleware/test_opente=
lemetry.py:tests/middleware/test_opentelemetry.py\n&#39;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n&=
#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;Testsuite summary\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;# TOTAL: 1\n&#39;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;# PASS: 0\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;# SKIP: 0\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;# XFAIL: 0\n&#=
39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;# FAIL: 0\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;# XPASS: 0\n&#39;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;# E=
RROR: 1\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;\n&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;ERROR: Exit status is 2\n&#39;<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;DURATION: 2\n&#39;}<br><br>ptests which had no test results:<br=
>[&#39;python3-starlette&#39;]<br><br></div></div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, O=
ct 27, 2026 at 2:21=E2=80=AFAM Leon Anavi via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:=
konsulko.com@lists.openembedded.org">konsulko.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upg=
rade to release 1.10.0:<br>
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

--000000000000b5c9ef065ed7f611--
