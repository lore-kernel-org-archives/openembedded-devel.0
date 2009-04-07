Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Lr8Ko-0000wY-Co
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 12:15:22 +0200
Received: from andromeda.vanille.de (e180153228.adsl.alicedsl.de
	[85.180.153.228])
	by drlauer-research.com (Postfix) with ESMTP id D664B584129
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2009 12:39:51 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Tue, 7 Apr 2009 12:12:18 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.27-11-generic; KDE/4.2.2; x86_64; ; )
MIME-Version: 1.0
Message-Id: <200904071212.18247.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: DEPLOY_DIR / packaged staging / persistent toolchains
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
X-List-Received-Date: Tue, 07 Apr 2009 10:15:25 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi folks,

I just stumbled over something that surprises me. I have set DEPLOY_DIR 
outside TMP for a while (which works fine). Now when I remove the TMPDIR to 
start a new build from scratch, I can no longer build anything. Apparantly OE 
thinks I do no longer need a toolchain, since it does not attempt to built 
one. I need to remove the whole DEPLOY_DIR to be able to do any builds again.

Wasn't the idea of packaged staging to be able to keep core packages and the 
toolchain intact when removing TMPDIR? If I understodd this wrong, how can I 
do something like that these days? Would it be sufficient to set CROSS_DIR 
outside TMPDIR?

Cheers,

Mickey.



