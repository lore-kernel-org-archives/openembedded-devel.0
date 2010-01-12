Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NUcDQ-0007wk-79 for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 09:35:07 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NUcBL-0008HQ-Cx
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 09:32:55 +0100
Received: from chello080108092216.22.11.tuwien.teleweb.at ([80.108.92.216])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 09:32:55 +0100
Received: from chris by chello080108092216.22.11.tuwien.teleweb.at with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 09:32:55 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Chris Veigl <chris@shifz.org>
Date: Tue, 12 Jan 2010 08:32:31 +0000 (UTC)
Message-ID: <loom.20100112T092146-439@post.gmane.org>
References: <loom.20100109T213305-664@post.gmane.org>
	<20100109221158.GA1444@rhein.zuhause.netz>
	<loom.20100111T101557-577@post.gmane.org>
	<20100111094046.GQ17224@jama>
	<loom.20100111T211613-99@post.gmane.org>
	<20100111213530.GU17224@jama>
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
X-List-Received-Date: Tue, 12 Jan 2010 08:35:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Martin Jansa <martin.jansa <at> gmail.com> writes:

> 
> On Mon, Jan 11, 2010 at 08:57:13PM +0000, Chris Veigl wrote:
> > Martin Jansa <martin.jansa <at> gmail.com> writes:
> 
> I did it only for classpath-native, maybe you need similar workaround
> for classpath (if you don't need to build gjdoc).
> 
> # SHR distro.. We had only this P_Vs now..:
> 
> # We need this for jamvm
> PREFERRED_VERSION_classpath = "0.98"
> PREFERRED_VERSION_classpath-native = "0.98"
> 
> And all PREFERRED_PROVIDERs set by compatibility-providers.conf


I disabled gjdoc as suggested and used 0.98 for classpath and classpath-native,
now i get lots of compilation-errors at

task 4127 of 7953 (ID: 2078, /media/disk/overo-oe/org.openembedded.dev/recipes
/maemo4/libhildonfm_1.9.46.bb, do_compile)
ERROR: function do_compile failed

(in files  hildon-file-system-model.h, hildon-file-common-private.h,
 hildon-file-selection.c, errors seem to be gtk - related...)


regards,
chris

> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel <at> lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 






