Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GSD67-000652-9n
	for openembedded-devel@openembedded.org; Tue, 26 Sep 2006 15:35:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8QDUtM4002490
	for <openembedded-devel@openembedded.org>;
	Tue, 26 Sep 2006 14:30:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02318-04 for <openembedded-devel@openembedded.org>;
	Tue, 26 Sep 2006 14:30:53 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8QDUnOD002483
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 26 Sep 2006 14:30:49 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <4519283E.5010001@dominion.kabel.utwente.nl>
References: <4518B426.6070905@mitac-mtc.com.tw>
	<1159265456.18705.53.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<4519283E.5010001@dominion.kabel.utwente.nl>
Date: Tue, 26 Sep 2006 14:30:50 +0100
Message-Id: <1159277450.5573.67.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Failed to build gpe-image ( mainstone/generic )
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2006 13:35:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-09-26 at 15:16 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Michael 'Mickey' Lauer schreef:
> > Am Dienstag, den 26.09.2006, 13:01 +0800 schrieb Axel.Lin:
> >> hi,
> >> I tried to build gpe-image with generic distro and mainstone machine
> >> setting.
> >> I got below error message.
> >> Could you kindly give me some hints to fix this?
> > 
> > I'm afraid GPE is not in the best state of maintenance in OE atm.
> > 
> > Try rebuilding (bitbake -c rebuild -b <filename) dbus 0.9x and dbus-glib
> > 0.7x, then rebuild gpe-conf. It should then pick up the new dbus
> > versions from pkgconfig. To be safe, remove
> > the old versions of dbus*.pc from PKG_CONFIG_PATH.
> 
> Is anybody still using dbus 0.23.x in .dev? I'd like to move it to packages/obsolete/dbus
> to avoid people falling in this trap over and over again. D-bus 1.0 (with a stable API) is
>  going to be released soon(TM), so people should really adapt their apps to the 0.9x (and
> thus 1.0) API.

I'd vote for removing it. Nobody should be using that now and if they
anyone does need it, we have an SCM for a reason...

One of my builds has also fallen down this hole :-(.

Cheers,

Richard




