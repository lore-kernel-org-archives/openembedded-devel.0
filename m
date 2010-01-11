Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NUGnd-0008S1-CU
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 10:43:04 +0100
Received: by fxm8 with SMTP id 8so19154087fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 01:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=oqhRZZ/uiI2/emR4HqosAWnpzYYbzb7n7fDfzwLkX3Q=;
	b=khonEiE6yrgqtKH6jWTbvnnU2aaQ8VFgz4kIt4ek8j4E1MkDPSx/t5fmj7P3L9QaeK
	sjigvKfS/Hyw0XCPEppm8C1IJItBsTsqt2K8ltPCysQM4eKoWBDZCmkIJwYWFj7zBsRI
	teO51BbktCAlG0qxny9eLNim+3oIaNqyjysu8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=PU2e7d9icvyZNc8xz4Lf05tXFx3qcacSYUdm32fU9tkn7ktBEVpvlxI7p9U2YBvct7
	RzoXrcsP2pURHYhixI6PlOFxkFOS3bYFrktzBSGfFpL7UZeeJp4j22kYAVJgrz8Ds9YX
	ZBH56uk5Y2Di8LUdK7d8u5T1tCwgjSLRbpmXg=
Received: by 10.223.4.132 with SMTP id 4mr724867far.45.1263202852870;
	Mon, 11 Jan 2010 01:40:52 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm9487314fxm.6.2010.01.11.01.40.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 11 Jan 2010 01:40:52 -0800 (PST)
Date: Mon, 11 Jan 2010 10:40:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100111094046.GQ17224@jama>
References: <loom.20100109T213305-664@post.gmane.org>
	<20100109221158.GA1444@rhein.zuhause.netz>
	<loom.20100111T101557-577@post.gmane.org>
MIME-Version: 1.0
In-Reply-To: <loom.20100111T101557-577@post.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: martin.jansa@gmail.com
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
X-List-Received-Date: Mon, 11 Jan 2010 09:43:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 11, 2010 at 09:27:00AM +0000, Chris Veigl wrote:
> 
> Dear Henning,
> 
> thank you for the fast response,
> 
> > jamvm 1.5 needs classpath-0.98, we don't use classpath-0.98  yet as default
> > because there were some issues with cacao. So add
> > PREFFERED_VERSION_classpath = "0.98" 
> > to your local.conf and it should work.
> 
> after my first rebuild i did not notice any effect,
> then i relalized the type in "PREFERRED_VERSION_classpath" ;-)
> 
> after that changed, i still got the same error,
> because the problem happens at the config of classpath_native... 
> 
> i then deleted my tmp folder and gave it another try, using
> the settings recommended at http://wiki.openembedded.net/index.php/Java :
> 
> PREFERRED_VERSION_jamvm-initial = "1.4.5"
> PREFERRED_VERSION_classpath-initial = "0.93"
> 
> PREFERRED_VERSION_jamvm-native = "1.5.3"
> PREFERRED_VERSION_classpath-native = "0.98"
> 
> PREFERRED_VERSION_jamvm = "1.5.2"
> PREFERRED_VERSION_classpath = "0.98"
> 
> PREFERRED_VERSION_libecj-bootstrap = "3.4"
> 
> 
> Unfortunately, i ran into a different error using this configuration:
> 
> task 1610 of 7888 (ID: 3738,
> /media/disk/overo-oe/org.openembedded.dev/recipes/classpath/classpath-
> native_0.98.bb,
> do_compile)
> ERROR: function do_compile failed
> 
> /media/disk/overo-oe/tmp/staging/i686-linux/usr/bin/java-initial -classpath
> antlr.Tool -o ../tools/generated/gnu/classpath/tools/gjdoc/expr/ \
> | 	  ./gnu/classpath/tools/gjdoc/expr/java-expression.g
> | Unrecognised command line option: -o

git pull.. se my commit yesterday

> any ideas what is going wrong now ?
> regards,
> chris

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


