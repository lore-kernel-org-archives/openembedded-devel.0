Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtcS7-0002Rr-Ce
	for openembedded-devel@openembedded.org; Thu, 09 Sep 2010 10:25:56 +0200
Received: by iwn2 with SMTP id 2so901398iwn.6
	for <openembedded-devel@openembedded.org>;
	Thu, 09 Sep 2010 01:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=eIlI6NLGgE5A0itFwNKupR5dTkcMAKtJHn7d/HvD9YU=;
	b=NM9LZCB/HRRcgMuWmiDYT8nxTGdRM5BWHA5xtc7TWKsz6rNQIHOZ0xi43Ql7ws3Q7Q
	Ek4Mmtq9TcPpNH+Ivl+Nav2Hfe6nduauTEYtvziYblq4bBOd2ADFt0gxysbQlpoSC4yt
	RbzoLCfRVGcOroO0DwpVi6BiaAJ0N2YvJ81sY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=bohwdwthWH6UDePlozgTA6TWULw2rRxNlXMbOomKKLxpPydaNGwkjyFxJKlVY9sjSm
	8oiC6YVb/+wsrXd5kN787qXTj3FihnHpEzAoTiw/DTZiQ1uAMpkgRQYQ5sX1eKQ8zqT8
	xUTvfqYsdqSE4HdoVunfz9VZ8i8jM93W5m2r0=
MIME-Version: 1.0
Received: by 10.231.157.135 with SMTP id b7mr11275212ibx.164.1284020701160;
	Thu, 09 Sep 2010 01:25:01 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Thu, 9 Sep 2010 01:25:01 -0700 (PDT)
Date: Thu, 9 Sep 2010 10:25:01 +0200
Message-ID: <AANLkTi=GypXSJV_8VDUQ9dO5oYKSJPtAzUOhvGAquLyd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: double _'s in names
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
X-List-Received-Date: Thu, 09 Sep 2010 08:25:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I noticed that we have some recipes with double underscores in the name.
Not sure how that will parse wrt PN_PV.bb

The recipes are:
clutter/clutter-box2d_0.10.0_git.bb
ntpclient/ntpclient_2007_365.bb
ntpclient/ntpclient_2003_194.bb
rpm2cpio/rpm2cpio-native_1.2_2.bb

The ntpclient ones set PV but not PN (although they use it)
the rpm2cpio and clutter ones do not seem to set PV and PN

Now it might be whether this works because the first _ is used to
split things, but I am not sure whether this is desirable.

It might well be that this error is also related to it:

ERROR: '['/home/hudson/jobs/FM_world/workspace/openembedded/recipes/clutter/clutter-box2d_0.10.0_git.bb']'
RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity
'clutter-box2d' but it wasn't found in any PACKAGE or RPROVIDES
variables of any buildable targets

Haven't had time to dig into that one.

Frans.


