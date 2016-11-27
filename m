Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 209EF71ABB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2016 12:18:52 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161127121852749_0484
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2016 12:18:52 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [174.118.92.171] (port=39626 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cAyPu-00061O-LW for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2016 07:18:46 -0500
Date: Sun, 27 Nov 2016 07:17:39 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611270710250.21400@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: does recipe naming convention allow 'libcgi-perl_4.28.bb:RPROVIDES_${PN} += "perl-module-cgi"'?
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
X-List-Received-Date: Sun, 27 Nov 2016 12:18:56 -0000
Content-Type: text/plain; charset=US-ASCII


  (apparently, i am doomed to poke around in OE perl recipes for the
next little while. le *sigh* ...)

  curious about the following under meta-openembedded/meta-perl:

$ grep -r RPROVIDES *
recipes-perl/libtest/libtest-harness-perl_3.36.bb:RPROVIDES_${PN} += "libapp-prove-perl \
recipes-perl/libio/libio-stringy-perl_2.111.bb:RPROVIDES_${PN} += " libio-atomicfile-perl \
recipes-perl/libmoo/libmoo-perl_2.000002.bb:RPROVIDES_${PN} = " libmethod-inliner-perl \
recipes-perl/libextutils/libextutils-parsexs-perl_3.24.bb:RPROVIDES_${PN} += " libextutils-parsexs-constants-perl \
recipes-perl/libencode/libencode-perl_2.83.bb:RPROVIDES_${PN} += "libencode-alias-perl \
recipes-perl/libhtml/libhtml-tree-perl_5.03.bb:RPROVIDES_${PN} = " libhtml-element-perl \
recipes-perl/librole/librole-tiny-perl_2.000001.bb:RPROVIDES_${PN} = " librole-tiny-perl \
recipes-perl/libcgi/libcgi-perl_4.28.bb:RPROVIDES_${PN} += "perl-module-cgi"
$

  it's that last line that's odd ... i thought the naming convention
was that the "perl-module-" prefix was reserved for modules generated
by the base build of perl itself, while independent recipes used names
with prefixes of "libxxx-yyyy-perl" and, therefore, provided, well,
exactly that.

  so what's the rationale for the RPROVIDES in that last example?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


