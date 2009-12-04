Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NGTkK-0007rW-Ik
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 09:42:39 +0100
Received: by pwj11 with SMTP id 11so1990940pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 00:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=na7q39HdXJkoKNbXJKeuU8trcfw3MblZ6xdiXRmoDqE=;
	b=kK6qRxkop2Kc67Q/SeqwdjozxDSnRm40pThYKsxdFxqOCMBh08Y4CeV7rk5IYJ6eCm
	8zjWiomuXYpjaXjhTaJPtGt6x/DsBBqVZ5+iZCsoZ+tAUECELAilwzJAIjIusurd1CsP
	g8LzcI9L9QHS4IC+4qZ528O/eWpOkKm/M8+cs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tioCE7h+LQeFoBDVM+ZYZH3wO81DUfqsNFipymymHf5nuCJItH8ww0g6QA+4JvavEk
	1O4+JOO9xAKgUwPSq9yPk/oAOhgRJ3sAnC7qMtQTj9pxjJZJdNRBVBHRw6kH5mtF2Roz
	DjJINBHWC7D9Wd3o2fKDnIfAof/YQg+OL55rI=
MIME-Version: 1.0
Received: by 10.141.52.15 with SMTP id e15mr166100rvk.204.1259916058833; Fri, 
	04 Dec 2009 00:40:58 -0800 (PST)
In-Reply-To: <6ec4247d0912032053g5f4963a7t6280f5341cce12e8@mail.gmail.com>
References: <4B18811D.8020206@mwester.net>
	<6ec4247d0912032053g5f4963a7t6280f5341cce12e8@mail.gmail.com>
Date: Fri, 4 Dec 2009 09:40:58 +0100
Message-ID: <d1b08f940912040040v3289f021k4e7877e4c5f46777@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Commit 2fdf1aa1c869ea9deecee86206f49a2eca9d7c00 breaks opkg
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
X-List-Received-Date: Fri, 04 Dec 2009 08:42:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

FYI,

I had similar issues with opkg-cl (was linked with libldap of my
buildhost...[1]).

I thouht it was originated by bump to SRCREV to 413 but a rebuild from
scratch fixed all.

Please retry the hard way...


Regards

Andrea


[1] What I did was to unmerge openldap on my Gentoo buildhost. This
broke opkg-cl and friends..
Suspicious bits:
 /bin/grep: /usr/lib/libldap.la: No such file or directory
 /bin/sed: can't read /usr/lib/libldap.la: No such file or directory


