Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1L7vbS-0000e6-W7
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Dec 2008 18:33:35 +0100
Received: by qw-out-1920.google.com with SMTP id 14so437238qwa.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2008 09:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:sender
	:to:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references
	:x-google-sender-auth;
	bh=0LAfreQXW9Zv1nG8r70tT8hSy73Y1QOIqG8OwvAx+sE=;
	b=RBN2/UXKJq3/sdXr8/UOdlJorTf5+T7bNmt9oiYvjm6pMGmnfKAuPSoLflRkhRZyf9
	dEkYEDNjfklx5m0nHJc7W+SWFUpyhNa+il6uHwjlXldZmdoujYSJJOmoIeFoF0S7Cp+O
	x4/w3ERXsr5llP2MSaDdzxEU6pG/Cwxkexvfk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:sender:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references:x-google-sender-auth;
	b=UOFrP/4Ur3hqu7PO/gvJvJWtffNXslKBDQKd98bMEZHhvi5cgbICZuxQ5oufs6ZL+S
	1U9/JKlilsIkbn3ug2HyK9sKocmcfKbbonkTSvyO3nvbZ6Mv6UrhK636nIG0m0dKLap8
	7w1ttkU4Tppe6N8R65zH30vsTVd9T2jM/iHlc=
Received: by 10.142.52.9 with SMTP id z9mr5459117wfz.327.1228323613101;
	Wed, 03 Dec 2008 09:00:13 -0800 (PST)
Received: by 10.142.203.15 with HTTP; Wed, 3 Dec 2008 09:00:13 -0800 (PST)
Message-ID: <b6ebd0a50812030900r593d6bb0me3a35316907b21ab@mail.gmail.com>
Date: Wed, 3 Dec 2008 10:00:13 -0700
From: "Chris Larson" <clarson@kergoth.com>
Sender: kergoth@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0812030846n604eccf0pe47d15f7122f0435@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0812030846n604eccf0pe47d15f7122f0435@mail.gmail.com>
X-Google-Sender-Auth: 303673aa5c6a451a
Subject: Re: [RFC Wild Ideas Department] create soft-links from <pkg>/<src>/patches/some_local.patch to <oe.git>/packages/<pkg>/files/some_local.patch
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
X-List-Received-Date: Wed, 03 Dec 2008 17:33:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Dec 3, 2008 at 9:46 AM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello,
>
> during maintenance of our local set of OE patches, it would be handy
> not having to copy patches back into the repository.
>
> i.e. the patch fetcher could instead of copy the patch to the work
> directory, soft-link from the repo.

I can see why you want it.   The file:// fetcher copies everything,
not just patches, they aren't fetched differently currently.  You
could introduce regressions if it were to affect anything but patches,
so you'd have to add a special case for uris with patch=1 in the
file:// fetcher to link instead of copy, and possibly make it optional
via a variable.  I take it you do a lot of patch alterations in the
workdir to fix problems?
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


