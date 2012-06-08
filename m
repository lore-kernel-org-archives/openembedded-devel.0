Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ScsDH-0000uB-Su for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 07:58:23 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Scs36-0000tn-8S for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 07:47:52 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 07:47:52 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 07:47:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 08 Jun 2012 07:47:39 +0200
Message-ID: <jqs3lq$bpg$1@dough.gmane.org>
References: <CALbNGRRSxKD_QqhCbLH=aRj3S0PEyTmQs9j8Lgg-5EObqMypxQ@mail.gmail.com>
	<jp3k9b$p58$1@dough.gmane.org>
	<CALbNGRSDJGWyQd0ZwASa4ZrJ9FfD=y08ET_gg-xStbpLGtnQBw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <CALbNGRSDJGWyQd0ZwASa4ZrJ9FfD=y08ET_gg-xStbpLGtnQBw@mail.gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: meta-systemd
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
X-List-Received-Date: Fri, 08 Jun 2012 05:58:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 07-06-12 20:27, Andreas Müller schreef:
> On Thu, May 17, 2012 at 9:41 PM, Koen Kooi <koen@dominion.thruhere.net> 
> wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 17-05-12 15:07, Andreas Müller schreef:
>>> Hi
>>> 
>>> happy to see this happen I have few questions on what is planned.
>>> 
>>> In README is written:
>>> 
>>>> And we're working to break the dependency on this one:
>>>> 
>>>> URI: git://git.openembedded.org/meta-openembedded
>>> 
>>> Maybe it is a misunderstanding but I would expect for contents of 
>>> this layer
>>> 
>>> * systemd.bbclass * all from meta-oe/recipes-core/systemd *
>>> bbappends for all recipes with systemd support.
>>> 
>>> Is this correct?
>> 
>> Correct. The bbappends will likely cause dependencies on non-oecore 
>> layers, but so be it. We might need to set the unbreak-me flag for 
>> missing bb files that match our bbappends.
> 
> I started with meta-systemd and want to do some testing. The mentioned 
> 'unbreak-me' - is it available already or and idea to be implemented?

BB_DANGLINGAPPENDS_WARNONLY = "true"

in the layer.conf should work.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJP0ZH7AAoJEHZqAkdh1vT6eaoP/0J5NvTCFHuAO7aIr6K6rCdx
1aAgsq764gW2FhUg0xUwdqkcRzBDxD+KRF0uYDFhltsT0scMC6/V91NYbzk6Bi8x
sHe7pcmnQBVJaIAe4Y54gbXjFP838g044ypjNLvwGe4fPSWkdNWZ+mU5lUKj2PQY
Hwa6RpRLXRrAJLBAmElWQ3ULTX0q2tho91KK69EmSiqD5Wj/ql9plO72KzX191uf
l0lPdK0WE86fpGn6QbJaDN7Q9gH1RoazYxqUwA23P8ZZ3k+JHZy4eqWIn1HWTouO
bK3e5rKfNm5SiGhjw3Y5WQvyiv/4w4obsPNTUJrXGP6tNkx5Kx/T31VsWLtik+oR
tXxcQEnkkMVafy8J//tQTtdoDDG/Igyvsw+W/czViWs7AK40WpElClUDTes8AOoz
YSJZlYgGYykqYb50imdm+RlSMovn5cLoTivYGz3GBqgpsBkatRWFb+EUfW3Knxz/
Iosy045Eho8/5z4hhwsggltkJxg5VkEup4h0rN1NRSQis70U+PJ7CTO6/+6959gQ
s3wSbVjsc7Qnw6FJhfYRdtlDZcxd6tHi/5Rqe5frQ1zdCDNZHJRxtOXsrjF2qh2r
qdnNcB/PgF9c03VKfBouP83VC0LoOzHZklG2XkAngZd4CcZuxyhTp0DLdns14IlL
vFvtzPj1yXUdYVHzEWlN
=n4Hr
-----END PGP SIGNATURE-----



