Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3206F71AC3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 14:40:10 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id v15so18820053wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HgdNT3dTBsHqCZbh99nvuil1V9wnbkIhbRv1BPwFDC4=;
	b=tmOYwq4Ng3qv+5yVg9WSmAZqr7VUuvePElFFvh7iZFqjMATCM5/nfXT8SDy+gHcxEZ
	CfjZQKo9DE3iZaDg/6KiH7rOok7HtYMykcNd+HnsL80uqGroaZeXeGFA7BnGg+ez74wh
	R1EMR9r24EFi5CqfeUga5fMrJSw74WlThuVkUFb04xklOn97vIn41uP29a7BhMiViQXp
	6fcfV2qu/6kDq2tRWejqARZiwldf+CnJJMBlRz0XYr0CuRMHtC9D9rLq2v4OrX3EWyTZ
	/lKzNEquovakrMZ9xUH2QECUd816m7EdVK74N4n5GMPZ0dY5GTJBFkzOQcNXbDBMlRfL
	Cslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HgdNT3dTBsHqCZbh99nvuil1V9wnbkIhbRv1BPwFDC4=;
	b=jFXY8W0dPlKc8sFPsOlanCR8HEusLm5UyjHYz9Vyi3a2aQ4B2jMeWTBSdICalswMc+
	ofEF7RxIIuZzUAqQWLSlOfINutozFWTD+RbM03vzYzgwqH05KhcFJg/ZCjtiLbyFGX4j
	U/0NT3x57mPr8PLuffR8XFQAyGyaDaiqa/MmjlLOUPrdSTV3Ani9x+GPPPAeMs0CyZSm
	wdEd0BorZUSsuxvJgmqbpe+/YOdr5hUrv4bKZNk3bqyyGIjWYTzbdDKKtIIkCIaJwmfu
	yTlacRBtoDJ3wJKy92YoNO1sGd9BHndih7r93TIMyBhT3o3hByRFdnPlatWGJxDANP8g
	/nOA==
X-Gm-Message-State: AODbwcAIhYpF9V5H3PCCnR80+FLdJwME9/H7nYJZSF6l521Pp6p3fzoB
	oyEVd7WqGmDF1f1eot9+h9Tj4E26DA==
X-Received: by 10.80.144.118 with SMTP id z51mr3260645edz.143.1495032011769;
	Wed, 17 May 2017 07:40:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Wed, 17 May 2017 07:39:41 -0700 (PDT)
In-Reply-To: <CA+chaQc-igmSCje4h2XC7Urcq=yE1JJTfcQR3L1J2vbLdM_0fQ@mail.gmail.com>
References: <20170506191840.26070-1-raj.khem@gmail.com>
	<20170506191840.26070-2-raj.khem@gmail.com>
	<CA+chaQc-igmSCje4h2XC7Urcq=yE1JJTfcQR3L1J2vbLdM_0fQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 May 2017 07:39:41 -0700
Message-ID: <CAMKF1souBu+pDCF7G6wDtjE7BPBYmqhCcfUZgfcnEF95-_7zCw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 2/4] rygel: Update to 0.34.0
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
X-List-Received-Date: Wed, 17 May 2017 14:40:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 17, 2017 at 5:26 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Causes:
>
> rygel-0.34.0: rygel: Files/directories were installed but not shipped in any
> package:
>   /usr/lib/systemd
>   /usr/lib/systemd/user
>   /usr/lib/systemd/user/rygel.service

ah systemd. May be I should include one run with it.

