Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thoughtmonster@gmail.com>) id 1PBr5N-0001VT-Dy
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 17:41:46 +0200
Received: by wwb39 with SMTP id 39so3205380wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 08:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=r+44svZPXLFa2iwdZQxfg/88L5w6nWL03oYUJGzKIxU=;
	b=b3pU/b4ZLzcE0mejVKA9LO7DS7VfNRdDYH6J50sx1knaNz+kqIL0jA4N2N/VwmLhYS
	sqn0nHQD0dPI3e5s6I6Hy3+sSBPi+lB2BELplbPoSwRLFbnFhPIw+eC4qEUo4cXYi3Z9
	EOnv/Ir6F/KfB5nel4IuOyfECT5MY7hFKxK4I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=n7JbhK4sdPq7ezZ8VfXKunkEe2oyJxiHiIHgOBnMyaeNXqhiejGLSrC1ho533AXW7B
	LLSik+LVzPPPaH9+aLwbBt0MeEzUjCvO0e4u6xBlSk3YQgkQarvE1WzWpui85JsJvmJC
	uxdJ31kcOXZsx72CIOMn47X8vl/wwTdA9qpAc=
MIME-Version: 1.0
Received: by 10.216.87.84 with SMTP id x62mr1786286wee.48.1288366856796; Fri,
	29 Oct 2010 08:40:56 -0700 (PDT)
Received: by 10.216.155.141 with HTTP; Fri, 29 Oct 2010 08:40:56 -0700 (PDT)
In-Reply-To: <20101029145536.GA3206@jama>
References: <1288361334-17427-1-git-send-email-thoughtmonster@gmail.com>
	<20101029145536.GA3206@jama>
Date: Fri, 29 Oct 2010 18:40:56 +0300
Message-ID: <AANLkTi=HBBHMH9BZctTboQkagbD_zsLYE7N0Vkg4t5nP@mail.gmail.com>
From: Alex Ferguson <thoughtmonster@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: thoughtmonster@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] classes: Modify rootfs_ipk.bbclass for -force-overwrite.
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
X-List-Received-Date: Fri, 29 Oct 2010 15:41:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

First of all, thank you for your quick reply.

So,

On Fri, Oct 29, 2010 at 5:55 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> Why not modify the original files in corresponding recipes with distro
> override?
>

I understand this would be the best solution all around, but in most cases
this is impractical, as it is the case with icon themes. These
customizations change from
time to time and having to modify several packages (which will have to go
upstream),
is something I'd like to avoid.


> Problem with this kind of package overwritting other packages is when
> original package is upgraded (PR bump or even just DISTRO_PR) it forces
> user to also use -force-overwrite and then he will loose those
> customizations.
>
> I don't have problem with it as long as it's conditional, but I would be
> very carefull with using it. IMHO this is good only if you're building
> images which are not supposed to be upgraded by user with ie opkg on target<Martin.Jansa@gmail.com>
>

Our images are generally not upgraded but a simple workaround would be
pushing
the PR for jlime-extras along with other packages which might conflict,
although you
are correct as far as the user having to do -force-overwrite himself.

Thinking about it, it seems like a workaround, one which might cause some
issues down the road. I have nothing else for now and it certainly doesn't
hurt having the option there. I might just have to think of something better
for the future.

Thank you,

Alex Ferguson.

