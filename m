Received: from [63.80.53.70] (helo=smtp-relay1.palm.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rich.pixley@palm.com>) id 1JWgYk-0005jO-BD
	for openembedded-devel@openembedded.org; Wed, 05 Mar 2008 00:28:37 +0100
X-IronPort-AV: E=Sophos;i="4.25,444,1199692800"; 
   d="scan'208";a="4863142"
Received: from unknown (HELO mailhost02.palm.com) ([148.92.223.90])
	by smtp-relay1.palm.com with ESMTP; 04 Mar 2008 15:27:13 -0800
Received: from flamingo.palm1.palmone.com (flamingo.palm1.palmone.com
	[148.92.248.89])
	by mailhost02.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m24NRCOM027869; Tue, 4 Mar 2008 15:27:12 -0800 (PST)
Message-ID: <47CDDAD0.7090802@palm.com>
Date: Tue, 04 Mar 2008 15:27:12 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
X-SA-Exim-Connect-IP: 63.80.53.70
X-SA-Exim-Mail-From: rich.pixley@palm.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: curl-certs in wrong directory?
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
X-List-Received-Date: Tue, 04 Mar 2008 23:28:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm afraid my environment is somewhat removed from standard OE, but when 
building ipkg files, I'm seeing the resulting ipkg for curl-certs end up 
in the "arm" subdirectory rather than the "all" subdirectory.

Is anyone else seeing this?

I looked through package_ipk.bbclass, but it's not at all clear to me 
how multiple packages in a single component might ever end up in 
different directories.  And I'm not finding any examples, (in my 
somewhat removed environment), of any other packages successfully 
accomplishing this.

--rich


