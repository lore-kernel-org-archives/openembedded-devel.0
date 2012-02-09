Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RvZGx-00067I-20 for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 20:03:11 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RvZ95-0005j0-HA for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 19:55:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 19:55:03 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 19:55:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 09 Feb 2012 19:51:29 +0100
Message-ID: <jh14jj$866$2@dough.gmane.org>
References: <cover.1328648257.git.otavio@ossystems.com.br>
	<1cd08c798a7b335ba66ed186d6fbd3b4002d2f8a.1328648257.git.otavio@ossystems.com.br>
	<20120209160041.GC10322@jama.jama.net>
	<CAP9ODKpzNm9DCkkWWr0sHaiuWZAKyd37tqFhQzmLY8Vw_qQkOg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <CAP9ODKpzNm9DCkkWWr0sHaiuWZAKyd37tqFhQzmLY8Vw_qQkOg@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [PATCH][meta-oe 3/3] polkit: depends on systemd
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
X-List-Received-Date: Thu, 09 Feb 2012 19:03:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 09-02-12 17:14, Otavio Salvador schreef:
> On Thu, Feb 9, 2012 at 14:00, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> 
>> So it's clear that systemd will always be enabled and still easy to 
>> override both with .bbappend?
>> 
> 
> For the current state of polkit it might be better to disable systemd on 
> this, completely. So passing --disable-systemd to autoconf. What do you 
> think?

Well, systemd is the only backend that actually works in our current
metadata, so I'm hesitant to globally disable it.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk80FbEACgkQMkyGM64RGpFyNQCfU0ANmYwoxrK4+J8bzMGr8Wy3
J7sAnil8V8UOxuc+p+8zCXszOB8zhbzp
=/tbB
-----END PGP SIGNATURE-----



