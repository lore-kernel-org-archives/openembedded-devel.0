Received: from mail-pz0-f193.google.com ([209.85.222.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGm2j-0003BG-07
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 06:47:05 +0200
Received: by pzk31 with SMTP id 31so1939445pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 May 2010 21:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=eoNkTVEP4AxfHXRDXw0lcngSffm/JhQiu3cBoTVttEA=;
	b=EpnqcXoskzw7HmtHMlwm94yQcHDEd7m1TN7HNcqMhCwgjFnOjZtw7CPvA9c8uuKCtW
	VZFYP9Jh2BdlmqOL8aWxM6EAye3PKm7Hwm6iltZZ5HftEMsT6+swyY/axemSaC39ic5H
	DU5F30Btv7ZcOQ+LhOIk74X1CN34ox4XfigfA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=WfPKbahz7u1teTTJgkYkOuGbsU28uHjLBrM4GHYTB6ABAY7PrfQJEuKCTlaaKUen53
	aD5h+xb462aM7wVo5ko+T5WPCaBa86kMQa4CH3MqvcbFqqZ12LiPPXFecvoJvcWJF6cV
	KAPH/T5T4OSIkVgtmA4MUg7gNjS1Ay1YCfefI=
Received: by 10.143.24.41 with SMTP id b41mr4293979wfj.48.1274762577541;
	Mon, 24 May 2010 21:42:57 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 20sm4078367pzk.11.2010.05.24.21.42.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 May 2010 21:42:56 -0700 (PDT)
Date: Mon, 24 May 2010 21:42:49 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100525044249.GB25134@gmail.com>
References: <1274733028-13432-1-git-send-email-clarson@kergoth.com>
	<1274733028-13432-2-git-send-email-clarson@kergoth.com>
	<20100524233422.GK25484@denix.org>
MIME-Version: 1.0
In-Reply-To: <20100524233422.GK25484@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.222.193
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 2/2] Make the do_patch apply=yes param implicit if extension is .diff/.patch
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
X-List-Received-Date: Tue, 25 May 2010 04:47:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/05/10 19:34), Denys Dmytriyenko wrote:
> On Mon, May 24, 2010 at 01:30:28PM -0700, Chris Larson wrote:
> > From: Chris Larson <chris_larson@mentor.com>
> > 
> > For .diff/.patch you need to apply manually, you can specify apply=no.
> > 
> > Signed-off-by: Chris Larson <chris_larson@mentor.com>
> 
> Acked-by: Denys Dmytriyenko <denis@denix.org>

Acked-by: Khem Raj <raj.khem@gmail.com>

> 
> > diff --git a/classes/patch.bbclass b/classes/patch.bbclass
> > index 6ef408f..5ad9c7c 100644
> > --- a/classes/patch.bbclass
> > +++ b/classes/patch.bbclass
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


