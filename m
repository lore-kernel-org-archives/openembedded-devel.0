Return-Path: <twoerner@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0105B748CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 15:01:23 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id t11-v6so15275428wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 08:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zMAFkB/WbaGl2zgty4oJT7teSZ4SiKfNlrNzkuhLlrM=;
	b=iIiEvF1rTQ0yT2QdRzQOh5OrhgjHf/dzIsc0Z8cq5syahOwawbF+1edVPQiDhO8ycQ
	Sq+nH87IRGykghc/krgHKeAIvbD82EXubRTcPUX5zm50zEADMZ0y4i2VZFG7CX7J3/J7
	kKoIVicyFAyMLudU9qSAaeTuCBsrrhBP45HXeDgCfUz6nVbIzXciGdIHBEN4Wlf9zYch
	4pOEAgzcmWJVH7Ubc3BQsBbMFn58khVOqLpzWqdTuIUWM3e2PZcXAC9/SfM5kVmUY8sW
	EyvckdXp1hKTNQpL9zOOYZirJ6I4KjLV5+k4wONJ3ncACQIJGxqXCNDBO50xhU/ZeIaJ
	5Uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zMAFkB/WbaGl2zgty4oJT7teSZ4SiKfNlrNzkuhLlrM=;
	b=gBq8Y1HqbN1bab16ntJeK9nfbFwpZQ+TWhAkhKRkbXdKWOlGZ95oOAmMtM+cbBEI/s
	EOEAKgYWHIw8Ggv0+jWmXcL0frTl4KUNBRYn8MiYXVr05CjtOPQZ8f5DzTOeRjDaWRSN
	T3wWwSKyHObwYU0NlMKoS1esk4c7WTySMxjllkKmjdT2GXbwBv4IzdPDXy9geRb0CsdE
	VOw92zDXz/K3YEjLenMpw2nlNdKLE6fFW3zjYui5exBf7FrtEGcgLVaPVga6joj27dEM
	MAVZ6AV/1txFjCAB7cyx9/r4lcvs842l4PJx/Q237eGBFJcmPfL0lOelmV2PxDaSt+9f
	A3ug==
X-Gm-Message-State: ALKqPwcs5nDfm2/Z0nq+pYQ5Edz6aJe2oqT8Xjy0eyfAYdBzGuv/0qlj
	TKXZcAhjIddFNo3u8xp3N8HZm5nCmHMG7zAlTUs=
X-Google-Smtp-Source: ADUXVKL6owmfr77reYOqmjvDfrpbZ73xTqcYggN+igadkZMQJjPChlcJTgKI+u7nInH7SVnze5nKbQGgUdXmWJKzutI=
X-Received: by 2002:a2e:8350:: with SMTP id
	l16-v6mr2015618ljh.28.1527260484598; 
	Fri, 25 May 2018 08:01:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb07:0:0:0:0:0 with HTTP; Fri, 25 May 2018 08:01:23
	-0700 (PDT)
In-Reply-To: <CAFuZ8QBXvZ57MKzbwEkQ40mnYXMGLi4PaTM1TR=SKqJarQwuVQ@mail.gmail.com>
References: <CAFuZ8QBXvZ57MKzbwEkQ40mnYXMGLi4PaTM1TR=SKqJarQwuVQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 25 May 2018 11:01:23 -0400
Message-ID: <CAHUNapQmwC_7vdAt_LRVLZ4kq32XUyqeHnfQrH0ZNZzh=S9FHQ@mail.gmail.com>
To: Dylan Bartlett <dylan.bartlett@metixmedical.co.uk>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Do_install_append() with qmake
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
X-List-Received-Date: Fri, 25 May 2018 15:01:24 -0000
Content-Type: text/plain; charset="UTF-8"

Maybe IMAGE_POSTPROCESS_COMMAND might help?
https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-IMAGE_POSTPROCESS_COMMAND

There's an example of using it in:
https://github.com/resin-os/meta-resin/blob/master/meta-resin-common/recipes-core/images/resin-image.bb

