Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Ju4PX-0000ic-Nf
	for openembedded-devel@openembedded.org; Thu, 08 May 2008 13:35:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m48BZ3sV023284
	for <openembedded-devel@openembedded.org>;
	Thu, 8 May 2008 12:35:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22933-06 for <openembedded-devel@openembedded.org>;
	Thu,  8 May 2008 12:34:51 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m48BY3xI023215
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 8 May 2008 12:34:03 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0805080315o4aea668av311a9a6374db68e1@mail.gmail.com>
References: <c384c5ea0805071507u747f820fga7e797c26243a367@mail.gmail.com>
	<fvuc31$vci$1@ger.gmane.org>
	<c384c5ea0805080315o4aea668av311a9a6374db68e1@mail.gmail.com>
Date: Thu, 08 May 2008 12:34:03 +0100
Message-Id: <1210246443.5006.39.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Auto bi-sect build server idea
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 08 May 2008 11:35:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-05-08 at 12:15 +0200, Leon Woestenberg wrote:
> Hello Koen,
> 
> On Thu, May 8, 2008 at 10:02 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> > > Define a few local.conf's that are known-good.
> >  What is different between those confs? I haven't edited my local.conf in
> > months and still build different configurations every day.
> >
> Ah yes, you specify stuff on the command line prior to building?
> 
> MACHINE=foobar bitbake etc.?
> 
> > > if the build completes, tag the revision as "last known good".
> > > if the build fails, tag the revision as "latest known bad", and
> > >
> >
> >  Tags would be a bad idea, we can use certs with monotone, which allow a
> > free-from key:value structure, so you can do
> >
> I didn't mean tagging in the SCM context, just local to the build
> server (i.e. local to the bisect script). Should have made this more
> clear, as I don't intend to clutter the OE mtn db.
> 
> Should check if mtn supports bi-sect, otherwise cook up a script that does this.

There is another bisect which would be useful too. You know a package
foo from svn failed to compile somewhere between revisions 345 and 876.
Can bitbake tell you which commit broke things?

Both should be possible with our current technology, its just a question
of implementing them!

Cheers,

Richard




