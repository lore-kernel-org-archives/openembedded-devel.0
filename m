Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R4aRU-0006qf-2r
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 17:35:04 +0200
Received: by wwf27 with SMTP id 27so4198467wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 08:29:51 -0700 (PDT)
Received: by 10.227.20.85 with SMTP id e21mr1616964wbb.104.1316186991181;
	Fri, 16 Sep 2011 08:29:51 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id gd6sm13000741wbb.1.2011.09.16.08.29.49
	(version=SSLv3 cipher=OTHER); Fri, 16 Sep 2011 08:29:50 -0700 (PDT)
Message-ID: <4E736B6C.9060906@dresearch-fe.de>
Date: Fri, 16 Sep 2011 17:29:48 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Anatoly Shipitsin <norguhtar@gmail.com>,
	Michael Lauer <mickey@vanille-media.de>, 
	Richard Purdie <rpurdie@rpsys.net>, Thilo Fromm <fromm@dresearch-fe.de>
References: <4E70C8BA.9030901@dresearch-fe.de>
In-Reply-To: <4E70C8BA.9030901@dresearch-fe.de>
X-Enigmail-Version: 1.3.1
Subject: Re: guidelines for upstart in oe?
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
X-List-Received-Date: Fri, 16 Sep 2011 15:35:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.09.2011 17:31, Steffen Sledz wrote:
> If i remember right there are some first experiments with using upstart as an sysvinit replacement in some oe based distros.
> 
> Do some guidelines or suggestions exist to make an application recipes upstart ready?
> 
> Nowadays a recipe for a common service contains INITSCRIPT_NAME & Co and installs an init script for sysvinit.
> 
> How should such a recipe be modified to be able to install the application in a native upstart image (without sysvinit compatible runlevels)?

Let me put it in concrete terms.

Is it possible to write a bb recipe in a way like this?

---------------------->snip<-------------------------
...
IF IMAGE USES UPSTART AS INIT THEN

inherit autotools

do_install_append() {
    install -d ${D}${sysconfdir}/init
    install -m 0644 ${S}/upstartscript ${D}${sysconfdir}/init/foo.conf
}

ELSE

inherit autotools update-rc.d

do_install_append() {
    install -d ${D}${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/foo
}

INITSCRIPT_NAME = "foo"

FI
...
---------------------->snip<-------------------------

Regards
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


