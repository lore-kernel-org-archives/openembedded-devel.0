Received: from [81.255.54.16] (helo=mx.laposte.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <c.romain@laposte.net>) id 1Hdapu-00065A-6f
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Apr 2007 01:42:18 +0200
Received: from smtp.laposte.net (10.150.9.43) by mx.laposte.net (7.2.060.1)
	id 45FFE41400CACE34; Tue, 17 Apr 2007 01:42:17 +0200
Received: from smtpin.laposte.net (10.150.9.73) by smtp.laposte.net (7.3.118.6)
	id 46067A870260729A; Tue, 17 Apr 2007 01:42:17 +0200
Received: from [192.168.2.2] (86.201.55.132) by smtpin.laposte.net (7.2.060.1)
	(authenticated as c.romain)
	id 45FA4DAE0032E2E8; Tue, 17 Apr 2007 01:40:19 +0200
Message-ID: <4623FC06.9060009@laposte.net>
Date: Tue, 17 Apr 2007 00:43:18 +0200
From: cyril Romain <c.romain@laposte.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070323)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
References: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
In-Reply-To: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
Cc: openembedded-devel@openembedded.org
Subject: Re: Making /var/lib persistent
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2007 23:42:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Koen Kooi wrote:
> Marcel Holtmann just pointed me to the fact that OE mount /var as tmpfs for
> almost all machines, which wipes /var/lib at boot, which will break bluez and
> dpkg.
>
> What would be the best way to preserve /var/lib (and maybe others) across boots?
>   
I suggest the use of symlinks in /var/lib that point to a let's say
/srv/ directory.
thoses links will be created at boot time, e.g.:
ln -s /srv/bitlbee/lib /var/lib/bitlbee

Best regards,

  cyril


