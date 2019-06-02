Return-Path: <ticotimo@gmail.com>
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7CAFB7E41B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 19:25:41 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id m141so24041772ita.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Jun 2019 12:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YD6UuSy1rUS8ZR2lQT4y6BU0c8PIz4mUfRxaQ0R+Xa8=;
	b=EtwENyJsrupQoL4A3FK/PY/Iizoljbm4Qxx7MtRwj+IOlCOwTVMKJkz+96bjTS1QxZ
	clMbEg+gzq+vuDR9yzBAYkKhX8H/2UYOXmetz+pPhpCcZkMYFB8dwQ66YDr4Lr8jgnvp
	tlpGoqjY9VER0nlS6NGJwkfa/lTPv065rTwHsnKdDiPKBrgkivDi1O+8aJCLcjnmnNrQ
	9d4oy5mNF/dbBl9phzG551gHcJHkF1iKzPjRPx4HBtSrF/1Zm3S77JdWgqWuUMdP90KW
	7w/a+Nh6ny3DcSIkAPYbClp0M7o1gP4Okm0rTm63UBVIQa+En3cnlMhXB1UlUBf/eGnM
	DHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YD6UuSy1rUS8ZR2lQT4y6BU0c8PIz4mUfRxaQ0R+Xa8=;
	b=aUAR5z7qHe5nLNwrEiBOLTkijXwMrIsrtZK2fvBhs+LiLrbOxdv/j7ylfK7HyrP8q/
	X6exFyOhE53Ck2h1JizdqUX1ykCNn7A42aZ+FLEN4WxHZf0wJ206Q3u9FLNQ4xLH9AkJ
	dQpSDiD8xqHmsnJCyYIzm8aa9lPhsyWa+yzWob7ubiov8WwCu1v1KLYd9sq6hhS5JTka
	aHD7arXrfdX6KDhF5ilmLt8eLNlVMw0ZtHz9HDQ0KRZQjrHiQJXgNwfo1lxvBhXkcN5G
	ZAa3avfmU8bpVceB54FQnX1gziHiMxTQtR9poLctNoDJuSwlZ4Ts8v7ELEB48KIfkNmi
	Pl9A==
X-Gm-Message-State: APjAAAWf6q/lgEJzzRhH/LYecwPvcvecywVMVQ11C6ZI0LdX51Vc+K3n
	UnbSTXG9+jNxLUcyjpkiaFQv826UrJjF11zaNQI=
X-Google-Smtp-Source: APXvYqz9X0LqjQfcmHOvvEGTilk/IHw1aQwF7FyFtaYwfNq50YyOjt+c1PV2iX2Bvq91pYHEQbL4+QlQ3jC+S+4cQms=
X-Received: by 2002:a24:9ac7:: with SMTP id
	l190mr14034247ite.100.1559503537411; 
	Sun, 02 Jun 2019 12:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <5492cc4e-4318-d6d8-3b84-86fb94fd8a74@gmail.com>
In-Reply-To: <5492cc4e-4318-d6d8-3b84-86fb94fd8a74@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 2 Jun 2019 12:25:26 -0700
Message-ID: <CANx9H-A8hDNPoJRKVNtZEWATqvWOwu-Ak1DxvXZBirmqBts7Lw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-python py2 plans
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Jun 2019 19:25:41 -0000
Content-Type: text/plain; charset="UTF-8"

What Ross, Paul and I are proposing (we have discussed in YPTM/Engineering
Sync,Bug Triage meetings and in person):

1. Move existing (deprecated) meta-python to a new layer
(meta-python-classic? ;) ). I will be seeking someone else to pick up the
mantel of maintenance, as I have no intent to spend time on python2.
2. Make meta-python python3 only. This gives us a chance to merge the
python3-* and python-*.inc files, for simpler maintenance.
3. Refactor recipetool/devtool to support python3 (only).
4. Investigate using distutils "test" functionality for low-hanging fruit
ptests for python3 modules (something like the ptest-perl.bbclass). We
really need ptests.

This is also an opportunity to move meta-python into it's own repository
(not under the meta-openembedded umbrella). I have no strong opinion on
this, but it has been under discussion for a couple of years now. Without
patchtest and ptests for python recipes, maintenance is challenging (not
that this is impacted by where the layer lives). I run a Jenkins job weekly
to run AUH on "all" python recipes, not that I have had a lot of time to go
the last mile to get the patches to the mailing list (there is always hand
tweaking and manual testing which is time consuming). This task would be
simpler in a separate repository, with cleaner git log. Patchtest and
patchwork would be simpler with a dedicated mailing list. The main cons to
a new repo are that (1) other layers (e.g. meta-networking) depend on
meta-python and meta-python depends on meta-oe and (2) without improved
tools maintenance, a new repo doesn't really change anything. There has
also been discussion of functional layers, rather than a "language" layer.
Meta-python has become a bit of a mini-meta-oe in that it has recieved a
lot of drive-by contributions and is a bit of everything plus the kitchen
sink.

Ultimately, I think the TSC(s) may need to make a call on moving the repo.
A clear consensus has not been achieved to date (in a series of OEDAM/OEDEM
meetings) and so we have continued with status quo.

I would like to see all of this accomplished by the 2.9 release. Anyone
interested in helping, especially with #1, #3 and #4, please speak up.

--Tim

On Sat, Jun 1, 2019 at 10:20 AM akuster808 <akuster808@gmail.com> wrote:

> Hello,
>
> With python2 being EOL this year. Is there a plan for meta-python to
> deal with this?
>
> - Armin
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

