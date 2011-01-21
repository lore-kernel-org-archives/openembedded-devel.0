Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1PgFeV-0007VL-9M
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 12:59:39 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 92FCB110025A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 12:58:58 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BA0C211000E7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 12:58:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225005010.adsl.alicedsl.de
	[92.225.5.10]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 12:58:57 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 3A4073C346; Fri, 21 Jan 2011 12:58:21 +0100 (CET)
Date: Fri, 21 Jan 2011 12:58:21 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110121115820.GA25415@mail.familie-heinold.de>
References: <1295608972.12720.47.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1295608972.12720.47.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: vdr: minimal-uclibc: task `compile` fails with `undefined reference to `_nl_msg_cat_cntr'`
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
X-List-Received-Date: Fri, 21 Jan 2011 11:59:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

seems vdr is not checking for libiconv and gettext the right way and so the right libs for linking
are missing. The utime warning is coding
stuff.

Bye Henning


