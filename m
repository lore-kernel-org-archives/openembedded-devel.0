Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id CAE2A79B57
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 08:48:54 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id k6so21097999qki.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 00:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n+Sm6SJ5WQorugrxDOAdmdCT/FbVGl5W7m08GXInds0=;
	b=euNh4LRNw4fbAm6W/bhJ8yoO/F+7wsuJWfvtWBxcJNy+KMZxLIU1e14EyNkw24pe2t
	HYmmjJYt+0IWFIThwfNKnki1dh3Q1+gN93xZw2C8d7Ni93WCiZa0PuLcCWF+lDytEm+7
	MkPt7TH9KYfoaS4vT/ggywn6fo22qndCl3x+43tXuOdxPbgU5sHBmxnZinwQpG2QQZPa
	g/gKL96Qxm9SiOn/MtIqpvKhjemRW2OOKEuKvGK5KOrEgizTxwWjxe/0614h7VrXN5CV
	fzGQIoF9HdYYdanx1KdfNPl1X9SyjHUz+h5JZybnIt4me5DN2qLy7n/IvYDGCFZPp05U
	XHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n+Sm6SJ5WQorugrxDOAdmdCT/FbVGl5W7m08GXInds0=;
	b=RPs7d5DnmLWgQ5uv/DWQv8crgi56V5H8OuCqVj63hX6J8/2PV8gt1UlYsu4/8xgHLL
	O9VIzwMhb/Y0jL6wdLRt/6+dUVq1bXQsQGy/8T4RtOCbCckMFcFDRtO33vU/i5nE3Zsv
	YlkIJn0Ae9kqXQ2B8vpKlKIunf1aV7UCnpqULX+LdSPQhDqXb/4pVnndXcsaIfjCWONP
	B4ymyjD5COu37ecT9Semh9ufK38d/E+cAJyCwU2Ivz51x7ux3MgZN8QqGLWFXTTZtOQ5
	CNZHnCemx7xtOiREIhsuClN43CLFhQTm99mMqEEYD45yw+f1CPPSz5pebCAf6sTRX3rm
	e9oQ==
X-Gm-Message-State: APjAAAX3bVaRf75osR4FKBIIrIXjv1SdcU9dKhG83crvgxrdKb1n9BRl
	40WBRWwRRIYC3e0OYn3K7UQa6cFAc6QIgXI8Nj45XGsO
X-Google-Smtp-Source: APXvYqyLJ+eKMVpaJsJ8ZJ3smfMDSQNnxKwF7Jm2NyAInbAwyXRAirMHP93hJg9Dgmj7pqRcgjnwE2tx+J8e6i+yub8=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr40990476qkg.71.1577436535424; 
	Fri, 27 Dec 2019 00:48:55 -0800 (PST)
MIME-Version: 1.0
References: <20191227035639.303716-1-raj.khem@gmail.com>
	<20191227035639.303716-5-raj.khem@gmail.com>
	<20191227081204.GF19235@localhost>
In-Reply-To: <20191227081204.GF19235@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Dec 2019 00:48:29 -0800
Message-ID: <CAMKF1sp9pY8Pmq5fpQd91OERR1avXKk7ShWbJYRQ=+hD1rTVOA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 5/5] ippool: Fix strncpy -Wformat-truncation warning
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
X-List-Received-Date: Fri, 27 Dec 2019 08:48:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 27, 2019 at 12:12 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Dec 26, 2019 at 07:56:39PM -0800, Khem Raj wrote:
> >...
> > +--- a/cli/cli_readline.c
> > ++++ b/cli/cli_readline.c
> > +@@ -261,6 +261,11 @@ static void cli_rl_display_wrapped_text(
> > +     if (left_margin == 0) {
> > +             left_margin = 3;
> > +     }
> > ++
> > ++    if (left_margin >= strlen(text_buf)) {
> > ++            left_margin = strlen(text_buf);
> > ++    }
> >...
>
> This doesn't make sense, text_buf is an uninitialized variable.
>

I had it replaced with 128 already, this patch can be ignored

> cu
> Adrian

