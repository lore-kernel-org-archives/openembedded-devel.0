Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7B8D3C934
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:41:53 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1880.1765388509169686887
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KPjAQ9/e;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-3f0cbfae787so22922fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 09:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765388508; x=1765993308; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DtChqu9cE/2evdTQ1paqMYy9th3oBiUW3/sWdEZm9o=;
        b=KPjAQ9/e22wRAZo1tqGlRkEs+OCjE4xz8cBIPYpyfu5y+Q7kIo3urK1zkkKxQU8SGO
         4RyRkTGnCFMVQUWe+IRAfeKlKIGMIZJfI03SlwTXafkDs9xSHxFWOlzazjPIxtueDbzH
         aaF8ROa5p4DVG72xT1KQq7XcNJRsaZ9lBtnlfKQmNAu+PRLDoMNf9bj15k1zsCpigXwU
         Acu926cstVQC/6JrbezMmAkGNDmPIMZnMrlcUh2jqsBuqWwTVIPsjnlSbJQ7SeL73lNd
         eYla1Uo7j+xi6bQyRB7OT7ld9hKkYUw4bVUQdLkTV3BcI7JEFqhoVApqEUm/0i6rOgtL
         Blvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765388508; x=1765993308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5DtChqu9cE/2evdTQ1paqMYy9th3oBiUW3/sWdEZm9o=;
        b=cpFMFz9Qd4sGMlCaTuwxQC8B7w0N0HiR+kIUQz8KfiYlx4Do4u9l7EzFuFtepD+tyk
         VY7EObtJM0fkqmfC7Tvemf6p1+iV5CQOw3GBy9MqFjVJTmjVPMaSIWqNyGYsUuijFO1s
         E8CkDa9vwdwHWuI5TMbAVzewCxFMjJoysMP/ye8b6D9bRrWi+YPEg95hBBUhOa9Umy8l
         AbsFlbz7JynTqt/VcdHnaNDjg/06VSbWmLj9I+Jn2jbkPTxtEPEPbxjcRLhIo0n8VV+P
         sSWsXdNpWdO6gASmdCMs7pPkgpZ43Jbr1qY86bD+/pDRWd3ZLWY9YZufWC5q9wiLefk+
         7H9Q==
X-Gm-Message-State: AOJu0YzW2PIhzM36K2CziMBx0OkkXF0nZiVIEiJxzBvh2aXit/ZsEx1l
	GrfVsn0VaUy7W7D7OitFKCQXyE1O8ySI0u07cXeoKLUuqCJ06AbKHKQ8DGR+Dzk1KY/7pXyBADA
	yMP1VzEHhIIq54/j09GY7bgM7t9KzayzqPHhYv5Y=
X-Gm-Gg: AY/fxX67/I+1YhDDG/7zDGJJC8cCqp/ZF87WDWMLcNvO+nEjpiG3hLzzf3UDEvY3Snr
	zeWpk8/SHtOJnpSL+fO9ZU802CUhSAJuvOrcUhKf7fHaihekeTpA7RZmT7oiEHJ5Dv3Fe5KSVeH
	UuWwYYmqWKRRH5biKlsLe2w+wNfpgEevhU2HYm0S4IvSbYprtCJ//LOggXq6RhBZZ2JgkKXae+W
	jnTuJmgKMsO2shRg/YsaA7Al8YTgUpmrFT5Flc7sz4zYzyfgw2h3aDkfao9BEVcxq1H9DLW
X-Google-Smtp-Source: AGHT+IFmA4KAPtRzb0ghxYL/YZOo6hu2e3faDOvmdujIANfRtaHX78l2rutkdum5szRFh3eQ9IGBx5Vfbo3ze993kCo=
X-Received: by 2002:a05:6870:9386:b0:3ec:89da:3958 with SMTP id
 586e51a60fabf-3f5bdcc31a8mr2226299fac.55.1765388508392; Wed, 10 Dec 2025
 09:41:48 -0800 (PST)
MIME-Version: 1.0
References: <20251210141639.1397030-1-ankur.tyagi85@gmail.com> <CAMKF1srzd+BgonkfytGjeT2Hi9XGYHbUxWCAcy4e8djiMt_4dA@mail.gmail.com>
In-Reply-To: <CAMKF1srzd+BgonkfytGjeT2Hi9XGYHbUxWCAcy4e8djiMt_4dA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 11 Dec 2025 06:41:36 +1300
X-Gm-Features: AQt7F2qsO8hklAuSshvRG8sjJhwWO7q-vBN_X1JuwNp9B_E-cTGV2kqHus_1ZMQ
Message-ID: <CADySD0GowWOE06X=FWpDtTumzSs3u4V3NA7i8Cb=2hc_JiLnCg@mail.gmail.com>
Subject: Re: [oe][meta-webserver][whinlatter][PATCH 1/7] nginx: switch to libpcre2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Hongxu Jia <hongxu.jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 17:41:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122566

On Wed, Dec 10, 2025 at 11:06=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> Not sure of switching defaults on a release branch is going to pan out.

Thanks for the comment Khem, I am neutral on this one and ok to drop
it if everyone agrees.

>
> On Wed, Dec 10, 2025 at 6:16=E2=80=AFAM <ankur.tyagi85@gmail.com> wrote:
>>
>> From: Hongxu Jia <hongxu.jia@windriver.com>
>>
>> NGINX 1.22 and later supports PCRE2 [1]
>>
>> [1] https://github.com/nginx/nginx/commit/c6fec0b027569a4e0b1d8aaee7dea0=
f2e4d6052b
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit 3e308aacb03631eb1ed27baad7fc28f21075e3a4)
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserv=
er/recipes-httpd/nginx/nginx.inc
>> index bcc384bd8a..fe23eb397b 100644
>> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
>> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
>> @@ -9,7 +9,7 @@ LICENSE =3D "BSD-2-Clause"
>>
>>  SECTION =3D "net"
>>
>> -DEPENDS =3D "libpcre zlib"
>> +DEPENDS =3D "libpcre2 zlib"
>>
>>  SRC_URI =3D " \
>>      http://nginx.org/download/nginx-${PV}.tar.gz \

