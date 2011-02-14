Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pp71r-0000GZ-R1
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 23:36:24 +0100
Received: by pvd12 with SMTP id 12so873050pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 14:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=Xe1WRWtUjQrxikkqZPQec9RFsCmqETwD4bLnqv0OPZU=;
	b=VVyD7JGwesIMf9J2g2prrWi0BBrGexgxWyl+KcHYmyX4oqEWXRiXjqtndwXm8eW4Xe
	qXKPp1pLk4nBDBBo4mimJKuHp1ZW/8HwrZacxXa+HMxhWPKQgpqGwqC3qOoOHM9Tqwna
	GtZDGCkDDoAeGyqr+qd2ePfOu0ORJl3L3sR6I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=d/JpK6A56jkfcqLW3HiAa63PIne/9v/+ozyQ/G7qAM5dXbRNWidoHcIgy/iAbnmL/E
	MHIiM6M0Ct0SB+PSkpROUMiyqqJIHJY/y+o9rfWDwgG//inFMC8ytC9qhNYRkJMHP5pS
	rE3nUZSQeT/lM95gAGbsCxAQ/uYKDrWoPzVt8=
Received: by 10.142.143.9 with SMTP id q9mr3586635wfd.30.1297722913498;
	Mon, 14 Feb 2011 14:35:13 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c3sm4759647wfa.14.2011.02.14.14.35.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Feb 2011 14:35:12 -0800 (PST)
Date: Mon, 14 Feb 2011 14:34:58 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110214223458.GB20605@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <AANLkTikLpJU9q7woyJrpTVWaAXK_m557J1uXAF-HLBCs@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikLpJU9q7woyJrpTVWaAXK_m557J1uXAF-HLBCs@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Which recipe to get EFL into SDK
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
X-List-Received-Date: Mon, 14 Feb 2011 22:36:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/02/11 11:17), Charles Manning wrote:
> Hello
> 
> I am building an SDK and have managed to get everything added to it
> that I want except for EFL.
> 
> Any hints as to what recipe to use to add EFL to the SDK?
there is a meta task
task-efl.bb in recipes/tasks that might be a good starting point

-Khem


