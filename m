Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1REjsQ-0000cT-4U for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 17:40:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1REjmk-0002Qf-Ha for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 17:34:58 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2011 17:34:58 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2011 17:34:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 14 Oct 2011 17:34:46 +0200
Message-ID: <j79kqm$6qg$1@dough.gmane.org>
References: <4E96E9FE.1060005@mlbassoc.com>
	<CAMKF1sp9HPM8DzxTSuhUKY7-q4QuDPNkDQ2TAQPwoGkZ+Gu4eg@mail.gmail.com>
	<4E974E38.5050807@mlbassoc.com>
	<201110132258.27380.schnitzeltony@gmx.de>
	<4E975444.3050507@mlbassoc.com>
	<CA+T6QPkOQgFSmSsNaaeCOM5zNtzaNcCzgVaXr=t_5jj902w11Q@mail.gmail.com>
	<CAMKF1srDzFzjkoWAs2k8wP45xskCuwhyLb_dCpiT2GMarC_s5w@mail.gmail.com>
	<4E980D6D.7090307@mlbassoc.com>
	<CAMKF1srhvhNhf5DAsGeuzWYvuhsExE_y92PjvSaQRoDixtMiDQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <CAMKF1srhvhNhf5DAsGeuzWYvuhsExE_y92PjvSaQRoDixtMiDQ@mail.gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: Can't build libcgroup
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
X-List-Received-Date: Fri, 14 Oct 2011 15:40:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 14-10-11 17:28, Khem Raj schreef:
>> Indeed, I did a rebuild from scratch with BB_NUMBER_THREADS=1 and 
>> PARALLEL_MAKE="-j1" and it worked fine.  When I set both to 2 I had 
>> failures, but of a different sort (openssl failed to build).
>> 
>> Seems to be some real gremlins in the parallel builds :-(
>> 
>> Odd that I've never seen this when building Poky (I _always_ use 
>> BB_NUMBER_THREADS=4 and PARALLEL_MAKE="-j4")
>> 
> 
> It could be that the runqueue of poky is constructed such that this does
>  not happen

RP suspects it's rm_work that is triggering all these bitbake bugs.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOmFaVMkyGM64RGpERApm3AJ4mGLiR2ZfpPyEXWf/R82J147ZxBACfZmhY
tt6QS1QPdcfRlFQAGOEaR9E=
=UTKA
-----END PGP SIGNATURE-----



