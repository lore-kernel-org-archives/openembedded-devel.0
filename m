Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SV1hC-0002no-JZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 16:28:51 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 993B7F81242; Thu, 17 May 2012 08:18:48 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2206BF81240;
	Thu, 17 May 2012 08:18:47 -0600 (MDT)
Message-ID: <4FB508C7.4070808@mlbassoc.com>
Date: Thu, 17 May 2012 08:18:47 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: meta-browser
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
X-List-Received-Date: Thu, 17 May 2012 14:28:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Trying the new layer, when I ran 'bitbake chromium -c fetch', I got this error:
   Fetcher failure for URL: 'http://commondatastorage.googleapis.com/chromium-browser-official/chromium-19.0.1049.3.tar.bz2'. The fetch command returned success for url 
http://commondatastorage.googleapis.com/chromium-browser-official/chromium-19.0.1049.3.tar.bz2 but /local/p60_poky/downloads/chromium-19.0.1049.3.tar.bz2 doesn't exist?!

Looking at my tree, I found this:
   downloads/chromium-19.0.1049.3.tar.bz2?cms_redirect=yes&redirect_counter=1
which has MD5SUM that matches the recipe.

Any ideas what might have gone wrong?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


