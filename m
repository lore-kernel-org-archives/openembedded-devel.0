Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NTjZN-0005ec-PR
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 23:14:08 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8931A1100098
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jan 2010 23:12:00 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CBD161100093
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jan 2010 23:11:59 +0100 (CET)
Received: from rhein.familie-heinold.de (f052066192.adsl.alicedsl.de
	[78.52.66.192]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jan 2010 23:11:59 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 80B863C118; Sat,  9 Jan 2010 23:11:58 +0100 (CET)
Date: Sat, 9 Jan 2010 23:11:58 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100109221158.GA1444@rhein.zuhause.netz>
References: <loom.20100109T213305-664@post.gmane.org>
MIME-Version: 1.0
In-Reply-To: <loom.20100109T213305-664@post.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building classpath / ecj-initial fails
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
X-List-Received-Date: Sat, 09 Jan 2010 22:14:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

jamvm 1.5 needs classpath-0.98, we don't use classpath-0.98  yet as default
because there were some issues with cacao. So add
PREFFERED_VERSION_classpath = "0.98" 
to your local.conf and it should work.

Bye Henning


