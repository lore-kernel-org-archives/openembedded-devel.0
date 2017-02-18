Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id D9D746078E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 20:27:20 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id 35so5568085wrw.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 12:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=tdmdvkWI6A9vb5Td59gyTiSoYTFIvJNpXR2/GR8vxMc=;
	b=OxF1XhmWoloKpoZT/+k4cI+tZgUqX7zrNS1BFGswmpPm7ZxuRIAjgh99Ng1r6BoRrg
	vRQ+AsmVBrEDJIiOXnaXouwf7JEJG2wSJjIyygc4Dsp2wCt3GL4mf9xPiD6niw66q8cn
	RjM/6+uB7VixllJ4FykCO5MNTJPOxlP6b4nUqyMwX01JoApM20YASyJt+yGafKXohh3D
	JCWapbiSQKsZ4o28pZzOqTUHdP7Jmbc7T5WemjIUtX5rIljtswEeYblXWb+8r3qAG4wP
	FVL8ax0lOwCrL8hgs7XpEeIqSaUP5NLQfTWryAJYj5/IRb/XdAdhmFJalbmSnsK5W20z
	juwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=tdmdvkWI6A9vb5Td59gyTiSoYTFIvJNpXR2/GR8vxMc=;
	b=RMux+eCJj8KA1mB0HxpuvB5CCYKVW+7AYQw1Ze35KJFUDg5Ca4uoodFDQWJ+BFlXvI
	T0cA4STTeQcypPNN+2PIunoylC5CkjwGf61YLAlgZCzXg48WJmb5puwOx4LI0UM4nFQm
	xvlwHNrQxWq5zoMSrwcZcXILCZ/+V676KR9W9TidGGYGiefA2Z94qLJ0xZ/FcehMqf67
	0cjRr7ZoQN50I2ulUXOXTyGX/b8DEhqN0ndkOsfcap1jviB6u9Owj9UjRsTmke/V6dCb
	zD2p/IKCdmzI/N0+unwZxoK1E2cHI2xvrFctyM1AtMfpcimxRzudqHyCayGkOWKqGz0d
	2FHg==
X-Gm-Message-State: AMke39kjhO3i54QCdj3v9TOIAfXqtjpHyk8R88jUIEteQmDtu1AS76krhQdwpewEms368OjWTR0A5yz8KPvYeg==
X-Received: by 10.223.153.55 with SMTP id x52mr8003557wrb.196.1487449640337;
	Sat, 18 Feb 2017 12:27:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Sat, 18 Feb 2017 12:27:19 -0800 (PST)
In-Reply-To: <ace37025-faef-4ffe-1e02-e3a1ad52ff03@pseudoterminal.org>
References: <ace37025-faef-4ffe-1e02-e3a1ad52ff03@pseudoterminal.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 18 Feb 2017 21:27:19 +0100
Message-ID: <CA+chaQcSUf1T+tRgKUm=N=8R5jfTs7UZjxpp2vtBhELeOCADJg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [morty][meta-openembedded] Commit backport required
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
X-List-Received-Date: Sat, 18 Feb 2017 20:27:21 -0000
Content-Type: text/plain; charset=UTF-8

Are you sure you're using right version of bitbake? I doubt that bb.data
API changes was backported to release branch of bitbake.

On Sat, Feb 18, 2017 at 9:08 PM, Carlos Rafael Giani <dv@pseudoterminal.org>
wrote:

> Hello,
>
> commit d361ef01a9a61cd8a83f7728f7d3e9f118233cb8 "nis, opencv: Update
> getVar/setVar syntax" needs to be backported to meta-openembedded's morty
> branch. Otherwise builds break, because the deprecated bb.data API was
> removed also in morty.
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

