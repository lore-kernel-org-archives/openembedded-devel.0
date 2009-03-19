Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LkF4f-0007Ze-Gq
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 11:02:12 +0100
Received: from andromeda.vanille.de (e180149050.adsl.alicedsl.de
	[85.180.149.50])
	by drlauer-research.com (Postfix) with ESMTP id 7E7FD5843D5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2009 11:27:06 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Mar 2009 11:01:08 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.27-11-generic; KDE/4.2.0; x86_64; ; )
References: <1237328436.20770.57.camel@homestead>
	<20090318000600.GA20384@denix.org>
In-Reply-To: <20090318000600.GA20384@denix.org>
MIME-Version: 1.0
Message-Id: <200903191101.09014.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_PROXY,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Cleaning tmp folder
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
X-List-Received-Date: Thu, 19 Mar 2009 10:02:15 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 18 March 2009 01:06:00 Denys Dmytriyenko wrote:
> On Tue, Mar 17, 2009 at 10:20:36PM +0000, Shane Dixon wrote:
> > I've been digging through the bitbake files and I don't see any recipe
> > for cleaning the tmp folder.  I typically just blow away the entire tmp/
> > folder and build again, but then I'm spending time rebuilding the native
> > packages and crosscompiler.
> >
> > Is there a bitbake recipe for cleaning out all non-native and
> > non-crosscompiler packages from tmp or am I stuck just starting over
> > each time?
>
> If you have packaged staging enabled (see INHERIT += "packaged-staging"),
> you can try setting DEPLOY_DIR_PSTAGE (or entire DEPLOY_DIR) outside of
> TMPDIR.

Note that this doesn't work atm. since DEPLOY_DIR is not using a weak 
assignment in bitbake.conf -- something which I'm changing as we speak.

-- 
:M:



