Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTrwA-0004Oy-3E
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2012 11:23:46 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so1492281pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Nov 2012 03:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=T3NXaodkJyg5KqtDdv+uVPKB1yyI1KbYW2GUhI7BftU=;
	b=t4VVIR46kHoX0/WDuF1oGkno0HWnBGcCmZQ+4fTBoZfZ7SqOZvk6eXgDPVsZr2NiI4
	Hci1dbNqmX6WMTzmhzzRwID57rgH4q1U8YqqGz3NmofeWmHWai30RMdvN2i7mVEgt8np
	iya+lwxle+j95QkaSEO2avJ7jepHVJ6DNUXBcrJeTy+iZPjZom8RbYbpx6bxsjjM5rTb
	OdLhp8/h70R8eYwrlz69n83AmyDvIvvLrCM92Xi26tshtHpbELi8IHhxOLHYZMXi3wi2
	7xTG4OP1wnleXjZu0jxg4WR3psMmvz1JLg7TmL5VUeqtwsXpmFsplYtWb2b8aW5ISTA7
	eFLg==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr12828636pbc.33.1351764607460;
	Thu, 01 Nov 2012 03:10:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Thu, 1 Nov 2012 03:10:07 -0700 (PDT)
In-Reply-To: <CAJTo0LYVC11crUCixSMz8tGrFuGXkoFG3Tsd1dHh+74ToTNMeQ@mail.gmail.com>
References: <CAJTo0LYm7bwU0fNYcD8wQ3unJm_ShoW-ej5tZ3FeeogEztJGnQ@mail.gmail.com>
	<508AA6D5.1030009@linaro.org>
	<CAJTo0LYVC11crUCixSMz8tGrFuGXkoFG3Tsd1dHh+74ToTNMeQ@mail.gmail.com>
Date: Thu, 1 Nov 2012 08:10:07 -0200
X-Google-Sender-Auth: 39bpIiIBKTGczfrC_TlclZ2IDbg
Message-ID: <CAP9ODKq=cP96wFR0sZ2ZX+gCAocXkqagPaVufVLEWBrFcPOqMw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Danny stable release branch
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
X-List-Received-Date: Thu, 01 Nov 2012 10:23:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 31, 2012 at 1:28 PM, Burton, Ross <ross.burton@intel.com> wrote:

> Hi Marcin,
>
> On 26 October 2012 16:05, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
> > Are there chances that AArch64 related changes which are present in
> > master can get into danny? Everything other then gnu-config should be
> > safe and not affect other targets:
>
> Adding a new architecture doesn't seem like a simple bug fix or
> security problem, so I'm inclined to say no to this.
>

I second your point of view; besides many fixes or improvements will
involve packaging new recipe versions or adding patches. Since ARMv8 is not
yet public avaiable in SoCs the work could be done in master and don't risk
breaking Danny.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

