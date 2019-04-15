Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id BC0377CD90
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 20:00:07 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id o129so10664835qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tjLDyAOhlcVtg0obfzCneSi0xsy9F2GobMPQ3siW2WM=;
	b=GXooYcNFVtCjs8fIMpqbYsMeCSb5SeS4cHDezix39DKQG3gkdLnFae7oVCWJzP4Lap
	Bl/s9LqEjgQIfJoJ6SB8PBeDcoPtfC6mb5g+ws3k/uPphQlZoek/XXkXQjfVVemKX1eq
	HHtthn4N7a6sNAQ6yslVKaj5SAG330fWYJCq1oSiOYQQqxbtSQpujfYa5xXMsSdPcwdw
	wBxeZXxRCM9KIVxpQDy+QwkOqrD04/sdFyXFsU/Bd3ULXATqWCQGZFOW4u34tPOHAwtu
	It9kUw7K+bQOnalgJGOqCnd/aFYxiSNOa9p3xpBzfQz2/D0jZerbThv8A6cxzwG9rLQZ
	W27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tjLDyAOhlcVtg0obfzCneSi0xsy9F2GobMPQ3siW2WM=;
	b=GcdS69olMDl6oPjOwP5tp0UaocvZpOuZcD6qaZdJuhqUlhbl8yV3cYsUwz5+RxoXrN
	byqF0n9wX2iYO6s6wlr7+AudqvVaZVZxnBTDoffwHpc6m/avO7FULMewG2vsLIkpOW3z
	9OkSa+hu6WdgS9lsFTYUk+6mqnEeoBsHogoKqs90vwlpDSgd6vWCixOOx8S7z6hkTbpD
	09xKgpZV1xiQgPsA1ydKdfco2uXB6pYIWbm47d58JDzdZbgX+PLS/g66ZiZJ9moARQri
	fZX8f+MAEyWmfXkFKFsWbtEARIJyGBVnRbKBgGlNIP5Rid31jBiA+SUnU6jPhjHPXOpb
	ETOg==
X-Gm-Message-State: APjAAAUr49paoTbVR8jYlTGmzwCQ1srqHIpyN53sp5I4CyO5/rV3D9LL
	FgDcJagZaJKLa1hb+xV8YI/5w/aNAmnPZ8USLS8=
X-Google-Smtp-Source: APXvYqxA1bZOX6VF4tv9n+bFCFLaveYkcrr9FY1TCLGTp8hneDmTprZHD5GIY1E5qkCfb4wtX+2SfKWKgAdF1lCK9aQ=
X-Received: by 2002:a37:7b02:: with SMTP id w2mr57349754qkc.225.1555358408449; 
	Mon, 15 Apr 2019 13:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190415185146.14189-1-alistair.francis@wdc.com>
In-Reply-To: <20190415185146.14189-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Apr 2019 12:59:56 -0700
Message-ID: <CAMKF1sqhZc8Y9KMPpadR0EgzGkh4bYreo2KOsnFB_ObBkYeNuA@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 1/2] mycroft: Update the systemd service to ensure we are ready to start
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
X-List-Received-Date: Mon, 15 Apr 2019 20:00:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 15, 2019 at 11:53 AM Alistair Francis <Alistair.Francis@wdc.com>
wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../recipes-multimedia/mycroft/files/mycroft.service         | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git
> a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
> b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
> index 04cf43620..28729f6b1 100644
> --- a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
> +++ b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
> @@ -1,10 +1,11 @@
>  [Unit]
>  Description=Mycroft
> -DefaultDependencies=no
> -After=mycroft-setup
> +RequiresMountsFor=/var


Does this mean it should be a separate mount point

>
> +After=mycroft-setup.service
>
>  [Service]
>  Type=forking
> +WorkingDirectory=@LIBDIR@/mycroft
>  ExecStartPre=mkdir -p /var/log/mycroft
>  ExecStart=@LIBDIR@/mycroft/start-mycroft.sh all
>  ExecStop=@LIBDIR@/mycroft/stop-mycroft.sh all
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

