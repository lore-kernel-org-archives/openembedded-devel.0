Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OlGFL-0000IN-C9
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 09:06:09 +0200
Received: by fxm6 with SMTP id 6so3466418fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 00:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=e3XXBWm9dfFcBYHP6CoBuepoNcbP7EBYvnY+ep0huB0=;
	b=C+cgXB5V4wPuvBhcedZFxnmtmr5O25rnK9t3Hee50NYbiObGMI9dEE2RJiCSQqX1tq
	akFux15lbY0jsJbfVYsTknLBetO7Ia5Ti9lcMTCq7bqSpmTFnVzGKx0c42IToBfSAEE/
	Ne3z+nEHZ2rBwJysAsbV+BHPLbhB323c3Pa7E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=t+jkAs1fa16Qn3sQYsoGesatuD7/CMVpEzQ/EpCniYvL/sNQeQ01eLm7Ht8AT5ONod
	2QETdFwxatGsecpPSBBwkzJ/xo2konh3jv0mzOULb20fKeUH48waPFgCe8n24sG2Ybba
	llbSeamEMxl5NW7jScLYHJuEGYbquq9LR655I=
Received: by 10.223.108.71 with SMTP id e7mr6081189fap.13.1282028734342;
	Tue, 17 Aug 2010 00:05:34 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f28sm1512867faa.24.2010.08.17.00.05.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 17 Aug 2010 00:05:33 -0700 (PDT)
Date: Tue, 17 Aug 2010 09:05:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100817070548.GD11569@jama>
References: <1281983778-21054-1-git-send-email-khimov@altell.ru>
	<201008162325.59305.roman@khimov.ru>
	<AANLkTik-LOv_7xTmgsEz8ip_smmZ+L4FeG0Cr5rHc1zF@mail.gmail.com>
	<201008171050.16611.roman@khimov.ru>
MIME-Version: 1.0
In-Reply-To: <201008171050.16611.roman@khimov.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openssl: update 1.0.0 to 1.0.0a
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
X-List-Received-Date: Tue, 17 Aug 2010 07:06:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Aug 17, 2010 at 10:50:13AM +0400, Roman I Khimov wrote:
> В сообщении от Понедельник 16 августа 2010 23:35:59 автор Khem Raj написал:
> > IMO the newest version in a recipe should always be default preference
> > this way we can
> > stabilize recipe upgrades quicker. This also means a wider testing
> > before pushing a new recipe
> > DEFAULT_PREFERENCE = "-1" makes it to escape the testing.
> 
> Well, consider Perl, for example. Making 5.10.1 a default preference would 
> break binary packaged perl modules built for 5.8.8, so technically some 
> massive PR bump (most probably DISTRO_PR) is needed when updating to 5.10.1. 
> Forcing distro maintainers to do that is not nice, IMO.

But if you drop D_P globally you can bump PR of depending packages just
once. If distro maintainders add P_V_perl = "5.10.1" one by one, then we'll have
multiple PR bumps.

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


