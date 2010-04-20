Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tux.jens@googlemail.com>) id 1O4Bup-0005xG-Lz
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Apr 2010 13:46:56 +0200
Received: by ewy3 with SMTP id 3so1485559ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Apr 2010 04:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:sender:user-agent;
	bh=fmLvCdEHFE8ckBA7XLXtmIA10CXZLzrF5SFBMN+zVXQ=;
	b=nJUyWw9+2d3ghUPGUR5DEvz1dQxXPw4OT3LQrG1UFJunPT9w1ozrcAAQmLax0eqIht
	ORmDI5ROuXByQN7ulZ0oMUMnOSGUG/rt72Xv09VQo71ZraDlAjfUCKM7XxcN4HUZLMjW
	JAoLWsYZO0Y+3DSPp5jaK4oNFE+3ywU22YrPc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to:sender
	:user-agent;
	b=swxyb1UmX8uP//ekpEyou1iJKfQY2YBuykynCIqHpW5bfJofCdO7QvX9Le7wWSXsTo
	5GRoJLtKEuF1t7WljtwgyYHaE9eL3cYZ2ubO8ffRLmTzQwEy3jYG39A+qPEsbwB2EyOw
	bAKjdTaFH0WWNqRFk+JDtaBC2A9m9sOlQdCfk=
Received: by 10.103.76.26 with SMTP id d26mr330151mul.115.1271763802011;
	Tue, 20 Apr 2010 04:43:22 -0700 (PDT)
Received: from merkur.sol.de (p4FD736DD.dip0.t-ipconnect.de [79.215.54.221])
	by mx.google.com with ESMTPS id j2sm4594892mue.53.2010.04.20.04.43.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 20 Apr 2010 04:43:20 -0700 (PDT)
Received: from jens by merkur.sol.de with local (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1O4Bbq-0006NM-Uq
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Apr 2010 13:27:19 +0200
Date: Tue, 20 Apr 2010 13:27:18 +0200
From: Jens Seidel <jensseidel@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100420112718.GB24470@merkur.sol.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1271471763-28331-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1271471763-28331-1-git-send-email-denis@denix.org>
Sender: Jens Seidel <tux.jens@googlemail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: tux.jens@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] xorg-headers-native: haven't been updated since	2006, do so now
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
X-List-Received-Date: Tue, 20 Apr 2010 11:46:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 16, 2010 at 10:36:03PM -0400, Denys Dmytriyenko wrote:
> Update the combined headers from the following packages:

Update? In which way? Please properly write your commit messages and
explain:
 * what you do
 * why you do it
 * possible problems/advantages/ ...

Your current log is useless for me, even after looking at the patch.
I really don't know what you try. Especially for such large patches you
should do it better.

> * xproto-7.0.16
> * libx11-1.3.3
> * libxau-1.0.5
> * libxdmcp-1.0.3
> * libxt-1.0.8
> 
> For example, GenericEvent is new since xproto-7.0.13 and prevents
> libx11-native from building on an X-less host.

Jens


