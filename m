Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web09.28869.1605020165256560573
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2020 06:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uTUZs3tW;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: rosbrookn@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id l10so15024278lji.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2020 06:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uExb49ylpKypctUCb5Gdk1lvrXc7REq8I3a4YSFqStM=;
        b=uTUZs3tW3ub2/2kwZwvDBB2VPkiJtAEoBSj914tCCYy+Dg75/5t2ZR2SwPfiygzOGE
         W7Bki/VI436lTtlSqwXdyXB7dj5vTRaIbvFJyOuAyDo0OfgOID5QdlI7wBl96aIX0Egb
         D0liujR06ondNSJ7+Fe9Cnza7Jup8pz+9AqCs9hwBw0dnPtFVa3NAFq4NiUmozpwRNh7
         BNTwcPgx9h0W9F1etHSgvRvYDArRyhKDJr7nnyy/x6w82FAsKXC8vJfgEC2bA+X8Lapi
         WlHglBHSVMRzzQkCrKwGSUBfZ6VoQVPBVa1Ourd14AUtKGCXCsj72uv0AJ7cqBTwlRMo
         J+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uExb49ylpKypctUCb5Gdk1lvrXc7REq8I3a4YSFqStM=;
        b=VSQEXABu0nrZ1p5DzXRaRPvw/gNfzGtWoUDWALtHlkFMJqXlundDKZ6aBRPE81LVXS
         +UOZCOUOp0tRLS9Rrqciu78o9k8q8/Dgdl9wSmFx+BTEIOtvp4Zd9QanUePYLv1PKyOx
         yIUzbtQGtEHP9eiWE06z91dZyqTYZ/z4xgYGLQPk/LBW8O7uKThnO9pqWc6MTw/LEBRN
         OjG/Sw+9X36U/BFk7lWCYv1aSzdZSQ1AhMtBbmCO2TZAFluyE9A6YCYQwqEXm250oIZ7
         Lf/l39ihas98YUx6HFqEtQ1/jEukEaiASckqHJwfnqjmw6kx81Q5mDbK3pRz607uZKgq
         SEuw==
X-Gm-Message-State: AOAM532Q8YeQ461m6veMCLshazBzXBese9pMcxFcdaviybqia201cgwn
	t7BB/NVcPA67IcFXy89Kg0YzvjjezDz6C/NAn50=
X-Google-Smtp-Source: ABdhPJy4ZjQuT8LHRAseQ4eJq1HxyOlDtLGmpT34TqAqYcNTtSFIdR8Y8vOnAoOWACFkFWyy21PG9nRcHP4rj8Xop7E=
X-Received: by 2002:a2e:760d:: with SMTP id r13mr5025502ljc.420.1605020163210;
 Tue, 10 Nov 2020 06:56:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604935361.git.rosbrookn@ainfosec.com> <b26c5c7085c0fea710a37de329a8972b66d9f3c8.1604935361.git.rosbrookn@ainfosec.com>
 <CAMKF1sriwh8+Z2P6FDd4B_mK8aqAipRffWCUvPmakiaCcR-02g@mail.gmail.com>
In-Reply-To: <CAMKF1sriwh8+Z2P6FDd4B_mK8aqAipRffWCUvPmakiaCcR-02g@mail.gmail.com>
From: "Nick Rosbrook" <rosbrookn@gmail.com>
Date: Tue, 10 Nov 2020 09:55:51 -0500
Message-ID: <CAEBZRSdkpmDvb97mm-HNxTAmf6m6JQn0ej63k_O8mRKnjbUPSQ@mail.gmail.com>
Subject: Re: [meta-networking][PATCH v2 1/2] strongswan: do not use deprecated stroke and starter by default
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Nick Rosbrook <rosbrookn@ainfosec.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 9, 2020 at 7:01 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> it seems to fail
>
> https://errors.yoctoproject.org/Errors/Details/537881/

Ah, I think I figured it out. Is this build for a non-systemd distro?
I think 'charon' needs to be the false value in the DISTRO_FEATURES
contains systemd check.
