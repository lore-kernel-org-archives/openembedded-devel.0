Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Nf8M4-0002Td-8q
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 09:55:31 +0100
Received: by bwz26 with SMTP id 26so956912bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 00:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=anxYcNaqSTTtzxvJ716ch5N3K4d14kJU7AR2F8ZnZ5Y=;
	b=qTx+WgQXJqGLtmBc1yT0qm79Oxy/E++Soi8NnZvA0MH36bKWT5sZ96AgLOv70bLjpe
	BT4XdXOGJlyVFb5SS50/cS7gcu5dqhfcjLq0QaDOYqZw7d6kryTIFUEQWiKqfVT0OxrX
	ADWaSnWmyRhlbhT62CP8KIuk2GePv/h+c9LcA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=YgZ63M6oeMf6C/C+rYSMIAKh+2Bk2WiHCTnI0e6PI0FnbcBbWlJGA6uAu9JTeApXVZ
	25orCUuvp02kiDunI1Ez2PF5NMj3r2lTSgmLEenaPl0TvimSdOpzpOtOmbiyJSuJZxgo
	JRKiKXfvMLHybNIc1CQhiq7Y4n2cRmbBsfFSY=
Received: by 10.204.160.147 with SMTP id n19mr630823bkx.182.1265791974858;
	Wed, 10 Feb 2010 00:52:54 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 13sm422715bwz.10.2010.02.10.00.52.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 00:52:53 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Nf8LY-0000aw-BJ; Wed, 10 Feb 2010 09:54:56 +0100
Date: Wed, 10 Feb 2010 09:54:56 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100210085456.GB2239@mx.loc>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<20100209093757.GB9094@merkur.sol.de>
MIME-Version: 1.0
In-Reply-To: <20100209093757.GB9094@merkur.sol.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 02/12] some more !getopt_long fixes
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
X-List-Received-Date: Wed, 10 Feb 2010 08:55:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 09, 2010 at 10:38:00AM +0100, Jens Seidel wrote:
>On Mon, Feb 08, 2010 at 10:14:23PM +0100, Bernhard Reutner-Fischer wrote:
>> -                if [ "$VERBOSE" != no ]
>> +                if [ "$VERBOSE" != "no" ]
>
>I don't see any need for this change. Why doesn't the commit message does
>not explain why it was done?
>
>I assume it is a stylistic change only and should that's why committed
>separately (with a different commit log), right?

Yes, it is a stylistic change only and could be committed separately.
I'll factor them out and resend.


