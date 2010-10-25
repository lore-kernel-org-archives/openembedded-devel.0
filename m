Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PAGXo-0005uZ-S0 for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 08:28:36 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PAGX4-0000v3-Vv for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 08:27:46 +0200
Received: from d75-157-13-138.bchsia.telus.net ([75.157.13.138])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 08:27:46 +0200
Received: from dfoley by d75-157-13-138.bchsia.telus.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 08:27:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Dallas Foley <dfoley@telus.net>
Date: Sun, 24 Oct 2010 23:27:36 -0700
Message-ID: <4CC52358.3030501@telus.net>
References: <E1P9vMr-0005nc-48@melo.openembedded.org>
	<AANLkTikb60YbUhzk+FNRZDJsYyg1wqappagRt0z0N3=W@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: d75-157-13-138.bchsia.telus.net
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.14) Gecko/20101006 Thunderbird/3.0.9
In-Reply-To: <AANLkTikb60YbUhzk+FNRZDJsYyg1wqappagRt0z0N3=W@mail.gmail.com>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Frans Meulenbroeks : tinylogin/tinylogin_1.4.bb: removed unneeded EXTRA_OEMAKE
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
X-List-Received-Date: Mon, 25 Oct 2010 06:28:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10-10-24 04:25 PM, Andrea Adami wrote:
> build breaks on do_compile after that commit
>
> Needs investigation
>
> Andrea

This seems to unbreak the build.
Haven't tested runtime though.

diff --git a/recipes/tinylogin/tinylogin_1.4.bb b/recipes/tinylogin/tinylogin_1.4.bb
index bbc7dd2..a15e9a7 100644
--- a/recipes/tinylogin/tinylogin_1.4.bb
+++ b/recipes/tinylogin/tinylogin_1.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://limpens.net/trac/at91-kit-trac/export/4/trunk/sources/tinylogi
         file://remove-index.patch"

  do_compile () {
+       unset CFLAGS STRIP
         oe_runmake 'CC=${CC}' 'CROSS=${HOST_PREFIX}'
  }




