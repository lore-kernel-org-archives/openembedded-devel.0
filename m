Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A9CD2AB3A
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 12:39:42 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.18440.1730205577972799378
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 05:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LaqzTswM;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53b1fbb8be5so5247917e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 05:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730205576; x=1730810376; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrqZDStOjjKbCAzb2fhncTqYfrW8zC7wCMuTzycY1qo=;
        b=LaqzTswM0UzHcKu3UI6Bldrx3snvpt6MNqrKjpsCpvNoDexHPxed+sj8neehIDyL15
         t8eD2UJhis2p89lfn+xuXRunZQAqGTgwpZTIg/0ySO6plV3bYLHgWmSTAuu6yb9ahYiF
         x8/+gg3E1NEl9375y/YiOWyp9K7O4MYl7k1rrDxudJ3XUCRn7mBaoHNmTfBd7pbqS7ex
         Xewv9JZ9bTrxLYcg9r8j8tmdHzXfaXdF3HnVAUD9R65Xxjpujiad9K+uACzoumzeR30E
         BwX38BTp3QZXV75gc8edOU02b6QP2er7QBfIbZuale76fHtJCQVLB2PLVOw9XkI7BQDt
         Hmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730205576; x=1730810376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrqZDStOjjKbCAzb2fhncTqYfrW8zC7wCMuTzycY1qo=;
        b=IWWKaBx+DhSUn/IQL9IwXomgPksDi6qUvtZYrzUfePkMAAhwzSC/BSMtYN9Z0MCHSp
         MvKcnfoHVTEYe3YyA00ChLt437cAC0DzJ8l+mjgPShxoYeRNV2aWApNrpBC1NWihzEGO
         5xafQeY55DWHPO1CJwi+W1B8A2SX/4NeAn85exz3brz47MIjr+SRWKexO5NUK6lRCrh0
         cbu1SeHWSVMqeNVhMVVbPSIgqT91jpIIEfTV2TUqq0/pqJROoHbIYVbTA6HZOGtzhF5N
         l7+91Q2FQix76mW8pbwBXCsWzHOh/X9qnzhm+19sSmEeYwYVFTvL0I/zKfjntB3UD1Nz
         FWcg==
X-Forwarded-Encrypted: i=1; AJvYcCXk29pdPWlBw0UJR3RpHRZOJqI4XLzjiNVpizv8IAFdui3JDzvldQQdOhmNnAo2DvYBbjsQVOdxvsC1NCseBkSWiC8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwSS12M0jces8YAiUlPGGNVo09YehJGxzbhx2hbl0iGQ5TjkwjI
	+L5fhHlyDJth18NsqRhS3CNElDig97SY/AKe4Rsavwqi5ovvcp9h2ZYuHd7Xv/XjsLESLi/JyrO
	yBaPFXUsX/DG9t/pnbJdqDnGpLZE=
X-Google-Smtp-Source: AGHT+IGVPS67/H31W9S+Pu7t5yQl55WoCrDnimBEYHAJeTRzTA2QFWaJdGPNAAOmpG3uuJjifoFmIGgqawRsl6spkOE=
X-Received: by 2002:a05:6512:696:b0:539:fcf0:268e with SMTP id
 2adb3069b0e04-53b4922ad58mr735499e87.14.1730205575396; Tue, 29 Oct 2024
 05:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241024135126.48781-1-brgl@bgdev.pl> <29bbf4a17cfa28fc45c0f3e7fe3b472170d6bdec.camel@siemens.com>
 <CAMKF1spzk7ezwr1ekRq+NxoLFuT3gZ66-ARsc1_ZYfi0czwUgg@mail.gmail.com>
In-Reply-To: <CAMKF1spzk7ezwr1ekRq+NxoLFuT3gZ66-ARsc1_ZYfi0czwUgg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 29 Oct 2024 13:39:23 +0100
Message-ID: <CA+chaQdCQquu7TDt=YONbXmA8rpdoALUDPJ22eJRe50Zumo73g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] libgpiod: update to v2.2
To: raj.khem@gmail.com
Cc: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, "brgl@bgdev.pl" <brgl@bgdev.pl>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 12:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113324

Doesn't this upgrade break python3-gpiod
(meta-oe/meta-python/recipes-devtools/python/python3-gpiod_2.2.1.bb)?

In world builds I'm seeing new build failure which looks like caused
by update libgpiod API:

gpiod/ext/chip.c: In function 'chip_path':
gpiod/ext/chip.c:43:37: error: implicit declaration of function
'gpiod_chip_get_path'; did you mean 'gpiod_chip_get_line'?
[-Wimplicit-function-declaration]
   43 |         return PyUnicode_FromString(gpiod_chip_get_path(self->chip)=
);
      |                                     ^~~~~~~~~~~~~~~~~~~
      |                                     gpiod_chip_get_line
gpiod/ext/chip.c:43:37: error: passing argument 1 of
'PyUnicode_FromString' makes pointer from integer without a cast
[-Wint-conversion]
   43 |         return PyUnicode_FromString(gpiod_chip_get_path(self->chip)=
);
      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                     |
      |                                     int
In file included from
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-gpiod/2.2.1/recipe-sy=
sroot/usr/include/python3.13/Python.h:79,
                 from gpiod/ext/internal.h:8:
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-gpiod/2.2.1/recipe-sy=
sroot/usr/include/python3.13/unicodeobject.h:130:17:
note: expected 'const char *' but argument is of type 'int'
  130 |     const char *u              /* UTF-8 encoded string */
      |     ~~~~~~~~~~~~^
gpiod/ext/chip.c: In function 'chip_fd':
gpiod/ext/chip.c:48:32: error: implicit declaration of function
'gpiod_chip_get_fd'; did you mean 'gpiod_chip_get_line'?
[-Wimplicit-function-declaration]
   48 |         return PyLong_FromLong(gpiod_chip_get_fd(self->chip));
      |                                ^~~~~~~~~~~~~~~~~
      |                                gpiod_chip_get_line
gpiod/ext/chip.c: In function 'chip_get_info':
gpiod/ext/chip.c:82:16: error: implicit declaration of function
'gpiod_chip_get_info'; did you mean 'gpiod_chip_get_lines'?
[-Wimplicit-function-declaration]
   82 |         info =3D gpiod_chip_get_info(self->chip);
      |                ^~~~~~~~~~~~~~~~~~~
      |                gpiod_chip_get_lines
gpiod/ext/chip.c:82:14: error: assignment to 'struct gpiod_chip_info
*' from 'int' makes pointer from integer without a cast
[-Wint-conversion]
   82 |         info =3D gpiod_chip_get_info(self->chip);
      |              ^
gpiod/ext/chip.c:87:38: error: implicit declaration of function
'gpiod_chip_info_get_name'; did you mean 'gpiod_chip_open_by_name'?
[-Wimplicit-function-declaration]
   87 |                                      gpiod_chip_info_get_name(info)=
,
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
      |                                      gpiod_chip_open_by_name
gpiod/ext/chip.c:88:38: error: implicit declaration of function
'gpiod_chip_info_get_label'; did you mean 'gpiod_chip_open_by_label'?
[-Wimplicit-function-declaration]
   88 |                                      gpiod_chip_info_get_label(info=
),
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
      |                                      gpiod_chip_open_by_label
gpiod/ext/chip.c:89:38: error: implicit declaration of function
'gpiod_chip_info_get_num_lines'; did you mean
'gpiod_chip_get_all_lines'? [-Wimplicit-function-declaration]
   89 |
gpiod_chip_info_get_num_lines(info));
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                      gpiod_chip_get_all_lines
gpiod/ext/chip.c:90:10: error: implicit declaration of function
'gpiod_chip_info_free'; did you mean 'gpiod_chip_iter_free'?
[-Wimplicit-function-declaration]
   90 |          gpiod_chip_info_free(info);
      |          ^~~~~~~~~~~~~~~~~~~~
      |          gpiod_chip_iter_free
gpiod/ext/chip.c: At top level:
gpiod/ext/chip.c:94:40: warning: 'struct gpiod_line_info' declared
inside parameter list will not be visible outside of this definition
or declaration
   94 | static PyObject *make_line_info(struct gpiod_line_info *info)
      |                                        ^~~~~~~~~~~~~~~
gpiod/ext/chip.c: In function 'make_line_info':
gpiod/ext/chip.c:103:33: error: implicit declaration of function
'gpiod_line_info_get_offset'; did you mean 'gpiod_line_offset'?
[-Wimplicit-function-declaration]
  103 |                                 gpiod_line_info_get_offset(info),
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 gpiod_line_offset
gpiod/ext/chip.c:104:33: error: implicit declaration of function
'gpiod_line_info_get_name'; did you mean 'gpiod_line_bulk_get_line'?
[-Wimplicit-function-declaration]
  104 |                                 gpiod_line_info_get_name(info),
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
      |                                 gpiod_line_bulk_get_line
gpiod/ext/chip.c:105:33: error: implicit declaration of function
'gpiod_line_info_is_used'; did you mean 'gpiod_line_is_used'?
[-Wimplicit-function-declaration]
  105 |                                 gpiod_line_info_is_used(info) ?
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
      |                                 gpiod_line_is_used
gpiod/ext/chip.c:107:33: error: implicit declaration of function
'gpiod_line_info_get_consumer'; did you mean 'gpiod_line_consumer'?
[-Wimplicit-function-declaration]
  107 |                                 gpiod_line_info_get_consumer(info),
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 gpiod_line_consumer
gpiod/ext/chip.c:108:33: error: implicit declaration of function
'gpiod_line_info_get_direction'; did you mean 'gpiod_line_direction'?
[-Wimplicit-function-declaration]
  108 |                                 gpiod_line_info_get_direction(info)=
,
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 gpiod_line_direction
gpiod/ext/chip.c:109:33: error: implicit declaration of function
'gpiod_line_info_is_active_low' [-Wimplicit-function-declaration]
  109 |                                 gpiod_line_info_is_active_low(info)=
 ?
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gpiod/ext/chip.c:111:33: error: implicit declaration of function
'gpiod_line_info_get_bias'; did you mean 'gpiod_line_bulk_get_line'?
[-Wimplicit-function-declaration]
  111 |                                 gpiod_line_info_get_bias(info),
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
      |                                 gpiod_line_bulk_get_line
gpiod/ext/chip.c:112:33: error: implicit declaration of function
'gpiod_line_info_get_drive'; did you mean 'gpiod_line_bulk_get_line'?
[-Wimplicit-function-declaration]
  112 |                                 gpiod_line_info_get_drive(info),
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 gpiod_line_bulk_get_line
gpiod/ext/chip.c:113:33: error: implicit declaration of function
'gpiod_line_info_get_edge_detection' [-Wimplicit-function-declaration]
  113 |
gpiod_line_info_get_edge_detection(info),
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gpiod/ext/chip.c:114:33: error: implicit declaration of function
'gpiod_line_info_get_event_clock' [-Wimplicit-function-declaration]
  114 |                                 gpiod_line_info_get_event_clock(inf=
o),
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gpiod/ext/chip.c:115:33: error: implicit declaration of function
'gpiod_line_info_is_debounced'; did you mean
'gpiod_line_is_open_source'? [-Wimplicit-function-declaration]
  115 |                                 gpiod_line_info_is_debounced(info) =
?
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 gpiod_line_is_open_source
gpiod/ext/chip.c:117:33: error: implicit declaration of function
'gpiod_line_info_get_debounce_period_us'
[-Wimplicit-function-declaration]
  117 |
gpiod_line_info_get_debounce_period_us(info));
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
gpiod/ext/chip.c: In function 'chip_get_line_info':
gpiod/ext/chip.c:133:24: error: implicit declaration of function
'gpiod_chip_watch_line_info'; did you mean 'gpiod_chip_get_lines'?
[-Wimplicit-function-declaration]
  133 |                 info =3D gpiod_chip_watch_line_info(self->chip, off=
set);
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |                        gpiod_chip_get_lines
gpiod/ext/chip.c:133:22: error: assignment to 'struct gpiod_line_info
*' from 'int' makes pointer from integer without a cast
[-Wint-conversion]
  133 |                 info =3D gpiod_chip_watch_line_info(self->chip, off=
set);
      |                      ^
gpiod/ext/chip.c:135:24: error: implicit declaration of function
'gpiod_chip_get_line_info'; did you mean 'gpiod_chip_get_lines'?
[-Wimplicit-function-declaration]
  135 |                 info =3D gpiod_chip_get_line_info(self->chip, offse=
t);
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~
      |                        gpiod_chip_get_lines
gpiod/ext/chip.c:135:22: error: assignment to 'struct gpiod_line_info
*' from 'int' makes pointer from integer without a cast
[-Wint-conversion]
  135 |                 info =3D gpiod_chip_get_line_info(self->chip, offse=
t);
      |                      ^
gpiod/ext/chip.c:140:35: error: passing argument 1 of 'make_line_info'
from incompatible pointer type [-Wincompatible-pointer-types]
  140 |         info_obj =3D make_line_info(info);
      |                                   ^~~~
      |                                   |
      |                                   struct gpiod_line_info *
gpiod/ext/chip.c:94:57: note: expected 'struct gpiod_line_info *' but
argument is of type 'struct gpiod_line_info *'
   94 | static PyObject *make_line_info(struct gpiod_line_info *info)
      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
gpiod/ext/chip.c:141:9: error: implicit declaration of function
'gpiod_line_info_free'; did you mean 'gpiod_line_iter_free'?
[-Wimplicit-function-declaration]
  141 |         gpiod_line_info_free(info);
      |         ^~~~~~~~~~~~~~~~~~~~
      |         gpiod_line_iter_free
gpiod/ext/chip.c: In function 'chip_unwatch_line_info':
gpiod/ext/chip.c:156:15: error: implicit declaration of function
'gpiod_chip_unwatch_line_info'; did you mean 'chip_unwatch_line_info'?
[-Wimplicit-function-declaration]
  156 |         ret =3D gpiod_chip_unwatch_line_info(self->chip, offset);
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |               chip_unwatch_line_info
gpiod/ext/chip.c: In function 'chip_read_info_event':
gpiod/ext/chip.c:176:17: error: implicit declaration of function
'gpiod_chip_read_info_event'; did you mean 'chip_read_info_event'?
[-Wimplicit-function-declaration]
  176 |         event =3D gpiod_chip_read_info_event(self->chip);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |                 chip_read_info_event
gpiod/ext/chip.c:176:15: error: assignment to 'struct gpiod_info_event
*' from 'int' makes pointer from integer without a cast
[-Wint-conversion]
  176 |         event =3D gpiod_chip_read_info_event(self->chip);
      |               ^
gpiod/ext/chip.c:181:16: error: implicit declaration of function
'gpiod_info_event_get_line_info' [-Wimplicit-function-declaration]
  181 |         info =3D gpiod_info_event_get_line_info(event);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gpiod/ext/chip.c:181:14: error: assignment to 'struct gpiod_line_info
*' from 'int' makes pointer from integer without a cast
[-Wint-conversion]
  181 |         info =3D gpiod_info_event_get_line_info(event);
      |              ^
gpiod/ext/chip.c:183:35: error: passing argument 1 of 'make_line_info'
from incompatible pointer type [-Wincompatible-pointer-types]
  183 |         info_obj =3D make_line_info(info);
      |                                   ^~~~
      |                                   |
      |                                   struct gpiod_line_info *
gpiod/ext/chip.c:94:57: note: expected 'struct gpiod_line_info *' but
argument is of type 'struct gpiod_line_info *'
   94 | static PyObject *make_line_info(struct gpiod_line_info *info)
      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
gpiod/ext/chip.c:185:17: error: implicit declaration of function
'gpiod_info_event_free'; did you mean 'gpiod_line_event_read'?
[-Wimplicit-function-declaration]
  185 |                 gpiod_info_event_free(event);
      |                 ^~~~~~~~~~~~~~~~~~~~~
      |                 gpiod_line_event_read
gpiod/ext/chip.c:190:33: error: implicit declaration of function
'gpiod_info_event_get_event_type' [-Wimplicit-function-declaration]
  190 |                                 gpiod_info_event_get_event_type(eve=
nt),
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gpiod/ext/chip.c:191:33: error: implicit declaration of function
'gpiod_info_event_get_timestamp_ns' [-Wimplicit-function-declaration]
  191 |
gpiod_info_event_get_timestamp_ns(event),
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gpiod/ext/chip.c: In function 'chip_line_offset_from_id':
gpiod/ext/chip.c:208:18: error: implicit declaration of function
'gpiod_chip_get_line_offset_from_name'
[-Wimplicit-function-declaration]
  208 |         offset =3D gpiod_chip_get_line_offset_from_name(self->chip,=
 name);
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gpiod/ext/chip.c: In function 'make_request_config':
gpiod/ext/chip.c:223:19: error: implicit declaration of function
'gpiod_request_config_new' [-Wimplicit-function-declaration]
  223 |         req_cfg =3D gpiod_request_config_new();
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~
gpiod/ext/chip.c:223:17: error: assignment to 'struct
gpiod_request_config *' from 'int' makes pointer from integer without
a cast [-Wint-conversion]
  223 |         req_cfg =3D gpiod_request_config_new();
      |                 ^
gpiod/ext/chip.c:232:25: error: implicit declaration of function
'gpiod_request_config_free' [-Wimplicit-function-declaration]
  232 |                         gpiod_request_config_free(req_cfg);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
gpiod/ext/chip.c:236:17: error: implicit declaration of function
'gpiod_request_config_set_consumer' [-Wimplicit-function-declaration]
  236 |                 gpiod_request_config_set_consumer(req_cfg, consumer=
);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gpiod/ext/chip.c:246:17: error: implicit declaration of function
'gpiod_request_config_set_event_buffer_size'
[-Wimplicit-function-declaration]
  246 |                 gpiod_request_config_set_event_buffer_size(req_cfg,
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gpiod/ext/chip.c: In function 'chip_request_lines':
gpiod/ext/chip.c:275:19: error: implicit declaration of function
'gpiod_chip_request_lines'; did you mean 'gpiod_chip_get_lines'?
[-Wimplicit-function-declaration]
  275 |         request =3D gpiod_chip_request_lines(self->chip,
req_cfg, line_cfg);
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~
      |                   gpiod_chip_get_lines
gpiod/ext/chip.c:275:17: error: assignment to 'struct
gpiod_line_request *' from 'int' makes pointer from integer without a
cast [-Wint-conversion]
  275 |         request =3D gpiod_chip_request_lines(self->chip,
req_cfg, line_cfg);
      |                 ^
gpiod/ext/chip.c:283:25: error: implicit declaration of function
'gpiod_request_config_get_event_buffer_size'
[-Wimplicit-function-declaration]
  283 |
gpiod_request_config_get_event_buffer_size(req_cfg));
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gpiod/ext/chip.c:282:46: error: passing argument 1 of
'Py_gpiod_MakeRequestObject' from incompatible pointer type
[-Wincompatible-pointer-types]
  282 |         req_obj =3D Py_gpiod_MakeRequestObject(request,
      |                                              ^~~~~~~
      |                                              |
      |                                              struct gpiod_line_requ=
est *
gpiod/ext/internal.h:14:65: note: expected 'struct gpiod_line_request
*' but argument is of type 'struct gpiod_line_request *'
   14 | PyObject *Py_gpiod_MakeRequestObject(struct gpiod_line_request *req=
uest,
      |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~=
~~~~
gpiod/ext/chip.c:285:17: error: implicit declaration of function
'gpiod_line_request_release'; did you mean 'gpiod_line_request_bulk'?
[-Wimplicit-function-declaration]
  285 |                 gpiod_line_request_release(request);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |                 gpiod_line_request_bulk
error: command 'TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-gpiod=
/2.2.1/recipe-sysroot-native/usr/bin/aarch64-webos-linux/aarch64-webos-linu=
x-gcc'
failed with exit code 1

On Thu, Oct 24, 2024 at 4:19=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Thanks for testing and Review Alexander.
>
> On Thu, Oct 24, 2024 at 7:10=E2=80=AFAM Sverdlin, Alexander
> <alexander.sverdlin@siemens.com> wrote:
> >
> > Hello all,
> >
> > On Thu, 2024-10-24 at 15:51 +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > This is a big update for libgpiod bringing in the D-Bus daemon and it=
s
> > > command-line client. This is why the patch is pretty hefty. The major=
ity
> > > of the line count comes from the removed patch that is now upstream b=
ut
> > > the v2.2 recipe also now contains a lot of bits and pieces that make =
the
> > > D-Bus daemon work both with system as well as sysvinit.
> > >
> > > The project now packages the systemd service and udev rules that allo=
w
> > > the manager to run under its own user in a well sandboxed environment
> > > but the sysvsinit script is carried in the recipe as I don't want to
> > > put support for legacy systems in libgpiod repo.
> > >
> > > The patch also updates the ptests for libgpiod to run three new
> > > test-suites: one for GLib bindings, one for the command-line D-Bus
> > > client and finally one testing some daemon corner-cases not supported=
 by
> > > the client.
> > >
> > > Build tested with various config options with systemd and sysvinit (t=
he
> > > latter with glibc and musl) on 32- and 64-bit architectures.
> > >
> > > The complete changelog since v2.1 (taken verbatim from the NEWS file)=
 is
> > > below:
> > >
> > > libgpiod v2.2
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > New features:
> > > - add GObject bindings with introspection
> > > - add a D-Bus interface to libgpiod together with a daemon implementi=
ng it and
> > >   a command-line client
> > > - split out the common shell test code for gpio-tools into a reusable=
 test
> > >   harness for GPIO command-line tools
> > > - add minutes as a new supported time unit for tools and allow longer=
 periods
> > >   for timeouts, line holding, etc.
> > > - add a script for generating sdist and wheels for python bindings
> > > - migrate C++ tests to using Catch2 v3
> > >
> > > Improvements:
> > > - relicense C++ bindings under LGPL-2.1-or-later in order to make the=
 project
> > >   more attractive to users with GPL-3.0 restrictions
> > > - remove dependency on grep from tools' tests
> > > - make shell scripts pass shellcheck treewide
> > > - use ppoll() in tools to actually achieve the advertised microsecond
> > >   granularity of timeouts
> > > - documentation improvements
> > > - improve typing info in python bindings
> > > - improve __repr__() implementations in python bindings
> > > - make reconfiguring lines more flexible in python bindings by relaxi=
ng the
> > >   requirement to carry the ordering of the config entries from the re=
quest
> > > - support casting of line.Value to bool in python bindings
> > > - various new test-cases for improved coverage treewide
> > > - align the test cases with the current kernel requirement for specif=
ying
> > >   direction explicitly when reconfiguring lines
> > >
> > > Bug fixes:
> > > - fix C++ bindings build using slibtool
> > > - accept the new style automatic GPIO chip labels from gpio-sim in ba=
sh tests
> > > - fix C++ tests with recent kernels which introduced stricter reconfi=
gure
> > >   behavior
> > > - fix a use-after-free bug in python bindings
> > > - fix passing the event clock property to line requests in python bin=
dings
> > > - fix a memory leak in tools
> > > - make sure the string buffers in line-info and chip-info are big eno=
ugh to not
> > >   truncate the strings they hold below the size accepted by the kerne=
l
> > > - remove buggy and unnecessary flags sanitization from line-config
> > > - fix python bindings installation with Makefile build
> > > - sanitize the return values of GPIO ioctl()s which in some cases may=
 be
> > >   erroneously positive
> > > - fix requesting lines by name with multiple entries in python bindin=
gs
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > I admit I had to backport it to scarthgap to test (along with glib 2.80=
, etc),
> > but I didn't notice any problems and I'm able to start gpio-manager
> > (systemd service) and control it over gpiocli.
> >
> > Thanks a lot Bartosz!
> >
> > Reviewed-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> >
> > > ---
> > > Changes in v3:
> > > - make dbus a runtime dependency for the 'dbus' and 'tests' PACKAGECO=
NFIG
> > >   switches
> > > - make libgpiod-manager a runtime dependency for libgpiod-cli
> > >
> > > Changes in v2:
> > > - fix SRC_URI[sha256sum] value
> > >
> > >  ...cxx-Migrate-C-tests-to-use-Catch2-v3.patch | 530 ----------------=
--
> > >  .../libgpiod/libgpiod-2.x/gpio-manager.init   |  76 +++
> > >  .../libgpiod/libgpiod-2.x/run-ptest           |  43 +-
> > >  .../libgpiod/libgpiod_2.1.3.bb                |  33 --
> > >  .../recipes-support/libgpiod/libgpiod_2.2.bb  |  99 ++++
> > >  5 files changed, 206 insertions(+), 575 deletions(-)
> > >  delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/000=
1-bindings-cxx-Migrate-C-tests-to-use-Catch2-v3.patch
> > >  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpi=
o-manager.init
> > >  delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_2.1.3.b=
b
> > >  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> >
> > --
> > Alexander Sverdlin
> > Siemens AG
> > www.siemens.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113171): https://lists.openembedded.org/g/openembedde=
d-devel/message/113171
> Mute This Topic: https://lists.openembedded.org/mt/109190169/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

