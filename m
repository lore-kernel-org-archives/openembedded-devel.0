Received: from [64.233.184.238] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JVs25-0008OE-JU
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Mar 2008 18:31:43 +0100
Received: by wr-out-0506.google.com with SMTP id c30so16102379wra.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Mar 2008 09:30:24 -0800 (PST)
Received: by 10.100.135.16 with SMTP id i16mr18104880and.9.1204479024186;
	Sun, 02 Mar 2008 09:30:24 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Sun, 2 Mar 2008 09:30:24 -0800 (PST)
Message-ID: <c384c5ea0803020930s27303ee1q2719373db77fd8ba@mail.gmail.com>
Date: Sun, 2 Mar 2008 18:30:24 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.233.184.238
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Multiple bitbake and a shared DL_DIR location - race conditions?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Mar 2008 17:31:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

in setting up a few automated builds, I have shared the DL_DIR amongst
the builds.

I would like to allow the builds to overlap in time, at least make
sure the builds are robust to this, but I doubt this is possible at
all.

Are there any race conditions with the current approach?

I.e. what if two fetch tasks from concurrent instances of bitbake
decide to download a package?

Regards,
-- 
Leon


