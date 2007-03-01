Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <hvontres@gmail.com>) id 1HMoxq-0001Lt-LE
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2007 18:21:11 +0100
Received: by ug-out-1314.google.com with SMTP id e2so422969ugf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2007 09:21:10 -0800 (PST)
Received: by 10.78.201.2 with SMTP id y2mr183784huf.1172769669818;
	Thu, 01 Mar 2007 09:21:09 -0800 (PST)
Received: by 10.78.17.3 with HTTP; Thu, 1 Mar 2007 09:21:09 -0800 (PST)
Message-ID: <a7f8874a0703010921v6a85a6fet49b184dfbc9b805b@mail.gmail.com>
Date: Thu, 1 Mar 2007 09:21:09 -0800
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45E6FDF8.2040103@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <E1HMgkl-0004SM-Gs@linuxtogo.org>
	<1439152940.20070301165525@vanille-media.de>
	<45E6FDF8.2040103@dominion.kabel.utwente.nl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE policy: remove feed management tools
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
X-List-Received-Date: Thu, 01 Mar 2007 17:21:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Koen, Is there some documentation available on how to properly generate
feeds by hand then? I whould like to do things "correctly", but references
to "munging" things by hand don't help me much at this point.

Thank you very much for any pointers.

On 3/1/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Michael 'Mickey' Lauer schreef:
> > koen commit wrote:
> >> rootfs_ipk: as per OE policy: remove feed management tools
> >
> > Guys, please don't play games. Since it is a handy feature indeed,
> > can we perhaps agree on making this a seperate bbclass to keep both of
> > you satisfied?
>
> All feed management was removed a long time ago from OE because
>
> a) it's out of scope
> b) can't be done right in an automated fashion
>
> And after discovering some bugs in ipkg-utils a while ago it seems you
> have to manually
> munge the Packages file to get something that ipkg will handle correctly
> when upgrading stuff.
>
> So whichever way you look at it it's going to add broken behaviour to OE.
> I don't want to
> explain to users why their 'feeds' don't work because they disabled common
> sense because
> 'OE generated it'.
>
> But but but but but... OE generates feeds now as well!! Right, deploy/ipk
> contains
> subdirectories people could abuse as feeds if they want, but I wouldn't
> recommend it.
>
> So *if* people *need* OE to generate feeds, there you have them. However,
> I strongly
> oppose adding know broken behaviour to satisfy lazy people.
>
> regards,
>
> Koen
>
> PS: find */ -name  "*.ipk" -exec mv  '{}'  ./ \;
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFF5v34MkyGM64RGpERAjI0AJ4tbIeCUQoeurXBhlJ8vdFmQ0AD0QCZAVSW
> EUO+7SF5AFM4BwLZyTj89tc=
> =xAzY
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

