Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.8832.1600850388793775511
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 01:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G9oWceYv;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: marek.belisko@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id i26so26563819ejb.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2020 01:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=nsWa+ewMQIKQnVG635S5vud5vz2zNDiExXjYFXWZITk=;
        b=G9oWceYvQ0ngj8gp4D3vGUWF0EfdpmaVn0TOeGmgYqnSyBUFVYpN8gzVE1P7zP3Kl0
         fmj0nQRyLiFawFkA0VbHulYLreTAWqN0dIQCSl0JRX9yXpUwgaP712yV91lLTuV+K19v
         PAspLLRxrHab/gUfrlnoMv+vrePFpdPbtQI8F3DGYQiqY9RzihE7FQ6D8HKENbWsTFl0
         S1WVGfGdAliDqF7LE6z+GJp+uWd/G92J7c6Pj+JW+qlcfemXd+j8P0xmppj60Ew89FIZ
         GNuBmuhRnNSihVw4JHNNbnaB2yQXbkVRkVvjGqWV5C5+pkZDaL9qSZjAgYg8sYH27RQa
         YJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=nsWa+ewMQIKQnVG635S5vud5vz2zNDiExXjYFXWZITk=;
        b=NQjlfu7GGOQ11FAj/1z7oyD/1cJPZ43rznmG3XoW3ICTjJbBMaJoIhrAcG8p5UZkwm
         OizYECOPdRTlQ9xajwAXXemA7Yy6ffylcBQK92YYfyaAiz/VplLlcZpk6UqFkayH9TCA
         roF2kjE3wdqCe+kH7qNt5Mvryz2GVBbe5KhD2cHt9Iu6dyCGsE0BqwRz/qbO9HpjOl+Y
         oLoZa7cszw2mUYiCsUKbm/i/JC0FjwzbhZMCpnUqephigich3szDW5ku8ps+m8ppVQyy
         bd9qSOuMUEtO9HipIsxRxVJCZ0lMQIr+rw2cpNHrUTWmsLe+XDzrtjMwIEO7igkMhlRF
         oLjw==
X-Gm-Message-State: AOAM531+epdDho8I5+AGW+QcGElKEIsK6gb6cinP1wk/0eWpmxDaaEVw
	45ixXyYQ3/FQcFLkg2NM1thMKUpC14qXwobsoVEm+854gPWgTw==
X-Google-Smtp-Source: ABdhPJyNuVjctXDvWTsYcKI9Q4EeMQ68z7hhM0tExvccwQE2onotEV4E0zA/X9Cs8jS9xuemmFVrwjuZnemcKGtAhho=
X-Received: by 2002:a17:906:cf82:: with SMTP id um2mr9059487ejb.49.1600850386784;
 Wed, 23 Sep 2020 01:39:46 -0700 (PDT)
MIME-Version: 1.0
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Wed, 23 Sep 2020 10:39:35 +0200
Message-ID: <CAAfyv36V01GDPqHp614ti5E4UBuVPSz=cUj98HwaThUDAYsh+w@mail.gmail.com>
Subject: dunfell: zbar linking broken
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

adding zbar as dependency of some binary fails to link with this error:
recipe-sysroot/usr/lib/libzbar.so: undefined reference to `dsprintbuf'

when checked zbar code dsprintbuf is a static method and it's not exported.
Any ideas?

Thanks,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
