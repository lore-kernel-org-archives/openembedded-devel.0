Received: from [74.125.78.146] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Lz8ts-000568-Kh
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 14:28:32 +0200
Received: by ey-out-1920.google.com with SMTP id 26so422882eyw.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 05:23:17 -0700 (PDT)
Received: by 10.210.37.11 with SMTP id k11mr285656ebk.81.1241007797344;
	Wed, 29 Apr 2009 05:23:17 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 7sm1648325eyg.7.2009.04.29.05.23.16
	(version=SSLv3 cipher=RC4-MD5); Wed, 29 Apr 2009 05:23:16 -0700 (PDT)
Message-ID: <49F846B3.6040709@xora.org.uk>
Date: Wed, 29 Apr 2009 13:23:15 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090417055233.0A30C189350@amethyst.openembedded.net>
	<49F83052.10303@xora.org.uk>
In-Reply-To: <49F83052.10303@xora.org.uk>
X-Enigmail-Version: 0.95.0
Subject: Re: [oe-commits] Carsten Haitzler (Rasterman : angstrom, exquisite, psplash, opkg, angsrtom-images, sysvinit: abstract splash
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
X-List-Received-Date: Wed, 29 Apr 2009 12:28:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> GIT User account wrote:
>   
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 212e36417ae27e1be11147168b6f5cdfd1c5eda9
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=212e36417ae27e1be11147168b6f5cdfd1c5eda9
>>
>> Author: Carsten Haitzler (Rasterman <raster@rasterman.com>
>> Date:   Fri Apr 17 15:44:58 2009 +1000
>>
>> angstrom, exquisite, psplash, opkg, angsrtom-images, sysvinit: abstract splash
>>
>> this abstracts psplash to be generic. now as long as something provides a
>> splashfuncs file that sysvinit (and other scripts) can source, and all the
>> approproate init hooks to start the splash etc. you can use psplash,
>> exquisitie, usplash or anything that tickles your fancy. this moves splash
>> toa ${SPLASH} variable to include in your image (or override). the default in
>> angstrom is psplash - unless you override it. opkg also runs a configure
>> script that cna take forever - and so this speically sends off some splash
>> commands (if there) to let you know the systme is alive and working (but just
>> busy).
>>
>> this is one commit as if this breaks things you either want to fix the minor
>> break or totally revert the whole patch. i hope it didn't break anything.
>>
>>  recipes/opkg/files/configure                       |   18 ++++++++++++
>>   
>>     
> Taken me a while to notice, but the backgrounding of opkg configure in
> this file totally breaks booting cleanly on first boot. It causes a race
> condition on whether the necessary packages are configured before X
> manages to launch. Is it really required that opkg be backgrounded at
> this point?
>
> Also Im not convinced about the deleting of S98configure, this breaks
> the situation when a device dies during opkg configure (most commonly
> when dbus shuts down which kills pretty much everything) as packages
> dont get configured on next boot to finish the operation.
>
> This is not worthy of a revert, just some more thought!
>
>   
Ah I see, it is broken in the case there is no /etc/default/splashfuncs

Graeme



