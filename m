Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 49A2660017
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 19:46:13 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id p18so8503586ioh.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t4LjiXnHUVBVZPsBWcJI7gScYoQq+kPXPVDhZbS0OX4=;
	b=Z3bQ+5MLAd5mGzYqKgBP2e3sH1A/TaKQeeQCL9WJp1KooOnQ/E/FiIgoeFmnNfSPO+
	RncpICXpNA2QhFBwydqtE/d5Uq0tEnTDVPNyGof3I7KEMqeR3NzQgnt9k+2s1WzblIin
	iRIFqMohJcUMGD0NNIoiN2FPIUhCFTHGWnBSBA7r+vhQYqwMr/v2omhksckDojeYbaWh
	86Q7U+QwJO3I9WUjq4NBB64AO7vdP5vZgUQZKA29tsyTKm+RpmQzVwlOLxP9oL7qyb3S
	0tLN712cxnDBFjndh+ZUo1hruLk/GhjGITNX9usFI2l9IS+hgymNSgV+fHttuBcLsks1
	FnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t4LjiXnHUVBVZPsBWcJI7gScYoQq+kPXPVDhZbS0OX4=;
	b=hb4H1fYcUtVxgYPBDPf7pKpRX8Q7/1sfZinsbD1TS2IkFQjhxlbc5WwYSG21+52nC/
	65Rre8XahzWW6qwOZqRE66QFFrb+PUqaXea7F3MTTTNk3MyyaumfqBCp1EnzvvKRUfxy
	L2Y9Tmxn8z99OtRWncjLGiOgKHq1lvCUt3A5gzSRlTx9DqozfYAv5hfq6b9Mn5M2WN0n
	vc9fSobG6jeAWLsWpwTQiEc2OvbaAYTbL50tnqbhWivZk6OHrOGVNKn1mpjzqKRk9aLa
	OnCCPAgq7zWduuk3CZZgsoqWwfl6cGCh/RuD1gg8irla2s2uAwnVHRsx/AgzMBjmA7tn
	hfJQ==
X-Gm-Message-State: AHQUAuYlWODb13tx9M0qqiwpTLHKiD2R9DXi0X0dr0AeV3bVnFME4mer
	jQJJ5wzYXxRKAaaxPV8awQcmetmLYnVZjhbiwiE=
X-Google-Smtp-Source: AHgI3IbXcI7MMWGnGZR9UguZDQajTHzpqWFBWJssqvtakeeWU7j0EFJDeaB8l+c1/w29RvZOXgDbiX4luqlg7OxGNjw=
X-Received: by 2002:a6b:7108:: with SMTP id q8mr10374645iog.7.1551123974175;
	Mon, 25 Feb 2019 11:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20190225172823.4030-1-michael.davis@essvote.com>
In-Reply-To: <20190225172823.4030-1-michael.davis@essvote.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 25 Feb 2019 20:46:02 +0100
Message-ID: <CALbNGRTxkytzRsu4MaB4vy=0k8gEDWytqsaq-6YydBPDhBik6A@mail.gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] plymouth: Update to version 0.9.4
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
X-List-Received-Date: Mon, 25 Feb 2019 19:46:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 25, 2019 at 6:28 PM Davis, Michael
<michael.davis@essvote.com> wrote:
>
> Signed-off-by: Michael Davis <michael.davis@essvote.com>
> ---
>  .../0002-Fix-build-with-glibc-2.28.patch      | 34 -------------------
>  .../{plymouth_0.9.2.bb => plymouth_0.9.4.bb}  | 10 +++---
>  2 files changed, 5 insertions(+), 39 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.patch
>  rename meta-oe/recipes-core/plymouth/{plymouth_0.9.2.bb => plymouth_0.9.4.bb} (91%)
>
I have tried similar long time ago but plymouth did not work. Did you
run-test this?

Andreas

