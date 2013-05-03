Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nicolas.dechesne@linaro.org>) id 1UYHHl-0004n6-2V
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 16:48:33 +0200
Received: by mail-oa0-f46.google.com with SMTP id j6so1686308oag.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 07:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=v0hxGaq0vd+1y4FFm/CdsPt3w0ubprXDnvq5aAfk4So=;
	b=Zn6xCEjtWuYqOMXR87FiwqC6tvWhnCKvo4VwpntAiXsWy1wZdjEf052WMdL5JYfulH
	ZJ7sbnPHkOc++aQR6Sj5pzF7fA3M/gPY1evSeuCzuFM7Rgfzk0dYWSjXXE7ni72SAw2o
	1SC2GpFqh+mI7G3vPDY5cadR8B28BPTSwQBhk1fGTPr9agajiV/QQcyF94ncMKUW/5on
	gz/4rVtPo7TzCBpd2imizVUN1HZS8hP0E39rBJf7Ppa2SJ8r9EWAzjHeMrQhhLQ+e5lU
	Of0ueH6UCa8STZimvMBCHbAY7Uth5caG4OmSTrGQHR5hAQntTj/4Iij8LvN4dXIeypS8
	oO3g==
X-Received: by 10.60.34.167 with SMTP id a7mr3087881oej.20.1367591437348; Fri,
	03 May 2013 07:30:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.35.193 with HTTP; Fri, 3 May 2013 07:30:17 -0700 (PDT)
In-Reply-To: <576F47F5-73BA-4369-9A2E-666939097E0A@dominion.thruhere.net>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<68356141.McDxtR3Bre@helios> <517BA9C6.6090707@balister.org>
	<1756231.MGNYtfpC2x@helios>
	<576F47F5-73BA-4369-9A2E-666939097E0A@dominion.thruhere.net>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 3 May 2013 16:30:17 +0200
Message-ID: <CAP71WjwFFivLQ1NaMtudjCZyv1D_Xtodf5utigWPACAg=OA5dw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnUFIh7ZexyM+pfhDK91mbNUupjCNk215RqC92s8LYADwJXgrTNK0VkOEVl1oxp7X9FJSLa
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Fri, 03 May 2013 14:48:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 3, 2013 at 4:10 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> > I agree we should try to keep only one version of each recipe in software
> > layers, however I figure it makes it easier for people to carry their own
> > versions of recipes in distro layers (particularly older, which may be
> > required in certain circumstances) if we do keep inc files where they
> already
> > exist.
>
> Can people raise their hand if they want to have a different version of
> smartmontools in their layer?


i think it would be nice to have a policy for that. i am going to send a
couple of recipes for new components, and it would be good to know what's
the agreed 'policy' for .inc file. in fact, it's not even clear to me why
have .inc file is easier to carry different version in distro layers. well
it's just a 'large' recipe to carry over..

nicolas

