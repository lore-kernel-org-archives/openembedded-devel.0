Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OCVEJ-0001El-Bn
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 12:01:26 +0200
Received: by fxm12 with SMTP id 12so159660fxm.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=MYZFbybRCh/LtbRDrsfvvxXAbOo/stmHwN3XwQlVCC4=;
	b=aGOfMynzoBaEVdGznk4VT6mPmek33LTbDKygUpKu6nE6eb4Pjw3qN1kqNT3Wm69rnG
	jQLyIU36zKLr19yBrHli3VPHw/s5cIX9KeTPBq1VLGchO4ag+vaUOQbQr3eZk1c/KhcG
	oWgKofJUr8vRuwZnEgaG98n3RZXZ2k3C5UASc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=EZR0EVaWr7YM1PHU9O+//qt1H+mN4Kx7Fsfmbs0jzEa+MUlBPZB2Ub9q5qseIdTVPG
	Uua0rl7l6cRfO/cHftz7iLKbMNKJpCw5w0uxPUgYzR5/Xswf7sSDweZoVhM4jkCT2kRV
	fMw3KupYQdK4+qHAyp9Dn5JBXMhRg5cOYrA6U=
Received: by 10.223.97.149 with SMTP id l21mr9754071fan.91.1273744644560;
	Thu, 13 May 2010 02:57:24 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm5100236fav.13.2010.05.13.02.57.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 May 2010 02:57:24 -0700 (PDT)
Date: Thu, 13 May 2010 11:57:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100513095725.GH3370@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.51
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: install_linguas using public feed for locale package install?
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
X-List-Received-Date: Thu, 13 May 2010 10:01:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Today I noticed that with every do_rootfs I see few downloads from my
webserver (where is DISTRO_FEED_URI pointing).

I guess it's because install_linguas from image.bbclass.

Is there some special reason why it's not used from deploy/ipk directly?
it's not problem here, but if public feed is not in sync with deploy/ipk
it can be IMHO pretty bad (locale .ipk cannot be found or different version).

BTW: that's probably the reason I didn't get any locales available
with last rebuild from scratch on shr buildhost (rsync to public feed
started manually after image build) resulting in:
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=e38c2c1286f25518770d6c668dc43939476f312d

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


