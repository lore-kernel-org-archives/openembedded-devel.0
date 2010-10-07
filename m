Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P3vds-0000hV-12
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 20:56:38 +0200
Received: by wyf23 with SMTP id 23so121872wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 11:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=WgGl017B+N2cjW/lVtGVN0YjsgGVUmW6/4b1rAr0iM8=;
	b=mM4hJyTjCm2Zy/29IjPRiiNzhr+4+MXEkS9f9pFGFqxpH4zKybnxzYIjEGVdzIWzlk
	DHEA/KUzx0VQ+Czm7f3WD4c/PJ8wk+NZwo4YueYtcH39LWDPsj57OY0/LFYafNIlkh5W
	LA9F0Mteb75hUGZCGHlgVw8J/iFPYBEL8QlGE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=OQaMnFWWLRdpi29NHrjeM+GeaGZ6XCTKaIbXtxD01aPp4iWdS5iUlXe+mIjJczC7eB
	gHq5C4o1/pP8RzdBlaHHr97/7hP9axvUTvx87w7zwEShNLK3hJc8zOwUYYcliisy7FIF
	Wqp/WRSLwfxiV9YVbzObm7XTy6k2IIphJ+0l4=
Received: by 10.216.65.204 with SMTP id f54mr2739591wed.3.1286477774292; Thu,
	07 Oct 2010 11:56:14 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Thu, 7 Oct 2010 11:55:54 -0700 (PDT)
In-Reply-To: <AANLkTimeMWsTvhkZjP+qjVJW7ynM69XcF_0WbS2VdenR@mail.gmail.com>
References: <AANLkTimeMWsTvhkZjP+qjVJW7ynM69XcF_0WbS2VdenR@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 7 Oct 2010 11:55:54 -0700
X-Google-Sender-Auth: duWAsuajqsg_abWucKjRW7wcqzA
Message-ID: <AANLkTimE8tt4k6nfRSbDJwZDEkecc1sfJQyB9LKtehKQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: bitbake COMPATIBLE_MACHINE stack backtrace
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
X-List-Received-Date: Thu, 07 Oct 2010 18:56:38 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 7, 2010 at 11:36 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Hi,
>
> If I run bitbake (git head of about a week ago) with a recipe that has
> COMPATIBLE_MACHINE set and that is not for my machine, I get a bitbake
> tracedump;
>

Looking into it, thanks for the details.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

