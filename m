Received: from mail-yx0-f180.google.com ([209.85.210.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NafjR-0004dc-0Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 02:33:12 +0100
Received: by yxe10 with SMTP id 10so1249703yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 17:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Hhvw3ROXo0o99oBHAsSdnLo0VC+NxfYXsUM3lP/dveo=;
	b=ZzJld5eOgdJsdfYn3NzjeOY28KJ3ZsfsXFSooVPA57w7NIDFegwZQOe3bKtznL7I7x
	THjn3lF6vejDMScYljaW2fRQGZmmE45H6HhpL8F82TPL1CgxsJgsBEhp4VT+Etpygz7t
	6nhYtH3ezVCBw6IevEdXARSoRoegCqKRqdBtE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Hi6xmDLbX2HPZwy7wbTt/LBTPuQRdpTOVkGdyKpx2xx7lqimpkxeiykWaAnCHvb/C0
	CUS9ZuhF3nTObI+a+nunU4Z+EtKSWB+t/xFScdG8agMtUTWsodYUjN53h4S/TU4SZQgj
	K0InHkrJNL9fONeFagK4gOnUVunTtjUDgI5o0=
Received: by 10.150.4.26 with SMTP id 26mr839877ybd.0.1264728645377;
	Thu, 28 Jan 2010 17:30:45 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 23sm537798yxe.0.2010.01.28.17.30.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 28 Jan 2010 17:30:44 -0800 (PST)
Date: Thu, 28 Jan 2010 17:30:29 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100129013029.GA6136@gmail.com>
References: <20100128200049.GA4958@gmail.com>
	<1264715530.9974.436.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1264715530.9974.436.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: update hook for git to check push commit message
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
X-List-Received-Date: Fri, 29 Jan 2010 01:33:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (28/01/10 21:52), Phil Blundell wrote:
> On Thu, 2010-01-28 at 12:00 -0800, Khem Raj wrote:
> > Attached is a small hook for updates that are pushed into repo.
> > Right now it only checks the first line of the commit and expects
> > module: summary
> 
> I'm not really in favour of applying the commit message policy quite
> that harshly.  The wiki page that you linked to doesn't really seem to
> support this kind of check: the actual guidance it gives about checkin
> messages is:

Thats true. However I have seen many devs complain about the module:
summary. That was my motivation. 

> 
> * Have a clear commit message (example):
>     - The first line of commit is a summary of the changes.
>     - The first line should start with the name of the recipe the change affects.
>     - The rest of the message should give more details on the change as appropriate.
>     - Mention the affected bug numbers if appropriate.
>     - Give credit where credit is due. If you commit someone else's work more or 
>       less verbatim, you should use git commit --author $mail-of-author. If pulling
>       changes from somewhere like Poky or OpenMoko there is no problem with that
>       but mention where the changes came from.
>     - Include a Signed-off-by: line indicating the change has valid certificate 
>       of origin as per the Linux kernel
> 
> ... which is nowhere near as prescriptive as the rule that you seem to
> be implementing in your script.  Also, the wiki page has an explicit
> statement that "[these] rules are not hard fast rules", which would
> suggest that even such guidance as it does provide is not intended to be
> taken too dogmatically. 
> 
> Personally I think that the current situation of the TSC applying
> pressure to those people who seem to be chronically unable to write
> suitable checkin comments is a perfectly fine way of solving the
> problem.

Probably it could help developers to check the commit messages on their own
by making this as post commit or pre push hook of some sort in their clones .git/hooks

> 
> On a technical level, I think you could probably do without the sed
> subprocess, and "summary = rev.split(1)" doesn't look quite right
> either.

true. I could have got it if I have tested it. The check for : should also
be inverted.



