Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web08.36529.1606144381952480883
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AlQYeJ48;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id 7so13582990qtp.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 07:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Of/bct8T/yLXQJI3ZAZuIsBvnZbepMBa/Rbj+aFHiVI=;
        b=AlQYeJ48fgxJvKxPXLtdXso0giwVvTc8Ab7VYW6iIXJqCJmY9YXe4r9vxHj36H2HDD
         tZJqhPeLH656inrDU8qFGMZVDmpoG08fcoKLyjq3TalRy23Hwq1bbu/Dl0s81uCOcOeY
         TtWs94XTZWxTCOMeEU8wIWqEQFe6cMP75GQ93qqSePyHg2Or26uF6nVgjbbm6QeS130h
         L+uNjNav9hp65HwEoMmSbmNcY7aiv06rk3ujyO0c1IZlXGUbE6cV5rtTcRjwLX/y1zLe
         IyUjnBCSnbpgaVfUooeHVofN7g7UtGZsz+fEZDMgBWF6OTE1yGNyTAJ2fQw3jtXlBNgb
         nbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Of/bct8T/yLXQJI3ZAZuIsBvnZbepMBa/Rbj+aFHiVI=;
        b=o+vA8t76D+UjTROz+qQKIzAMS3iH5QHaXa84aST5M8FjE0MSDbALTnAy7GcQS1mJvR
         1fTung7ZbuyTOeImY1ix8nV0Ej66NvcSykOzf1OraqHQYMx9C/WAjWwaVJ6XSZTD+Ezx
         m8OtaKmT0ftcjsfzHqEa5xQql3xEI9gWm1L1Z+Z29nvui3jE6ip7rSXQOq8TWJlxWNOO
         8aLfarLNqEW1MOivbTb9Or5tUi2xIYgIs1YiaQMv42wvnY1AC7FvOq2lGGkxXyheGqQt
         SxplPWnGV4HMyqDlaV0/VjXSHbF7pj+XV9lgcbTs29q9T/9rH8Lx7sNywjP1meVYY7WH
         ZFOg==
X-Gm-Message-State: AOAM5335ucrMLLlCeQG/JZd5q6fRykpBfxo7dWqhK5aNfc3d0RVbx2bf
	bN9l00zix5zS7Tr1F/wNeQJjzyu2uH+LEWjv5IA=
X-Google-Smtp-Source: ABdhPJzvPqlf5NqpCkYS/26rpz2dG7JdEVYFvQXkwnKj+UpLpFjz+JSOX1cLo6WEwEncLv9y5ztv9SzTph+9V43TeJ0=
X-Received: by 2002:ac8:3805:: with SMTP id q5mr7774694qtb.53.1606144380991;
 Mon, 23 Nov 2020 07:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20201119155823.2741395-1-raj.khem@gmail.com> <CA+chaQd27zuYdE4Op9JrRtBFiEWEKCAyQ=o-FcRHi8dWtrYBeA@mail.gmail.com>
In-Reply-To: <CA+chaQd27zuYdE4Op9JrRtBFiEWEKCAyQ=o-FcRHi8dWtrYBeA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 23 Nov 2020 07:12:33 -0800
Message-ID: <CAMKF1sq+ZbL+FFJVCgqCjmftZL+7MzRjecWe9zL1jiyxPWWYHA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] thingsboard-gateway: Move under dynamic layers
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 6:46 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> BTW: "python3-jsonpath-rw: Add recipe for v1.4.0" commit is also only in master-next branch (and after this), so thingsboard-gateway_2.5.2.bb is broken in master completely (not only when meta-python layer isn't included).
>

thanks yeah I am still waiting on Trevor's ack on that but I guess
this one should fix the error and once
the  jsonpath-rw gets into master all will be hunky dory

> On Thu, Nov 19, 2020 at 4:58 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Depends on meta-python therefore move it here so it does not impact non
>> meta-python users
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../thingsboard-gateway/thingsboard-gateway/bacnet.json           | 0
>>  .../thingsboard-gateway/thingsboard-gateway/ble.json              | 0
>>  .../thingsboard-gateway/thingsboard-gateway/can.json              | 0
>>  .../thingsboard-gateway/thingsboard-gateway/custom_serial.json    | 0
>>  .../thingsboard-gateway/thingsboard-gateway/logs.conf             | 0
>>  .../thingsboard-gateway/thingsboard-gateway/modbus.json           | 0
>>  .../thingsboard-gateway/thingsboard-gateway/modbus_serial.json    | 0
>>  .../thingsboard-gateway/thingsboard-gateway/mqtt.json             | 0
>>  .../thingsboard-gateway/thingsboard-gateway/odbc.json             | 0
>>  .../thingsboard-gateway/thingsboard-gateway/opcua.json            | 0
>>  .../thingsboard-gateway/thingsboard-gateway/request.json          | 0
>>  .../thingsboard-gateway/thingsboard-gateway/rest.json             | 0
>>  .../thingsboard-gateway/thingsboard-gateway/snmp.json             | 0
>>  .../thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml       | 0
>>  .../thingsboard-gateway/thingsboard-gateway.service               | 0
>>  .../thingsboard-gateway/thingsboard-gateway_2.5.2.bb              | 0
>>  16 files changed, 0 insertions(+), 0 deletions(-)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service (100%)
>>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.5.2.bb (100%)
>>
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.5.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.5.2.bb
>> similarity index 100%
>> rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.5.2.bb
>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.5.2.bb
>> --
>> 2.29.2
>>
>>
>> 
>>
