Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5C771C9F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 21:39:04 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id m22-v6so9052828pls.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 14:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FhbduGCGJLMLz9Y6zEgPb9tYJfQlysgI6JDnJ9zLV10=;
	b=HoPGPvt8BQR4E0d2/ppR9JNSGq4d/VPG02lroV5QYYzlYnjhPypfUoaUySakIsB2mT
	mX9LuesILp9ppr+OCe4nmgbg2IvjWVYWCZNAyAxIyYeW/oH3B3imdjkYB0EChxPGrzXw
	DEYFVAJWfOvfaaUgBsDOrQOj7N7dRBNy3I9hRquNC/ZyDCj2N+YyiY5COuJYLMZFpg/A
	Cg+dPJdVrOk47Zzv0o/OENG7nKxAPwS7qmjVzh63kSMrHAcgQgw2GxinfPz09/ndCBjC
	yGR0WA03L/DVul9T1udysjGmkDBrx6CkIwB9dVkxuaCT+f7Ib51g4vHBiTsUo4RL/XOL
	Ghyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FhbduGCGJLMLz9Y6zEgPb9tYJfQlysgI6JDnJ9zLV10=;
	b=JBteGBF70PtvplZgz2FssiPtfaGmZsO/pankNB3BXzEa+Dn08OArga+qVhQL2P0LOG
	g61/Pq7b/RabtQ0U/aDQDe/ic8eBeevFiiqmoDIQ6VqGhvu7vdA1KdxXEf4KnnZuOhN0
	nVfspZiBcJaApbphcVn6sL1auhfot2RZvAdPMVNAzTa8T9NQEOgB/8nJ2nJp226dpTlH
	mcV4iwkhf0YJQWpMSDOu5LI3cJwJ5vXfWXOG3NVCqwPnkKZbpeZoDe4blWJatfCwDK29
	XR03riUTBnZyG9+M1ytycmBcdJADUxywhMCcYQdkQQYB48SDR2/6nX6SAjmo8ftrNx+Q
	HRUg==
X-Gm-Message-State: AElRT7G3u7VF4qw+mfVequWGouCbGvmK+5MEm9VLPc5zkySAdc+BSYzK
	/zzZVXab89zK6Pi805iz3F1LLJy5/TX8kVnOYkg=
X-Google-Smtp-Source: AG47ELuZrMSqEYiTw+wughhbBpoENycybvDn6LLWH43UnB7uChVArqhzgjwlFvGNziCq2XTMq5lRwWlZGfrFW/mAxAw=
X-Received: by 2002:a17:902:63:: with SMTP id
	90-v6mr10246744pla.125.1521409146093; 
	Sun, 18 Mar 2018 14:39:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Sun, 18 Mar 2018 14:38:35 -0700 (PDT)
In-Reply-To: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
References: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 Mar 2018 14:38:35 -0700
Message-ID: <CAMKF1sqJhAeFwH22g-0CA0T1=i_fg6CTQym8xBCYefw+vfSRhQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-openembedded Layers
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
X-List-Received-Date: Sun, 18 Mar 2018 21:39:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 18, 2018 at 2:32 PM, akuster808 <akuster808@gmail.com> wrote:
> Hello all,
>
> I have been reviewing the meta-openembedded sub-layers and I plan on
> taking the following actions:
>
> Please keep your comments focused on the 3 items below.
>
>
> 1) I plan on resetting the sub-layer maintainers. Several maintainers
> listed have been inactive.
>
> If a currently listed maintainer is interested in continuing, please
> send me an email.  I plan on removing in-active maintainers in 12 days (
> March 30th).
>

This sounds like a good plan.

>
> 2) I plan removing meta-filesystem and moving recipes to other layers.
>

LGTM, this also means some changes in external layers who might
depends on this layer explicitly. I hope those layer maintainers will
take needed action.

>
> 3)  Meta-gnome, I have heard feed back regarding this layer. Does it
> make sense to remove it and push needed recipes out to  other layers?
>

Agreed here again, I have only fixed this layer in past to keep it afloat to
reduce compile failures e.g. with clang or musl.

>
> I want to get any restructuring done prior to sumo release to lessen
> impact on the Sumo maintainer.
>
>
> regards,
>
> Armin
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

