Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OkBzw-00064N-UK
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 10:22:03 +0200
Received: by fxm6 with SMTP id 6so2301505fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=AwDyC0Rvl2G58hJd+/sf4J1eaalIHWtu0jwMcg2kSvk=;
	b=ZnGUt0cZUAlfu7Sle71oMcGXtbHzvZSzp3D8UNJTc8XqxD5W6EoT6De9lX0o7ALg6w
	xJlPETc+yFiUJ5dGgzoESL7Fm/vmphGgLthfGjthceeGmOiFEq9LjWIC4cptpef34tLp
	vssGmmGczAFESkj4kgwICjOzqgZJIK3UXSyCw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=GAz7fF/3D4KKYF5S1StblriRPuBvKeB9fY12FvQGwAy+S4ybZWlvwZv91+5mEQV/yQ
	uzM9PiBlfqzUuKybrCUpgVOFnsJCwVq+qJVBjR707PGAi99KmMThNkOzQY3lE/46wV7d
	DRwFN709S7C+Oc6WO4BOGJePn+YnPj3aFousM=
Received: by 10.223.107.211 with SMTP id c19mr3033331fap.20.1281774078147;
	Sat, 14 Aug 2010 01:21:18 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r4sm733856faa.43.2010.08.14.01.21.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 14 Aug 2010 01:21:17 -0700 (PDT)
Date: Sat, 14 Aug 2010 10:21:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100814082121.GF10076@jama>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
	<alpine.LNX.2.00.1008131040070.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTikQ5qGF4N1N0Ud11cdS7P4+HxfPEXSvWwMvm4YV@mail.gmail.com>
	<alpine.LNX.2.00.1008131154370.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTinChtk+VTgQ4H3+sMfyTRUQks+=YQR9Agj8M7a_@mail.gmail.com>
	<alpine.LNX.2.00.1008132255040.11048@asterix.crazy-teaparty.dyndns.org>
	<1281734825.3858.281.camel@mattotaupa>
	<AANLkTin28kSQZTgWHd_DsXcqeANKfBcg3+NLaOP74kaD@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTin28kSQZTgWHd_DsXcqeANKfBcg3+NLaOP74kaD@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patch queue/patchwork: How should states be used? (was: update canutils to current version)
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
X-List-Received-Date: Sat, 14 Aug 2010 08:22:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 14, 2010 at 09:59:59AM +0200, Frans Meulenbroeks wrote:
> review patch. if ok and it is a simple patch
> download patch from patchwork in mbox fmt
> git am patch
> bitbake recipe
> if ok, git push.

check contrib/patchwork/pw-am.sh to simplify steps 2 and 3.

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


