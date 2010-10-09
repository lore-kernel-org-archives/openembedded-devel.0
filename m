Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1P4WiM-0005yr-4J
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 12:31:42 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 888D811000A8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Oct 2010 12:31:17 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CB165110009D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Oct 2010 12:31:16 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052225097.adsl.alicedsl.de
	[78.52.225.97]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Oct 2010 12:31:16 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 5B0643C0FD; Sat,  9 Oct 2010 12:30:54 +0200 (CEST)
Date: Sat, 9 Oct 2010 12:30:54 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101009103053.GA22759@rhein.zuhause.netz>
References: <1286612941.3831.24.camel@mattotaupa>
	<AANLkTi=x_-moOb3Xv02rVZkw3Uq5BhLjBFstbiqtZR1E@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=x_-moOb3Xv02rVZkw3Uq5BhLjBFstbiqtZR1E@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DEPENDS not honored: `do_configure` runs before `do_populate_sysroot` of dependencies
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
X-List-Received-Date: Sat, 09 Oct 2010 10:31:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 09, 2010 at 11:52:39AM +0200, Frans Meulenbroeks wrote:
> +DEPENDS_virtclass-native_append = " tcl-native"

Please dont quote the not so good solution and which later was superceeded by:

DEPENDS_append_virtclass_native = " tcl-native"


Bye Henning


