Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S4YiL-0007hy-Aj
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 15:16:37 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 423C1F811F4; Mon,  5 Mar 2012 07:08:03 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 1CE27F811F3;
	Mon,  5 Mar 2012 07:08:02 -0700 (MST)
Message-ID: <4F54C8C2.5020003@mlbassoc.com>
Date: Mon, 05 Mar 2012 07:08:02 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-mozilla] Can't access any HTTPS page
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
X-List-Received-Date: Mon, 05 Mar 2012 14:16:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I've added firefox to my platform by adding the meta-mozilla layer
(and it's requirements).  To include firefox, all I did was
   CORE_EXTRA_IMAGE_INSTALL += "firefox"

With this setup, firefox works, but not with any SSL page,
e.g. trying to access https://google.com/mail gives me this
error screen:

Secure Connection Failed
            An error occurred during a connection to accounts.google.com.
        security library: memory allocation failure.
        (Error code: sec_error_no_memory)

   The page you are trying to view can not be shown because the authenticity of the received data could not be verified.
   Please contact the website owners to inform them of this problem. Alternatively, use the command found in the help menu to report this broken site.

Did I miss something?  Has anyone else tried this?

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


