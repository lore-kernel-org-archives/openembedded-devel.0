Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K49PD-0002kT-1W
	for openembedded-devel@openembedded.org; Thu, 05 Jun 2008 08:57:03 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K49Kf-0006ny-7J
	for openembedded-devel@openembedded.org; Thu, 05 Jun 2008 06:52:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 05 Jun 2008 06:52:21 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 05 Jun 2008 06:52:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 05 Jun 2008 08:52:12 +0200
Message-ID: <g282es$bm6$1@ger.gmane.org>
References: <d1b08f940806041503j30d3192fj3607d2071886131b@mail.gmail.com>
	<d1b08f940806041524k42788e2cve997b861bc3fd0d4@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052703)
In-Reply-To: <d1b08f940806041524k42788e2cve997b861bc3fd0d4@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] patches for angstrom 2008.1 - c7x0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 05 Jun 2008 06:57:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Andrea Adami wrote:
> Sorry, was meant for c7x0 only:
>
> ============================================================
> --- conf/distro/include/angstrom-2008-preferred-versions.inc	45c7ad8dae151667ad4090f51315c58cf1e5a31b
> +++ conf/distro/include/angstrom-2008-preferred-versions.inc	989f798867f6f1deb79f8cd515470d7f419445fd
> @@ -8,5 +8,6 @@ PREFERRED_VERSION_udev 		= "118"
>   PREFERRED_VERSION_pixman	= "0.10.0"
>   PREFERRED_VERSION_pulseaudio 	= "0.9.9"
>   PREFERRED_VERSION_udev 		= "118"
> +PREFERRED_VERSION_udev_c7x0 	= "092"
>   PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
>   PREFERRED_VERSION_dropbear 	= "0.50"

PV can't go backwards, and we certainly don't want to special-case 
machines wrt udev versions. You'll have to find another solution to your 
problem.

regards,

Koen




