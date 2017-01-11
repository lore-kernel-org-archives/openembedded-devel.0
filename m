Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0006571A62
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 12:25:33 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id q89so11308826lfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 04:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=cs3yNGI3D/KtQfLicooYiUVjtIi6AnM0t2ar5oTiNbY=;
	b=LEVKuFPcAzSLc4dnMIRCcvPtNtkBPGDzpPLxrIrior8KvcOG31qaOvuibqMtext6dV
	VZvXVFdxfSFJbaBa/vR8A9xqYFn5ELcvUGyQ1N81j0X+PPC5GT9B7HjhM2hr4O3YTNST
	+7j37YjP+86Me4hGJJ58gzRDgD60EcOjMimupyLIIvSphWEFuJBZ9WXKrNj8k6eoOt9G
	LKTB8lHOqanusCE2vFhY0mFfNrQsM4BF+JPHrT7Q/MaleJ2d2lkPiw+oYZt6zWzi36P3
	Gb0qdqi0pF0ASJFVwl2U8vzQ9pVYDlZc9n9aDTTQqZySlf6vIRmoe3rTg0zt2nXHAkn7
	gCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=cs3yNGI3D/KtQfLicooYiUVjtIi6AnM0t2ar5oTiNbY=;
	b=ZypKDd68q6r9mDvuO9pgZkaKZrCitz9oo4Vkb286CcWYOEw+a8BZN2NVueaf6M6mzZ
	+JHCzridygnNrwwIhb+yxDmaDQ5fenXH7EOEo6RhuL/FzzG257EoZ8/WXafnCOwfzckz
	VXEkERWrO88OizJWh77Lvh4BA2kR1cYwBNIaEYoEhXsQNhbtFo7lP5ekV6dFce1BI83R
	wfZZhkXXQU0n0fRGhpYQAUlrAzK0YbiKMKmZbC6c05uLiKboZ/8O3xIg29bKW/Kz5lgs
	mSycLcOV0BDEt3jiFxF1Wt6jUWjLDCnmhd2xgbVMnVB04QXLpMURLDAIV6MxfGovuFJ/
	RUaQ==
X-Gm-Message-State: AIkVDXIczzqvQBQFAGDj8TDUb57+NRUaHW82xmAjtiDryCYoXiJkwyJZXqTXHQnIwZwRHB/e8R9hfemrp6liMQ==
X-Received: by 10.25.72.20 with SMTP id v20mr2684552lfa.46.1484137533232; Wed,
	11 Jan 2017 04:25:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.41.70 with HTTP; Wed, 11 Jan 2017 04:25:02 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <CALbNGRQ96mC8=tCLXpauUoDbz9zpD=cvztkaCiezta03V865Sw@mail.gmail.com>
References: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
	<1484074127-21458-2-git-send-email-schnitzeltony@googlemail.com>
	<CAAPZna1k+N+gbqb2n+fOLpmE6=RLasGku9rR7zebHvJRex-Htw@mail.gmail.com>
	<CALbNGRT2CMU03HQzC3-_J7UXR5U_RzkmHNROHyrC3kG2RZxOjw@mail.gmail.com>
	<CAAPZna2vG6pz3_jC=3PSswpBTb4zAaZZRpF9ooKGE-OSioxLEg@mail.gmail.com>
	<CALbNGRQ96mC8=tCLXpauUoDbz9zpD=cvztkaCiezta03V865Sw@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 11 Jan 2017 10:25:02 -0200
Message-ID: <CAAPZna2sAhd=-Y7EhwvZe7-aDU_m5uP8wWXrBTLc=X2H5UrhYg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH V2 2/3] firefox: use pkg-config to find nspr
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
X-List-Received-Date: Wed, 11 Jan 2017 12:25:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm testing with master branch for all layers.

On Wed, Jan 11, 2017 at 10:22 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Wed, Jan 11, 2017 at 1:03 PM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> > ERROR: firefox-45.6.0esr-r0 do_patch: Command Error: 'quilt --quiltrc
> > ../build/tmp/sysroots/x86_64-linux/etc/quiltrc push' exited with 0
> Output:
> > Applying patch 0002-use-pkg-config-to-find-nspr.patch
> > patching file configure
> > Hunk #1 FAILED at 15153.
> > 1 out of 1 hunk FAILED -- rejects in file configure
> > Patch 0002-use-pkg-config-to-find-nspr.patch does not apply (enforce
> with
> > -f)
> > ERROR: firefox-45.6.0esr-r0 do_patch: Function failed: patch_do_patch
> >
> Ahh: The patch in the patch does not apply. I tested that before
> sending and tested it again few seconds ago. It is possible that -
> since I haven't latest oe-core (or bitbake?) - you have different
> result.
>
> As far as I can remember there was an announcement by Alexander
> Kanavin to change patching to more restrictive mode so that the full
> three lines before/after change must match. Will redo patch creation
> based on firefox 45.6..
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

