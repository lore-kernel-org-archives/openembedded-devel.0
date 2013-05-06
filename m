Received: from mail-ob0-f171.google.com ([209.85.214.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nicolas.dechesne@linaro.org>) id 1UZGvh-0003WD-Mv
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 May 2013 10:37:57 +0200
Received: by mail-ob0-f171.google.com with SMTP id v19so2870190obq.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2013 01:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=n/B1KjgPN+KRwAWR/IfAgKkBXex2Eq94sHXi0E8/C/Q=;
	b=FFvU9A9cG0vZZsoSRDp87Gl/G5fIF2WnHibuz8SS7gXtUWqCMYrnJYOBmhlFCNslcE
	YaSzrtLjPShAVUyTF8/FMg2n33GESLOV/rUSwGxvXeBpxCh3chBeSLW/FLWUkkrzv0e2
	cJYJggvKpBBHOY7QnNuPsGs6LURl1Vgbi8EMyuQlm6n5VscNFqqK3G31396yrZ6RDCI0
	v0fJozczEQCl5lIjkEwdaUE7fZpEm7E6ZSgocPxpGrJUtQ8Wb8TKjfJPHES7YU/Xz2lU
	nSQ4ps9a985dKpvTB487+FY/GVVJVVAafZWE27xjHcNdeTFF6JW0NXerl9muZtEw+fg2
	W2WA==
X-Received: by 10.182.125.164 with SMTP id mr4mr926987obb.94.1367828393812;
	Mon, 06 May 2013 01:19:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.35.193 with HTTP; Mon, 6 May 2013 01:19:33 -0700 (PDT)
In-Reply-To: <5183D490.8050804@balister.org>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<576F47F5-73BA-4369-9A2E-666939097E0A@dominion.thruhere.net>
	<CAP71WjwFFivLQ1NaMtudjCZyv1D_Xtodf5utigWPACAg=OA5dw@mail.gmail.com>
	<2863767.6XU4RXlosl@helios> <20130503150917.GB3187@jama>
	<5183D490.8050804@balister.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 6 May 2013 10:19:33 +0200
Message-ID: <CAP71Wjz5Q9-+X0jmdC1zeS98s8Net64zpgwNEBhJkDqdW2MP4A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmzYQ+Y9IlooLAzMC++78GCn6/Qi5/b1ATjZN1WbPjATNclcZOcA8SI8fa7QHFd0cDdarxQ
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] smartmontools: import from OE classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2013 08:37:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 3, 2013 at 5:15 PM, Philip Balister <philip@balister.org> wrote:

> > I don't have strong opinion about keeping/loosing .inc files, but
> > I've removed couple of .inc files when importing stuff from OE-Classic
> > in cases where .inc is relatively short (like in smartmontools).
> >
> > I would keep .inc when it's reused in different recipes or really
> > long/complicated (like mesa.inc).
> >
> > We also have policy that there is only one version per recipe if
> > possible.
>
> I agree with Martin. I've dropped some .inc files for recipes I worry
> about also.
>

ok ,thanks for all the inputs. I will rework the recipe, and remove the
.inc as more people seem to be willing it this way.

also, i realized that there is newer upstream version of smartmontools, so
i will upgrade the recipe to the most recent one too.

