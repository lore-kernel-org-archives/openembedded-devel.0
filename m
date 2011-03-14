Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Pz3w7-0000X9-01
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 10:19:35 +0100
Received: (qmail 13703 invoked by uid 2404007); 14 Mar 2011 08:51:12 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89-73-110-167.dynamic.chello.pl (HELO ?192.168.1.112?)
	(marcin@juszkiewicz.com.pl@89.73.110.167)
	by host4.kei.pl with ESMTPA; 14 Mar 2011 08:51:12 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300035425-15984-3-git-send-email-eric@eukrea.com>
References: <1300035425-15984-1-git-send-email-eric@eukrea.com>
	<1300035425-15984-3-git-send-email-eric@eukrea.com>
Date: Mon, 14 Mar 2011 09:51:13 +0100
Message-ID: <1300092673.9169.0.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 3/4] slugos: prefer busybox 1.18.4
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
X-List-Received-Date: Mon, 14 Mar 2011 09:19:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Dnia 2011-03-13, nie o godzinie 17:57 +0100, Eric Bénard pisze:
> --- a/conf/distro/include/preferred-slugos-versions.inc
> +++ b/conf/distro/include/preferred-slugos-versions.inc
> @@ -24,7 +24,7 @@ PREFERRED_VERSION_autoconf                    ?=
> "2.65"
>  PREFERRED_VERSION_autoconf-native              ?= "2.65"
>  PREFERRED_VERSION_automake                     ?= "1.11.1"
>  PREFERRED_VERSION_automake-native              ?= "1.11.1"
> -PREFERRED_VERSION_busybox                      ?= "1.18.3"
> +PREFERRED_VERSION_busybox                      ?= "1.18.4" 

Can't it be handled by DEFAULT_PREFERENCE_slugos = "1" in
busybox_1.18.4.bb recipe? Less reparsing.



