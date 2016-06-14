Return-Path: <henry@kittyhawk.aero>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3226D602D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 18:29:48 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id z186so145010081ywd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 11:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kittyhawk-aero.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=FCeczKDv15A5rw94Tf9Mq9Gu73my5CRwsO2le/mgdf0=;
	b=sD7U7+tqj0HhiH4qQ499w7MNarNlB8Inxra/CVHu028NkAs0hYxpooaZVXdTPSmTRB
	CNrCZqzTd7Wxs4W81DOtgjG8CXMfmE7okB16q9ZK6I+QQ5aMbsDQrK1vb4A9MXgLVR/R
	HRWaFcGI8x/H+fFOSG4OU5TRQXVzaSrORy4mdn4C81ncTeqUNsZVwVyL2iMrX0hKB6Ml
	npc7ljqfwzu3LR2RTcHmb8/TEHNcSQawPVb21EDrKHyjkfGYHGOOogijkYh6zR1q85XV
	K8hNAd2Gc5vOz1Ziiji0+dZSC++2qS6YbFyx0mtWNjqVr2hGrFvzo/za6Kks7TyHVUpd
	q5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=FCeczKDv15A5rw94Tf9Mq9Gu73my5CRwsO2le/mgdf0=;
	b=As5hqaKJ/YjyLzWJVasTCmBzU15/05MCcyfox98O8XVhs5fb8Q6wqhIWEYvwTAY/v7
	DtX+d8wRBuN7sQ7Jdrl+xeuVTmTZBOcRtBfcbFLGyPHZMcgBAyyWZfPZRtV9AKuV8O6Q
	Q5eYiD6ADGGWSULPWzurx8t+lykxEnDDKcc7heKpRqtMFOWnFiYhmo8a1BwrpeL/In3j
	HuxpQzIciOYHg1nHjaKgET4Rl+/NbTR0g6imonqjMqxJJ70pmR77FlGHg8kk5o90pDPL
	371Ni0TT1+kF1AcBQLPYidz6MLLwaI87ZKWLi+//0bDf1Tb1SVZVlMkZQMG56hC/t9Us
	KNKA==
X-Gm-Message-State: ALyK8tKFaA1SiMd4tG8f6KprodMwHIvflJ2q9vGFC4THMiU0z+I2DZl+LfHe80bqxQA2CpOJT9LkF8BxeHXqViDJ
X-Received: by 10.13.207.131 with SMTP id r125mr2766592ywd.246.1465928988951; 
	Tue, 14 Jun 2016 11:29:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.236.18 with HTTP; Tue, 14 Jun 2016 11:29:48 -0700 (PDT)
In-Reply-To: <njm3ur$ri4$1@ger.gmane.org>
References: <1465499198-340-1-git-send-email-henry@pericynthion.org>
	<njm3ur$ri4$1@ger.gmane.org>
From: Henry Hallam <henry@kittyhawk.aero>
Date: Tue, 14 Jun 2016 11:29:48 -0700
Message-ID: <CABvT5oWcANrJiXp_yX__8Bj47iBTA_xQHw1s2iANUj06NT-d5g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] chrony: Versatile implementation of NTP
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
X-List-Received-Date: Tue, 14 Jun 2016 18:29:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 13, 2016 at 4:03 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> That file hardcodes /etc, /var, etc
> ...
> While the recipe is well behaved and uses ${sysconfdir} and friends. You'll
> likely need to add a sed -i -e s:/var:${localstatedir}:g -e
> s:/etc/:${sysconfdir}:g -e .... -e..... to do_install to fix that up.

Thanks Koen, I will put out a V2 patch shortly that fixes those paths
as well as the ones in the SysVinit and systemd scripts.  I'm a little
surprised there isn't a more general way to do this since it must come
up a lot.

Henry

