Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1QpMXx-0001B4-M8
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 17:42:49 +0200
Received: by gwb11 with SMTP id 11so701132gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2011 08:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=7LsM5vnybOhpJYCMspBhDGGaJ2s0Akpq1RLB3vpG4Yg=;
	b=FYpQyPu6kOuiZrNZRChsxXJG+HNpdCsbHfo4BQlAp/snce9D6YfFe0MwtUFyMgsoBd
	jnQRMR2c8eHNITa2HXtTZOz6nIw+BVqbC6YKdVrPleJCf4uzJkOlU6QmFH/sjmXkAJ+S
	1ZOtDx05VUxaiP8NX9tJlJgXCLkHD2RpLqMdU=
MIME-Version: 1.0
Received: by 10.236.184.194 with SMTP id s42mr3085627yhm.447.1312558703003;
	Fri, 05 Aug 2011 08:38:23 -0700 (PDT)
Received: by 10.236.110.3 with HTTP; Fri, 5 Aug 2011 08:38:22 -0700 (PDT)
In-Reply-To: <20110805151726.GB15632@rhein.zuhause.netz>
References: <CAFu+nvEwf_hPbB0a21qJFWAHZqdCkb3MPaKaZcLFgD+xc7cGVw@mail.gmail.com>
	<4E15F6DD.2020308@mentor.com> <1312553761.14079.22.camel@jjg-linux>
	<CAFu+nvE3v+VswNB-3ZwF3dFMa42wgeSv6GMBJ4C=bYNpWKKFmw@mail.gmail.com>
	<20110805151726.GB15632@rhein.zuhause.netz>
Date: Fri, 5 Aug 2011 11:38:22 -0400
Message-ID: <CAFu+nvEwGYd-t6n04yn41wd50+5zPoEu=5WVYxOmaWLDdyKdEQ@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: classpath in 2011.03-maintenance
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
X-List-Received-Date: Fri, 05 Aug 2011 15:42:49 -0000
Content-Type: text/plain; charset=UTF-8

I posted a patch that makes the wrapper script return the error code if it
fails after 5 retries.  it is on patchwork.
http://patches.openembedded.org/patch/7249/

I don't know if anyone has reviewed it, but it worked for me.


On Fri, Aug 5, 2011 at 11:17 AM, Henning Heinold
<heinold@inf.fu-berlin.de>wrote:

> Hi,
>
> we made some hacks bescause for some java packages javac fails at random
> and
> we just try to recompile it for some rounds and have a higher chance to
> get it done. To admit the ecj script is now diffrent from the one I wrote
> original,
> maybee Stefan Schmidt made some more tweaks.
>
> As side note we did not test classpath compiling for target architecture,
> we only made sure classpath-native works, so we can compile openjdk
> for the target.
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

