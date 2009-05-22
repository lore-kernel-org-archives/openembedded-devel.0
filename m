Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1M7ZU0-00064C-ER
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 May 2009 20:28:40 +0200
Received: from [10.50.1.165] (unknown [10.50.1.165])
	by hermes.mvista.com (Postfix) with ESMTP
	id B5523195D7; Fri, 22 May 2009 11:20:55 -0700 (PDT)
Message-Id: <DEB73D04-3490-41E1-8C56-C41822C040D9@mvista.com>
From: Christopher Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Fri, 22 May 2009 11:20:55 -0700
X-Mailer: Apple Mail (2.930.3)
Subject: amend-recipes.inc
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
X-List-Received-Date: Fri, 22 May 2009 18:28:40 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

I created a little .inc that can be loaded into a distro .conf.  It  
just enables the ability to amend bits to a recipe from its  
filespath.  I mentioned this in a previous email wrt managing  
overlays.  It's incredibly simple, but I'd like a sanity check :)  It  
seems to work fine in my local test builds.

python () {
	import bb
	amendfile = bb.which(d.getVar("FILESPATH", 1), "amend.inc")
	if amendfile:
		bb.parse.handle(amendfile, d, 1)
}
-- 
Chris Larson
Software Engineer
MontaVista Software, Inc.
Email: clarson AT mvista DOT com
Email: clarson AT kergoth DOT com


