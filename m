Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id C0E2C6006E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 19:53:14 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id b18so333059qkc.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 12:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G1JkBpQl6rZnoHWaBHkzljI2q/Acu0W5v73wtXJVk1s=;
	b=owM6aKUCjYYwD7dYQeDhZKUu5YVXe6msOEKC0oGUw/XcOhaTxlxN98Vfc5AQEu3AEV
	bwp8LUFGyMmuwlyApGkOeCXfTR5JK8Bnr0vHRvUQeLf4qx+zATUPR0hUcjqjTsT71f2l
	eR4sLxLdh6bbIGLKHuQSp2wzLXZyJxhhkXket+QpVFzVT9dySeETRQLoFWIhga2uRrq0
	PE6jLe4hObEuOe826wkw37uXZahLxaNr/iC+uZV5nE+0O/JL0V3Bllg/Zn8RRvaoI2A3
	nv0j7TVWPk1OhYF24LBD8DOygulHjM5a12sBxvZgx3bUdvqbFOr5BfTHPAFyUrszJsGE
	Lhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G1JkBpQl6rZnoHWaBHkzljI2q/Acu0W5v73wtXJVk1s=;
	b=CEfs5yF4JmqrZqcibsStbDs9Jmc55sc6QQSA3wsHM5vCDuvMZfMLReP5HO77tb+V0S
	X1VULNC1N1yZzS4hKeyiiy85hLUAzE536lntKSNr+xZWhQGhZn6jCn4qcX8+En3IfQH0
	JzIl2hNXGxmd/cnkcfXS3mEsUq0FziOq18cnDfyA/qdGF0DgWF0uQ1pmFYTA6RwdWAzc
	U6MNh/7d0SOaPk9Lsna/wG1kMH1n4t/A4Z43/KfbYJS54jOK5/grRWuwFY+2j0/pSDDG
	kQyuAXACJYae+sfifFFwo1TkskotPUNcawpl7D7rh91HnPWEugxB2DbdvyQ+E7dPo7NI
	YL9A==
X-Gm-Message-State: APjAAAUgZt8QXkaIYlTTxhKg8i+ZPrl9TaMXmfFdX6O2a2uAV5bx5X/k
	2+n1bU/jlL9Y7nsdZUUvO0VchYePEuoICM0E46dFZA==
X-Google-Smtp-Source: APXvYqwhsGe5h51g/xGuyxL+wfJPyC0ZpgFK7LQ9LrM+iiiq8C02NEZ3H7OialPSpJIbKE17W6yGsb+1n3Z3zAHkkvg=
X-Received: by 2002:a37:a017:: with SMTP id
	j23mr101004170qke.258.1560973995323; 
	Wed, 19 Jun 2019 12:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <e0d06b82-d76e-01af-f1c3-f3976eafa459@javox-solutions.com>
In-Reply-To: <e0d06b82-d76e-01af-f1c3-f3976eafa459@javox-solutions.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jun 2019 12:53:03 -0700
Message-ID: <CAMKF1srjxhVS8j9v61CXnPcSUAzHdN7E54gfEoYEpt0E7AZmZw@mail.gmail.com>
To: Florian Wickert <fw@javox-solutions.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: rtmpdump and GnuTLS
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
X-List-Received-Date: Wed, 19 Jun 2019 19:53:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 14, 2019 at 6:53 AM Florian Wickert <fw@javox-solutions.com>
wrote:

> The following commit changed rtmpdump to use GnuTPS instead of OpenSSL:
>
> commit b284f2b45a9127b84460ab99f00fd13755b1af5b
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Fri Feb 1 23:00:08 2019 -0800
>
>      rtmpdump: Switch to using GNU TLS instead of openssl10
>
> Unfortunately this leads to really nasty heap corruption errors that are
> hard to track.
> This is a bug in rtmpdump, not in the meta layer, so this e-mail is just
> a warning to people who are using rtmpdump.
>
> I have a patch that makes rtmpdump compile against the OpenSSL 1.1 API.
> If someone is interested I can post it to the mailing list


Thanks please post them

>
>
> Regards,
> Florian
>
> --
> Florian Wickert, M.Sc.
> Javox Solutions GmbH
> Gallierstr. 33, 52074 Aachen
> Germany
>
> Phone: +49 241 99034569
> Web: www.javox-solutions.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

