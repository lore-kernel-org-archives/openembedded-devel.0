Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R4oPH-0004bk-Hc
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Sep 2011 08:29:43 +0200
Received: by bke11 with SMTP id 11so9663188bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 23:24:30 -0700 (PDT)
Received: by 10.204.145.209 with SMTP id e17mr137847bkv.221.1316240669467;
	Fri, 16 Sep 2011 23:24:29 -0700 (PDT)
Received: from [217.197.84.226] (recycler.in-berlin.de. [217.197.84.226])
	by mx.google.com with ESMTPS id y8sm8181625bkb.4.2011.09.16.23.24.27
	(version=SSLv3 cipher=OTHER); Fri, 16 Sep 2011 23:24:28 -0700 (PDT)
Message-ID: <4E743D19.4020901@dresearch-fe.de>
Date: Sat, 17 Sep 2011 08:24:25 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E70C8BA.9030901@dresearch-fe.de>
	<4E736B6C.9060906@dresearch-fe.de>
	<1316187165.3510.37.camel@phil-desktop>
In-Reply-To: <1316187165.3510.37.camel@phil-desktop>
Cc: Michael Lauer <mickey@vanille-media.de>
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
X-List-Received-Date: Sat, 17 Sep 2011 06:29:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Am 16.09.2011 17:32, schrieb Phil Blundell:
> On Fri, 2011-09-16 at 17:29 +0200, Steffen Sledz wrote:
>> On 14.09.2011 17:31, Steffen Sledz wrote:
>>> If i remember right there are some first experiments with using upstart as an sysvinit replacement in some oe based distros.
>>>
>>> Do some guidelines or suggestions exist to make an application recipes upstart ready?
>>>
>>> Nowadays a recipe for a common service contains INITSCRIPT_NAME & Co and installs an init script for sysvinit.
>>>
>>> How should such a recipe be modified to be able to install the application in a native upstart image (without sysvinit compatible runlevels)?
>>
>> Let me put it in concrete terms.
>>
>> Is it possible to write a bb recipe in a way like this?
>>
>> ---------------------->snip<-------------------------
>> ...
>> IF IMAGE USES UPSTART AS INIT THEN
>>
> 
> Fundamentally no, since there is no way to know at the time the recipe
> is evaluated what images it will go into.
> 
> It would be possible to ship both sets of scripts and then have a
> postprocessing step to remove the ones that you don't need.  Or you
> could make upstart vs sysvinit be a DISTRO_FEATURE.  Or, in at least
> some cases, we could probably stop shipping the scripts as discrete
> files altogether and replace them with some symbolic representation from
> which the necessary scripts could be constructed dynamically at install
> time.

Would it be an accepted solution to have two different packages in two recipes with common parts in an include like this?


foo_x.y.bb:
------------------>snip<-------------------
require foo-x.y.inc

RCONFLICTS = "foo-upstart"

inherit update-rc.d

do_install_append() {
    install -d ${D}${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/foo
}

INITSCRIPT_NAME = "foo"
...
------------------>snip<-------------------


foo-upstart_x.y.bb:
------------------>snip<-------------------
require foo-x.y.inc

RCONFLICTS = "foo"

do_install_append() {
    install -d ${D}${sysconfdir}/init
    install -m 0644 ${S}/upstartscript ${D}${sysconfdir}/init/foo.conf
}
...
------------------>snip<-------------------


foo-x.y.inc:
------------------>snip<-------------------
inherit autotools
...
------------------>snip<-------------------

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


