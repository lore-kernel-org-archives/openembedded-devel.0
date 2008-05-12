Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JvUzg-0000Mi-2Z
	for openembedded-devel@openembedded.org; Mon, 12 May 2008 12:10:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4CA9g39012934
	for <openembedded-devel@openembedded.org>;
	Mon, 12 May 2008 11:09:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12745-02 for <openembedded-devel@openembedded.org>;
	Mon, 12 May 2008 11:09:33 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4CA8NbN012809
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 12 May 2008 11:08:23 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080512092007.GC3841@cimmeria.hyboria>
References: <20080512001723.81DEF1892C6@amethyst.openembedded.net>
	<20080512092007.GC3841@cimmeria.hyboria>
Date: Mon, 12 May 2008 11:08:23 +0100
Message-Id: <1210586903.4981.26.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev autotools.bbclass: from OM.	Needed as	commit 85a5e185b6a21e42e4243ad17befe40373025e0e alone will	break	uclibc/gettext builds.
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
X-List-Received-Date: Mon, 12 May 2008 10:10:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-05-12 at 10:20 +0100, Graeme Gregory wrote:
> On Mon, May 12, 2008 at 02:17:23AM +0200, likewise commit wrote:
> > autotools.bbclass: from OM. Needed as commit 85a5e185b6a21e42e4243ad17befe40373025e0e alone will break uclibc/gettext builds.
> > 
> I was specifically asked not to merge this from OM to OE until more
> investigation was carried out.
> 
> > -		cp -fpPR "$from"/* "$to"
> > +		cp -fpPR -t "$to" "$from"/*
> >  
> Isnt this a reverse diff of a previous change for no real reason?

Yes, that reverts a fix that was made and is unrelated to the problem
you're trying to fix :(

> > -				echo "oe_libinstall -C ${S} -so $(basename $i .la) ${STAGING_LIBDIR}/${dir}"
> > -				oe_libinstall -C ${S} -so $(basename $i .la) ${STAGING_LIBDIR}/${dir}
> > +				echo "oe_libinstall -C ${STAGE_TEMP}/${libdir}/${dir} -so $(basename $i .la) ${STAGING_LIBDIR}/${dir}"
> > +				oe_libinstall -C ${STAGE_TEMP}/${libdir}/${dir} -so $(basename $i .la) ${STAGING_LIBDIR}/${dir}
> 
> And this section was under discussion with Holger, RP and myself.
> 
> I dont think this commit should have gone in without discussion.

and whilst this "fixes" certain issues, it will cause all kinds of other
subtle changes. What we don't know is whether that will result in
breakage or not. It hasn't for OpenMoko but that doesn't mean its the
right thing to do.  I doubt you've taken the time to understand what
this does and what the potential implications are :(.

I think the proper fix will be to stop using oe_libinstall entirely here
and instead do something like:

http://www.rpsys.net/openzaurus/temp/autotools.patch

This patch is as yet untested but I'll try and give it some testing...

Cheers,

Richard







