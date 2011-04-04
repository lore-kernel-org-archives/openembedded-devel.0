Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Q6kpg-00017G-0k
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 16:32:44 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 7EF1A16605C2; Mon,  4 Apr 2011 08:30:40 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id C5C8F16601B1;
	Mon,  4 Apr 2011 08:30:33 -0600 (MDT)
Message-ID: <4D99D609.8020800@mlbassoc.com>
Date: Mon, 04 Apr 2011 08:30:33 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Master broken?
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
X-List-Received-Date: Mon, 04 Apr 2011 14:32:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I just updated to org.openembedded.dev 556819235f501bf762c8d8cc9f41a1a8244b106f

Now I get these errors during the initial parse:
   $ bitbake xfce-image
   NOTE: Handling BitBake files: | (0046/7335) [ 0 %]ERROR: global name 'runtime_mapping_rename' is not defined while parsing /local/Angstrom_BeagleBoard/openembedded 
/recipes/images/x11-gpe-image.bb
   NOTE: Handling BitBake files: \ (0053/7335) [ 0 %]ERROR: global name 'runtime_mapping_rename' is not defined while parsing 
/local/Angstrom_BeagleBoard/openembedded/recipes/images/angstrom-gnome-image.bb
   NOTE: Handling BitBake files: \ (0113/7335) [ 1 %]ERROR: global name 'runtime_mapping_rename' is not defined while parsing 
/local/Angstrom_BeagleBoard/openembedded/recipes/images/helloworld-image.bb
    ... etc

What am I missing?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


