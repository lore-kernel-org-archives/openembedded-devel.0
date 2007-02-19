Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nelsoneci@gmail.com>) id 1HIxFL-0001va-36
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Feb 2007 02:23:15 +0100
Received: by ug-out-1314.google.com with SMTP id e2so497952ugf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Feb 2007 17:23:14 -0800 (PST)
Received: by 10.78.170.17 with SMTP id s17mr259681hue.1171848192324;
	Sun, 18 Feb 2007 17:23:12 -0800 (PST)
Received: by 10.78.178.6 with HTTP; Sun, 18 Feb 2007 17:23:12 -0800 (PST)
Message-ID: <2accc2ff0702181723s1b272080mfc8ab1ee2ea4fa41@mail.gmail.com>
Date: Sun, 18 Feb 2007 20:23:12 -0500
From: "Nelson Castillo" <nelson@emqbit.com>
Sender: nelsoneci@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45D8C301.200@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <2accc2ff0702181229p739ebee1ke3ea6c6264cf9b0f@mail.gmail.com>
	<45D8C301.200@dominion.kabel.utwente.nl>
X-Google-Sender-Auth: 9a85a04bab626c8c
Subject: Re: Trying to package Appweb 2.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Feb 2007 01:23:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2/18/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Nelson Castillo schreef:
> > Hi.
> >
> > We've been trying to package Appweb 2.1.0. This package works
> > (We haven't thought of PHP5).
> >
> > We tried to get rid of /usr/mime.types in the commented code that
> > follows but we could not.
> >
> > #FILES_${PN} += " /etc/appWeb/appWeb.conf /etc/appWeb/mime.types"
> > FILES_${PN} += " /usr/appWeb.conf /usr/mime.types"
>
> /etc (or rather ${sysconfdir}) always gets includes, so you need to override FILES_${PN}
> ('=') instead of appending to it ('+=').

Koen. This did not work.

BTW, when I remove the package it seems to do a "rm /var/www/*". Nasty!


NOTE: the following files were installed but not shipped in any package:
NOTE:   /etc/rc0.d/K15appWeb
NOTE:   /etc/rc1.d/K15appWeb
NOTE:   /etc/rc2.d/K15appWeb
NOTE:   /etc/rc3.d/K15appWeb
NOTE:   /etc/rc4.d/K15appWeb
NOTE:   /etc/rc5.d/S81appWeb
NOTE:   /etc/rc6.d/K15appWeb
NOTE:   /etc/init.d/appWeb
NOTE:   /var/www/upload.html
NOTE:   /var/www/test.esp
NOTE:   /var/www/index.html
NOTE:   /var/www/inc.js
NOTE:   /var/www/upload.esp
NOTE:   /var/www/features.esp
NOTE:   /var/www/inc.esp
NOTE:   /var/www/simple.esp
NOTE:   /usr/COPYRIGHT.TXT
NOTE:   /usr/LICENSE.TXT
NOTE:   /usr/README.TXT
NOTE:   /usr/appWeb.bmp
NOTE:   /usr/appWeb.ico
NOTE:   /usr/remove
NOTE:   /usr/groups.db
NOTE:   /usr/users.db
NOTE:   /usr/install
NOTE:   /usr/appWeb.conf
NOTE:   /usr/mime.types
NOTE:   /usr/bin/libdirModule.so
NOTE:   /usr/bin/libputModule.so
NOTE:   /usr/bin/libcgiModule.so
NOTE:   /usr/bin/libappWeb.so.1
NOTE:   /usr/bin/libegiModule.so
NOTE:   /usr/bin/libcopyModule.so
NOTE:   /usr/bin/libadminModule.so
NOTE:   /usr/bin/libauthModule.so
NOTE:   /usr/bin/libcapiModule.so
NOTE:   /usr/lib/libappWeb.so.1
NOTE:   /usr/lib/libappWeb.so.1.0.0
NOTE:   /usr/sbin/httpClient
NOTE:   /usr/sbin/httpComp
NOTE:   /usr/sbin/appWeb
NOTE:   /usr/sbin/httpPassword

Regards,
Nelson.-

-- 
http://arhuaco.org
http://emQbit.com


