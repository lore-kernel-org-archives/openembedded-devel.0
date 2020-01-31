Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9818860785
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 09:36:30 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id b15so5623601iln.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 01:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wmAXG/XJ/+K7609gj0VWpxqPKvGw6nEqnH5Ub8CSJS0=;
	b=gXdvcIFFrvvNP6oKl/Q6V8bwdd+Fbu5OhSejKNNqfQuHNGJn3iuzF+C+fhW4P7vrdS
	L4SncXJFuQtJpuhUDByRqWOaq+P2jRFwlKxO0ErcFvukuJrvzzT6l/b1H4kHscsaei/Y
	nZHgmgP7vEfdV9PIJ2YSoBlx6yzAzZ8osvP67rbSDvGIxWSWhYEkA6Hihn6sPqcCjjO+
	2YkdU5GiOOBXW6D/Z8HOVxaRBT4W8hddbiNWyhmQ0e/O3OBJ9NZlS7HymhCXouwex3qa
	h3vaWHoCUsKf/sxwfv6a5GM7+3yMUG//Xfu+vNx47X0mfDE9x3UI686EFNXzG69pU1qx
	pOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wmAXG/XJ/+K7609gj0VWpxqPKvGw6nEqnH5Ub8CSJS0=;
	b=URSb8Yb64UBF+Ltu+g40RciNrkkmw69ftxKPAPbwG7AuK1khp8C6DVitNBcyCKXSMY
	EBkxDYpoGViAydK9JGQy+NHOJ3loI8OMJwmenCwHa883cYC5nmmmcfXYW4GkkLcOP1zq
	6O3v8X+z41a3+3mq7z+/F+UGKXpfH2knybBa+SRsmRAlVJ9N62eZj88kVVGVHvwdJwsg
	mExu8U51h1iFInRI29aRHi6VvFn0VlOkreiaCgEFVRppg9vWjbv4gYrspBJ1nRjsbeGW
	4tS2ocAD0dSExrV++vyywV2/g7r5US+IhjonEQTerami9YffKFT65smTGpjGE21OoUdx
	AVWA==
X-Gm-Message-State: APjAAAUGUuXlF9kAXT3jZUBUCbCH6HzctqTbZKEl9ct8Vb3K4IxvQ1Vx
	7yE3wcJ6OhI35CZWEZSPRRNGFXoCUyGXj8edlwM=
X-Google-Smtp-Source: APXvYqy8QUteX+58l5h5Ep9ARiWLBxkAmhsgKwntezhdb+vIpEfdECukgTDjgX9uRQCjrUCi2vxC97xuW3ILI2SlJeE=
X-Received: by 2002:a92:4019:: with SMTP id n25mr569076ila.147.1580463391691; 
	Fri, 31 Jan 2020 01:36:31 -0800 (PST)
MIME-Version: 1.0
References: <20200125202357.4766-1-Martin.Jansa@gmail.com>
	<CANx9H-BvkgBQb_NPgJ66LUJvpMDFy7h899MTrnVrqGsm=fDsaQ@mail.gmail.com>
	<20200129203200.GA3422@linux-uys3>
In-Reply-To: <20200129203200.GA3422@linux-uys3>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 31 Jan 2020 10:36:19 +0100
Message-ID: <CALbNGRS6dTCn5M9q_yPiGbPG8Q2d++8c_qOggYUAZrU8fA0dGg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] packagegrop-meta-oe: remove blacklisted mpv
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
X-List-Received-Date: Fri, 31 Jan 2020 09:36:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 31, 2020 at 10:29 AM Trevor Woerner <twoerner@gmail.com> wrote:
>
> On Sat 2020-01-25 @ 12:42:21 PM, Tim Orling wrote:
> > If someone cares, it has been updated to python3
> > https://github.com/mpv-player/mpv/releases/tag/v0.31.0
>
> I'm looking into this now. Is anyone else?
> (no point multiple people looking into this)
Was on my list - but am happy you jump in to reduce it :)

Andreas

