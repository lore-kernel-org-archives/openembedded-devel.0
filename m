Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HbYOE-0004vi-IM
	for openembedded-devel@openembedded.org; Wed, 11 Apr 2007 10:41:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3B8fIuq014404
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Apr 2007 09:41:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14346-02 for <openembedded-devel@openembedded.org>;
	Wed, 11 Apr 2007 09:41:12 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3B8fC56014391
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Apr 2007 09:41:12 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200704110855.34007.openembedded@hrw.one.pl>
References: <46176E51.2030608@dominion.kabel.utwente.nl>
	<1176049069.5844.6.camel@localhost.localdomain>
	<200704110850.48209.openembedded@hrw.one.pl>
	<200704110855.34007.openembedded@hrw.one.pl>
Date: Wed, 11 Apr 2007 09:41:11 +0100
Message-Id: <1176280871.5843.6.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	l3B8fIuq014404
Subject: Re: [RFC] rm_work
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
X-List-Received-Date: Wed, 11 Apr 2007 08:41:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2007-04-11 at 08:55 +0200, Marcin Juszkiewicz wrote:
> Dnia =C5=9Broda, 11 kwietnia 2007, Marcin Juszkiewicz napisa=C5=82:
>=20
> > Maybe rm_work.bbclass should do:
> >
> > BB_DEFAULT_TASK =3D "rm_work"
> > addtask rm_work after do_build
> >
> > But I did not tested it yet (got that idea during Easter).
>=20
> Looks like it is a way - atleast it works in Poky:

Its a nice way to cheat but that might not work for bitbake 1.6? If it
doesn't work for 1.6, it could probably get backported easily enough. I
would like to see support for specifying multiple tasks to the addtask
syntax though to solve this problem properly.

Cheers,

Richard





