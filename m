Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LXzEx-0000kS-AZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 15:42:03 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 13B7416DFBD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 15:53:22 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id B9CFE2A41DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 15:40:37 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 13 Feb 2009 15:40:40 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF66A@hiob.intern.dresearch.de>
In-Reply-To: <CF7FB0793253794F9F45991443E5FE20050080FC56@us194mx002.tycoelectronics.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Devshell X display error
Thread-Index: AcmN4CdY9xDplUOAS8mF+YjnvoqJngACBvPQ
References: <CF7FB0793253794F9F45991443E5FE20050080FC56@us194mx002.tycoelectronics.net>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Devshell X display error
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
X-List-Received-Date: Fri, 13 Feb 2009 14:42:03 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> I am getting the following error when I attempt to start a=20
> gnome-terminal devshell as follows:
> ...
> NOTE: package linux-2.6.20-r8: task do_devshell: started
> X11 connection rejected because of wrong authentication.
> ERROR: function do_devshell failed

I had the same problem when using X11 over ssh redirection. The =
following part in my .profile helped me.

 if [ -e "$HOME/.Xauthority" ] ; then
     export XAUTHORITY=3D"$HOME/.Xauthority"
 fi

Steffen


