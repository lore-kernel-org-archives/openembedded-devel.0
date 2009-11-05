Received: from [212.27.42.91] (helo=wmproxy1-g27.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alain2210@free.fr>) id 1N5yco-0006i6-0q
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 10:27:29 +0100
Received: from wmproxy1-g27.free.fr (localhost [127.0.0.1])
	by wmproxy1-g27.free.fr (Postfix) with ESMTP id 32447359B;
	Thu,  5 Nov 2009 10:26:15 +0100 (CET)
Received: from UNKNOWN (imp3-g19.priv.proxad.net [172.20.243.133])
	by wmproxy1-g27.free.fr (Postfix) with ESMTP id 1FF5E3590;
	Thu,  5 Nov 2009 10:26:15 +0100 (CET)
Received: by UNKNOWN (Postfix, from userid 0)
	id 1F667E660CB3D; Thu,  5 Nov 2009 10:26:15 +0100 (CET)
Received: from  ([82.123.143.222]) by imp.free.fr (IMP) with HTTP 
	for <alain2210@172.20.243.55>; Thu, 05 Nov 2009 10:26:15 +0100
Message-ID: <1257413175.4af29a371a827@imp.free.fr>
Date: Thu, 05 Nov 2009 10:26:15 +0100
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel@lists.openembedded.org, Phil Blundell <pb@reciva.com>
References: <1254096967.4ac00047b8abb@imp.free.fr>
	<200911031451.06266.holger+oe@freyther.de>
	<1257256918.10421.111.camel@mill.internal.reciva.com>
In-Reply-To: <1257256918.10421.111.camel@mill.internal.reciva.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.8
X-Originating-IP: 82.123.143.222
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 212.27.42.91
X-SA-Exim-Mail-From: alain2210@free.fr
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: xmonobut
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
X-List-Received-Date: Thu, 05 Nov 2009 09:27:29 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

thanks for the answers.

Selon Phil Blundell <pb@reciva.com>:

> On Tue, 2009-11-03 at 14:51 +0100, Holger Hans Peter Freyther wrote:
> > On Monday 28 September 2009 02:16:07 Alain2210 wrote:
> > > Hello,
> > >
> > > xmonobut segfault. I need this patch to get it works again.
> >
> > > -  unsigned char map[6];
> > > +  unsigned char map[31];
> > ...
> > > +      buts =3D XGetPointerMapping(dpy, map, 32);
> > ,,.
> > > +      while((rst =3D XSetPointerMapping(dpy, map, 32)) =3D=3D Mapp=
ingBusy);
> >
> > 31. vs 32... please send an updated patch

Sorry for the mistake.

> Looking at this patch again, I think it is just broken and (even aside
> from the 31/32 thing) should not be applied.

I have seen in the september answer that you says that xlib should be cor=
rected.
In fact, I do not understand the behaviour of XG/SetPointerMapping since =
the
third argument seems to be ignored in a certain sense.

>
> I guess the cause of the original segfault was that "buts" is set to a
> value greater than six and hence the XSetPointerMapping() call runs off
> the end of the array. However, the solution presented in the patch,
> i.e. just ignoring the return value from XGetPointerMapping()
> altogether, doesn't seem too good either since this will cause
> XSetPointerMapping() to read uninitialised garbage from the balance of
> the array.
>
> A minimal fix for the original crash would probably be to insert
> something like:
>
> if (buts > sizeof(map))
>   buts =3D sizeof(map);
>
> after the XGetPointerMapping() call.

I will try this. (and will try to remember what was exactly the problem).

> A slightly better fix would
> perhaps be to make an initial call to XGetPointerMapping() with nmap=3D=
0
> to find out how many buttons are present, then to dynamically allocate
> an array of the right size and read the mapping into it.

Sorry, it is beyond my capabilities.


Thanks,

Alain


