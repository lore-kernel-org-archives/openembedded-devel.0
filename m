Received: from [66.249.82.239] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IVEgT-0005Xk-Ot
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2007 00:58:17 +0200
Received: by wx-out-0506.google.com with SMTP id h27so17431wxd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2007 15:55:12 -0700 (PDT)
Received: by 10.90.88.13 with SMTP id l13mr13915851agb.1189551312322;
	Tue, 11 Sep 2007 15:55:12 -0700 (PDT)
Received: by 10.90.50.8 with HTTP; Tue, 11 Sep 2007 15:55:12 -0700 (PDT)
Message-ID: <c384c5ea0709111555p25aa8680v3c59a1742b5e841b@mail.gmail.com>
Date: Wed, 12 Sep 2007 00:55:12 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46E71524.4CAFCDBC@vollmann.ch>
MIME-Version: 1.0
References: <200709111318.52432.openembedded@haerwu.biz>
	<c384c5ea0709111037o723dda57x171c148a0f93a91a@mail.gmail.com>
	<1189545452.6163.65.camel@localhost.localdomain>
	<46E71524.4CAFCDBC@vollmann.ch>
Subject: Re: Task-base is big :(
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2007 22:58:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On 9/12/07, Detlef Vollmann <dv@vollmann.ch> wrote:
> Richard Purdie wrote:
> > Is this overlay public? Even if we can't use it directly a summary of
> > what you find unacceptable of the current approach in OE would be useful
> > to see.
> I don't have a full overlay, but here's an example:
> $ cat python-my_2.5.1.bb

> The difference to the original python .bb is the removing of
>  DEPEND: tk
>   This would build a whole X11 system, and I definitely don't want that.
>

Same here, but I guess we are using OE for similar purposes. Using
OpenEmbedded for embedded applications you build a kernel, need a
*few* packages (say 10) and some custom stuff (say 20 packages).

Removing stuff like X or XML dependencies from the bitbake of those
handful of packages allows me to build reasonably quick and especially
the build does not break when any of the redundant packages breaks.

I plan to bring a OE monotone and package mirror and the overlay
online soon. I also have spare hours on a build server that could be
used to build public targets, I would like to dedicate this to
regression testing.

Regards,
-- 
Leon


