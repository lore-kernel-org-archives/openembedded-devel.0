Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OlELI-0006r1-0S
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 07:04:22 +0200
Received: by fxm6 with SMTP id 6so3436163fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 22:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=w/6bqwQyfDMve9L5L6dqPruidI6F8c+it9j836aS1Tk=;
	b=m8pJsE7qEvnCCW4+eVINpHpCZhfX+L5VgfeH2pSrBAA7x/XTgxzut4jJfQjpuJF5Fr
	PT5PDkVTlob1LF1i7U2Ir2zyHgJywQzFyEuNyroi80oUccXQJyaMWw57uio7VSzIQICr
	WXZK9YDgNAdu8R845bgd815H+3dSahID49YZg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=loEU1lZznhdX+y/IM/ORo88oToUb3IJgzUHGf6W32iedVdpr0zEeI2+Wso+DcCH3IG
	FrwCdHhcBgUxQTzcDdC1DG+UzTsskzbU7jWK+OV/Rbm4XYve2xMOA/eF4CU433i4gtSo
	dQq/7JlEMcwVB2BhonxclhZ5ZxU2cLWOcBXFA=
Received: by 10.223.103.148 with SMTP id k20mr5901483fao.101.1282021425376;
	Mon, 16 Aug 2010 22:03:45 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 10sm2783792fax.42.2010.08.16.22.03.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 22:03:44 -0700 (PDT)
Date: Tue, 17 Aug 2010 07:03:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100817050359.GA11569@jama>
References: <4C69F1E7.50000@balister.org>
MIME-Version: 1.0
In-Reply-To: <4C69F1E7.50000@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: alsa-utils failure
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
X-List-Received-Date: Tue, 17 Aug 2010 05:04:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 16, 2010 at 07:20:23PM -0700, Philip Balister wrote:
> At least one other person is seeing this. Mine is on a clean build on a 
> new F13 machine. Any thoughts?

It's calling ncurses-config from your host which returns also -ltinfo.
Default ncurses in OE (5.4) doesn't have ncurses-config. It will build
ok with 5.7 or you have to update configure to ignore ncurses-config
from host.

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg06852.html

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


