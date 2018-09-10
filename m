Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0159179831
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 06:19:06 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d131-v6so13614396qke.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 23:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sdmp5qRYGz8f3zcPi2vo5Z3UeabH19upetD9aD7jQQU=;
	b=t9Uh5vpudRvdzggHZIcKAkoaX7nwHRhwHUMLCjynRPIumuH9N02rLi37g1vsxRCYyV
	4P5MYyRvMDJdcI5L+kgPi5fk4Xaz6W0w+RqHU2gyUoXclP1scT7E8CwUgbveHEl9Eyng
	YuizMuJI6DCfoTurmEegmm8uHf9igOwIGsi18Y7q0vCUOgBFNEfpGSD17hMbF0+jqV/W
	z/HH3zCC6KCZ4brNXog6dMzj58gHzYk2KDnW6k4XGY9gXf4CyJjH8k5+o8aIJqTfjiLw
	ENP8HEttmqKt865s/WnPGEPP9FYcq+i51DFS2rNL5M83uJjkAzWmV+ZciLosbEW2i62R
	y3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sdmp5qRYGz8f3zcPi2vo5Z3UeabH19upetD9aD7jQQU=;
	b=YGCocNzb7R5AiAgOUDbZIk0OICA+hDlKkS06lMzYqFr4EpUa3vWeMa4AZIV+kYbPn0
	2lNzg2W/8zuvJR4J2/btjRZwmEnu8Lf0Y+BmjLEGv+MO80NbK/0eeDMNZ5wxoN74Gn+c
	pNGm+2qWyjM8/5hRO3qjsUa4yoDoG+PFGzAhNHnQfUsIJrXvCuLth+C93sT1vadRO1w9
	RuSSvWrT4cbCTvlkHG6uqiAOJSTD4qZEnh/ws/Q9US7H4kXWiMtLRhmF8ZG5a5PL2GeL
	ce1kxKlttfpUX3Wv9p7Asfp2W9ynKFf/WNH4D0lDZuTwvCp3wDGVfbasyzlYVKd7Filj
	sGAA==
X-Gm-Message-State: APzg51DW7lVLQlTxkYu595fXCCAiiDhg3bdDIPCDyvvrt56G6dhMoSjC
	Tw6UjmwKOF7pBCdfKBL4+xIfZhQj/t9R2WxqBZ4=
X-Google-Smtp-Source: ANB0VdafgAyjdHAYIuz/BZU7vFVT8oqIWlQardAw0o5Dvw2AMjE1m+4Ow5AsibruG9AKueW+zfoht3IL15tPuABubsY=
X-Received: by 2002:a37:c5d2:: with SMTP id
	k79-v6mr14203308qkl.206.1536560347726; 
	Sun, 09 Sep 2018 23:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAATN8PW7KbbYPKnHhxM7Y8ZxbxTPvx7yngd=W-hBQm95YZZgtA@mail.gmail.com>
In-Reply-To: <CAATN8PW7KbbYPKnHhxM7Y8ZxbxTPvx7yngd=W-hBQm95YZZgtA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Sep 2018 23:18:41 -0700
Message-ID: <CAMKF1so4Uh5YCbz=h9uxbXoAYX0QRJVUGbMecjNV=LQ8R0LWaA@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 07/10] wvstreams: Add openssl 1.1.x support
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
X-List-Received-Date: Mon, 10 Sep 2018 06:19:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 9, 2018 at 11:15 PM Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
>
> Hello Khem,
>
> did you forget a
> sed s/openssl10/openssl/g in the bb file? :)

no, this is a squashed patch with the last one.

>
> thanks for applying the fix!
>
> G.

