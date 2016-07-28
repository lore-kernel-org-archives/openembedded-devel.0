Return-Path: <denis@denix.org>
X-Greylist: delayed 3601 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Jul 2016 19:38:49 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 6EBE96072C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2016 19:38:49 +0000 (UTC)
Received: from vz-proxy-m007.mx.aol.com ([64.236.83.14])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OB100GPJFS6MF50@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	28 Jul 2016 13:38:31 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=kj9zAlcOel0A:10 a=cAmyUtKerLwA:10	a=0gcC27t9AAAA:8 a=sozttTNsAAAA:8
	a=Q4-j1AaZAAAA:8 a=NCEwR_1qjzg5VC2yO8oA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 0ced32fe; Thu, 28 Jul 2016 18:38:30 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 755141620C3; Thu,
	28 Jul 2016 14:38:30 -0400 (EDT)
Date: Thu, 28 Jul 2016 14:38:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20160728183830.GK8521@denix.org>
References: <1469725226-14727-1-git-send-email-denis@denix.org>
	<CA+chaQcBrDH-Ns30KX=fuBqzKPBn4Xh3zkgfOZwpb9=PO5UKhQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+chaQcBrDH-Ns30KX=fuBqzKPBn4Xh3zkgfOZwpb9=PO5UKhQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][krogoth][PATCH] cmake_qt5.bbclass: when using _prepend don't forget to add space at the end
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
X-List-Received-Date: Thu, 28 Jul 2016 19:38:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jul 28, 2016 at 08:08:35PM +0200, Martin Jansa wrote:
> Is the same needed in master branch?

Yes, just sent separately - had to update commit id, as I used the one from
krogoth below...

-- 
Denys


> On Thu, Jul 28, 2016 at 7:00 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Previous commit aacd63f10dd58acf7bf6138e2f4734e37dcf0420 introduced a bug
> > by
> > using _prepend w/o a space at the end, resulting in corrupted EXTRA_OEMAKE
> > variable in packages that inherit cmake_qt5.bbclass.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  classes/cmake_qt5.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/classes/cmake_qt5.bbclass b/classes/cmake_qt5.bbclass
> > index 4dc897b..3180fd6 100644
> > --- a/classes/cmake_qt5.bbclass
> > +++ b/classes/cmake_qt5.bbclass
> > @@ -32,4 +32,5 @@ EXTRA_OECMAKE_prepend = " \
> >      -DOE_QMAKE_PATH_QT_DOCS=${OE_QMAKE_PATH_QT_DOCS} \
> >      -DOE_QMAKE_PATH_QT_SETTINGS=${OE_QMAKE_PATH_QT_SETTINGS} \
> >      -DOE_QMAKE_PATH_QT_EXAMPLES=${OE_QMAKE_PATH_QT_EXAMPLES} \
> > -    -DOE_QMAKE_PATH_QT_TESTS=${OE_QMAKE_PATH_QT_TESTS}"
> > +    -DOE_QMAKE_PATH_QT_TESTS=${OE_QMAKE_PATH_QT_TESTS} \
> > +"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

