Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1QhJwR-00026h-UR for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 13:18:52 +0200
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p6EBEvCf001854
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 13:14:58 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 14 Jul 2011 13:14:54 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 14 Jul 2011 13:14:54 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE51A8@GSX300A.mxchg.m.corp>
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04AD2583@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Errors on fetching files
Thread-Index: AcxBtExly/vNi83sSXGI/YQ7IQnTLAAYdH7g
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04AD2583@nzc-ap-xch-02.ap.trimblecorp.net>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 14 Jul 2011 11:14:54.0149 (UTC)
	FILETIME=[41BD0750:01CC4217]
Subject: Re: Errors on fetching files
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
X-List-Received-Date: Thu, 14 Jul 2011 11:18:52 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>So the question is if wget works from the command line why does it not
>work from bitbake .... Unless it uses another method to get the file,
>but I see nothing in the .bb file to indicate what
>program is used ..

Hello,

OE doesn't use the http_proxy variables from environment !

Normaly the BB_ENV_EXTRAWHITE environment Variable is used to import
environment variables into OE environment. But it is reported, that this
dosn't work with http_proxy somehow.

Put your proxy settings into ~/.wgetrc (local user setting) or
/etc/wgetrc (system wide setting).=20
For svn put it into ~/.subversion/servers.=20
For git search in google for settings and try it, I haven't much luck
with it.

Regards
Wolfgang


