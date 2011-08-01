Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Qno2H-0008Jy-27
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 10:39:41 +0200
Received: by yib18 with SMTP id 18so3433425yib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Aug 2011 01:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=x/ArUkCasH6jIKLwcL0ZN+RfGjzvGl4fOj7eGaic8T4=;
	b=WqgVtpvJo0M5UhVlknYknAIDo2fhFYqdkbv9T3gEztiN6ecCNuka9vIv6FIdULEYD/
	8+GGkCGuDlIUns5OBXfXnhMSYZfnioHZPKTk3BtPSr8RSRcIYP3YDa4ARer/giIWqOrj
	LCfKG4K8B7p5C0qu6+7nfnVJy91Ofix17vDfo=
MIME-Version: 1.0
Received: by 10.90.249.13 with SMTP id w13mr2943461agh.122.1312187720915; Mon,
	01 Aug 2011 01:35:20 -0700 (PDT)
Received: by 10.91.94.13 with HTTP; Mon, 1 Aug 2011 01:35:20 -0700 (PDT)
In-Reply-To: <4E364EB1.8050800@dresearch-fe.de>
References: <4E364EB1.8050800@dresearch-fe.de>
Date: Mon, 1 Aug 2011 10:35:20 +0200
Message-ID: <CACW_hTaqobWjz4WWneZ1JsfPTeGu8iu=FeinU62sum4-1rkvfw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: unnecessary dependencies?
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
X-List-Received-Date: Mon, 01 Aug 2011 08:39:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/8/1 Steffen Sledz <sledz@dresearch-fe.de>

> We are working on an application which requires libgssdp.
>
> libgssdp requires libsoup, libsoup inherits gnome, gnome inherits
> gtk-icon-cache, gtk-icon-cache rdepends hicolor-icon-theme. So this icon
> theme (probably a lot more gnome stuff) unnecessarily allocates place in our
> image (we do not have a GUI). :(
>
> Are these deps really necessary?
>
>
I know this does not answer your question, but if you do not have a GUI
maybe libgssdp is not the best choice for your project.
You could consider another upnp library (e.g. libupnp).

And ofc a workaround could be to simply nuke all nonneeded junk at image
creation time.

Enjoy!
Frans.

