Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NURM6-0001A7-3d for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 21:59:21 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NURK2-0006No-4o
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 21:57:10 +0100
Received: from chello080108092216.22.11.tuwien.teleweb.at ([80.108.92.216])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 21:57:10 +0100
Received: from chris by chello080108092216.22.11.tuwien.teleweb.at with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 21:57:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Chris Veigl <chris@shifz.org>
Date: Mon, 11 Jan 2010 20:56:46 +0000 (UTC)
Message-ID: <loom.20100111T215259-536@post.gmane.org>
References: <loom.20100109T213305-664@post.gmane.org>	<20100109221158.GA1444@rhein.zuhause.netz>	<loom.20100111T101557-577@post.gmane.org>
	<20100111094046.GQ17224@jama> <1263219513.3293.6.camel@nvc1511>
	<4B4B759D.3040609@techsol.ca>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 80.108.92.216 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.0.17) Gecko/2010010604 Ubuntu/9.04 (jaunty) Firefox/3.0.17)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
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
X-List-Received-Date: Mon, 11 Jan 2010 20:59:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Dallas Foley <dfoley <at> techsol.ca> writes:

> 
> Jaap de Jong wrote:
> > Hi Henning,
> > 
> > My approach after many unsuccessful attempts:
> > 
> > 	- install
> > 		apt-get install sun-java6-jdk
> > 	- edit local.conf 
> > 		ASSUME_PROVIDED += " ecj-initial "
> > 		ASSUME_PROVIDED += " virtual/java-initial "
> > 		ASSUME_PROVIDED += " virtual/java-native "
> > 		ASSUME_PROVIDED += " virtual/javac-native "
> > 		PREFERRED_PROVIDER_classpath = "classpath"
> > 		PREFERRED_VERSION_classpath = "0.97.2"
> > 	- bitbake cacao
> > 

thank you for the hint - i will try this next

> > Could not get jamvm nor classpath 0.98 compiled.

what problems did arise ?


> 
> Not sure if this is the right answer, but I also could not build ecj-initial 
> until I changed "-Xmx1024m" to "-Xmx512m" in recipes/ecj/files/ecj.in
> and I think rebuilding ecj-bootstrap-native and ecj-initial worked for me.
> 


I suppose this solves the memory error in the "classpath - configure" - task.
which setup (in terms of PREFERRED_PROVIDER, PREFERRED_VERSION, ASSUME_PROVIDED)
did you use ? - and: could you build jamvm and classpath successfully ?

Using the OE-wiki setup, I got problems with the "compile" task (jamvm does not
recognize option "-o"), which do not relate to the above memory problems.



regards,
chris.









