Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 146C7786D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 08:18:44 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id c6-v6so1535802oiy.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 01:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KEHvSuoTo10RB3ZdVyFvzhV9rjW28IJk4qovbQNx9gg=;
	b=IVMrnb6h0iYE82STARKUQLjfwP2xzWRrYi5/CiR3gMD+GFIt5ux9ck6fFv27kv4G80
	oEpKzURrGZGetVavRAaGLj8g3B/NDl1BhwCAf8ci3PMLhzJFiTLXk/V5wMkfom6TVp/s
	gIp+NrgtQlSdC9WCFbDnfQkwWoCx2oL5/7LpSdM+gT4ERjuiv06Uvx7znjCmcEoD+xBQ
	sf8d3TssARLpS1O9geXYLZfThOW5GL1xbttOWNYavK6yRP46fjtPx2ku9HdLNqy2hS3D
	Jpt5QpOo1quH4zP5JNxo3Um2DzVOLK8RZURtfj5yz4bFL80kec62SIvBQE8tvZ7HSU+F
	1ncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KEHvSuoTo10RB3ZdVyFvzhV9rjW28IJk4qovbQNx9gg=;
	b=NklfeWIljQfSOR8CaPfngORaSms+WRIeA1q1/sbGFMWd4TRv9AkHCnJMxlgZHCy1pD
	/9m+GYQcVpFUFcs7veJ384KC2SJ/Z6I2fPruCQu0t4TwgUWZffhRNysMBfGllWLkxhaf
	k2fhy6dnOOiNBvQ3/8p8CBfLwu5bjLMSgNodG7iAJgKlSdAdWUmYNGjkUwvekO7B1yhS
	InLErytEvVoH39SRHS4H7tCg5/Tnvfff1Bd4avNr8cye2aRnKRPzzwFGmnxGsDNiMcx9
	nxg5d+MSiWU2zAsnJg/urku8Mue/Kn9DffvxZpHONKf09CET00pIMfmzqlZF6rJ4+Jts
	LR1A==
X-Gm-Message-State: APt69E2+R8AWQgUBoVzjS4q91LzHDIcJYqS8Y1sOce6JQrF4cK1ImTJI
	bwtNtJSGE2E8HFj6Gql1iDxCFpD+BB500SnFeSg=
X-Google-Smtp-Source: ADUXVKKfI8SNVc8kjXXvYv9ydx3+uQZh0jLQaZotSts7uR+SExbSG4wtn2qGSsKswM5tTM6L6OalNNAVAUobUXj+nRA=
X-Received: by 2002:aca:d60b:: with SMTP id n11-v6mr4072998oig.4.1528877925103;
	Wed, 13 Jun 2018 01:18:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 01:18:44
	-0700 (PDT)
In-Reply-To: <20180613063512.1755-2-raj.khem@gmail.com>
References: <20180613063512.1755-1-raj.khem@gmail.com>
	<20180613063512.1755-2-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 13 Jun 2018 10:18:44 +0200
Message-ID: <CALbNGRTotmY_EWAc0J-RKR21bxH9VDz2ra5yEe7ZK_yuA_aK5g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 2/5] modemmanager: Fix build with musl provide canonicalize_file_name()
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
X-List-Received-Date: Wed, 13 Jun 2018 08:18:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 13, 2018 at 8:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...eck-for-canonicalize_file_name-befor.patch | 64 +++++++++++++++++++
>  .../modemmanager/modemmanager_1.7.991.bb      |  4 +-
>  2 files changed, 67 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
>
> diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
> new file mode 100644
> index 0000000000..256dd2ce0b
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
> @@ -0,0 +1,64 @@
> +From 07f1eda630517816bfa900e811963745a149e57c Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 8 Jun 2018 20:38:30 -0700
> +Subject: [PATCH] Add configure check for canonicalize_file_name() before use
> +
> +Define canonicalize_file_name API if not provided by system C library
> +musl e.g. does not provide this API
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
^ Don't know what the current status: Do we still insist on Upstream-Status?

Why I ask: This solution might have the chance upstream.

Andreas

