Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <EliSko@FastMail.fm>) id 1KnCDL-0007WD-4D
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Oct 2008 15:03:04 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 957D7178399
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2008 08:58:25 -0400 (EDT)
Received: from web6.messagingengine.com ([10.202.2.215])
	by compute1.internal (MEProxy); Tue, 07 Oct 2008 08:58:25 -0400
Received: by web6.messagingengine.com (Postfix, from userid 99)
	id 7921D44FC1; Tue,  7 Oct 2008 08:58:25 -0400 (EDT)
Message-Id: <1223384305.24707.1277967707@webmail.messagingengine.com>
X-Sasl-Enc: VT91D/rsWYSyhYOxuozhnaEOGz0CV/jetErULUmdwi0F 1223384305
From: "Eliyahu Skoczylas" <EliSko@FastMail.fm>
To: "Developers@OE.net" <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
References: <1223374579.21329.1277940603@webmail.messagingengine.com>
	<gcffp7$7pm$1@ger.gmane.org>
	<1223380608.10806.1277957855@webmail.messagingengine.com>
	<gcfkki$o84$1@ger.gmane.org>
In-Reply-To: <gcfkki$o84$1@ger.gmane.org>
Date: Tue, 07 Oct 2008 14:58:25 +0200
Subject: Re: PHP on PPC little-endian? Conflicts w/ ncurses big-endian
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
X-List-Received-Date: Tue, 07 Oct 2008 13:03:48 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

On Tue, 07 Oct 2008 14:28:02 +0200, "Koen Kooi"
<k.kooi@student.utwente.nl> said:
> On 07-10-2008 13:56, Eliyahu Skoczylas wrote:
> > +++ Why is php-5.2.6-r2 (and php-5.2.0-r1 before it) using a HOST
> > autoreconf when building (and linking to) a TARGET binary?
> 
> because your host can't run target binaries

Thank you.  I know that.

I'm asking why several versions of PHP are trying to do what we all
agree can NOT be done when all other builds in this environment, with
the same site.conf, local.conf, minimal.conf, and MACHINE.conf did NOT
do that and worked correctly.

Also note that php-5.1.4-r2 does NOT do that.  (I just rebuilt the
system with PHP 5.1.4 and am testing it.)

This behavior started with php-5.2.0.-r1, AFAICT.


-    Eliyahu
--
Eliyahu Skoczylas    +972 (54) 214-1505
While <EliSko@Eli-Sko.com> is temporarily down, please use <EliSko@FastMail.fm>, instead.



