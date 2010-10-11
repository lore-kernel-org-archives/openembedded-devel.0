Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P5GwQ-0000LQ-1l
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 13:53:18 +0200
Received: by bwz9 with SMTP id 9so571307bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 04:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=ivOxGyfR4vYzD61RXY4j74KxzilWIxfYtzqJdQbw2rM=;
	b=twHlyLbi4yfjqR8cL1Wj2ZBFygsu/gh2lroVbTrhl36T3FxX8R1rjN4+hBFlf98daG
	tBwHtmavtx/n51RutwdtxNJID+I3jPLOMVmrbW2C6sZgYTt7/Y0Rin8ZI/Wofd5Eq7Ua
	/stcRD256Mlf83OrP8ZXwJxwVa/ZmBfk2cKNc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=o4aOWEAABZWFlLPYmGfwTULUhcHO+Wo7MihTnSeJR+E2LaFhhhs56JQ0HbxVn47/wT
	9t/PnOL3BiJzWU6Bre+b5tv82DUqvE0VGf6RAYWcmk6sMJTktJSj5N+umFm7LfzoKnKy
	+qRUcuFljPEKbJwNBnDJ5xlX3+ETZhcjSy9Pw=
Received: by 10.204.123.136 with SMTP id p8mr4954597bkr.148.1286797972657;
	Mon, 11 Oct 2010 04:52:52 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id g8sm723608bkg.23.2010.10.11.04.52.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 11 Oct 2010 04:52:50 -0700 (PDT)
Date: Mon, 11 Oct 2010 13:52:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101011115250.GB3465@jama>
References: <AANLkTimQBC0f8J-J_E+XADErZMAGzgNHRKwUemXThgPy@mail.gmail.com>
	<4CB2F93C.2060609@xora.org.uk> <4CB2F9AF.6000607@xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <4CB2F9AF.6000607@xora.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: git & SRCREV
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
X-List-Received-Date: Mon, 11 Oct 2010 11:53:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 11, 2010 at 12:49:03PM +0100, Graeme Gregory wrote:
>  On 11/10/2010 12:47, Graeme Gregory wrote:
> >  On 11/10/2010 12:45, Frans Meulenbroeks wrote:
> >> Roughly once a week i see a question on irc about someone getting a
> >> git error: "fatal: not a valid object name 1"
> >> this is because SRCREV is not defined for e.g. that machine.
> >> What about extending bitbake (guess it is in there) with an error
> >> message that more clearly explains the problem?
> >>
> > As 1 can never be valid for git, how about a if SRCREV==1 then exlode in
> > git.bbclass
> >
> Of course I meant the git class in the fetcher in bitbake :-)

if you want it to explode then you can use:

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index c1a65e2c..f7a876d 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -579,7 +579,7 @@ UPDATECOMMAND = "ERROR, this must be a BitBake bug"
 UPDATECOMMAND_cvs = "/usr/bin/env 'PATH=${PATH}' cvs -d${CVSROOT} update -d -P ${CVSCOOPTS}"
 UPDATECOMMAND_svn = "/usr/bin/env svn update --non-interactive --trust-server-cert --force --accept theirs-full ${SVNCOOPTS}"
 SRCDATE = "${DATE}"
-SRCREV = "1"
+SRCREV = "INVALID"
 SRCPV = "${@bb.fetch.get_srcrev(d)}"
 AUTOREV = "${SRCPV}"

problem is that you'll get lots of
NOTE: Handling BitBake files: / (6820/7151) [95 %]ERROR: Please set SRCREV to a valid value while parsing /OE/dev/recipes/pimlico/contacts_svn.bb
NOTE: <class 'bb.fetch.InvalidSRCREV'>:Please set SRCREV to a valid value while evaluating:
${@bb.fetch.get_srcrev(d)}
NOTE: <class 'bb.fetch.InvalidSRCREV'>:Please set SRCREV to a valid value while evaluating:
0.8+svnr${SRCPV}
NOTE: <class 'bb.fetch.InvalidSRCREV'>:Please set SRCREV to a valid value while evaluating:
${PN}-${EXTENDPE}${PV}-${PR}
NOTE: <class 'bb.fetch.InvalidSRCREV'>:Please set SRCREV to a valid value while evaluating:
${PF}:${P}:${PN}:${BP}:${BPN}:files:.
ERROR: Please set SRCREV to a valid value while parsing /OE/dev/recipes/pimlico/contacts_svn.bb

even for recipes not in your target RDEPENDS..

regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


