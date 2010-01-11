Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NUROz-0001cZ-Ub for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 22:02:21 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NURMr-0007Yc-CS
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 22:00:05 +0100
Received: from chello080108092216.22.11.tuwien.teleweb.at ([80.108.92.216])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 22:00:05 +0100
Received: from chris by chello080108092216.22.11.tuwien.teleweb.at with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 22:00:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Chris Veigl <chris@shifz.org>
Date: Mon, 11 Jan 2010 20:57:13 +0000 (UTC)
Message-ID: <loom.20100111T211613-99@post.gmane.org>
References: <loom.20100109T213305-664@post.gmane.org>
	<20100109221158.GA1444@rhein.zuhause.netz>
	<loom.20100111T101557-577@post.gmane.org>
	<20100111094046.GQ17224@jama>
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
X-List-Received-Date: Mon, 11 Jan 2010 21:02:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Martin Jansa <martin.jansa <at> gmail.com> writes:
> > ERROR: function do_compile failed
> > 

> git pull.. se my commit yesterday


I did a git pull, cleared the tmp folder and let 
bitbake run during the night, but get the same error:

  tmp/staging/i686-linux/usr/bin/java-initial -classpath  antlr.Tool -o \
    ../tools/generated/gnu/classpath/tools/gjdoc/expr/ \
    ./gnu/classpath/tools/gjdoc/expr/java-expression.g
  Unrecognised command line option: -o


must be something different ...
seems like jamvm version 1.4.5 does not have the "-o" switch !?

I currently use

  PREFERRED_VERSION_jamvm-initial = "1.4.5"
  PREFERRED_VERSION_classpath-initial = "0.93"

  PREFERRED_VERSION_jamvm-native = "1.5.3"
  PREFERRED_VERSION_classpath-native = "0.98"

  PREFERRED_VERSION_jamvm = "1.5.2"
  PREFERRED_VERSION_classpath = "0.98"

  PREFERRED_VERSION_libecj-bootstrap = "3.4"

as recommended in the openembedded wiki ...
regards,
chris.



