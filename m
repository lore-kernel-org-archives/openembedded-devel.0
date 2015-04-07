Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4A7C360043
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2015 13:17:38 +0000 (UTC)
Received: by iebrs15 with SMTP id rs15so45824443ieb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2015 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ClfW6gYoJwTajhfh+Sixq+2CbZhZjFaHnL/+Iip7Kqg=;
	b=YDH8Xek+SZcnJ6aRzIuZfIJdZ+XFQB69HqkvtpDyy5Wb+WffqtAXNaVGGX3NjJeUNq
	X+b767pvYO+Mr4/GPJOME6RI+ZCgj9Fd8yh/FAS+bQa0V6ygCafiKq/UzhnwwFSPjd9U
	PUqqCHYGOqPZKpe9kjomWb8BEUKd/6pzjMY/sj8MOwitSFylj7BB0pmi867SE1HOo+mb
	NSA1zuVy55Z6CAs5cR8OcotgwXhl2obszuOyFcyzABSESOsQg9AEz9s0HlS9hdyRG3GZ
	szyFVFcmjwmmAfxD4VDqsL6ZMFwpUqyivFsnSsWNbY9A3ZBWYoDXTPx6IjtT/c5bZFB2
	2JSQ==
MIME-Version: 1.0
X-Received: by 10.50.66.37 with SMTP id c5mr3518339igt.26.1428412660025; Tue,
	07 Apr 2015 06:17:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Tue, 7 Apr 2015 06:17:39 -0700 (PDT)
In-Reply-To: <CAD0=qkKX-6afKD8H+sD+MrVp3LRspmuieJC8T=R57ktcnJauxw@mail.gmail.com>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
	<CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>
	<551C4F35.7020001@gmail.com>
	<CAEHkU3Xg=NSPw2gc1rmPLy3RD68BRNK5hczmS5e6tTE9gEBk+A@mail.gmail.com>
	<551DA5BA.3050505@gmail.com>
	<CAP9ODKqazzhOMQtsdKaGhA-1pNQOHNRQ2vvp_uXDtq+gce2gqg@mail.gmail.com>
	<551E4A44.7050708@gmail.com>
	<CAP9ODKr4Xz8_OLD+DKqZ1wxx4c0Rc6bdSDwqLecFnhZa2x5kVg@mail.gmail.com>
	<CAD0=qk+2f1qORQLQzD_r8p_VaF0+mAkVu+E=yz5-zzipf7RHXQ@mail.gmail.com>
	<CAP9ODKqgAQqCxNg=fWMC6iW1Ks3HDd4c-YroMVOgJ=doTmsWLQ@mail.gmail.com>
	<CAD0=qkKX-6afKD8H+sD+MrVp3LRspmuieJC8T=R57ktcnJauxw@mail.gmail.com>
Date: Tue, 7 Apr 2015 10:17:39 -0300
X-Google-Sender-Auth: mv0wR4f5ppmZOkDxkUDyV50Pz8Y
Message-ID: <CAP9ODKq_yN=M8-+Hbjk_NHyTGQ=oVEs=tEEQwkGWghR_LBHLfA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Trying to update openjdk-7 to icedtea 2.5.4 and jdk75b13
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
X-List-Received-Date: Tue, 07 Apr 2015 13:17:40 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 7, 2015 at 6:41 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
> I tried some debugging with the old HotSpot, finding that the SIGSEGV
> appeared in parts of the Assembler Code which got recent patches in
> IcedTea-Repositories.
> So I updated the HotSpot-Changeset to 24.80b07 and the Bug disappeared
> for me. I've pushed my changes to my github repository.
>
> I don't know if this is acceptable for you? It's running on my arm
> target quit well at the moment.
> If you want, I could create a patchset based on the meta-java
> repository on yoctoproject.org?!

Sure. If you want, please also cook some clean up patches. Both are
very welcome additions :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

