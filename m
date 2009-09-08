Received: from [64.71.152.235] (helo=lirone.symas.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hyc@symas.com>) id 1MlB9W-00087Y-CF
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 02:35:17 +0200
Received: from [76.91.220.157] (helo=[192.168.1.29])
	by lirone.symas.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hyc@symas.com>) id 1Mkv3P-0001fB-PG
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Sep 2009 00:23:51 -0700
Message-ID: <4AA60682.1020309@symas.com>
Date: Tue, 08 Sep 2009 00:23:46 -0700
From: Howard Chu <hyc@symas.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64;
	rv:1.9.1b5pre) Gecko/20090819 SeaMonkey/2.0a1pre Firefox/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.71.152.235
X-SA-Exim-Mail-From: hyc@symas.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: wpa_supplicant and GnuTLS
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
X-List-Received-Date: Wed, 09 Sep 2009 00:35:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On the Always Innovating TouchBook I've found that the wpa_supplicant always 
fails on WPA-EAP authentication in its default package, built with GnuTLS. It 
works fine when I rebuild it using OpenSSL. It's surprising the number of 
packages in the distro that depend on GnuTLS. I think you should seriously 
reconsider relying on such a volatile library in your builds.

-------- Original Message --------
Subject: Re: wpa_supplicant
Date: Tue, 08 Sep 2009 00:02:43 -0700
From: Gregoire Gentil <gregoire@gentil.com>
Reply-To: gregoire@gentil.com
Organization: Gregoire Gentil
To: Howard Chu <hyc@symas.com>

I have no experience with gnutls vs. openssl and I didn't patch
anything. It's OE which is using gnutls and unfortunately, there is a
bunch of packages depending of gnutls :-(. I think that in the situation
you raise, it's really wpa-supplicant recipe that matters:
http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/wpa-supplicant

I can try to replace gnutls depends by openssl but I'm not an expert of
this, so I'm not sure of the result,

Grégoire


On Mon, 2009-09-07 at 23:19 -0700, Howard Chu wrote:
> Also, as I mentioned in bug #8, the wpa_supplicant built with GnuTLS doesn't
> work for me; it only works when built with OpenSSL. I suppose I should point
> out that GnuTLS doesn't exactly have a brilliant history in my experience.
>
> http://www.openldap.org/lists/openldap-devel/200802/msg00072.html
>
> http://www.openldap.org/lists/openldap-bugs/200908/msg00080.html
> http://www.openldap.org/lists/openldap-bugs/200908/msg00084.html
> http://www.openldap.org/lists/openldap-bugs/200903/msg00049.html
> http://www.openldap.org/lists/openldap-bugs/200903/msg00050.html
> http://www.openldap.org/lists/openldap-bugs/200805/msg00094.html
> http://www.openldap.org/lists/openldap-bugs/200802/msg00080.html
>
> The software is immature and the coders behind the project have insufficient
> experience with programming, let alone security software programming. I
> strongly recommend sticking with OpenSSL and removing all GnuTLS dependencies
> from your distro.

-- 
   -- Howard Chu
   CTO, Symas Corp.           http://www.symas.com
   Director, Highland Sun     http://highlandsun.com/hyc/
   Chief Architect, OpenLDAP  http://www.openldap.org/project/


