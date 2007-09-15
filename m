Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1IWWr7-0001MN-DB
	for openembedded-devel@openembedded.org; Sat, 15 Sep 2007 14:34:39 +0200
Received: (qmail 10521 invoked by uid 813007); 15 Sep 2007 12:31:10 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 15 Sep 2007 12:31:09 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
User-Agent: KMail/1.9.7
References: <200709111318.52432.openembedded@haerwu.biz>
	<46EA57E9.4020202@dominion.kabel.utwente.nl>
	<46EB97FE.1030906@student.utwente.nl>
In-Reply-To: <46EB97FE.1030906@student.utwente.nl>
MIME-Version: 1.0
Date: Sat, 15 Sep 2007 14:31:07 +0200
Message-Id: <200709151431.07995.openembedded@haerwu.biz>
Subject: Re: Splitting up bluez in a sane way, was Re: Task-base is big :(
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
X-List-Received-Date: Sat, 15 Sep 2007 12:34:43 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 15 wrze=B6nia 2007, Koen Kooi napisa=B3:
> Koen Kooi schreef:
> > Marcin Juszkiewicz schreef:
> >> Dnia pi=B1tek, 14 wrze=B6nia 2007, Koen Kooi napisa=B3:
> >>> What can be done is to make the default bluez-utils build only
> >>> build bluez-utils* and have seperate recipes for all the 3rdparty
> >>> stuff it builds:
> >>> That would solve both buildtime and runtime issues.
> >>>
> >>> What do you think?
> >>
> >> bluez-utils-cups, bluez-utils-gstreamer, bluez-utils-alsa? Sounds
> >> good for me - especially first both.
> >
> > bluez-utils-cups and bluez-utils-alsa can be done for sure, but I
> > haven't looked at where gstreamer comes in and if it can be a
> > seperate package.
>
> What do you think of this patch?

Looks ok - in cups you can disable hid2hci and in both probably few other=20
options can be disabled but their compile time is small rather so better=20
leave as they are.

Did you tried to create separate gst-plugin-bluez recipe?

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

 Learn the facts and make up your own damn mind. That's why you have one.




