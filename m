Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6489D6612C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 16:36:50 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id a5so42320163ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2016 09:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nf2mA7/Da5idcen5RzOpq20fx0Vc4TwLkDKk4t/4bCo=;
	b=OtAQqgJNriWwrpuU0jR7J9DKJDYGODTlDjROevZKgkxHhWIhEDtfKzs/t3ONGx+ai3
	Dteg+9X0BJp9fke8JOlLeeHzCJgRLoCrXMXgIZzEdIwFGIjaky9tnB5mSUrv4ugwgrz3
	VegT69Y6bLaL8An64hoiTsFgG9mxgcDsoIw7aVsGOko+mRaf8MQou6wQYVUcdcz0ArG6
	63rdXE1butYaGsPsYEkn9rRW9sZTC6GopMCurRk3vBc+uez3GaxOzDxtEFXobpDZONXN
	rDdEK6bvdW5W/43m1T5PD/3w8JQZRxHd/f0CSRx4sqy2njzYELKehJgZD4sh/WG8ucaC
	s3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nf2mA7/Da5idcen5RzOpq20fx0Vc4TwLkDKk4t/4bCo=;
	b=Wnr5ESjF88Yw0a1TMlR9hYP6q9/Ve3EhNq1GSrm2OfUjXPXMKGTugrhP1HZdz2JHTA
	wiH+SinisqJf5YbIGffFNGJEcfUG8UJ6MtQHH7P6+ziMJtKv8OIlnRt8B1Wzv5N9dLfX
	D4AYjlIrbc8TZ8S9TyC4FMWvE+k6NIVEa4AWpd00pImJsBBl0NNtEh0IH8vXIog1/3n4
	lpldHHM88J/Da40eex/1STViLeQHriJ+IffNNpw6fxtbgxUyaq+YjjZj+v/dXjDkT6w6
	5ufh63ZaRXbvZfa94G0eghwcBxrYYvkl8ecJE8TZPqAotxK8pfujw8v1Oyy5yZTlQ4Wx
	e+3w==
X-Gm-Message-State: ALyK8tLmsQl3qXcl+0v6Tj+ixbljPvOgT/aUxrzkSbDTxZQb7J7RqQgdmwAxOxoEZNoTPYYCA1LYbfkOn5iNYlzS
X-Received: by 10.36.120.193 with SMTP id p184mr23945017itc.22.1465490211790; 
	Thu, 09 Jun 2016 09:36:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 9 Jun 2016 09:36:32 -0700 (PDT)
In-Reply-To: <CAHPquwP2RDW3T5hiizow6=1xJzwgCPDDs=z+OHgaEedcXTh6bg@mail.gmail.com>
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
	<CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
	<33320.10.7.198.51.1465487815.squirrel@linux.intel.com>
	<CAHPquwP2RDW3T5hiizow6=1xJzwgCPDDs=z+OHgaEedcXTh6bg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jun 2016 17:36:32 +0100
Message-ID: <CAJTo0LZhrKJvg=m05_SUPktikELaDRq8gTvvtjfhaj_9Uq+vPw@mail.gmail.com>
To: Petr Nechaev <petr.nechaev@cogentembedded.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Konstantin Ripak <konstantin.ripak@cogentembedded.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] the fate of Vala in OE
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
X-List-Received-Date: Thu, 09 Jun 2016 16:36:51 -0000
Content-Type: text/plain; charset=UTF-8

On 9 June 2016 at 16:59, Petr Nechaev <petr.nechaev@cogentembedded.com>
wrote:

> We do use Vala for internal gstreamer-related projects so I would
> volunteer to support it in oe-core.
>

Would you volunteer to maintain it in a separate layer if possible?  If
nothing in core uses it and it can be maintained out of core then I think
it should be moved out.  Currently, vala support is in oe-core but nothing
in oe-core uses it... so the autobuilder can't tell if it works.

Ross

