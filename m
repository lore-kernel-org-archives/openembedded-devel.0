Received: from mail.progra.de ([81.16.54.14])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fabian@progra.de>) id 1PkGVl-0005rL-Fk
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 14:43:13 +0100
Received: from [160.45.111.54] (port=38257)
	by trench.progra.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <fabian@progra.de>) id 1PkGFZ-0001nu-Gx
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 14:26:29 +0100
Message-ID: <4D480A79.4030603@progra.de>
Date: Tue, 01 Feb 2011 14:28:25 +0100
From: Fabian Ruff <fabian@progra.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: hicolor-icon-theme installation/dependency problem
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
X-List-Received-Date: Tue, 01 Feb 2011 13:43:14 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

first of all I'm not sure if this is the right mailing-list to post my 
question. Please point me to the right one if it isn't.

I've stumbled upon a problem building an recipe for custom software that 
depends on totem-pl-parser which itself depends on hicolor-icon-theme 
(which seems to be introduced by the gnome bbclass the totem-pl-parser 
recipe inherits from).

The installation of the hicolor-icon-theme fails at the postinstallation 
step because the directory /etc/gtk-2.0 and the binaries 
gdk-pixbuf-query-loaders & gtk-update-icon-cache don't exist.
The postinst script of hicolor-icon-them is as follows:

> #!/bin/sh
> if [ "x$D" != "x" ]; then
>         exit 1
> fi
> # Update the pixbuf loaders in case they haven't been registered yet
> gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders
>
> for icondir in /usr/share/icons/* ; do
>     if [ -d $icondir ] ; then
>         gtk-update-icon-cache -qt  $icondir
>     fi
> done
I believe this postinstallation step is added by the gtk-icon-cache 
class the hicolor-icon-theme recipe inherits from.

I don't know which package provides this binaries/directory but as the 
package hicolor-icon-theme explicitly has no RDEPENDS set this seems 
wrong somehow.
Installing hicolor-icon-theme via opkg from a standard console-image 
installation leaves the package manager in an inconsistent state with a 
half installed hicolor-icon-theme package which additionally can't be 
removed anymore because the postrm step also expects 
gtk-update-icon-cache to be available.

Any suggestions how to fix this or how this was intended to work?
I want to use totem-pl-parser with the least possible additional 
software and hope this is possible without unfolding a complete 
gnome/gtk universe in my installation.

Cheers,
Fabian







