Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NUUGK-0007YP-NV for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 01:05:35 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NUUEG-0007tH-KY
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 01:03:24 +0100
Received: from chello080108092216.22.11.tuwien.teleweb.at ([80.108.92.216])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 01:03:24 +0100
Received: from chris by chello080108092216.22.11.tuwien.teleweb.at with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 01:03:24 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Chris Veigl <chris@shifz.org>
Date: Tue, 12 Jan 2010 00:03:12 +0000 (UTC)
Message-ID: <loom.20100112T005221-810@post.gmane.org>
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
X-List-Received-Date: Tue, 12 Jan 2010 00:05:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Martin Jansa <martin.jansa <at> gmail.com> writes:

> > I did a git pull, cleared the tmp folder and let 
> > bitbake run during the night, but get the same error:
> > 
> >   Unrecognised command line option: -o
> 
> Strange because this should be built only with gjdoc enabled, which I
> disabled, because I had exactly the same problem (it worked only on
> system with antlr installed also outside OE staging).
> 
>
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=762fa9e86556d8f12031eaa383063d379fde21d7


thanks for the patch,
i use the angström distro, machine=beagleboard 
and applied the patch manually.

my most recent build, uses the original setup (no P_Vs defines) 
and the adjustment of the memory option suggested by Dallas 
("-Xmx512m" in recipes/ecj/files/ecj.in)
this try showed success: configure and compile of classpath-initial worked,
but I got another error at:

task 2434 of 7953 (ID: 3753,
/media/disk/overo-oe/org.openembedded.dev/recipes/antlr/antlr-native_2.7.7.bb,
do_compile)
ERROR: function do_compile failed
ERROR: log data follows (/media/disk/overo-oe/tmp/work/i686-linux/ \
  antlr-native-2.7.7-r0/temp/log.do_compile.11606)
 Exception in thread "main" java.lang.NoClassDefFoundError: org/eclipse
/jdt/internal/compiler/batch/Main
Caused by: java.lang.ClassNotFoundException:
org.eclipse.jdt.internal.compiler.batch.Main not found in java.lang.ClassLoader



> 
> I did it only for classpath-native, maybe you need similar workaround
> for classpath (if you don't need to build gjdoc).
> 
> # SHR distro.. We had only this P_Vs now..:
> 
> # We need this for jamvm
> PREFERRED_VERSION_classpath = "0.98"
> PREFERRED_VERSION_classpath-native = "0.98"

> And all PREFERRED_PROVIDERs set by compatibility-providers.conf

OK. i will try that next...

thank you,
regards,
chris



