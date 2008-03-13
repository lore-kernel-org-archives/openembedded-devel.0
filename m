Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1JZj9F-0003iP-Hq
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 09:50:54 +0100
Received: (qmail 27445 invoked by uid 813007); 13 Mar 2008 08:48:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Mar 2008 08:48:40 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Mar 2008 09:48:34 +0100
User-Agent: KMail/1.9.9
References: <200803110807.11368.zecke@selfish.org>
	<1205358843.4530.22.camel@dax.rpnet.com>
	<fr9n05$sm7$1@ger.gmane.org>
In-Reply-To: <fr9n05$sm7$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200803130948.35511.openembedded@haerwu.biz>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: openembedded@haerwu.biz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Thu, 13 Mar 2008 08:50:55 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Wednesday 12 of March 2008, Koen Kooi napisa=B3:
> Richard Purdie schreef:
> | Whilst I think OE will always have a central master .dev repository I
> | see a lot of gain from having branches. I would have happily put the
> | sysroot changes into a branch and likewise the packaged-staging stuff
> | I'm working on. As it is I'm keeping it locally uncommitted with no
> | version tracking since I don't really want to play games with
> | monotone.
>
> Thank you for saying it right out: "I haven't tried to use branches in
> mtn, ever".
> So we only have Holger saying mtn can't merge the dreambox branch, and
> people ignoring what I said about the avr32 branch.

I maintained MTN branches for quite long time (.oz354fam083 and .oz345x).=20
I did not merged them with .dev (as they were for other stuff) but only=20
cherrypicked some revisions .dev <> .oz354x/.oz345fam083.=20

There was one thing which I did not liked - MTN cared more about files and=
=20
their history then about content of those files. I remember situations=20
when it was not possible to cherrypick one line change because there was=20
few revisions difference between .oz354x and .dev versions.=20
Patching .oz354x by hand was the only solution then.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

     Free speech includes the right not to listen, if not interested=20
                                                [Robert A. Heinlein]




