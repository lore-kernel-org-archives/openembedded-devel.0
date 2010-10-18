Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P7kOg-00015A-Fu
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 09:44:44 +0200
Received: by bwz9 with SMTP id 9so380839bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 00:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=A3nODOt7zCAGauwftotvt08hk5a66dWjc2If5l0UB4I=;
	b=Xf/GxEa83BHRBoRHPMsLHi5POJO9TRLmOk9NkjaGNZS4i4rdaC6NlRdrki8bM9pXTK
	ueq5qJNOpnfci3MzNBWy6/YXGkfoQFU3DqWMEJRFeP11jECag/ZrUxskXRvGfbNdXVTd
	iBaco1XjpMCkc5MTFDa5ZuAw3wobhx1ZG8Pi0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=UxTwugv1jeQ67MiZNBLBQSfpSkjY/mKvZkAygsEuXF4F22G2Pq5SFgWkj2H4mduhYb
	8k0qsQgwnchcIHWbAevo+MNd+g0Ml2vDq3suubLjh7oeO9uQ7w7FN35To9/cxIP8yzvw
	H5sAKdZgm3jAFShBmzOxAw/7KJwMc8P0me6YI=
Received: by 10.204.126.167 with SMTP id c39mr4120789bks.125.1287387834639;
	Mon, 18 Oct 2010 00:43:54 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u4sm14125182bkz.17.2010.10.18.00.43.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 18 Oct 2010 00:43:53 -0700 (PDT)
Date: Mon, 18 Oct 2010 09:43:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101018074347.GE3324@jama>
References: <20101017211540.GB3324@jama>
	<AANLkTinn3BXBjocx=9D5Z_TxrPZnvtQTEwyRK+e3hPkP@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinn3BXBjocx=9D5Z_TxrPZnvtQTEwyRK+e3hPkP@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] do we really need all OVERRIDES in FILESPATH?
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
X-List-Received-Date: Mon, 18 Oct 2010 07:44:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 18, 2010 at 09:33:28AM +0200, Frans Meulenbroeks wrote:
> 2010/10/17 Martin Jansa <martin.jansa@gmail.com>:
> > Currently
> > bitbake -e -b xserver-xorg-conf_0.1.bb | grep ^FILESPATH= | sed "s/:/\n/g" | wc -l
> > shows 65 directories where file:// from SRC_URI can be found.
> 
> Actually I got 84. This is git head from last friday or so. Seems a
> good plan to reduce this somewhat.
> BTW this was for:
> DISTRO = "angstrom-2008.1"
> MACHINE = "ixp4xxbe"

Why do you have P and PN twice in FILESPATHPKG? something in local.conf?
I don't see any in-tree conf/class changing FILESPATHPKG that way

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


