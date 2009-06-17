Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MGjJ1-0005Y4-RL
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 02:47:12 +0200
Received: (qmail 23750 invoked from network); 17 Jun 2009 00:36:47 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 16 Jun 2009 17:36:47 -0700
Date: Tue, 16 Jun 2009 17:36:47 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090617003646.GA15477@smtp.west.cox.net>
References: <37367b3a0906161523p3bca0c45k69f0415fa5796e85@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <37367b3a0906161523p3bca0c45k69f0415fa5796e85@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] Add basic support for i.MX27ADS board
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
X-List-Received-Date: Wed, 17 Jun 2009 00:47:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 16, 2009 at 07:23:27PM -0300, Alan Carvalho de Assis wrote:

> This patch adds basic support on OpenEmbedded for i.MX27ADS board.
> 
> It uses the mainline kernel instead Freescale one. The mainline doesn't
> have support for USB, Camera, etc.

Since this is using mainline kernel, you should start a linux_2.6.30.bb
(based on 2.6.29) and add DEFAULT_PREFERENCE_mx27ads = "1" to that,
rather than adding a new kernel recipe.  The machine.conf looks fine
otherwise, however.

-- 
Tom Rini


