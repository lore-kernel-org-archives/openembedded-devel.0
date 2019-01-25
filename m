Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7F07C034
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 12:48:22 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id l12so10481385qtf.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 04:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GgXWjmjAc8fpN2xISRpdyR5ND1yxIcxBtTkOIl3X6OY=;
	b=uo9ol0dL7sCelsrKSWGEnt6lcGzZ3RN6zHh6qLyzV65kBQEL07BlkErMVE+bS1HYwQ
	fZlSU+wp+gfkna41OsY1keycRtD2k6m8xaRpRpJNKeuilyStyuXxCdhS7Vcm+rZ9bMly
	s2McxDRJkweUkNL1u+iKziCXr2laOSdydonw9qm126tlOWNeQg6acx22ELJGwRepfH8B
	foJJf7rs+KjwyauiI+ybUZ4ZeiEldJYdc4XwYpQQALWlUzCnFMURM4j0fNYrvEonepJ0
	jRp3Q6SgZGNDJ3N/OoU9BZoYWIGB0+Q42xMtG/s12RjIISKc2lLyAsBXypIE4sGsxEVS
	n6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GgXWjmjAc8fpN2xISRpdyR5ND1yxIcxBtTkOIl3X6OY=;
	b=h1f3Jlr7YKQMdHNK+o1SGqIYoi4INHI9wwjwoBvLd/AyL0grmYubPJnvOWcjx/X/yQ
	7cPUsic8wYI/azyR5jmdRohiEnZ7nSrq++8qpPB51qZ3gFRv0iF8jM5Ctr7KQYZqNyqd
	EqHCwmfWY2gFt6SAyNUdgNJcGB4QdOKjOjjQz4LtNpP8I+vNKBY8F4fTYVpDL6xdYYcw
	KoGCO+xRYzNJTBLaJ9uIvt8LJP7JcwXW+OvNN3PstjYuY44nZyY5Ti75Iq3DrXgboKcl
	4UFU3DYxQvl1M+1aUfIbrWtMg+H/PBoyGnLJZ89Dmm+5Jlnu8UwKVW8/vrUZBcRHQlbp
	f+Yw==
X-Gm-Message-State: AJcUukcsSuPCN3/MbdulEF0663IiBNrGlBuAS8w7RYUB/eVOwHv9m4vh
	FOs185wxrE/v3wi365mPVg0uUP/xMQGa6a6kK8I=
X-Google-Smtp-Source: ALg8bN6AN7qPlmdZbmXyXCqE3Z4O3ZG7pzMK4eZEjQEEu+T0GSsRsgnRkAtmBBN8hFR2lV7MplvBoAgClvmBqoS5IFY=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr10839916qte.29.1548420503077; 
	Fri, 25 Jan 2019 04:48:23 -0800 (PST)
MIME-Version: 1.0
References: <CAGvkhOKTk5jicBPL66GY--+g=ZcJ-MO_PY_8iwrXC=Nyc7WaJQ@mail.gmail.com>
In-Reply-To: <CAGvkhOKTk5jicBPL66GY--+g=ZcJ-MO_PY_8iwrXC=Nyc7WaJQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Jan 2019 07:47:57 -0500
Message-ID: <CAMKF1sqjg5MX0TFBmSJF_F3atvvBeQRSbfLP_MHA0SKyoNrO9w@mail.gmail.com>
To: Glenn Stroz <gstroz@uber.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4] libqmi: Update to 1.22.0
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
X-List-Received-Date: Fri, 25 Jan 2019 12:48:22 -0000
Content-Type: text/plain; charset="UTF-8"

fails configure on mips/musl see
http://errors.yoctoproject.org/Errors/Details/218672/

On Thu, Jan 24, 2019 at 10:39 PM Glenn Stroz <gstroz@uber.com> wrote:
>
> Giving up on inline patches for now.
>

