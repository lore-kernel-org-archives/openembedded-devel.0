Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R4b9K-0008R4-Cl
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 18:20:22 +0200
Received: by fxi1 with SMTP id 1so1939998fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 09:15:09 -0700 (PDT)
Received: by 10.223.71.155 with SMTP id h27mr2221200faj.126.1316189709514;
	Fri, 16 Sep 2011 09:15:09 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id n1sm11044376fad.20.2011.09.16.09.15.07
	(version=SSLv3 cipher=OTHER); Fri, 16 Sep 2011 09:15:08 -0700 (PDT)
Message-ID: <4E73760B.6020605@dresearch-fe.de>
Date: Fri, 16 Sep 2011 18:15:07 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E70C8BA.9030901@dresearch-fe.de>
	<4E736B6C.9060906@dresearch-fe.de>
	<1316187165.3510.37.camel@phil-desktop>
In-Reply-To: <1316187165.3510.37.camel@phil-desktop>
X-Enigmail-Version: 1.3.1
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
X-List-Received-Date: Fri, 16 Sep 2011 16:20:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.09.2011 17:32, Phil Blundell wrote:
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

I'm not sure if there exist upstart based oe distros/images. But it seems that there are some systemd based ones (recipes/images/angstrom-systemd-image.bb).

Do they have a similar problem? How do these handle the sysvinit config vs. systemd config for the different services?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


