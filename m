Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pqxzs-0004gP-1J
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 02:22:00 +0100
Received: by pwj9 with SMTP id 9so156057pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 17:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=N+RsbfAYF72YxBAp23BrY2F6GZm9tvmqNjreOQR7UPo=;
	b=QHnOeTLnNl2lu7524aCD/pbpmRuZfIouHwWMyw+cMdW/q2nJmDYjVrSaGPLRDZJpxT
	UrNM1CNzmSt4MU3pYLldZPtShH+bPq8kdcicy9NbZfIIbx5HEHSkfUmZ4xaiUW7qAtps
	pSOrKrNfIpAfPuLNVciDeExhKP1srLp+ub7SA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=peus7PioS5+VqkaEI2gBbup25kaIyIvxn5N7gMpnRSf0y69umSS9TrMhEw/McIoYs+
	htF60O0dgfJZ0sVdu/2cbi4xPyQDpa9I/R2h7Gr1Vew4v+iMsEC0m074pQZTTGK4YVla
	74tiGCGttCCqcOZ7N5hD4Qc2EEjV8TFi4HqRQ=
Received: by 10.143.34.8 with SMTP id m8mr1851746wfj.121.1298164842915;
	Sat, 19 Feb 2011 17:20:42 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s41sm573745wfc.15.2011.02.19.17.20.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Feb 2011 17:20:41 -0800 (PST)
Date: Sat, 19 Feb 2011 17:20:38 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110220012038.GB3451@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4D5EEE4A.5030002@freyther.de>
MIME-Version: 1.0
In-Reply-To: <4D5EEE4A.5030002@freyther.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Build issues on natty
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
X-List-Received-Date: Sun, 20 Feb 2011 01:22:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/02/11 23:10), Holger Freyther wrote:
> Hi all,
> 
> I am still hitting two build issues on natty and could need a hand on fixing
> this in OpenEmbedded.
> 
> 1.) openssl-native. We apply a patch to make openssl link with local objects
> so that an upgrade from openssl 0.9.x to 1.0.0 is going to work. With
> something in gcc 4.5, latest binutils... something changed
> 
> 
> 2.) curl-native. This is actually somehow weird. We disable GNUTLS on build
> but something links to gnutls indireclty and it takes the system gnutls but
> the local gcrypt and stuff goes wrong. Building without ldap support seems to
> fix that.

I use natty and dont see any of these issues. I dont have anything in
ASSUME_PROVIDED

> 
> cheers
> 	holger
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


