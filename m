Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.8217.1589647678411931288
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 May 2020 09:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rRY93Nph;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id r187so3001957qkf.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 May 2020 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2jzSGJL+Fs8+zq0sQ8YuyBYMRa4j/eu/WD1L22c3+9M=;
        b=rRY93Nph6ikNZOtDh5W7lZ4AvdCIW3lrDeulnNyCLq62z1DzLBg1UcZlmOXDV26VWB
         7nL8SL8omRvZ81dWnAq41OInsHyR8Jhkg2PINDrJJl4Lv5j6Ac7qhGLEHHmE/jR9PEcX
         8ymKjYIXcEq5l+H6jkKgVRWM+jrSFtCd2Mv1+z1cDxts2OK9LWaUWyADratpZAZzYZPp
         ixDNzLZaQeU9UyprHPPIqxv/b5ieXOfOxt/PHfahrHW/B3cpkexxNzmvVfHrU6qgJquv
         DDAJq9id0AlyX7REOxKNoBXYDyhJcIRlxmFBoODWAZ04gWyFf8OQSep4VH+7tqSQWPIf
         SNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2jzSGJL+Fs8+zq0sQ8YuyBYMRa4j/eu/WD1L22c3+9M=;
        b=J6+KYzO8Od8R4pIIQDC722GuY/+aIyAmP3D/WJhx0V6m4gkyXK8nMfB16M10ClIMnW
         HsN2jxSgD3vDtvxgP5TauMleFawANwgdI/hMRXdrZsxMQWQpbAx+Sz8M3EwNpfGgrJ7x
         fYaeqQwdRBQSUv8rOFCCdxOpzdvOod6X+RcOsJgXB7/oXKeJmlFIIyC7H8Ld67uuEyla
         afzkytjfEHigr8CGdeIa80soDpygauD8EWuDClm+pqOGyqfuAl6Ap1oBVa3WvbSpu+mk
         cvQgEQcB3ivBiw0OhECY6JBZe7LV6LxxVdPgt+NB6RyY+pbkGeVhh1du60dKCe7ixisB
         KLNg==
X-Gm-Message-State: AOAM533UucIeRz0zMpkLepEZUg7VFRMhMbyUFQ5E/SAApZix4dUxDIQG
	OMZjGamrm/GuKQ71ogk0elkweNCWmiSQsjhMIT39/jcO
X-Google-Smtp-Source: ABdhPJxL3USgU+rQ5I+/0wJ/L6sK451VOYlJ16aJbjXAEp4hJD8/qzQbgZ+ANH43lLgFegTPAs9WnRGFx54nKB1Rf2Y=
X-Received: by 2002:a37:b847:: with SMTP id i68mr8422601qkf.431.1589647677411;
 Sat, 16 May 2020 09:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2005161051310.10701@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2005161051310.10701@localhost.localdomain>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 16 May 2020 09:47:31 -0700
Message-ID: <CAMKF1srHT=9A2q9=koPbii_njHTXVh1Ffxa6f-=+1N4o3RZ8+g@mail.gmail.com>
Subject: Re: [oe] why is python-mako recipe in OE, while python-mako.inc is in meta-oe?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 16, 2020 at 7:56 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   was just perusing some python recipes, trying to learn all the
> details of how python recipes work, and i noticed the following:
>
> ./openembedded-core/meta/recipes-devtools/python/python3-mako_1.1.1.bb
> ./meta-openembedded/meta-python/recipes-devtools/python/python-mako.inc
>
>   as in, the recipe for mako is in oe-core, but the include file is in
> meta-oe, the recipe does not include the .inc file, and the git log
> just looks confusing. is there something clever going on here that i
> just don't get?
>

its cruft left after py2 recipes moved out into its own layer. Send a
patch to remove this inc file
for meta-python.

> rday
> 
