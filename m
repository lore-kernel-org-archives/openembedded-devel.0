Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.316.1613173891824370295
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 12 Feb 2021 15:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eWNgkVg7;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id t62so1310903qke.7
        for <Openembedded-devel@lists.openembedded.org>; Fri, 12 Feb 2021 15:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ygCl1bUVPzimBwy/c3znlbZ0r7O3b5xPWwAn3VDhrW0=;
        b=eWNgkVg7oYKt5JL096v9nQarpjblXRoovquwfUnZl5Unfw+qpyj3sS76UKTJTqGLjG
         aGMqRmuVYaEsYR+/5kLORKpHmBwZwRU0UeDrQ0fasWIwPwZug99tmgwohy62Z6w2XLpT
         7RegUX0P3daOrVFQTtMslNvnQ9BkE5BT7yrgXplPKW0MgD90XmbK+HnME96bzgs1pqOo
         T8CQn5+FNex7h7cn7tNjb07S5zJ0WfJMbjLChvjw8lfxn53M4KWxpLY+qDbtAXtzQGQW
         j8l8K8FXxgMi7OIWN8vtGU1mPywlz0sqzOafHRIN1NYEoqnDMH5Rf1KsFdi7yRA7QvBN
         gdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ygCl1bUVPzimBwy/c3znlbZ0r7O3b5xPWwAn3VDhrW0=;
        b=j609AGu7rtcdZZ/iwfNA9GSGvc1hDxxQiP//scOxPh8KKhog8l0hqDJv8g7obv9Hpn
         y8nld/MYAYQK6bIFXb9yakXvSlxbax6QvV3d51a8q3owokTdCpaO6M3jrc5GSQTO6kmN
         RMG/c7wvev518xI5OMG3ly4o0BBlVNyBWorB14pan/h9VrEjFmPilWd7FEQOBog2AHVo
         +3Hb9eFuEJFJxXzfWXLhySsZWqhfqJCgJIVbLL/ER9ppoMNX+z325ddPwHefxxxpqDZy
         MhdjvhVBN9AxoHUa2PSFdfuqVxWLmrPg/1RYoMeAl5JhdSMR1cf6I9DXqQ13UW94QCAK
         gUoA==
X-Gm-Message-State: AOAM531yiBYjT/Ymobnn8G827BvUx+mpZB50o+QHML1+lG8NZyaE68om
	W1e8PP0gxTuSKkYmK1X4XWRNOrwBY4CkwJ0sAEM=
X-Google-Smtp-Source: ABdhPJxDWl+vy+OulRuRkHooQI++hHSSPeHl1aVm9bq4haQE9ARfc5sGCowp1Q8FV0Nn8tfjzGOSE/wEz9y3VrmcM/U=
X-Received: by 2002:a37:9ec5:: with SMTP id h188mr5049568qke.474.1613173890931;
 Fri, 12 Feb 2021 15:51:30 -0800 (PST)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 12 Feb 2021 15:51:05 -0800
Message-ID: <CAMKF1sroouPVRt9z-NnL6CQPGOcaYKNrAuTpaiZuYrFXmH69pw@mail.gmail.com>
Subject: prepare_recipe_sysroot hashes change for yelp-xsl-native
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andreas

I am seeing this error

http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-compare-signatures/1011/console

like here

% bitbake-diffsigs -t yelp-xsl-native do_populate_sysroot
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/mnt/b/yoe/master/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 40561,
PID: 1889403
Hash for dependent task libxml/libxml2_2.9.10.bb:do_populate_sysroot
changed from 63142a44ab89fba42814217d366391d8b06890bcc934c5e695795666e8d1a5e7
to 4689a6ac4ad77ac5e7d0773f4096a7fa4d1d2c3c3e01475a471332c293bf8e51
Unable to find matching sigdata for
/mnt/b/yoe/master/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot
with hash 4689a6ac4ad77ac5e7d0773f4096a7fa4d1d2c3c3e01475a471332c293bf8e51

it seems to be related to

https://git.openembedded.org/meta-openembedded/commit/?id=94f61f7330d4d114660f1d5edc4080fe672306e6

where I see

RDEPENDS_${PN}_append_class-native = " libxml2"

which adds a dependency on target package to native package is that intended ?
