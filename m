Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2214D2AB3C
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 12:48:41 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.18684.1730206112326757632
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 05:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=l9+bYGaB;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d5aedd177so3616315f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1730206111; x=1730810911; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0y4PnI3vJ4i5jnSNtI6Svf2/JipN3NU/qr9cwtcqJPQ=;
        b=l9+bYGaBaoHC53LI/0tGFehCN+l75IscvRmzHbA4IOjHM2yfoqj9o+blOINVmufYGD
         gIGyma+BdSEjkstKEF0TNMpOB3CPUOUoCp7bZ91ydbrVW0lUBXwnglxeuCzXHY17JO7n
         HmwjjOP+qWSI5IN/zmpydasDpaAD6yLxDse2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730206111; x=1730810911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0y4PnI3vJ4i5jnSNtI6Svf2/JipN3NU/qr9cwtcqJPQ=;
        b=vxVTARgRLjgm4r86CrcQrZqdLsWjJ206F4GspND5zQ6PWuaLLFT0RAplSQnH7Ul4d3
         J0WRFFPghwafR3hSh6EnSjwFrWraFlwzC+LWqO7CwmENwnTe2EO2Hf4htGzIbXk13ucx
         lWfdmiI5JLp9eJJNndWConMHcswy76vqkuX3hCx+srE61OGPvhYeL7Bvg+08fcuh4up4
         esrS9UoaN/DSVgRZbsOKbIOK5bkhcUM1YXzfZx8Ml3R6BXtmpjKfIJsaF70ZwZUZxoLA
         9RgH8aFlM3r+OPcB84S3b78k4sg4aVInOCRTe6DoShxKeNVKBoUPjFzZpV1LinQFKsC9
         Ad7g==
X-Forwarded-Encrypted: i=1; AJvYcCUCYgopDPkwWhbD366IaRHEixExm+h+kpH5yGnw0k0TOAHcrp/bkGl8MYyuCSq9ySMrw6y1qyzDcvPI/+v6oGL1b44=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyA9Zh0Fwb07bdlzvAdpadjZoKkcvPjt9m+UNPPC3cm6tkDI+2
	P1mwaCZ7NSTECZYHM6yQnLZkeSzebA6JChNtURp8FT1s60fMHxlVrwcyWscW7940r8bvot2B8x/
	LwiLIpqtMTAYdD56tKJbJv7sHMzyhAK3NWJCJhA==
X-Google-Smtp-Source: AGHT+IGydMVUzJwnzGm40ya906reftmqRhKnEa13cir9jTMsQkxyfKlpRB+yAKkcPlK93nRhqEGvhJqDVRhUl0Lu6Ak=
X-Received: by 2002:adf:ed43:0:b0:37c:d1c7:a0c0 with SMTP id
 ffacd0b85a97d-3806115ab9fmr8960792f8f.30.1730206110549; Tue, 29 Oct 2024
 05:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241024135126.48781-1-brgl@bgdev.pl> <29bbf4a17cfa28fc45c0f3e7fe3b472170d6bdec.camel@siemens.com>
 <CAMKF1spzk7ezwr1ekRq+NxoLFuT3gZ66-ARsc1_ZYfi0czwUgg@mail.gmail.com> <CA+chaQdCQquu7TDt=YONbXmA8rpdoALUDPJ22eJRe50Zumo73g@mail.gmail.com>
In-Reply-To: <CA+chaQdCQquu7TDt=YONbXmA8rpdoALUDPJ22eJRe50Zumo73g@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 29 Oct 2024 13:48:04 +0100
Message-ID: <CAMSfU+7nxacg36pTWkrMcrtmUbfUjEhciomKrdBeD1Cs05+3aw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] libgpiod: update to v2.2
To: martin.jansa@gmail.com
Cc: raj.khem@gmail.com, "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, "brgl@bgdev.pl" <brgl@bgdev.pl>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009ba62306259d00e1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 12:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113325

--0000000000009ba62306259d00e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 29 oct. 2024 =C3=A0 13:39, Martin Jansa via lists.openembedded.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> Doesn't this upgrade break python3-gpiod
> (meta-oe/meta-python/recipes-devtools/python/python3-gpiod_2.2.1.bb)?
>
Looks like it.
Error seen by autobuilder as well :
https://valkyrie.yoctoproject.org/#/builders/87/builds/16/steps/40/logs/std=
io


>
> In world builds I'm seeing new build failure which looks like caused
> by update libgpiod API:
>
> gpiod/ext/chip.c: In function 'chip_path':
> gpiod/ext/chip.c:43:37: error: implicit declaration of function
> 'gpiod_chip_get_path'; did you mean 'gpiod_chip_get_line'?
> [-Wimplicit-function-declaration]
>    43 |         return
> PyUnicode_FromString(gpiod_chip_get_path(self->chip));
>       |                                     ^~~~~~~~~~~~~~~~~~~
>       |                                     gpiod_chip_get_line
> gpiod/ext/chip.c:43:37: error: passing argument 1 of
> 'PyUnicode_FromString' makes pointer from integer without a cast
> [-Wint-conversion]
>    43 |         return
> PyUnicode_FromString(gpiod_chip_get_path(self->chip));
>       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>       |                                     |
>       |                                     int
> In file included from
>
> TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-gpiod/2.2.1/recipe-=
sysroot/usr/include/python3.13/Python.h:79,
>                  from gpiod/ext/internal.h:8:
>
> TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-gpiod/2.2.1/recipe-=
sysroot/usr/include/python3.13/unicodeobject.h:130:17:
> note: expected 'const char *' but argument is of type 'int'
>   130 |     const char *u              /* UTF-8 encoded string */
>       |     ~~~~~~~~~~~~^
> gpiod/ext/chip.c: In function 'chip_fd':
> gpiod/ext/chip.c:48:32: error: implicit declaration of function
> 'gpiod_chip_get_fd'; did you mean 'gpiod_chip_get_line'?
> [-Wimplicit-function-declaration]
>    48 |         return PyLong_FromLong(gpiod_chip_get_fd(self->chip));
>       |                                ^~~~~~~~~~~~~~~~~
>       |                                gpiod_chip_get_line
> gpiod/ext/chip.c: In function 'chip_get_info':
> gpiod/ext/chip.c:82:16: error: implicit declaration of function
> 'gpiod_chip_get_info'; did you mean 'gpiod_chip_get_lines'?
> [-Wimplicit-function-declaration]
>    82 |         info =3D gpiod_chip_get_info(self->chip);
>       |                ^~~~~~~~~~~~~~~~~~~
>       |                gpiod_chip_get_lines
> gpiod/ext/chip.c:82:14: error: assignment to 'struct gpiod_chip_info
> *' from 'int' makes pointer from integer without a cast
> [-Wint-conversion]
>    82 |         info =3D gpiod_chip_get_info(self->chip);
>       |              ^
> gpiod/ext/chip.c:87:38: error: implicit declaration of function
> 'gpiod_chip_info_get_name'; did you mean 'gpiod_chip_open_by_name'?
> [-Wimplicit-function-declaration]
>    87 |
> gpiod_chip_info_get_name(info),
>       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
>       |                                      gpiod_chip_open_by_name
> gpiod/ext/chip.c:88:38: error: implicit declaration of function
> 'gpiod_chip_info_get_label'; did you mean 'gpiod_chip_open_by_label'?
> [-Wimplicit-function-declaration]
>    88 |
> gpiod_chip_info_get_label(info),
>       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                      gpiod_chip_open_by_label
> gpiod/ext/chip.c:89:38: error: implicit declaration of function
> 'gpiod_chip_info_get_num_lines'; did you mean
> 'gpiod_chip_get_all_lines'? [-Wimplicit-function-declaration]
>    89 |
> gpiod_chip_info_get_num_lines(info));
>       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
>       |                                      gpiod_chip_get_all_lines
> gpiod/ext/chip.c:90:10: error: implicit declaration of function
> 'gpiod_chip_info_free'; did you mean 'gpiod_chip_iter_free'?
> [-Wimplicit-function-declaration]
>    90 |          gpiod_chip_info_free(info);
>       |          ^~~~~~~~~~~~~~~~~~~~
>       |          gpiod_chip_iter_free
> gpiod/ext/chip.c: At top level:
> gpiod/ext/chip.c:94:40: warning: 'struct gpiod_line_info' declared
> inside parameter list will not be visible outside of this definition
> or declaration
>    94 | static PyObject *make_line_info(struct gpiod_line_info *info)
>       |                                        ^~~~~~~~~~~~~~~
> gpiod/ext/chip.c: In function 'make_line_info':
> gpiod/ext/chip.c:103:33: error: implicit declaration of function
> 'gpiod_line_info_get_offset'; did you mean 'gpiod_line_offset'?
> [-Wimplicit-function-declaration]
>   103 |                                 gpiod_line_info_get_offset(info),
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                 gpiod_line_offset
> gpiod/ext/chip.c:104:33: error: implicit declaration of function
> 'gpiod_line_info_get_name'; did you mean 'gpiod_line_bulk_get_line'?
> [-Wimplicit-function-declaration]
>   104 |                                 gpiod_line_info_get_name(info),
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
>       |                                 gpiod_line_bulk_get_line
> gpiod/ext/chip.c:105:33: error: implicit declaration of function
> 'gpiod_line_info_is_used'; did you mean 'gpiod_line_is_used'?
> [-Wimplicit-function-declaration]
>   105 |                                 gpiod_line_info_is_used(info) ?
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
>       |                                 gpiod_line_is_used
> gpiod/ext/chip.c:107:33: error: implicit declaration of function
> 'gpiod_line_info_get_consumer'; did you mean 'gpiod_line_consumer'?
> [-Wimplicit-function-declaration]
>   107 |                                 gpiod_line_info_get_consumer(info=
),
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                 gpiod_line_consumer
> gpiod/ext/chip.c:108:33: error: implicit declaration of function
> 'gpiod_line_info_get_direction'; did you mean 'gpiod_line_direction'?
> [-Wimplicit-function-declaration]
>   108 |
>  gpiod_line_info_get_direction(info),
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                 gpiod_line_direction
> gpiod/ext/chip.c:109:33: error: implicit declaration of function
> 'gpiod_line_info_is_active_low' [-Wimplicit-function-declaration]
>   109 |
>  gpiod_line_info_is_active_low(info) ?
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> gpiod/ext/chip.c:111:33: error: implicit declaration of function
> 'gpiod_line_info_get_bias'; did you mean 'gpiod_line_bulk_get_line'?
> [-Wimplicit-function-declaration]
>   111 |                                 gpiod_line_info_get_bias(info),
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
>       |                                 gpiod_line_bulk_get_line
> gpiod/ext/chip.c:112:33: error: implicit declaration of function
> 'gpiod_line_info_get_drive'; did you mean 'gpiod_line_bulk_get_line'?
> [-Wimplicit-function-declaration]
>   112 |                                 gpiod_line_info_get_drive(info),
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                 gpiod_line_bulk_get_line
> gpiod/ext/chip.c:113:33: error: implicit declaration of function
> 'gpiod_line_info_get_edge_detection' [-Wimplicit-function-declaration]
>   113 |
> gpiod_line_info_get_edge_detection(info),
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> gpiod/ext/chip.c:114:33: error: implicit declaration of function
> 'gpiod_line_info_get_event_clock' [-Wimplicit-function-declaration]
>   114 |
>  gpiod_line_info_get_event_clock(info),
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> gpiod/ext/chip.c:115:33: error: implicit declaration of function
> 'gpiod_line_info_is_debounced'; did you mean
> 'gpiod_line_is_open_source'? [-Wimplicit-function-declaration]
>   115 |                                 gpiod_line_info_is_debounced(info=
)
> ?
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                 gpiod_line_is_open_source
> gpiod/ext/chip.c:117:33: error: implicit declaration of function
> 'gpiod_line_info_get_debounce_period_us'
> [-Wimplicit-function-declaration]
>   117 |
> gpiod_line_info_get_debounce_period_us(info));
>       |
>  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> gpiod/ext/chip.c: In function 'chip_get_line_info':
> gpiod/ext/chip.c:133:24: error: implicit declaration of function
> 'gpiod_chip_watch_line_info'; did you mean 'gpiod_chip_get_lines'?
> [-Wimplicit-function-declaration]
>   133 |                 info =3D gpiod_chip_watch_line_info(self->chip,
> offset);
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                        gpiod_chip_get_lines
> gpiod/ext/chip.c:133:22: error: assignment to 'struct gpiod_line_info
> *' from 'int' makes pointer from integer without a cast
> [-Wint-conversion]
>   133 |                 info =3D gpiod_chip_watch_line_info(self->chip,
> offset);
>       |                      ^
> gpiod/ext/chip.c:135:24: error: implicit declaration of function
> 'gpiod_chip_get_line_info'; did you mean 'gpiod_chip_get_lines'?
> [-Wimplicit-function-declaration]
>   135 |                 info =3D gpiod_chip_get_line_info(self->chip,
> offset);
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~
>       |                        gpiod_chip_get_lines
> gpiod/ext/chip.c:135:22: error: assignment to 'struct gpiod_line_info
> *' from 'int' makes pointer from integer without a cast
> [-Wint-conversion]
>   135 |                 info =3D gpiod_chip_get_line_info(self->chip,
> offset);
>       |                      ^
> gpiod/ext/chip.c:140:35: error: passing argument 1 of 'make_line_info'
> from incompatible pointer type [-Wincompatible-pointer-types]
>   140 |         info_obj =3D make_line_info(info);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct gpiod_line_info *
> gpiod/ext/chip.c:94:57: note: expected 'struct gpiod_line_info *' but
> argument is of type 'struct gpiod_line_info *'
>    94 | static PyObject *make_line_info(struct gpiod_line_info *info)
>       |                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> gpiod/ext/chip.c:141:9: error: implicit declaration of function
> 'gpiod_line_info_free'; did you mean 'gpiod_line_iter_free'?
> [-Wimplicit-function-declaration]
>   141 |         gpiod_line_info_free(info);
>       |         ^~~~~~~~~~~~~~~~~~~~
>       |         gpiod_line_iter_free
> gpiod/ext/chip.c: In function 'chip_unwatch_line_info':
> gpiod/ext/chip.c:156:15: error: implicit declaration of function
> 'gpiod_chip_unwatch_line_info'; did you mean 'chip_unwatch_line_info'?
> [-Wimplicit-function-declaration]
>   156 |         ret =3D gpiod_chip_unwatch_line_info(self->chip, offset);
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |               chip_unwatch_line_info
> gpiod/ext/chip.c: In function 'chip_read_info_event':
> gpiod/ext/chip.c:176:17: error: implicit declaration of function
> 'gpiod_chip_read_info_event'; did you mean 'chip_read_info_event'?
> [-Wimplicit-function-declaration]
>   176 |         event =3D gpiod_chip_read_info_event(self->chip);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                 chip_read_info_event
> gpiod/ext/chip.c:176:15: error: assignment to 'struct gpiod_info_event
> *' from 'int' makes pointer from integer without a cast
> [-Wint-conversion]
>   176 |         event =3D gpiod_chip_read_info_event(self->chip);
>       |               ^
> gpiod/ext/chip.c:181:16: error: implicit declaration of function
> 'gpiod_info_event_get_line_info' [-Wimplicit-function-declaration]
>   181 |         info =3D gpiod_info_event_get_line_info(event);
>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> gpiod/ext/chip.c:181:14: error: assignment to 'struct gpiod_line_info
> *' from 'int' makes pointer from integer without a cast
> [-Wint-conversion]
>   181 |         info =3D gpiod_info_event_get_line_info(event);
>       |              ^
> gpiod/ext/chip.c:183:35: error: passing argument 1 of 'make_line_info'
> from incompatible pointer type [-Wincompatible-pointer-types]
>   183 |         info_obj =3D make_line_info(info);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct gpiod_line_info *
> gpiod/ext/chip.c:94:57: note: expected 'struct gpiod_line_info *' but
> argument is of type 'struct gpiod_line_info *'
>    94 | static PyObject *make_line_info(struct gpiod_line_info *info)
>       |                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> gpiod/ext/chip.c:185:17: error: implicit declaration of function
> 'gpiod_info_event_free'; did you mean 'gpiod_line_event_read'?
> [-Wimplicit-function-declaration]
>   185 |                 gpiod_info_event_free(event);
>       |                 ^~~~~~~~~~~~~~~~~~~~~
>       |                 gpiod_line_event_read
> gpiod/ext/chip.c:190:33: error: implicit declaration of function
> 'gpiod_info_event_get_event_type' [-Wimplicit-function-declaration]
>   190 |
>  gpiod_info_event_get_event_type(event),
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> gpiod/ext/chip.c:191:33: error: implicit declaration of function
> 'gpiod_info_event_get_timestamp_ns' [-Wimplicit-function-declaration]
>   191 |
> gpiod_info_event_get_timestamp_ns(event),
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> gpiod/ext/chip.c: In function 'chip_line_offset_from_id':
> gpiod/ext/chip.c:208:18: error: implicit declaration of function
> 'gpiod_chip_get_line_offset_from_name'
> [-Wimplicit-function-declaration]
>   208 |         offset =3D gpiod_chip_get_line_offset_from_name(self->chi=
p,
> name);
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> gpiod/ext/chip.c: In function 'make_request_config':
> gpiod/ext/chip.c:223:19: error: implicit declaration of function
> 'gpiod_request_config_new' [-Wimplicit-function-declaration]
>   223 |         req_cfg =3D gpiod_request_config_new();
>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~
> gpiod/ext/chip.c:223:17: error: assignment to 'struct
> gpiod_request_config *' from 'int' makes pointer from integer without
> a cast [-Wint-conversion]
>   223 |         req_cfg =3D gpiod_request_config_new();
>       |                 ^
> gpiod/ext/chip.c:232:25: error: implicit declaration of function
> 'gpiod_request_config_free' [-Wimplicit-function-declaration]
>   232 |                         gpiod_request_config_free(req_cfg);
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> gpiod/ext/chip.c:236:17: error: implicit declaration of function
> 'gpiod_request_config_set_consumer' [-Wimplicit-function-declaration]
>   236 |                 gpiod_request_config_set_consumer(req_cfg,
> consumer);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> gpiod/ext/chip.c:246:17: error: implicit declaration of function
> 'gpiod_request_config_set_event_buffer_size'
> [-Wimplicit-function-declaration]
>   246 |                 gpiod_request_config_set_event_buffer_size(req_cf=
g,
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> gpiod/ext/chip.c: In function 'chip_request_lines':
> gpiod/ext/chip.c:275:19: error: implicit declaration of function
> 'gpiod_chip_request_lines'; did you mean 'gpiod_chip_get_lines'?
> [-Wimplicit-function-declaration]
>   275 |         request =3D gpiod_chip_request_lines(self->chip,
> req_cfg, line_cfg);
>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~
>       |                   gpiod_chip_get_lines
> gpiod/ext/chip.c:275:17: error: assignment to 'struct
> gpiod_line_request *' from 'int' makes pointer from integer without a
> cast [-Wint-conversion]
>   275 |         request =3D gpiod_chip_request_lines(self->chip,
> req_cfg, line_cfg);
>       |                 ^
> gpiod/ext/chip.c:283:25: error: implicit declaration of function
> 'gpiod_request_config_get_event_buffer_size'
> [-Wimplicit-function-declaration]
>   283 |
> gpiod_request_config_get_event_buffer_size(req_cfg));
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> gpiod/ext/chip.c:282:46: error: passing argument 1 of
> 'Py_gpiod_MakeRequestObject' from incompatible pointer type
> [-Wincompatible-pointer-types]
>   282 |         req_obj =3D Py_gpiod_MakeRequestObject(request,
>       |                                              ^~~~~~~
>       |                                              |
>       |                                              struct
> gpiod_line_request *
> gpiod/ext/internal.h:14:65: note: expected 'struct gpiod_line_request
> *' but argument is of type 'struct gpiod_line_request *'
>    14 | PyObject *Py_gpiod_MakeRequestObject(struct gpiod_line_request
> *request,
>       |
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
> gpiod/ext/chip.c:285:17: error: implicit declaration of function
> 'gpiod_line_request_release'; did you mean 'gpiod_line_request_bulk'?
> [-Wimplicit-function-declaration]
>   285 |                 gpiod_line_request_release(request);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                 gpiod_line_request_bulk
> error: command
> 'TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-gpiod/2.2.1/recipe=
-sysroot-native/usr/bin/aarch64-webos-linux/aarch64-webos-linux-gcc'
> failed with exit code 1
>
> On Thu, Oct 24, 2024 at 4:19=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Thanks for testing and Review Alexander.
> >
> > On Thu, Oct 24, 2024 at 7:10=E2=80=AFAM Sverdlin, Alexander
> > <alexander.sverdlin@siemens.com> wrote:
> > >
> > > Hello all,
> > >
> > > On Thu, 2024-10-24 at 15:51 +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > This is a big update for libgpiod bringing in the D-Bus daemon and
> its
> > > > command-line client. This is why the patch is pretty hefty. The
> majority
> > > > of the line count comes from the removed patch that is now upstream
> but
> > > > the v2.2 recipe also now contains a lot of bits and pieces that mak=
e
> the
> > > > D-Bus daemon work both with system as well as sysvinit.
> > > >
> > > > The project now packages the systemd service and udev rules that
> allow
> > > > the manager to run under its own user in a well sandboxed environme=
nt
> > > > but the sysvsinit script is carried in the recipe as I don't want t=
o
> > > > put support for legacy systems in libgpiod repo.
> > > >
> > > > The patch also updates the ptests for libgpiod to run three new
> > > > test-suites: one for GLib bindings, one for the command-line D-Bus
> > > > client and finally one testing some daemon corner-cases not
> supported by
> > > > the client.
> > > >
> > > > Build tested with various config options with systemd and sysvinit
> (the
> > > > latter with glibc and musl) on 32- and 64-bit architectures.
> > > >
> > > > The complete changelog since v2.1 (taken verbatim from the NEWS
> file) is
> > > > below:
> > > >
> > > > libgpiod v2.2
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > New features:
> > > > - add GObject bindings with introspection
> > > > - add a D-Bus interface to libgpiod together with a daemon
> implementing it and
> > > >   a command-line client
> > > > - split out the common shell test code for gpio-tools into a
> reusable test
> > > >   harness for GPIO command-line tools
> > > > - add minutes as a new supported time unit for tools and allow
> longer periods
> > > >   for timeouts, line holding, etc.
> > > > - add a script for generating sdist and wheels for python bindings
> > > > - migrate C++ tests to using Catch2 v3
> > > >
> > > > Improvements:
> > > > - relicense C++ bindings under LGPL-2.1-or-later in order to make
> the project
> > > >   more attractive to users with GPL-3.0 restrictions
> > > > - remove dependency on grep from tools' tests
> > > > - make shell scripts pass shellcheck treewide
> > > > - use ppoll() in tools to actually achieve the advertised microseco=
nd
> > > >   granularity of timeouts
> > > > - documentation improvements
> > > > - improve typing info in python bindings
> > > > - improve __repr__() implementations in python bindings
> > > > - make reconfiguring lines more flexible in python bindings by
> relaxing the
> > > >   requirement to carry the ordering of the config entries from the
> request
> > > > - support casting of line.Value to bool in python bindings
> > > > - various new test-cases for improved coverage treewide
> > > > - align the test cases with the current kernel requirement for
> specifying
> > > >   direction explicitly when reconfiguring lines
> > > >
> > > > Bug fixes:
> > > > - fix C++ bindings build using slibtool
> > > > - accept the new style automatic GPIO chip labels from gpio-sim in
> bash tests
> > > > - fix C++ tests with recent kernels which introduced stricter
> reconfigure
> > > >   behavior
> > > > - fix a use-after-free bug in python bindings
> > > > - fix passing the event clock property to line requests in python
> bindings
> > > > - fix a memory leak in tools
> > > > - make sure the string buffers in line-info and chip-info are big
> enough to not
> > > >   truncate the strings they hold below the size accepted by the
> kernel
> > > > - remove buggy and unnecessary flags sanitization from line-config
> > > > - fix python bindings installation with Makefile build
> > > > - sanitize the return values of GPIO ioctl()s which in some cases
> may be
> > > >   erroneously positive
> > > > - fix requesting lines by name with multiple entries in python
> bindings
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > I admit I had to backport it to scarthgap to test (along with glib
> 2.80, etc),
> > > but I didn't notice any problems and I'm able to start gpio-manager
> > > (systemd service) and control it over gpiocli.
> > >
> > > Thanks a lot Bartosz!
> > >
> > > Reviewed-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > > Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > >
> > > > ---
> > > > Changes in v3:
> > > > - make dbus a runtime dependency for the 'dbus' and 'tests'
> PACKAGECONFIG
> > > >   switches
> > > > - make libgpiod-manager a runtime dependency for libgpiod-cli
> > > >
> > > > Changes in v2:
> > > > - fix SRC_URI[sha256sum] value
> > > >
> > > >  ...cxx-Migrate-C-tests-to-use-Catch2-v3.patch | 530
> ------------------
> > > >  .../libgpiod/libgpiod-2.x/gpio-manager.init   |  76 +++
> > > >  .../libgpiod/libgpiod-2.x/run-ptest           |  43 +-
> > > >  .../libgpiod/libgpiod_2.1.3.bb                |  33 --
> > > >  .../recipes-support/libgpiod/libgpiod_2.2.bb  |  99 ++++
> > > >  5 files changed, 206 insertions(+), 575 deletions(-)
> > > >  delete mode 100644
> meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-Migrate-C=
-tests-to-use-Catch2-v3.patch
> > > >  create mode 100644
> meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-manager.init
> > > >  delete mode 100644 meta-oe/recipes-support/libgpiod/
> libgpiod_2.1.3.bb
> > > >  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_2.2.b=
b
> > >
> > > --
> > > Alexander Sverdlin
> > > Siemens AG
> > > www.siemens.com
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113324):
> https://lists.openembedded.org/g/openembedded-devel/message/113324
> Mute This Topic: https://lists.openembedded.org/mt/109190169/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000009ba62306259d00e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mar. 29 oct. 2024 =C3=A0=C2=A013:=
39, Martin Jansa via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:</di=
v><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Doesn&#39;t this upgrade break python3-gpiod<br>
(meta-oe/meta-python/recipes-devtools/python/<a href=3D"http://python3-gpio=
d_2.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpiod_2.2.1.bb</a>=
)?<br></blockquote><div>Looks like it.</div><div>Error seen by autobuilder =
as well : <a href=3D"https://valkyrie.yoctoproject.org/#/builders/87/builds=
/16/steps/40/logs/stdio">https://valkyrie.yoctoproject.org/#/builders/87/bu=
ilds/16/steps/40/logs/stdio</a></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
In world builds I&#39;m seeing new build failure which looks like caused<br=
>
by update libgpiod API:<br>
<br>
gpiod/ext/chip.c: In function &#39;chip_path&#39;:<br>
gpiod/ext/chip.c:43:37: error: implicit declaration of function<br>
&#39;gpiod_chip_get_path&#39;; did you mean &#39;gpiod_chip_get_line&#39;?<=
br>
[-Wimplicit-function-declaration]<br>
=C2=A0 =C2=A043 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PyUnicode_FromStr=
ing(gpiod_chip_get_path(self-&gt;chip));<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0gpiod_chip_get_line<br>
gpiod/ext/chip.c:43:37: error: passing argument 1 of<br>
&#39;PyUnicode_FromString&#39; makes pointer from integer without a cast<br=
>
[-Wint-conversion]<br>
=C2=A0 =C2=A043 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PyUnicode_FromStr=
ing(gpiod_chip_get_path(self-&gt;chip));<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0int<br>
In file included from<br>
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-gpiod/2.2.1/recipe-sy=
sroot/usr/include/python3.13/Python.h:79,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from gpiod/ex=
t/internal.h:8:<br>
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-gpiod/2.2.1/recipe-sy=
sroot/usr/include/python3.13/unicodeobject.h:130:17:<br>
note: expected &#39;const char *&#39; but argument is of type &#39;int&#39;=
<br>
=C2=A0 130 |=C2=A0 =C2=A0 =C2=A0const char *u=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* UTF-8 encoded string */<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~^<br>
gpiod/ext/chip.c: In function &#39;chip_fd&#39;:<br>
gpiod/ext/chip.c:48:32: error: implicit declaration of function<br>
&#39;gpiod_chip_get_fd&#39;; did you mean &#39;gpiod_chip_get_line&#39;?<br=
>
[-Wimplicit-function-declaration]<br>
=C2=A0 =C2=A048 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PyLong_FromLong(g=
piod_chip_get_fd(self-&gt;chip));<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~=
~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpiod_chip_get_=
line<br>
gpiod/ext/chip.c: In function &#39;chip_get_info&#39;:<br>
gpiod/ext/chip.c:82:16: error: implicit declaration of function<br>
&#39;gpiod_chip_get_info&#39;; did you mean &#39;gpiod_chip_get_lines&#39;?=
<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 =C2=A082 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D gpiod_chip_get_=
info(self-&gt;chip);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gpiod_chip_get_lines<br>
gpiod/ext/chip.c:82:14: error: assignment to &#39;struct gpiod_chip_info<br=
>
*&#39; from &#39;int&#39; makes pointer from integer without a cast<br>
[-Wint-conversion]<br>
=C2=A0 =C2=A082 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D gpiod_chip_get_=
info(self-&gt;chip);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br=
>
gpiod/ext/chip.c:87:38: error: implicit declaration of function<br>
&#39;gpiod_chip_info_get_name&#39;; did you mean &#39;gpiod_chip_open_by_na=
me&#39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 =C2=A087 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gpiod_chip_info_get_name(info),<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 gpiod_chip_open_by_name<br>
gpiod/ext/chip.c:88:38: error: implicit declaration of function<br>
&#39;gpiod_chip_info_get_label&#39;; did you mean &#39;gpiod_chip_open_by_l=
abel&#39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 =C2=A088 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gpiod_chip_info_get_label(info),<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 gpiod_chip_open_by_label<br>
gpiod/ext/chip.c:89:38: error: implicit declaration of function<br>
&#39;gpiod_chip_info_get_num_lines&#39;; did you mean<br>
&#39;gpiod_chip_get_all_lines&#39;? [-Wimplicit-function-declaration]<br>
=C2=A0 =C2=A089 |<br>
gpiod_chip_info_get_num_lines(info));<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 gpiod_chip_get_all_lines<br>
gpiod/ext/chip.c:90:10: error: implicit declaration of function<br>
&#39;gpiod_chip_info_free&#39;; did you mean &#39;gpiod_chip_iter_free&#39;=
?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 =C2=A090 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpiod_chip_info_free(in=
fo);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~=
~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpiod_chip_iter_fr=
ee<br>
gpiod/ext/chip.c: At top level:<br>
gpiod/ext/chip.c:94:40: warning: &#39;struct gpiod_line_info&#39; declared<=
br>
inside parameter list will not be visible outside of this definition<br>
or declaration<br>
=C2=A0 =C2=A094 | static PyObject *make_line_info(struct gpiod_line_info *i=
nfo)<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ^~~~~~~~~~~~~~~<br>
gpiod/ext/chip.c: In function &#39;make_line_info&#39;:<br>
gpiod/ext/chip.c:103:33: error: implicit declaration of function<br>
&#39;gpiod_line_info_get_offset&#39;; did you mean &#39;gpiod_line_offset&#=
39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 103 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_line_info_get_=
offset(info),<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_lin=
e_offset<br>
gpiod/ext/chip.c:104:33: error: implicit declaration of function<br>
&#39;gpiod_line_info_get_name&#39;; did you mean &#39;gpiod_line_bulk_get_l=
ine&#39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 104 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_line_info_get_=
name(info),<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_lin=
e_bulk_get_line<br>
gpiod/ext/chip.c:105:33: error: implicit declaration of function<br>
&#39;gpiod_line_info_is_used&#39;; did you mean &#39;gpiod_line_is_used&#39=
;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 105 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_line_info_is_u=
sed(info) ?<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_lin=
e_is_used<br>
gpiod/ext/chip.c:107:33: error: implicit declaration of function<br>
&#39;gpiod_line_info_get_consumer&#39;; did you mean &#39;gpiod_line_consum=
er&#39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 107 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_line_info_get_=
consumer(info),<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_lin=
e_consumer<br>
gpiod/ext/chip.c:108:33: error: implicit declaration of function<br>
&#39;gpiod_line_info_get_direction&#39;; did you mean &#39;gpiod_line_direc=
tion&#39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 108 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_line_info_get_=
direction(info),<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_lin=
e_direction<br>
gpiod/ext/chip.c:109:33: error: implicit declaration of function<br>
&#39;gpiod_line_info_is_active_low&#39; [-Wimplicit-function-declaration]<b=
r>
=C2=A0 109 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_line_info_is_a=
ctive_low(info) ?<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~<br>
gpiod/ext/chip.c:111:33: error: implicit declaration of function<br>
&#39;gpiod_line_info_get_bias&#39;; did you mean &#39;gpiod_line_bulk_get_l=
ine&#39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 111 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_line_info_get_=
bias(info),<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_lin=
e_bulk_get_line<br>
gpiod/ext/chip.c:112:33: error: implicit declaration of function<br>
&#39;gpiod_line_info_get_drive&#39;; did you mean &#39;gpiod_line_bulk_get_=
line&#39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 112 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_line_info_get_=
drive(info),<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_lin=
e_bulk_get_line<br>
gpiod/ext/chip.c:113:33: error: implicit declaration of function<br>
&#39;gpiod_line_info_get_edge_detection&#39; [-Wimplicit-function-declarati=
on]<br>
=C2=A0 113 |<br>
gpiod_line_info_get_edge_detection(info),<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~<br>
gpiod/ext/chip.c:114:33: error: implicit declaration of function<br>
&#39;gpiod_line_info_get_event_clock&#39; [-Wimplicit-function-declaration]=
<br>
=C2=A0 114 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_line_info_get_=
event_clock(info),<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~<br>
gpiod/ext/chip.c:115:33: error: implicit declaration of function<br>
&#39;gpiod_line_info_is_debounced&#39;; did you mean<br>
&#39;gpiod_line_is_open_source&#39;? [-Wimplicit-function-declaration]<br>
=C2=A0 115 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_line_info_is_d=
ebounced(info) ?<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_lin=
e_is_open_source<br>
gpiod/ext/chip.c:117:33: error: implicit declaration of function<br>
&#39;gpiod_line_info_get_debounce_period_us&#39;<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 117 |<br>
gpiod_line_info_get_debounce_period_us(info));<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
gpiod/ext/chip.c: In function &#39;chip_get_line_info&#39;:<br>
gpiod/ext/chip.c:133:24: error: implicit declaration of function<br>
&#39;gpiod_chip_watch_line_info&#39;; did you mean &#39;gpiod_chip_get_line=
s&#39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 133 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
nfo =3D gpiod_chip_watch_line_info(self-&gt;chip, offset);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpiod_chip_get_lines<br>
gpiod/ext/chip.c:133:22: error: assignment to &#39;struct gpiod_line_info<b=
r>
*&#39; from &#39;int&#39; makes pointer from integer without a cast<br>
[-Wint-conversion]<br>
=C2=A0 133 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
nfo =3D gpiod_chip_watch_line_info(self-&gt;chip, offset);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
gpiod/ext/chip.c:135:24: error: implicit declaration of function<br>
&#39;gpiod_chip_get_line_info&#39;; did you mean &#39;gpiod_chip_get_lines&=
#39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 135 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
nfo =3D gpiod_chip_get_line_info(self-&gt;chip, offset);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpiod_chip_get_lines<br>
gpiod/ext/chip.c:135:22: error: assignment to &#39;struct gpiod_line_info<b=
r>
*&#39; from &#39;int&#39; makes pointer from integer without a cast<br>
[-Wint-conversion]<br>
=C2=A0 135 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
nfo =3D gpiod_chip_get_line_info(self-&gt;chip, offset);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
gpiod/ext/chip.c:140:35: error: passing argument 1 of &#39;make_line_info&#=
39;<br>
from incompatible pointer type [-Wincompatible-pointer-types]<br>
=C2=A0 140 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info_obj =3D make_line_info(i=
nfo);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~=
~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<=
br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ruct gpiod_line_info *<br>
gpiod/ext/chip.c:94:57: note: expected &#39;struct gpiod_line_info *&#39; b=
ut<br>
argument is of type &#39;struct gpiod_line_info *&#39;<br>
=C2=A0 =C2=A094 | static PyObject *make_line_info(struct gpiod_line_info *i=
nfo)<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~~~~=
~~~~~~~~~~~~~~~^~~~<br>
gpiod/ext/chip.c:141:9: error: implicit declaration of function<br>
&#39;gpiod_line_info_free&#39;; did you mean &#39;gpiod_line_iter_free&#39;=
?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 141 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_line_info_free(info);<b=
r>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~=
~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_line_iter_fre=
e<br>
gpiod/ext/chip.c: In function &#39;chip_unwatch_line_info&#39;:<br>
gpiod/ext/chip.c:156:15: error: implicit declaration of function<br>
&#39;gpiod_chip_unwatch_line_info&#39;; did you mean &#39;chip_unwatch_line=
_info&#39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 156 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gpiod_chip_unwatch_li=
ne_info(self-&gt;chip, offset);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0chip_unwatch_line_info<br>
gpiod/ext/chip.c: In function &#39;chip_read_info_event&#39;:<br>
gpiod/ext/chip.c:176:17: error: implicit declaration of function<br>
&#39;gpiod_chip_read_info_event&#39;; did you mean &#39;chip_read_info_even=
t&#39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 176 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event =3D gpiod_chip_read_inf=
o_event(self-&gt;chip);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0chip_read_info_event<br>
gpiod/ext/chip.c:176:15: error: assignment to &#39;struct gpiod_info_event<=
br>
*&#39; from &#39;int&#39; makes pointer from integer without a cast<br>
[-Wint-conversion]<br>
=C2=A0 176 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event =3D gpiod_chip_read_inf=
o_event(self-&gt;chip);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^<br>
gpiod/ext/chip.c:181:16: error: implicit declaration of function<br>
&#39;gpiod_info_event_get_line_info&#39; [-Wimplicit-function-declaration]<=
br>
=C2=A0 181 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D gpiod_info_event_get=
_line_info(event);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
gpiod/ext/chip.c:181:14: error: assignment to &#39;struct gpiod_line_info<b=
r>
*&#39; from &#39;int&#39; makes pointer from integer without a cast<br>
[-Wint-conversion]<br>
=C2=A0 181 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D gpiod_info_event_get=
_line_info(event);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br=
>
gpiod/ext/chip.c:183:35: error: passing argument 1 of &#39;make_line_info&#=
39;<br>
from incompatible pointer type [-Wincompatible-pointer-types]<br>
=C2=A0 183 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info_obj =3D make_line_info(i=
nfo);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~=
~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<=
br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ruct gpiod_line_info *<br>
gpiod/ext/chip.c:94:57: note: expected &#39;struct gpiod_line_info *&#39; b=
ut<br>
argument is of type &#39;struct gpiod_line_info *&#39;<br>
=C2=A0 =C2=A094 | static PyObject *make_line_info(struct gpiod_line_info *i=
nfo)<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~~~~=
~~~~~~~~~~~~~~~^~~~<br>
gpiod/ext/chip.c:185:17: error: implicit declaration of function<br>
&#39;gpiod_info_event_free&#39;; did you mean &#39;gpiod_line_event_read&#3=
9;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 185 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
piod_info_event_free(event);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpiod_line_event_read<br>
gpiod/ext/chip.c:190:33: error: implicit declaration of function<br>
&#39;gpiod_info_event_get_event_type&#39; [-Wimplicit-function-declaration]=
<br>
=C2=A0 190 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_info_event_get=
_event_type(event),<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~<br>
gpiod/ext/chip.c:191:33: error: implicit declaration of function<br>
&#39;gpiod_info_event_get_timestamp_ns&#39; [-Wimplicit-function-declaratio=
n]<br>
=C2=A0 191 |<br>
gpiod_info_event_get_timestamp_ns(event),<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~<br>
gpiod/ext/chip.c: In function &#39;chip_line_offset_from_id&#39;:<br>
gpiod/ext/chip.c:208:18: error: implicit declaration of function<br>
&#39;gpiod_chip_get_line_offset_from_name&#39;<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 208 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D gpiod_chip_get_lin=
e_offset_from_name(self-&gt;chip, name);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
gpiod/ext/chip.c: In function &#39;make_request_config&#39;:<br>
gpiod/ext/chip.c:223:19: error: implicit declaration of function<br>
&#39;gpiod_request_config_new&#39; [-Wimplicit-function-declaration]<br>
=C2=A0 223 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0req_cfg =3D gpiod_request_con=
fig_new();<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~<br>
gpiod/ext/chip.c:223:17: error: assignment to &#39;struct<br>
gpiod_request_config *&#39; from &#39;int&#39; makes pointer from integer w=
ithout<br>
a cast [-Wint-conversion]<br>
=C2=A0 223 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0req_cfg =3D gpiod_request_con=
fig_new();<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^<br>
gpiod/ext/chip.c:232:25: error: implicit declaration of function<br>
&#39;gpiod_request_config_free&#39; [-Wimplicit-function-declaration]<br>
=C2=A0 232 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_request_config_free(req_cfg);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~<br>
gpiod/ext/chip.c:236:17: error: implicit declaration of function<br>
&#39;gpiod_request_config_set_consumer&#39; [-Wimplicit-function-declaratio=
n]<br>
=C2=A0 236 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
piod_request_config_set_consumer(req_cfg, consumer);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
gpiod/ext/chip.c:246:17: error: implicit declaration of function<br>
&#39;gpiod_request_config_set_event_buffer_size&#39;<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 246 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
piod_request_config_set_event_buffer_size(req_cfg,<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
gpiod/ext/chip.c: In function &#39;chip_request_lines&#39;:<br>
gpiod/ext/chip.c:275:19: error: implicit declaration of function<br>
&#39;gpiod_chip_request_lines&#39;; did you mean &#39;gpiod_chip_get_lines&=
#39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 275 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0request =3D gpiod_chip_reques=
t_lines(self-&gt;chip,<br>
req_cfg, line_cfg);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0gpiod_chip_get_lines<br>
gpiod/ext/chip.c:275:17: error: assignment to &#39;struct<br>
gpiod_line_request *&#39; from &#39;int&#39; makes pointer from integer wit=
hout a<br>
cast [-Wint-conversion]<br>
=C2=A0 275 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0request =3D gpiod_chip_reques=
t_lines(self-&gt;chip,<br>
req_cfg, line_cfg);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^<br>
gpiod/ext/chip.c:283:25: error: implicit declaration of function<br>
&#39;gpiod_request_config_get_event_buffer_size&#39;<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 283 |<br>
gpiod_request_config_get_event_buffer_size(req_cfg));<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~<br>
gpiod/ext/chip.c:282:46: error: passing argument 1 of<br>
&#39;Py_gpiod_MakeRequestObject&#39; from incompatible pointer type<br>
[-Wincompatible-pointer-types]<br>
=C2=A0 282 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0req_obj =3D Py_gpiod_MakeRequ=
estObject(request,<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gpiod_line_request *<br>
gpiod/ext/internal.h:14:65: note: expected &#39;struct gpiod_line_request<b=
r>
*&#39; but argument is of type &#39;struct gpiod_line_request *&#39;<br>
=C2=A0 =C2=A014 | PyObject *Py_gpiod_MakeRequestObject(struct gpiod_line_re=
quest *request,<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~<br>
gpiod/ext/chip.c:285:17: error: implicit declaration of function<br>
&#39;gpiod_line_request_release&#39;; did you mean &#39;gpiod_line_request_=
bulk&#39;?<br>
[-Wimplicit-function-declaration]<br>
=C2=A0 285 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
piod_line_request_release(request);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpiod_line_request_bulk<br>
error: command &#39;TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-g=
piod/2.2.1/recipe-sysroot-native/usr/bin/aarch64-webos-linux/aarch64-webos-=
linux-gcc&#39;<br>
failed with exit code 1<br>
<br>
On Thu, Oct 24, 2024 at 4:19=E2=80=AFPM Khem Raj via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Thanks for testing and Review Alexander.<br>
&gt;<br>
&gt; On Thu, Oct 24, 2024 at 7:10=E2=80=AFAM Sverdlin, Alexander<br>
&gt; &lt;<a href=3D"mailto:alexander.sverdlin@siemens.com" target=3D"_blank=
">alexander.sverdlin@siemens.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hello all,<br>
&gt; &gt;<br>
&gt; &gt; On Thu, 2024-10-24 at 15:51 +0200, Bartosz Golaszewski wrote:<br>
&gt; &gt; &gt; From: Bartosz Golaszewski &lt;<a href=3D"mailto:bartosz.gola=
szewski@linaro.org" target=3D"_blank">bartosz.golaszewski@linaro.org</a>&gt=
;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This is a big update for libgpiod bringing in the D-Bus daem=
on and its<br>
&gt; &gt; &gt; command-line client. This is why the patch is pretty hefty. =
The majority<br>
&gt; &gt; &gt; of the line count comes from the removed patch that is now u=
pstream but<br>
&gt; &gt; &gt; the v2.2 recipe also now contains a lot of bits and pieces t=
hat make the<br>
&gt; &gt; &gt; D-Bus daemon work both with system as well as sysvinit.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The project now packages the systemd service and udev rules =
that allow<br>
&gt; &gt; &gt; the manager to run under its own user in a well sandboxed en=
vironment<br>
&gt; &gt; &gt; but the sysvsinit script is carried in the recipe as I don&#=
39;t want to<br>
&gt; &gt; &gt; put support for legacy systems in libgpiod repo.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The patch also updates the ptests for libgpiod to run three =
new<br>
&gt; &gt; &gt; test-suites: one for GLib bindings, one for the command-line=
 D-Bus<br>
&gt; &gt; &gt; client and finally one testing some daemon corner-cases not =
supported by<br>
&gt; &gt; &gt; the client.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Build tested with various config options with systemd and sy=
svinit (the<br>
&gt; &gt; &gt; latter with glibc and musl) on 32- and 64-bit architectures.=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The complete changelog since v2.1 (taken verbatim from the N=
EWS file) is<br>
&gt; &gt; &gt; below:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; libgpiod v2.2<br>
&gt; &gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; New features:<br>
&gt; &gt; &gt; - add GObject bindings with introspection<br>
&gt; &gt; &gt; - add a D-Bus interface to libgpiod together with a daemon i=
mplementing it and<br>
&gt; &gt; &gt;=C2=A0 =C2=A0a command-line client<br>
&gt; &gt; &gt; - split out the common shell test code for gpio-tools into a=
 reusable test<br>
&gt; &gt; &gt;=C2=A0 =C2=A0harness for GPIO command-line tools<br>
&gt; &gt; &gt; - add minutes as a new supported time unit for tools and all=
ow longer periods<br>
&gt; &gt; &gt;=C2=A0 =C2=A0for timeouts, line holding, etc.<br>
&gt; &gt; &gt; - add a script for generating sdist and wheels for python bi=
ndings<br>
&gt; &gt; &gt; - migrate C++ tests to using Catch2 v3<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Improvements:<br>
&gt; &gt; &gt; - relicense C++ bindings under LGPL-2.1-or-later in order to=
 make the project<br>
&gt; &gt; &gt;=C2=A0 =C2=A0more attractive to users with GPL-3.0 restrictio=
ns<br>
&gt; &gt; &gt; - remove dependency on grep from tools&#39; tests<br>
&gt; &gt; &gt; - make shell scripts pass shellcheck treewide<br>
&gt; &gt; &gt; - use ppoll() in tools to actually achieve the advertised mi=
crosecond<br>
&gt; &gt; &gt;=C2=A0 =C2=A0granularity of timeouts<br>
&gt; &gt; &gt; - documentation improvements<br>
&gt; &gt; &gt; - improve typing info in python bindings<br>
&gt; &gt; &gt; - improve __repr__() implementations in python bindings<br>
&gt; &gt; &gt; - make reconfiguring lines more flexible in python bindings =
by relaxing the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0requirement to carry the ordering of the config =
entries from the request<br>
&gt; &gt; &gt; - support casting of line.Value to bool in python bindings<b=
r>
&gt; &gt; &gt; - various new test-cases for improved coverage treewide<br>
&gt; &gt; &gt; - align the test cases with the current kernel requirement f=
or specifying<br>
&gt; &gt; &gt;=C2=A0 =C2=A0direction explicitly when reconfiguring lines<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Bug fixes:<br>
&gt; &gt; &gt; - fix C++ bindings build using slibtool<br>
&gt; &gt; &gt; - accept the new style automatic GPIO chip labels from gpio-=
sim in bash tests<br>
&gt; &gt; &gt; - fix C++ tests with recent kernels which introduced stricte=
r reconfigure<br>
&gt; &gt; &gt;=C2=A0 =C2=A0behavior<br>
&gt; &gt; &gt; - fix a use-after-free bug in python bindings<br>
&gt; &gt; &gt; - fix passing the event clock property to line requests in p=
ython bindings<br>
&gt; &gt; &gt; - fix a memory leak in tools<br>
&gt; &gt; &gt; - make sure the string buffers in line-info and chip-info ar=
e big enough to not<br>
&gt; &gt; &gt;=C2=A0 =C2=A0truncate the strings they hold below the size ac=
cepted by the kernel<br>
&gt; &gt; &gt; - remove buggy and unnecessary flags sanitization from line-=
config<br>
&gt; &gt; &gt; - fix python bindings installation with Makefile build<br>
&gt; &gt; &gt; - sanitize the return values of GPIO ioctl()s which in some =
cases may be<br>
&gt; &gt; &gt;=C2=A0 =C2=A0erroneously positive<br>
&gt; &gt; &gt; - fix requesting lines by name with multiple entries in pyth=
on bindings<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Bartosz Golaszewski &lt;<a href=3D"mailto:bar=
tosz.golaszewski@linaro.org" target=3D"_blank">bartosz.golaszewski@linaro.o=
rg</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; I admit I had to backport it to scarthgap to test (along with gli=
b 2.80, etc),<br>
&gt; &gt; but I didn&#39;t notice any problems and I&#39;m able to start gp=
io-manager<br>
&gt; &gt; (systemd service) and control it over gpiocli.<br>
&gt; &gt;<br>
&gt; &gt; Thanks a lot Bartosz!<br>
&gt; &gt;<br>
&gt; &gt; Reviewed-by: Alexander Sverdlin &lt;<a href=3D"mailto:alexander.s=
verdlin@siemens.com" target=3D"_blank">alexander.sverdlin@siemens.com</a>&g=
t;<br>
&gt; &gt; Tested-by: Alexander Sverdlin &lt;<a href=3D"mailto:alexander.sve=
rdlin@siemens.com" target=3D"_blank">alexander.sverdlin@siemens.com</a>&gt;=
<br>
&gt; &gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; Changes in v3:<br>
&gt; &gt; &gt; - make dbus a runtime dependency for the &#39;dbus&#39; and =
&#39;tests&#39; PACKAGECONFIG<br>
&gt; &gt; &gt;=C2=A0 =C2=A0switches<br>
&gt; &gt; &gt; - make libgpiod-manager a runtime dependency for libgpiod-cl=
i<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Changes in v2:<br>
&gt; &gt; &gt; - fix SRC_URI[sha256sum] value<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 ...cxx-Migrate-C-tests-to-use-Catch2-v3.patch | 530 --=
----------------<br>
&gt; &gt; &gt;=C2=A0 .../libgpiod/libgpiod-2.x/gpio-manager.init=C2=A0 =C2=
=A0|=C2=A0 76 +++<br>
&gt; &gt; &gt;=C2=A0 .../libgpiod/libgpiod-2.x/run-ptest=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 43 +-<br>
&gt; &gt; &gt;=C2=A0 .../libgpiod/<a href=3D"http://libgpiod_2.1.3.bb" rel=
=3D"noreferrer" target=3D"_blank">libgpiod_2.1.3.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 33 --<br>
&gt; &gt; &gt;=C2=A0 .../recipes-support/libgpiod/<a href=3D"http://libgpio=
d_2.2.bb" rel=3D"noreferrer" target=3D"_blank">libgpiod_2.2.bb</a>=C2=A0 |=
=C2=A0 99 ++++<br>
&gt; &gt; &gt;=C2=A0 5 files changed, 206 insertions(+), 575 deletions(-)<b=
r>
&gt; &gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-support/libgpiod/li=
bgpiod-2.x/0001-bindings-cxx-Migrate-C-tests-to-use-Catch2-v3.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-support/libgpiod/li=
bgpiod-2.x/gpio-manager.init<br>
&gt; &gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-support/libgpiod/<a=
 href=3D"http://libgpiod_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">lib=
gpiod_2.1.3.bb</a><br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-support/libgpiod/<a=
 href=3D"http://libgpiod_2.2.bb" rel=3D"noreferrer" target=3D"_blank">libgp=
iod_2.2.bb</a><br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Alexander Sverdlin<br>
&gt; &gt; Siemens AG<br>
&gt; &gt; <a href=3D"http://www.siemens.com" rel=3D"noreferrer" target=3D"_=
blank">www.siemens.com</a><br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#113324): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/113324" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/113324</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109190169/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109190169/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--0000000000009ba62306259d00e1--

