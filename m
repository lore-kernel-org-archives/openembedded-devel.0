Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P8a0g-0003U4-2I
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 16:52:54 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 9DB09275CE43; Wed, 20 Oct 2010 16:50:48 +0200 (CEST)
Received: from [192.168.1.142] (p5489E00E.dip.t-dialin.net [84.137.224.14])
	by gravedo.de (Postfix) with ESMTPSA id 9B833275CE2E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 16:50:47 +0200 (CEST)
Message-ID: <4CBF01C6.7030409@gravedo.de>
Date: Wed, 20 Oct 2010 16:50:46 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12pre) Gecko/20101011 Shredder/3.1.6pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CBEB7E8.5020109@nedap.com>	<AANLkTikBiKGuQYXCdi_QMirA7_AjQn9b0A0CWtmkMu90@mail.gmail.com>	<29F88E4E-18CC-4CD2-8A76-5C78ED4EDAC7@nikom.net>
	<20101020140543.GN3324@jama>
In-Reply-To: <20101020140543.GN3324@jama>
X-Enigmail-Version: 1.1.2
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building gcc-cross-initial for armv5te
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
X-List-Received-Date: Wed, 20 Oct 2010 14:53:33 -0000
X-List-Received-Date: Wed, 20 Oct 2010 14:53:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 20.10.2010 16:05, Martin Jansa wrote:
> On Wed, Oct 20, 2010 at 09:26:32AM -0400, Nik wrote:
>> What os are you compiling on?  Can you run the cross compile gcc from the command line and get the no input files message?
> 
> Related log from #oe - as I'm lazy to type it again :)
> 

As I tried a little bit more I tracked it down to the commit
f1148d26740e57cba4fe29fd78c234359868a50e ("binutils.inc: Filter out
--with-sysroot for target binutils"). If you revert this one and do a
fresh build (rm -rf tmp) everything compiles fine.

regards,
morphis



