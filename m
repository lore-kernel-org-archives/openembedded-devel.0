Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <tobias.pflug@gmx.net>) id 1Ilji4-00040n-4I
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Oct 2007 13:20:11 +0200
Received: (qmail invoked by alias); 27 Oct 2007 11:12:34 -0000
Received: from p549AA970.dip0.t-ipconnect.de (EHLO [192.168.1.100])
	[84.154.169.112]
	by mail.gmx.net (mp043) with SMTP; 27 Oct 2007 13:12:34 +0200
X-Authenticated: #283898
X-Provags-ID: V01U2FsdGVkX1/WNfFx6bjW9UZZ1i8Po991wrg2bicBK2cDmXYIDz
	3154yOkyBd2yEU
From: Tobias Pflug <tobias.pflug@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Oct 2007 13:12:50 +0200
Message-Id: <1193483570.6376.106.camel@toontown>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-Y-GMX-Trusted: 0
Subject: list of packages from .dot
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
X-List-Received-Date: Sat, 27 Oct 2007 11:20:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

maybe there is some other, more elegant way but in order to obtain
all packages that will be installed for a given image I use the
following little sequence of bash fiddling on a .dot file generated
by `bitbake -g`. Maybe someone else finds it useful or wants to tell
me what a fool I am because there is a much easier way to do this :)


#!/bin/bash
# argument $1 = <dot file>

cat $1 | grep -v "label\|digraph\|\}\|virtual" | sed 's/^
\"\([[:alnum:]\.+\-]\+\)\"\ ->\ \"\ \?\([[:alnum:]\.\+\ \?-]\+\)\"\(\
\[style=.*]\)\?$/\1 \2/' | sed 's/\ /\n/g' | sort | uniq

remove the "\|virtual" part if you want virtual packages listed.
as well.

regards,
Tobi



