Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.9557.1587052235712758463
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 08:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vc1OPqbz;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id s18so2250207qvn.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 08:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6aGh5ebVR8+6ZoGOVP9hnorpcJBx/mq/mjfdmnWQlA4=;
        b=Vc1OPqbzzvgcxOjF4pgKFXGk45lgVV6UfOXAVR96015+o9N7MWL+AfxlQP1OfvyhvJ
         dE+1kk1aTJurvkN0L374Jm+C81E6oRDHgp1D1Nj4Vvk4O76TcX7uOOLm+BCk8pz2htSs
         PYgCRyPkTj/KzZevKB92uqtodLcrAPJkdV5YXzX7BoujmqVzxvNQBxzERizoeGLKbRcP
         lDx65IkvazQNiF78YJJ6Jl/0F6haoEZmKamxmSLYsFzdpmYee5qTAjNf30fWKzVDHVbs
         K3dLDo/RjakraLx0H293DNWcUsM69ykb13cYOk/5BROOsovVK/npZS+gYV2nSM1F96kp
         I5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6aGh5ebVR8+6ZoGOVP9hnorpcJBx/mq/mjfdmnWQlA4=;
        b=qiOvdVfN5UgyGlBPt47gfa3rw8uWqRoFLJ9RZw3LfmkvQelczgh7DndMxzjwGpCFfE
         DD3GKdbDM+PtEaRK+hGKLS5TigEq0QpHU/5A3YrCAJ+XAhDA4ptx7Tb5ElueCs0AKfdl
         jQ0EB6NCU5dgH1VifMkwiEmGVo+q5ErIP/nopcEg/ANi0WtQkoAImdWLqJTcHNgfrTBI
         Tlm1PsMJaQP2LR2RIp3vboLbEsz5xcFRmEvKg7LuH0OKzQqpY/Nd1dL8yfAh8uC1+GzO
         uakxIHK39cqS3ciYjfHjGIiDWz3wZbyA7Y5foiEE1RpwunR+Sr4mG0tvNe3NTIGSfeq1
         +VjA==
X-Gm-Message-State: AGi0PuZu2O6V3DKa5SmeSgS1zPRlRwWBlfRVdCI9rTX4QmthxNqUXRHS
	dzrF8rYMNlL/h9YWkrPNJKXFm7QUkacKSJBswE9Y5XUh
X-Google-Smtp-Source: APiQypIcsqcDbX1HWMk9h2mRDxYYX8veFcyj8d7aaNaXZotyli8l+rHDfuMf5qWyt7gP0D2XZRA9k5bFDCE1fMu5IVc=
X-Received: by 2002:ad4:4182:: with SMTP id e2mr10895918qvp.61.1587052234681;
 Thu, 16 Apr 2020 08:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200416102923.27122-1-Haseeb_Ashraf@mentor.com>
In-Reply-To: <20200416102923.27122-1-Haseeb_Ashraf@mentor.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 16 Apr 2020 08:50:08 -0700
Message-ID: <CAMKF1soS6_L4HpzA5WKuJGZLrnqvnq4qcq-zigYfBX0zhS6EpA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] modify LUA_CPATH_DEFAULT for 64-bit architectures
To: Haseeb Ashraf <haseeb_ashraf@mentor.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Can you rebase this change on top of master or master-next

On Thu, Apr 16, 2020 at 3:29 AM Haseeb Ashraf <haseeb_ashraf@mentor.com> wrote:
>
> LUA_CPATH_DEFAULT for *.so files should include
> LUA_ROOT/lib64/lua/LUA_VDIR not LUA_ROOT/lib/lua/LUA_VDIR
>
> Signed-off-by: Haseeb Ashraf <Haseeb_Ashraf@mentor.com>
> ---
>  meta-oe/recipes-devtools/lua/lua_5.3.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.4.bb b/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
> index 8f4e8fe68..1f077e501 100644
> --- a/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
> +++ b/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
> @@ -28,6 +28,7 @@ EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -DLUA_USE_LINUX -fPIC' MYLD
>
>  do_configure_prepend() {
>      sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
> +    sed -i -e s:lib/lua/:${baselib}/lua/:g src/luaconf.h
>  }
>
>  do_compile () {
> --
> 2.17.1
>
> 
