Return-Path: <richard.leitner@skidata.com>
Received: from mail.bubus.at (bubus.at [81.19.156.191])
	by mail.openembedded.org (Postfix) with ESMTP id 860C37C4F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:01:45 +0000 (UTC)
Received: from pcleri (unknown [91.230.2.244])
	by mail.bubus.at (Postfix) with ESMTPSA id EBF296C20001;
	Mon, 27 Jan 2020 14:01:44 +0100 (CET)
Date: Mon, 27 Jan 2020 14:01:43 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Message-ID: <20200127130143.GF2982185@pcleri>
References: <20200127112451.165555-1-richard.leitner@skidata.com>
	<20200127112451.165555-4-richard.leitner@skidata.com>
	<c5c24b0d8f7b6c1dca8e55d4acb6a050984e9716.camel@andred.net>
MIME-Version: 1.0
In-Reply-To: <c5c24b0d8f7b6c1dca8e55d4acb6a050984e9716.camel@andred.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 3/4] openjre-8: fix debuginfo fixup in do_install
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
X-List-Received-Date: Mon, 27 Jan 2020 13:01:45 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jan 27, 2020 at 11:37:51AM +0000, André Draszik wrote:
> Hi,
> 
> On Mon, 2020-01-27 at 12:24 +0100, Richard Leitner wrote:
> > Based on a patch sent by Jacob Kroon.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > Cc: Jacob Kroon <jacob.kroon@gmail.com>
> > ---
> >  recipes-core/openjdk/openjre-8_242.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/recipes-core/openjdk/openjre-8_242.bb b/recipes-core/openjdk/openjre-8_242.bb
> > index 4ed2e6b..2c8a6a5 100644
> > --- a/recipes-core/openjdk/openjre-8_242.bb
> > +++ b/recipes-core/openjdk/openjre-8_242.bb
> > @@ -11,7 +11,7 @@ do_install() {
> >      cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
> >      chown -R root:root ${D}${JRE_HOME}
> >      install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
> > -    find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
> > +    [ -d ${D}${JDK_HOME} ] && find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
> 
> Does this line make sense? The JRE build should not produce any files in the JDK_HOME
> directory, I think?

True ;-)

> 
> So the only 'fix' this is doing is to silence 'find' to not print a warning about a
> directory it can't find?
> 
> Shouldn't the line be dropped completely instead?
> 
> Should we worry if the JRE build (sometimes?) places files into JDK_HOME?

Good catch. Thanks.
It seems this was a copy'n'paste error from my side intially.
Furthermore openjre doesn't create any debuginfo files, therefore I'll
modify this patch.

Thanks again.

regards;rl

> 
> 
> A.
> 
> >  }
> >  
> >  FILES_${PN}_append = "\
> > -- 
> > 2.24.1
> > 
> 

