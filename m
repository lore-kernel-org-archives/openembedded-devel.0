Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id C95367016E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 14:44:35 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id g44-v6so15446628qtb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 07:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=N0rVImQkRfq+XOXj2zRc104vkyI5UKQaVMw/J1lozXA=;
	b=rIiEdbR6pUEq/98LQV8WyNnWsEeyLbahIKxAkmkqYcEWC02xzKSaiI6LQ+aBQqu6eg
	oMgJBa563T8yk/agapYydYbQ2qskDrSFuBw1vrxlcLk9kQM6fzJk5XM+lfW9F/oCnhkC
	Qq14uSZ8q1I2B0IauOGIG8OI8UZNLzNZFo/p31vNF8fpFhnTJbiOrqEe83S1A/P6dYDH
	qMovsZPinqXHIkjlfYAKDnixaN87pAbDxaxe6Hg0Derg7k4nQPCLuogyxDXGiu56cb7n
	Iw67cOXxxzcAAPduSwwPWds4HSWo35pZUa8VjLfU08V4wNl1opFFXDwqrgwAE4UwZiCv
	9A/Q==
X-Gm-Message-State: APzg51CQ+cjs8vptGcivV9wemgwRUSF/0Tdim8gybLyEywl+GAzHlOCF
	quyrXD8mWqsSKc0C1LxFfI0olmzY
X-Google-Smtp-Source: ANB0VdbNlTB4aCSgCu05QntXAfE5OJEP4VPkM5RS0ndIBsk/65nWmFPh7TlQw2Tt/rXoqVRaY0km9A==
X-Received: by 2002:ac8:7311:: with SMTP id
	x17-v6mr17617996qto.204.1537195476576; 
	Mon, 17 Sep 2018 07:44:36 -0700 (PDT)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	j5-v6sm8910580qtb.34.2018.09.17.07.44.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Sep 2018 07:44:35 -0700 (PDT)
Message-ID: <9ebbdc41bb7ebce99e013df00ec5ab9d58c6e4b7.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2018 15:44:34 +0100
In-Reply-To: <1536343810-87649-3-git-send-email-yevgenyp@pointgrab.com>
References: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
	<1536343810-87649-3-git-send-email-yevgenyp@pointgrab.com>
User-Agent: Evolution 3.30.0-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH 2/3] ca-certificates-java: Don't fail when called via hook on do_rootfs
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
X-List-Received-Date: Mon, 17 Sep 2018 14:44:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-09-07 at 21:10 +0300, Yevgeny Popovych wrote:
> It is possible that ca-certificates-java hook will be called via
> update-ca-certificates hook during do_roofs (the case when D is set
> and JVM_LIBDIR is not).
> This is a valid case so don't fail.
> 
> Change-Id: I908e2f0acec487c41499543014014e29919bd6ab
> Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
> ---
>  .../ca-certificates-java/ca-certificates-java.hook.in               | 6
> +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-core/ca-certificates-java/ca-certificates-java/ca-
> certificates-java.hook.in b/recipes-core/ca-certificates-java/ca-
> certificates-java/ca-certificates-java.hook.in
> index 89c764f..611a4ef 100755
> --- a/recipes-core/ca-certificates-java/ca-certificates-java/ca-
> certificates-java.hook.in
> +++ b/recipes-core/ca-certificates-java/ca-certificates-java/ca-
> certificates-java.hook.in
> @@ -14,9 +14,9 @@ jvm_libdir="@@libdir_jvm@@"
>  if [ -n "${D:-}" ] ; then
>      # called from postinst as part of image build on host
>      if [ -z "${JVM_LIBDIR:-}" ] ; then
> -        # should never happen, this is supposed to be passed in
> -        echo "$0: no JVM_LIBDIR specified" >&2
> -        false
> +        # if JVM_LIBDIR is not present - we were called as a hook
> +        echo "called as a hook of ca-certificates on do_rootfs, exiting"
> +        exit 0

I don't understand how silently not creating / updating the Java certificate
store any more is good? True, there is an issue here, but I'd say that this
should actually do something useful, not just pretend to have done
something.

Cheers,
Andre'



