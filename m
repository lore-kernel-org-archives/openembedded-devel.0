Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id B19866E27B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 05:52:33 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id y6so574231igj.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 21:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wAMEkfFS0dlz4bdcouPtFGbv+Bk84mQMJLIuLiczfng=;
	b=aq6Xj8T9E8RXfp6y6fFdgYTeHsCukZDw02Avbl6+6+mKQ9tFY9P2PZ8fYKZ7F9/Zyi
	ddhNaM20hVJKDAuuycIo13T/wnqkQre2xmtgJxICdJ68SAVtE0KVWflmJHzKnlzsQ+iH
	k3GESyuM9IU+Y39KY25x36PMOQZ172PFxZ3z5nUSxGdc4hVgF+/pOhCHqoZ1OSzeCJbQ
	IcH24P3O41Ac7q7K2l88BmAqAgLm1XuRYSIt0zljYwLdK+eJiExm18XVUND4EQWf0rgv
	x0R5ASjoMOdIjP3+JjSHTJdS7IPxCNMauW2Is5nx+AaawFwKY/ulU73ADoNkmiYsO/tp
	5g3w==
X-Received: by 10.43.138.8 with SMTP id iq8mr17761464icc.37.1393307553565;
	Mon, 24 Feb 2014 21:52:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Mon, 24 Feb 2014 21:52:03 -0800 (PST)
In-Reply-To: <1393273696-9249-3-git-send-email-otavio@ossystems.com.br>
References: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
	<1393273696-9249-3-git-send-email-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Feb 2014 21:52:03 -0800
Message-ID: <CAMKF1sor8AfGAjLODy5W9N91HQsBTTvAhh0+j3S-Obn_Gdv2Nw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH 2/3] packagegroup-qt5-qtcreator-debug: Add package group
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2014 05:52:33 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 24, 2014 at 12:28 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> This allow for easy installation of needed packages for remote
> debugging using QtCreator.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../packagegroups/packagegroup-qt5-qtcreator-debug.bb      |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb
>
> diff --git a/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb b/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb
> new file mode 100644
> index 0000000..4cfbea9
> --- /dev/null
> +++ b/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb
> @@ -0,0 +1,12 @@
> +# Copyright (C) 2014 O.S. Systems Software LTDA.
> +
> +SUMMARY = "Remote debugging tools for QtCreator integration"
> +LICENSE = "MIT"
> +
> +inherit packagegroup
> +
> +RDEPENDS_${PN} = " \
> +    gdbserver \
> +    openssh \

one could use dropbear or openssh for providing ssh server can we rely on that
instead of hardcoding openssh here ?

> +    openssh-sftp-server \
> +"
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

