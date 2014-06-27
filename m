Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id CFF4960559
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 13:09:06 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 9so2841657ykp.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 06:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=8raLahaybAUtTIvRKBbSS8TguvUGZ7NHDj3ULa0gSbI=;
	b=MAsjwdyfqPOEEXif7moPNWRzgyK5OdUfVhe1IeqxWZOMYNvBajRRj7w6Vqn8CnrFz6
	F9t63ukkOhO5j6UiCR+wOU+wBuN6Z39CaKcXia+Sf9H6XffwhtC1jEQ9fDjmSj8Onf7e
	fYp3qwOK4TkNRR9DYjD/yPMg/1FFF2G5Y8QxoFQQIaB15csuAxMcKkg/gfdO+UDuQPp4
	zOJ/RVsKjuzglSVZqU9mZhgkzR+cLmqioCpNCnTHVS49BVxboYvVl45GlA7tgX/PsCPC
	4oHPnbEiRckSELJmVjIwpJ4LjbVQ9eOBJvJKMIHFd4ggTa9SE6O13ea2KU0f2s8BFpjL
	ZLww==
MIME-Version: 1.0
X-Received: by 10.236.108.176 with SMTP id q36mr31194648yhg.87.1403874547569; 
	Fri, 27 Jun 2014 06:09:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.233.65 with HTTP; Fri, 27 Jun 2014 06:09:07 -0700 (PDT)
In-Reply-To: <lojdi3$8mu$1@ger.gmane.org>
References: <Lauren.Post@freescale.com>
	<1403793465-6376-1-git-send-email-lauren.post@freescale.com>
	<lojdi3$8mu$1@ger.gmane.org>
Date: Fri, 27 Jun 2014 10:09:07 -0300
X-Google-Sender-Auth: A8Acr5wt9VXamhd_M0pJfhrgiz8
Message-ID: <CAP9ODKrjhhBwm2Uuwg9j5RQ9e7NdX7TvOTrCG7mjWkWjA77Hiw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] cpuburn-neon: Upgrade to 2014066 version to fix build break
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jun 2014 13:09:15 -0000
Content-Type: text/plain; charset=UTF-8

Hello Koen,

On Fri, Jun 27, 2014 at 6:29 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Lauren Post schreef op 26-06-14 16:37:
>> Replace SRC_URI with new location, md5sum and new name since previous
>> download will not work.  Without this fix cpuburn-neon has a broken
>> build.
>
> Why not make the recipe clone the git repo?

I pondered about this when looking at the issue with Lauren. The
recipe was like this before and this build break is causing issues for
several people using meta-fsl-demos as we include it in our test
images.

The long term solution should be to rework it (also because it has
extra tests and those are not being included) but I think this fix is
urgent and known to work for now.

This fix needs to be backported to old branches as well as current
recipe fails to fetch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

