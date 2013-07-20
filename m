Return-Path: <stefan@datenfreihafen.org>
Received: from sirius.lasnet.de (sirius.lasnet.de [78.47.116.19])
	by mail.openembedded.org (Postfix) with ESMTP id 37BAD60FEE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 19:17:36 +0000 (UTC)
Received: from host-78-149-134-157.as13285.net ([78.149.134.157]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.69 #1)
	id 1V0cer-0004lX-F6 by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Sat, 20 Jul 2013 21:17:35 +0200
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.80)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1V0cer-0003Mc-AP; Sat, 20 Jul 2013 20:17:33 +0100
Date: Sat, 20 Jul 2013 20:17:33 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20130720191733.GA12568@novatech.datenfreihafen.org>
References: <1374266831-2316-1-git-send-email-stefan@datenfreihafen.org>
	<20130720154923.7f559faf@e6520eb>
MIME-Version: 1.0
In-Reply-To: <20130720154923.7f559faf@e6520eb>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qtbase-native_5.0.2: Also use gcc 4.8 fix for the native package.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Jul 2013 19:17:36 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello.

On Sat, 2013-07-20 at 15:49, Eric Bénard wrote:
> 
> Le Fri, 19 Jul 2013 21:47:11 +0100,
> Stefan Schmidt <stefan@datenfreihafen.org> a écrit :
> 
> > When running on a host with gcc 4.8 we run into a compile problem with stricter
> > gcc. This was already fixed for the target packages so we only re-use the patch.
> > 
> that's already fixed :
> https://github.com/meta-qt5/meta-qt5/commit/75291e7614115dc89045fcf6650bbdead071da03

Indeed. The setup I was working with had the meta-qt layer pinned to a
rev before your change. I totally did not realise that and made my
patch base don thois old rev.

Sorry for the noise and thanks for pointing it out. :)

regards
Stefan Schmidt

