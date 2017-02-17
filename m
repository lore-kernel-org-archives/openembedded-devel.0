Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 08D9771BD4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 10:40:02 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170217104001566_0685
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 02:40:01 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [216.191.234.70] (port=17204 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cefxD-000464-G4 for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2017 05:39:55 -0500
Date: Fri, 17 Feb 2017 05:39:53 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702170515100.11041@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: DEPENDS += "module-build-perl-native" versus "libmodule-build-perl-native"?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Feb 2017 10:40:03 -0000
Content-Type: text/plain; charset=US-ASCII


  i'm sure i asked about this before, but i currently have a hacky
workaround in a build because of the mixture of DEPENDS mentioned in
the subject line.

  first, i've pulled down the meta-cpan layer, where you can see the
consistency of recipes that depend on a native build of the perl build
module:

$ grep -rh "DEPENDS.*module-build-perl-native" *
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
DEPENDS += "module-build-perl-native"
$

and, predictably, the meta-cpan layer provides that very recipe:

  module-build-perl_0.4216.bb

OTOH, the meta-openembedded/meta-perl layer takes a slightly
different approach:

$ grep -r "DEPENDS.*module-build-perl-native" *
recipes-perl/libhtml/libhtml-tree-perl_5.03.bb:DEPENDS += "libmodule-build-perl-native \
$

and provides the equivalent(?) recipe:

  libmodule-build-perl_0.31.bb

the last time i checked, trying to mix those two layers verbatim
generated a build error, since i include recipes which combine the two
dependencies, and try to install the identical content at the same
location. clearly(?), i should restrict the build-time dependencies to one or
the other of those recipes for the native perl build module.

  is this even considered an issue that should be resolved? it seems
that if layers are catalogued at the https://layers.openembedded.org/,
they should be compatible and play nicely together. in this case, it's
just a naming convention incompatibility -- as i recall, the OE naming
convention for perl modules is "lib....-perl", while the meta-cpan
does something different; hence, the problem.

  thoughts? should some names be cleaned up to prevent this?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


