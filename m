Received: from [64.233.184.226] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <shawn.t.rutledge@gmail.com>) id 1JH7kU-0003QX-T3
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2008 02:16:23 +0100
Received: by wr-out-0506.google.com with SMTP id c30so747034wra.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2008 17:16:24 -0800 (PST)
Received: by 10.150.124.2 with SMTP id w2mr2614522ybc.2.1200964584797;
	Mon, 21 Jan 2008 17:16:24 -0800 (PST)
Received: by 10.150.137.16 with HTTP; Mon, 21 Jan 2008 17:16:24 -0800 (PST)
Message-ID: <d9a6586e0801211716q5c431bd1h96cdc5c77e42a5b1@mail.gmail.com>
Date: Mon, 21 Jan 2008 18:16:24 -0700
From: "Shawn Rutledge" <shawn.t.rutledge@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1986714322.20080122010325@vanille-media.de>
MIME-Version: 1.0
References: <200801211408.31701.openembedded@haerwu.biz>
	<13810087643.20080121191622@gmail.com>
	<200801212053.17632.openembedded@haerwu.biz>
	<942022707.20080122001050@gmail.com>
	<1986714322.20080122010325@vanille-media.de>
Subject: Re: Bug 2430 -- TrueType fonts handling and solution for it
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
X-List-Received-Date: Tue, 22 Jan 2008 01:16:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> Any ideas/objections?

Why does there need to be a font list on the filesystem?  Is it
prohibitive for a GUI to scan all the font files on startup?  I'm
guessing it is...

Well how about a FUSE filesystem which notices when a font file is
changed, and automatically updates the font list?  It's just a sort of
cache which contains the font name and some other metadata right?
Something like what you generate using mkfontdir on X?  Or maybe FUSE
is not even necessary... just put the timestamp into the list, for
each entry, then some init script can stat() each font file, and for
each file whose timestamp has changed or it does not have an entry at
all, update the list.

Eventually filesystems ought to have extended metadata.  Some do
already.  Then you could query the extended attributes of a font file
without having to open the font itself.

IMO installing a font, on any OS, ought to be no harder than copying
the file into the right place.


