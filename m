Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3580.1794168303603873345
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 12:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Q9OqbYYM;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: schonm@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so37293066b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 12:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794168301; cv=none;
        d=google.com; s=arc-20260327;
        b=sGZT5HzyccBlZwzsO87+DOh3S2T0oPN5iCU31IO+k3Y1qBAgBjDFz8NbDGPiaX0ZAC
         DZUwkoDtEkk5QQlhRD96Z6brp7tmOBXHDnEs43iYoa0wm+W87NB8ENKIwE6hvrOdAlR6
         ZphzW0waA7KbesiepspnQCSJDi674aFPB2+OT4qnjJg6y4RoOcx7AZ5JYYwGRuTMmf5D
         xpL6dSgts0lK17z8g4MQG/idKwPXAK+ktCrkmCwa2VhPCYJaDfEoNki2qVPsBI3gG1EU
         6wOJfDrEQhXG6cSiqmd6d/IW1dYXhWywLxNCML8PTo8rgy+ezPJ7D35+RYJwYZ0OC1WG
         ekbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=AxxxxD33QXDlBDvvsN6Z3fAdi7z0oTYTIq06+vEMBMQ=;
        fh=J+piolIxsMuNbMRQ7+ffbkiVQowhvP5OSY/7PuSnp88=;
        b=M9Xz0IbBh04Zo3NxuOxABZt58Yth7EbnzLja2D7sTtzKzrAhce1djcrsQFUXdbPZRd
         +QZSsUcMdrGDwvdn/I/0n+7ACLJZqgXJopnTr1vqx8kyDYnDLMtx0SixYvqdBbxi47gS
         QyxacDcAzgppW/jExuiSuKnfh76QTLuTgtlRo6roUvChJXTa/FKFn+peuJS+1ytjL/2i
         kMrjOdxB2BahbL13l/Kxw5U39KdmJTfEme+HTJ8HTQtnqbLHMggLVgY8bbIvP3DEswZb
         e0KU7eURKGAJA41KIqHxj88irNXbPkgfcTSr6JxuW5zQJAIf3Ebv4IOhsHCGDhN9f8q6
         gwjQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794168301; x=1794773101; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AxxxxD33QXDlBDvvsN6Z3fAdi7z0oTYTIq06+vEMBMQ=;
        b=Q9OqbYYM121ekInA+TvF2JalDGzCoheSFA0vXNVcPpLftsDKlB65XitDgeKDsA+znm
         +vq+dJHP3qcOR5O2zJUcYbJlw4Ih8j/75RyPt052KCn9IAJLIeun22gB0rlrLEtX+6h3
         2WhqVUEgsYT13kMBYtjpYlr8WFIqys+z7ahEOdUAXE+oi9DstnBCgWuuKHt8Pbz1twb2
         ZsD0EqUhESU2ow7rkNpvT4XolXifcNaIzGLeehatyN0H6moblZWtWRfTwfC1oAo9lyy3
         x23ghHEhH7x/38FzyTo6pBgHI8wjZJSG5lEXbqKmRM+PLykw+9esCiPVPac0Es5YWyjf
         pG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794168301; x=1794773101;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxxxxD33QXDlBDvvsN6Z3fAdi7z0oTYTIq06+vEMBMQ=;
        b=wXbUH0bA0kbbHB8Sd6kkDe4o01/haaUx1OABsCaOp/7WLiocpMrrkOgDN94CD46mun
         Bx97M730R84mpqo6a5fHvXS2gAtdZSVY3kNkayXPgNgT/1JtOWfiYM36X4tdR5KUTth3
         Jg1hkJpLYH1tHeqkCBbcfvKNL3YXETLfrX2/C65Shc+40hO5Dz+2rXHfcq09ux01bUlF
         q++4ramkJTF+0Qgx8I86Y6R856P4/GYOOkh6AvzOJsdXewQ4GYI17wdyU9m70V+gYBIP
         oYacZaudJCz6Mx9mPicQskFrr4wQZ7h76wz5w2XjJweMGJOG3D6lkcGJb3cG3KPYGoBb
         uV/Q==
X-Forwarded-Encrypted: i=1; AL+hErE2z6FKEEECrfxLEf0diSZa6oHjfq6dHZRzvja0TzYA7OuQ687ke9TKhP7MufY7mcO+dqW/Kv8778yi20293/fbjtQ=@lists.openembedded.org
X-Gm-Message-State: APuU4Z8Q5iTnyOvLYC/r3GguJUO5XS7b5qLbLUr/d4+awQImUR8M6UHf
	wYdiqNB2XrcNaxYil0wKivjh8aBSX5hI/okmeVK8tGw5jb6ZBUh20RefvXJ+PFIT475XZQS6b/o
	gbj76bLn6lbCmYAReEmOnUXWgtTmsSBs=
X-Gm-Gg: AYBFou16wEq2PBbnOpGza6sJNmf8OwV9JFArRq/rGdj3wamanH5GtTan7WYTLFruH5A
	N1UPlgL4nAze/hForvuO21ANhq/EdkZdN/OSXFlV/QSU0FvT65b83ogg7WYPLZHUzZnRhpi+r1s
	PFOYYM2GC3fb8ANVFqoqsAh1yi75zdB3BimOrQKZObCFOuGjUTXifeOfvedQ6goAbITCtAG1EwU
	UzwvJvtfJte5R4mudc7faCnmR/3rSq/nPBo+SX8qiqGsHDJlSq9CSU3SRJG5hJMS9lpUSMF1R3L
	YgX4auP9tasN1C8Ov0kuNxuN9XRNjrKUV24UM/bs7MraX262GE5Wv6bby80PtIB3qVk7RANGYXj
	DATxfXTCEbqCVOw/Zo27EaJGlrRnyeDyDc8MsinbnYMbdQmUkI2+q3LXG/Z1AMS/QZPSxP6KjhO
	h5uvlUdK4i/YJVYVmuJkfO8j/XaGkQKiRk3T6zTzFsQsXg74se2Mpb
X-Received: by 2002:a05:6402:4488:b0:6b7:834:4eb3 with SMTP id
 4fb4d7f45d1cf-6b7224567c9mr1387947a12.7.1794168301266; Sun, 08 Nov 2026
 12:05:01 -0800 (PST)
MIME-Version: 1.0
From: "J. S." <schonm@gmail.com>
Date: Sun, 8 Nov 2026 15:04:49 -0500
X-Gm-Features: AclHuK9qtBNTH7dwam44zInoXdcizYQY-HY1zm4hGjgXNW7eTGS45d_1-RY2WCY
Message-ID: <CABTo8gDSCaD+hsYMz0J3PvW4YMX+f6PL-+RODmyFN5mbchKPcw@mail.gmail.com>
Subject: Shutoffs
To: Jason Schonberg <schonm@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000043ac6b065fc95c73"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 20:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132012

--00000000000043ac6b065fc95c73
Content-Type: text/plain; charset="UTF-8"



--00000000000043ac6b065fc95c73
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--00000000000043ac6b065fc95c73--
