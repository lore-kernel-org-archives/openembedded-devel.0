Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.11870.1591798900158087756
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=VPgJ4not;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=0vpq=7x=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49hq1G1xGgz4J;
	Wed, 10 Jun 2020 16:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1591798898;
	bh=66l++KuMSokFB2LH/4ysoqup0ubdNYVwgTPzEXGtLrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VPgJ4notPzXHQDo2srSezVVxf8kzCTCyRIZ7ePAyrb1Alz2q4Z1SU31C8V9wLguBh
	 5AfPp+RA8LrvK81pRFjBwPIucf7ch95ph50MuDCD7O/x2z8bYSpBZJK/McYUF5qK9K
	 F8LKsPY2e4DHJvQTICdEJShw8o9JPZvgEHGIO15fsHDYYD9zdalXZXfSnFRc6k+OrG
	 4SMynilSqqT03dLPNx+vXM3zims53WiKNm0+kfWAksWpJJx4+/IpfjtM/k8g7lwILs
	 N0o5CU/nSjYpYOoRRncdajoEDo+0Bx3TCXCOP7TlC0NDMFEyHgcEy1zMdy03rzqZf+
	 z40Rhbdu2eXNHlBlhXTVT76GE9yVWihGCDoCsTNVgiabwTgybPHsg4tzQyKls0ODmB
	 XyAwgk2B0bh2JW6hBjhWEyEdRoaRQq90dLvEZMaE6QmJmdpoptDbpvh5pYKzvkA90P
	 aoTeHMhLThXjK05ZhBULn/UxTOw/leQjjw6Tahgah7ASu0I/qmYMwrV+1cKboykWP2
	 Xdeau82pk1pNN1G4I4XwperMWOyUD1gLU2M+pj3Y4rxKgz3ZzwX4mrBcVeST23jLDG
	 MYF1z749ui+4J1OtcivWuA2HSLV6f6kgYcOzIJaR9q179UJ5RsdsDWoTUzz0Rr0Yml
	 C1kDZgHEIYc8TeSEr9lgR0ss=
Date: Wed, 10 Jun 2020 17:21:36 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][dunfell][PATCH] uftrace: add PV to update the package version
Message-ID: <20200610142136.GB24380@localhost>
References: <20200610070254.9851-1-bunk@stusta.de>
 <bf52e942-c934-6767-d000-1d81cb42265e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <bf52e942-c934-6767-d000-1d81cb42265e@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 10, 2020 at 07:09:11AM -0700, akuster808 wrote:
> On 6/10/20 12:02 AM, Adrian Bunk wrote:
> > From: Honggyu Kim <honggyu.kp@gmail.com>
> >
> > uftrace_0.9.4.bb now doesn't actually use exact 0.9.4 version, so it has
> > to add a PV value to update the package version.
> 
> I remember looking at this one. As I could not see how this had any
> bearing on the function of the package I skipped it.
> 
> Why does it have merit?

It does show the correct version of the software.

0.9.4 is upstream version 0.9.4
0.9.4+git is some git snapshot after 0.9.4

This is a difference, e.g. when reporting a bug to upstream.

> -armin

cu
Adrian
