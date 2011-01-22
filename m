Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PgRNN-0007dI-2v
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 01:30:45 +0100
Received: by gxk20 with SMTP id 20so786150gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 16:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Rzvi5ap/P3Y3+3MK0tRHLI0O7ilYSTYDfN6kSA1XJgg=;
	b=VjDNFj5ymEsc61HyvvOmWbeREq0iWUpf/Px1XqIlXtyL4oKlVdwESdzZK4aqIHksB/
	/L5p7Un5lcAXWSHSyYbLLqIMhPoqUUGYjDiFgsKiXKuD3EKBRDLGijMU3/np8QsNe1qp
	ZPeQh+1WHqUkHHhSn4HFnjaXq7gvMcjzoo6XU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=Wwy8pP3jF5jupOC8iBlgSotuy6xbGk/NyvWdsLL1h9gn14iKDqnNWJ/7+B+BLpwydA
	Bn+xktEmtO2f+CatEqsI5PCddRN0OZXbnS55jEXbG79G8thNSOgd7IlXw6Tz122geKHa
	2PM15ZX/0KYitmjL0ma8jt+lJa7TMNc1XqZu8=
Received: by 10.91.163.27 with SMTP id q27mr1597396ago.139.1295656201284; Fri,
	21 Jan 2011 16:30:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Fri, 21 Jan 2011 16:29:41 -0800 (PST)
In-Reply-To: <4D39988B.5020204@balister.org>
References: <20110120181233.GA1789@lit.local.igalia.com>
	<ihbp5c$4ov$1@dough.gmane.org>
	<AANLkTimBieqoDRmVfoYmTVpehrmtCk-N=M8bKgRWumN0@mail.gmail.com>
	<4D39988B.5020204@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Jan 2011 16:29:41 -0800
Message-ID: <AANLkTins2-KeY8aUkoKHW+H3t0xzNeW+H2a5qfwVTY0U@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: board@openembedded.org
Subject: Re: problems compiling glibc_2.9-r37.4 under Angstrom
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
X-List-Received-Date: Sat, 22 Jan 2011 00:30:45 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 21, 2011 at 6:30 AM, Philip Balister <philip@balister.org> wrote:
> I think these remarks come from discussion over the pandaboard u-boot
> situation? If so, let's consider these options:
>
> 1) Remove the pandaboard machine from OE since it does not build for some
> people.
>

well its a step backwards

> 2) Force Koen to update the recipe to something that builds.
>

he is master of his own time so its not right to force anybody its all
volunteer work and we should leverage each others work.

> 3) Do nothing.

Doesnt take us anywhere.

>
> No one is happy with the set of options, but the reality is some distros use
> source mirrors and do not have issues. Distros that do not use source
> mirrors are going to have problems with this and other recipes, so the onus
> is on them to resolve these issues. Resolving this is issue does not revolve
> around updating the recipe and pushing it un tested for the Panda, since
> this is not something that can be tested on another set of hardware.
>
> So until someone who has a panda and the time and patience to work with
> u-boot, minimal will not work for panda. This is because the minimal distro
> is supposed to not use advanced OE features such as source mirrors and
> PREFERRED_VERSION pinning. Because of these decisions, it is entirely
> possible that minimal will not build for all combination by design.
>

I would propose that we use angstrom-mirrors in minimal distro as a
backup to fetch
sources from.
something like this in minimal.conf would do it

SOURCE_MIRROR_URL +=
"http://www.angstrom-distribution.org/unstable/sources/"
INHERIT += "own-mirrors"

if we do not want to inherit angstrom-mirrors class directly.
>


