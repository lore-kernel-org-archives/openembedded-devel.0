Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LlTAO-0001lm-VE
	for openembedded-devel@openembedded.org; Sun, 22 Mar 2009 20:17:05 +0100
Received: (qmail 29928 invoked by uid 813007); 22 Mar 2009 19:15:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2009 19:15:47 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Mar 2009 20:15:33 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc7-00188-gebdcc81-dirty; KDE/4.2.1;
	x86_64; ; )
References: <1237731142-8136-1-git-send-email-matthieu.poullet@gmail.com>
	<200903221929.57400.marcin@juszkiewicz.com.pl>
In-Reply-To: <200903221929.57400.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200903222015.34575.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] Alsa-state: Wildcard removed and all *.state put back in the recipes
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
X-List-Received-Date: Sun, 22 Mar 2009 19:17:05 -0000
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


> > diff --git a/recipes/alsa/alsa-state.bb

I looked more at that recipe and found few bugs in it:

1. It assumes that 'asound.conf' is same for all devices. This is not
   true for 'at91sam9263ek' which kernel oops with default file.

2. It plays with INITSCRIPT_PARAMS in postinst script. I do not know
   maybe it was required in past but why it is present now? No idea and
   no info in recipe why it is that way.

3. Postinst script restore default ALSA settings which is ugly too - 
   what if user just muted all channels to have device quiet during 
   night and postinst just makes his 1000W 7.1 audio system goes to full
   volume at 02:00 at night?

4. With current version is is broken for a780 device which has few
   states files available.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




