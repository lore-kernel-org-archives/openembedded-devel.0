Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nm7BL-0008SR-30
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 16:05:26 +0100
Received: by fxm20 with SMTP id 20so2310637fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 07:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=2NqFUlujSeJyk6Hou5zTfUxWKQVFtjotTxs8/6Vpb1A=;
	b=OBJ8lOn+uSfwxhzEPW1caXs5MegDWQmRJ6oNt6J55pZBl7Exwu9cMSB12mejX+DzH0
	syUrb6z9frR2oHO2U+AJ7rhKE9LgKlvaTgGN1nVb9SzeBfHBBxUdl3zC7XXUQzglX28E
	fv8tcbcM7ns0OPLWnKpdPDYxDoyQUyt/bKCR8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=n1ZxMFKZMmdmNPsWqte7A9uinqQcbUedXDHm77Nl+qHkNT55ToGSSQFvacJW37MeKY
	xOsj63tqhwou/ufwWwYs/RuhFzNj/poZfLIDYVPFFqYoZPK9HTrvXNZcTK5+eH6gAfVt
	zdLcGyjbuDwMb8E9IXgBJWAg76svnimgZ63WA=
Received: by 10.223.15.147 with SMTP id k19mr5104350faa.87.1267455745461;
	Mon, 01 Mar 2010 07:02:25 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm2186559fxm.2.2010.03.01.07.02.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Mar 2010 07:02:25 -0800 (PST)
Date: Mon, 1 Mar 2010 16:02:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100301150245.GC12022@jama>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
	<1267392928.13054.1.camel@andromeda> <hmgjc2$sgd$1@dough.gmane.org>
	<BE689342-3D28-4D8F-A58C-36885368CE0F@vanille-media.de>
MIME-Version: 1.0
In-Reply-To: <BE689342-3D28-4D8F-A58C-36885368CE0F@vanille-media.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: bitbake -b with BBCLASSEXTENDed recipes Was: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Mon, 01 Mar 2010 15:05:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 01, 2010 at 03:43:12PM +0100, Dr. Michael Lauer wrote:
> > And I want to reiterate the importance of new-style staging and
> > leveraging that for BBCLASSEXTEND.
> 
> Sure. That's certainly a good step, I just think it's not enough.

Is it possible to implement some support for old functionality like
bitbake -c clean -b path.to.recipe.with.BBCLASSEXTEND.bb

Now it fails with error like this:
bitbake@jama ~/build.dev.shr.gta $ bitbake -c clean -b ../dev/recipes/libxml/libxml2_2.7.6.bb
ERROR: Parsing error data_fn virtual:native:/OE/dev/recipes/libxml/libxml2_2.7.6.bb and fn /OE/dev/recipes/libxml/libxml2_2.7.6.bb don't match
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 143, in <module>
    main()
  File "/usr/bin/bitbake", line 140, in main
    cooker.cook()
  File "/usr/lib64/python2.6/site-packages/bb/cooker.py", line 608, in cook
    if not self.buildFile(self.configuration.buildfile):
  File "/usr/lib64/python2.6/site-packages/bb/cooker.py", line 500, in buildFile
    taskdata.add_provider(self.configuration.data, self.status, item)
  File "/usr/lib64/python2.6/site-packages/bb/taskdata.py", line 340, in add_provider
    self.add_provider_internal(cfgData, dataCache, item)
  File "/usr/lib64/python2.6/site-packages/bb/taskdata.py", line 376, in add_provider_internal
    eligible, foundUnique = bb.providers.filterProviders(all_p, item, cfgData, dataCache)
  File "/usr/lib64/python2.6/site-packages/bb/providers.py", line 226, in filterProviders
    eligible = _filterProviders(providers, item, cfgData, dataCache)
  File "/usr/lib64/python2.6/site-packages/bb/providers.py", line 188, in _filterProviders
    sortpkg_pn[pn] = sortPriorities(pn, dataCache, pkg_pn)
  File "/usr/lib64/python2.6/site-packages/bb/providers.py", line 46, in sortPriorities
    priority = dataCache.bbfile_priority[f]
KeyError: 'virtual:native:/OE/dev/recipes/libxml/libxml2_2.7.6.bb'

-b was usefull for quick rebuild of modified recipe (ie to rebuild it in workdir
after updating for new staging or BBCLASSEXTEND to see if everything is "the same")

It's really hard to implement something like prefixing -b path with "virtual:native:"
for native variant and use old behavior (clean non-native version) without virtual: prefix)?
Or just nobody cared yet? In this case I would check what can be done.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


