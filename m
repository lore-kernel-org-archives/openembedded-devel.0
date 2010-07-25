Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Od3ts-0000Kt-3c
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 18:18:06 +0200
Received: by wyb38 with SMTP id 38so1672751wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 09:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:received
	:in-reply-to:references:date:message-id:subject:from:to:cc
	:content-type; bh=W67CLkzlaVCe5WeweyZKws5hJRbB0h4oxkJzV8ROqyQ=;
	b=ZM1JMcPljHmrt2gpJa2LOqnyrtFuw+GxUcQ4/vShBjL4wXpyNieK0wpudKuFm7oIfL
	l0/0ZTJIIi5mgtO9Sm9xaXzS+jsQHETCHUStlPxfU91rGr031yNDEZK/Xb+KLjjAjH8L
	UMXEF5zN+AqUh8NtuwzL1dD1HX9RBoQQC6PsU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=nSTMwrY+fTgyVpxlgg9H3wm4d2K+iZl7LwOOkoYxG3IxEexm328zTFvoItvSEICznJ
	xEEHnOq3NTFvOPnmQLUy79P90udO4CUyafA8nWvZ9ytVF4rwRqs11OtL9K8nN6mR43ZK
	P5QRrg/y05/2y880A7fYrp/gPs2v198J+zP8w=
MIME-Version: 1.0
Received: by 10.227.133.66 with SMTP id e2mr6142939wbt.132.1280074664318; Sun, 
	25 Jul 2010 09:17:44 -0700 (PDT)
Received: by 10.227.132.207 with HTTP; Sun, 25 Jul 2010 09:17:43 -0700 (PDT)
Received: by 10.227.132.207 with HTTP; Sun, 25 Jul 2010 09:17:43 -0700 (PDT)
In-Reply-To: <1280009695.11135.21.camel@utx.lan>
References: <E1OcfGN-0007DB-9C@melo.openembedded.org>
	<AANLkTik35dsZ6rMfu8KJNo7ZoKd6071ELAhYmzr6T7Y+@mail.gmail.com>
	<1280009695.11135.21.camel@utx.lan>
Date: Sun, 25 Jul 2010 18:17:43 +0200
Message-ID: <AANLkTinYV5jJRxJVqU83HNe0z2ywBpVBiJiNZVCxXYca@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-commits] Stanislav Brabec : akita.conf, spitz.conf: Set PREFERRED_PROVIDER for udev-compat to udev-compat141.
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
X-List-Received-Date: Sun, 25 Jul 2010 16:18:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Just curious.. but wouldn't the logical scheme be that linux-2.6.26 sets the
preferred udev version?
cheers,

On 25 Jul 2010 00:17, "Stanislav Brabec" <utx@penguin.cz> wrote:

Andrea Adami wrote:
> Stanislav,
>
> thx for your work.
You are welcome. I wanted to boot my Zaurus Terrier even after opkg
upgrade. And the latest vanilla is still one step from going to the
production quality.


> Please note that other machines (c7x0 and poodle) are needing the same
> preference, thus I propo...
Feel free to do it for more machines or move this preference to the
defaults. The setting of preference has no effect until you add proper
lines to udev recipes.

I don't know, whether all Zaurii (and in general all old kernels) can
live with udev-compat141. I only confirmed that udev-141 works with
2.6.26 and udev-151 does not work with 2.6.26 (needs signalfd, CLOEXEC
and inotify_init1).

udev-compat141 recipe contains short manual for other users that may
need it.

Cloning udev-compat141 to udev-compat124 should work for machines that
would not boot even with udev-141.

Well, also libudev does not work completely with 2.6.26. Hopefully,
udev_monitor_new_from_netlink() is the only function that does work, and
this functions is needed only by udevd. But we run udevd-compat, which
is statically linked with the old version of the library.

Note: I committed sanity_check fixes as a separate patch, so people who
tested patches from the list can easily review these changes. (Well,
those people may want to force rebuild, as they will need to rebuild the
same PR.)

I guess that Koen can now remove udev-static.

--

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



_______________________________________________
Openembedded-devel mailing list
Openembedded-devel...

