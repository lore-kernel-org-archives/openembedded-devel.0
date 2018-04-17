Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 70B567450F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 07:31:07 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id e11-v6so5661625oii.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 00:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cojP5jae6NMt3WJkpp6N7i7xQuMImBv+zFzw1o1PGng=;
	b=r2txYiEioFlO14hu/Ty8Rl3gpkLsjwx+eV0ZRZsNxWocqm6A8KGydcWFnBa1TuK7aB
	zMqSBtoac+rjn2r8EoU57oGTTry0E8UGx2s664XlGfbF65dH4UQS3RWz7ftaJFqo3lDp
	9T7usY0GEWoYAP7RW1Qokamz0mA4EvcxrBPoXhWoxu7eSpNUFWy4NTUlWw1XkDow5DWA
	l83Zgn3vUNlQo7Qm/NRtH4CZ3xj2tv/hW8lxRU7X73/3f2aKEYtJ5EhAh659LdzbXoox
	5G13tXJJtpdQONYK5/j7F55yLHwhW+giy/gYlj66PjyzLOmSon/4o4zA+cZRCWxecj58
	I7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cojP5jae6NMt3WJkpp6N7i7xQuMImBv+zFzw1o1PGng=;
	b=MVWKSjC5erVoxoWJfRP3cbcIgWfJFAg3lcVuSTHYZPmOmfxbTvp+TcKs/IdBr9R8oC
	tsKWRkQPIMHqxF3qIrjixfnaIgc6IdaprL2onerdncBM5cichy+8n4y6ZdFmaM7f7sc7
	BhfrWo8zPUF7SxlQIpzFCn6LfI62xjhnyna3tZeO7ZX8dBz8c6heBkF9smhePqJFuqBQ
	nr3qfjYvmCw7woNaBpkjTVtORjOQoUbcjaMfzGZqEd3G2PKzCVkg+hEDH19GYM/uEvHU
	1KPxPQjJjnNNH+jFyplFSyLVSJJRsj2SU3YjlnCHxISOgl0t7mGXmuNDbLCqnB1YKKfV
	cgfw==
X-Gm-Message-State: ALQs6tA/RAVKlqbhvhUw9RrNM92Yx/7ca8at8aHBLc+Gj4yABeVsGWMc
	2UL/iw8SLVX7HDEnZ1m7etDidj1hWxgHAHWRp1k=
X-Google-Smtp-Source: AIpwx48OtMoky52WvqDXA97PiA1HG1XjDrLH7AMuCnwxuamnBNRmXaBiUx+jnSSjkiOTW2gUWIFq3w7z7AehlWOoiN0=
X-Received: by 2002:aca:b443:: with SMTP id
	d64-v6mr563784oif.104.1523950268401; 
	Tue, 17 Apr 2018 00:31:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Tue, 17 Apr 2018 00:31:07 -0700 (PDT)
In-Reply-To: <1523950047-18434-1-git-send-email-hongxu.jia@windriver.com>
References: <1523950047-18434-1-git-send-email-hongxu.jia@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 17 Apr 2018 09:31:07 +0200
Message-ID: <CALbNGRS8BtZjD5ioMYbTdWaDFd5GyG3qPh35C6jpStDhF0SdQg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-notifyd: fix parallel build issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2018 07:31:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2018 at 9:27 AM, Hongxu Jia <hongxu.jia@windriver.com> wrot=
e:
> While do an out-of-tree build, if xfce4-notifyd-config is not created
> in time, there is a compile failure:
> ...
> |LC_ALL=3DC intltool-merge -d -u -c ./po/.intltool-merge-cache
> ../xfce4-notifyd-0.4.0/po ../xfce4-notifyd-0.4.0/xfce4-notifyd-config/
> xfce4-notifyd-config.desktop.in xfce4-notifyd-config/xfce4-notifyd-config=
.desktop
> |Died at intltool-merge line 1184.
> ...
>
> Ensure xfce4-notifyd-config subdirectory exists fixes the issue.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb =
b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb
> index 54e702e..15ec51b 100644
> --- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb
> +++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb
> @@ -23,7 +23,7 @@ SRC_URI[sha256sum] =3D "f6f28af47fdfb41db84bd003f0d76f5=
f4abf2137d1e27e9d378f063bb8
>  EXTRA_OECONF =3D "--disable-dbus-start-daemon"
>
>  do_compile_prepend() {
> -    mkdir -p xfce4-notifyd
> +    mkdir -p xfce4-notifyd xfce4-notifyd-config
>  }
>
>  FILES_${PN} +=3D " \
> --
> 2.7.4
Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>

