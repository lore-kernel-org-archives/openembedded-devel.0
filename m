Received: from [198.175.154.225] (helo=us194mx04.tycoelectronics.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john.charlton@tycoelectronics.com>)
	id 1LY2rv-0004Ab-VK for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 19:34:32 +0100
Received: from usy90mx04.tycoelectronics.net ([163.241.175.14]) by
	us194mx04.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.2499); 
	Fri, 13 Feb 2009 13:33:01 -0500
Received: from us194mx11.tycoelectronics.net ([163.241.185.106]) by
	usy90mx04.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.1830); 
	Fri, 13 Feb 2009 13:33:01 -0500
Received: from us194mx07.tycoelectronics.net ([163.241.185.38]) by
	us194mx11.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.1830); 
	Fri, 13 Feb 2009 13:33:00 -0500
Received: from us194mx002.tycoelectronics.net (163.241.202.108) by
	us194mx07.tycoelectronics.net (163.241.185.38) with Microsoft SMTP
	Server (TLS) id 8.1.336.0; Fri, 13 Feb 2009 13:32:59 -0500
Received: from us194mx002.tycoelectronics.net ([163.241.202.108]) by
	us194mx002.tycoelectronics.net ([163.241.202.108]) with mapi;
	Fri, 13 Feb 2009 13:32:59 -0500
From: "Charlton, John" <john.charlton@tycoelectronics.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Feb 2009 13:32:58 -0500
Thread-Topic: [oe] Devshell X display error
Thread-Index: AcmN4CdY9xDplUOAS8mF+YjnvoqJngACBvPQAAg/HjA=
Message-ID: <CF7FB0793253794F9F45991443E5FE20050080FD91@us194mx002.tycoelectronics.net>
References: <CF7FB0793253794F9F45991443E5FE20050080FC56@us194mx002.tycoelectronics.net>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF66A@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF66A@hiob.intern.dresearch.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 13 Feb 2009 18:33:00.0379 (UTC)
	FILETIME=[7F9FAAB0:01C98E09]
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
X-List-Received-Date: Fri, 13 Feb 2009 18:34:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you.  That fixed the problem.

--John

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Sledz, Steffen
Sent: Friday, February 13, 2009 9:41 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Devshell X display error

> I am getting the following error when I attempt to start a=20
> gnome-terminal devshell as follows:
> ...
> NOTE: package linux-2.6.20-r8: task do_devshell: started
> X11 connection rejected because of wrong authentication.
> ERROR: function do_devshell failed

I had the same problem when using X11 over ssh redirection. The following p=
art in my .profile helped me.

 if [ -e "$HOME/.Xauthority" ] ; then
     export XAUTHORITY=3D"$HOME/.Xauthority"
 fi

Steffen

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


