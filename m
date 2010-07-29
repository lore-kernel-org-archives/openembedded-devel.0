Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1OeUny-00071x-Uh
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 17:13:59 +0200
Received: (qmail 13488 invoked from network); 29 Jul 2010 17:13:35 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 29 Jul 2010 17:13:35 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id EXJcT-hjDZ6x
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 17:13:33 +0200 (CEST)
Received: (Qmail 13483 invoked from network); 29 Jul 2010 17:13:33 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 29 Jul 2010 15:13:33 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1OeUnd-0001fr-Fm
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 17:13:33 +0200
Date: Thu, 29 Jul 2010 17:13:33 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100729151333.GA5867@mi.fu-berlin.de>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B58E2@deimsg40.de.net.world>
MIME-Version: 1.0
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B58E2@deimsg40.de.net.world>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-SA-Exim-Connect-IP: 160.45.40.10
X-SA-Exim-Mail-From: heinold@mi.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,
	UNPARSEABLE_RELAY autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: eggdbus-native fails to build, dbus-glib-1.so is missing
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
X-List-Received-Date: Thu, 29 Jul 2010 15:13:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 29, 2010 at 12:12:40PM +0200, Hauser, Wolfgang (external) wrote:
> Hello,
> 
> the latest pull of http://git.gitourious.org/angstrom/openembedded.git
> results in a missing dbus-glib-1.so while linking eggdbus.
> 
> The problem was in dbus-glib.inc, where the glib-dbus-native staging
> package don't include the shared library, the pkg-config.pc is
> available.
> 
> Seems, that the changes of the staging cause the error, an older version
> of OE containing a dbus-glib-native recipe was working well.
> 
> Regards
> Wolfgang Hauser
> 

Hm,

I tought I have fixed yesterday.

Bye Henning


