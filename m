Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id AFFDC606C5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 19:33:24 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id a2so7219377qko.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 11:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uF7wAh0EWykUnLtr0XBQlRPj4cKi4atRE76X8r/084w=;
	b=so8hL0176sL1MarrFM8IlFEkp7vkZ2jsw5aZrrnO4dAWwf0ku8mcB6KeXISNtrM32Q
	u3VNg/spz55ANmsnEjMS/ysdHOBL8OQHSEBmPULIfSbTJ/37/S54hryp00ZT8QdCX3Iz
	Lgvpaxk5SGwr15NEKcoLCeaA3Nt7I743TV2wOoXD67gzO8Ehwdj9Kk9q9AsXCxpilFs1
	GxFCMFLuwdoElzLSCnFFJTBDQxlaJnLjcmSKqFqfvLGNkhjm7lPFUD+vx0bE+n6i7j9X
	yoiHHtMd0jou+QtY/nNWNNY/s4pVTzJopj8OwDS/Gss+qvzpi+wXcH7Agk57sj4IXjnP
	KVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uF7wAh0EWykUnLtr0XBQlRPj4cKi4atRE76X8r/084w=;
	b=hzqFInCu9i0V1KhUw7OSz3N6mwh6NRpvYhBsP2drAMqH+TGLZlAYaJIID03uF48z+w
	bUpCBid5ojMp3m7ePoOE66XGHDm74b9JLeqyutq0L6JAm8LgHMhzpuIuaoPS4wVS8H6M
	wbJ1/GipLJbGWkohScmwvtA1kRO/D/zcxZx9UtzEcymFPPo/JKpps0Kt4W96MBI2BC0z
	98oOGqEKshMuoOgAhbqLVYvKcx9hjn2VYOAdP+tVVnqmZoXfpP0m4EvpwSdi9/l5xcHv
	aQxRgq703D4ikd1gco9L/A4Zk1HKEO1lZZ8g/mLiRHk8Y9nL1EjjJPGZ7RoAO7BfRBiy
	50BA==
X-Gm-Message-State: APjAAAX8sTo49FbMiEABnTQN/4LBWfSI/YbHzHrDysfhUILpefbx/e4H
	q0xEJrDtDEDUWNz89Axsp8M4aACtVHRlwQgXy7c=
X-Google-Smtp-Source: APXvYqw6Vm5W022Zn+0phTnKhATSwVsjasNW/yvMqYUw8RfsmWnUGePrHItwy5FmwUJalBzgeNlr8gcS2Avik9FR5vU=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr2805367qkg.71.1581363205319; 
	Mon, 10 Feb 2020 11:33:25 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR13MB2985C0370F67619F290460BEFE190@DM6PR13MB2985.namprd13.prod.outlook.com>
In-Reply-To: <DM6PR13MB2985C0370F67619F290460BEFE190@DM6PR13MB2985.namprd13.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Feb 2020 11:32:59 -0800
Message-ID: <CAMKF1sr1kWDiCrmK1WQ5Ey4e7Dki=5bHACvXdLhaeS6nXAEW7w@mail.gmail.com>
To: Mike Krupicka <Mike.Krupicka@panduit.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: FW: [meta-networking][master][zeus][PATCH] mosquitto.init
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
X-List-Received-Date: Mon, 10 Feb 2020 19:33:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 10, 2020 at 10:06 AM Mike Krupicka
<Mike.Krupicka@panduit.com> wrote:
>
> Reposting to tag master branch
>
> Config file specification is missing in start) case. It is present already in restart) case.
>
> Mike

Perhaps the commit message could be improved a nit. I have already
tweaked it locally
but for future reference its good to make it like described here
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

> ---
> .../recipes-connectivity/mosquitto/files/mosquitto.init         | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
> index 6a0c12760..9d5963c41 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
> @@ -38,7 +38,7 @@ export PATH="${PATH:+$PATH:}@SBINDIR@:@BASE_SBINDIR@"
> case "$1" in
>      start)
>          echo "Starting Mosquitto message broker" "mosquitto"
> -        if start-stop-daemon --start --quiet --oknodo --background  --make-pidfile --pidfile ${PIDFILE} --exec ${DAEMON} ; then
> +        if start-stop-daemon --start --quiet --oknodo --background --make-pidfile --pidfile ${PIDFILE} --exec ${DAEMON} -- -c @SYSCONFDIR@/mosquitto/mosquitto.conf ; then
>              exit 0
>          else
>              exit 1
> --
> 2.17.1
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

