Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OJhyh-0007Yx-DJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 09:03:08 +0200
Received: by fxm9 with SMTP id 9so698939fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 23:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=KhDhoy3Zq8uttrDLUAtFn9VYOa6NFxm87XwK+EbDMbs=;
	b=GlueefzxRqJbXTDR8CVvIQJwhrEYO1FZZElhcPmZCHuOwInW9rgqDLim01mfhUQbzS
	a0jXOW8LJFn9vKD2VQDTDfmkzLQUaXaolru4/nybVakORc90/OlIqAAK/Wd8GUrn5K3f
	PyhucuYU9pxjMKOidNaWB2c4n+NcLoHO0JU7o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=SElykNNxRbpOpOb6iz+J92OoGhb+/fKwJ9ZQzoVpNTKafNUl83v1qFefMIw9BLkLEB
	Zx/WdD3W0UqdcM6XzfzMrqn9hMIe0+lphTKNjepKHOhu9pWxmTAPnCPH3rIjXRut0z/u
	AysOOXjE5yJ8gmVGiBaFX4hR2DQGKrwn2v8I0=
Received: by 10.223.24.85 with SMTP id u21mr8168439fab.8.1275461928896;
	Tue, 01 Jun 2010 23:58:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u12sm50901745fah.4.2010.06.01.23.58.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Jun 2010 23:58:47 -0700 (PDT)
Date: Wed, 2 Jun 2010 08:58:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20100602065840.GI5446@jama>
References: <alpine.DEB.2.00.1006011641480.17094@lynx>
	<4C057DFC.6010409@mlbassoc.com>
	<alpine.DEB.2.00.1006011753350.30834@lynx>
	<20100601220233.GG5446@jama> <4C058898.60202@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4C058898.60202@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] current build errors, OE dev branch, beagleboard-linuxtag2010-demo-image
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
X-List-Received-Date: Wed, 02 Jun 2010 07:03:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 01, 2010 at 04:24:24PM -0600, Gary Thomas wrote:
> On 06/01/2010 04:02 PM, Martin Jansa wrote:
> >Yes easily fixable fetch errors, those archives are download restricted
> >and if you open those recipes you will see instruction where to download
> >them.
> >
> >For cheese issue I've already replied, but without answer (about
> >gstreamer-plugins...).
> 
> I *did* reply; it seems to be a multi-thread build problem.  When
> I reran bitbake, it went away.

Yes thanks, the point is that only important part was "Was
gst-plugins-base built before cheese?" And Robert is still having issue
with it.

So I guess the answer would be NO and no is more likely with more
BB_THREADS and in second run it's already built (especially if you're
building with -k) for some other recipe, so it worked for you later.

I've downloaded cheese, checked configure.ac and yes it depends on
gst-plugins-base unconditionally. I've pushed an update which adds it to
DEPENDS (which is ensured to be built _before_ do_configure of recipe,
RRECOMMENDS is building it too, but it can build it later then
do_configure.

BTW: cheese_2.30.0.bb also depends on whatever -native recipe provides
xml2po and cheese_2.30.1.bb depends on scrollkeeper-config to build it's
help. But probably is using happily scrollkeeper from host (as there is
no recipe) - and I don't have scrollkeeper in my OE chroot..
http://tinderbox.openembedded.net/packages/cheese/

Robert: If I remember right, you were asked few times to use tinderbox
instead sending many e-mails with pastebins, why didn't you follow this
advise yet?

Regards.
-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


