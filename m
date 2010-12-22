Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVUXf-0005lD-6d
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 20:40:07 +0100
Received: by ywi6 with SMTP id 6so2465938ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 11:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=YsigtskMMwjjn7EgVu4hY6dsd78T43F/xDyFdFfa1vA=;
	b=J2EaG/JgI3xH9XsqZTbc27JxlyA8YKZ7nAg1gi9sYzhvAigOx6VyqfsZxXAebMl/yt
	04OHkxE18YgFb9d8PzBs2g2YNZHHqMF3A0XIDtlpcWkUEeJxehPUlPAEX4ekbsaCiI3I
	pmduz4bQRcJdTe362gpVE9HNU8vSatXlEfgdM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=eSt/U/DXEB9piEUdAizD3iWcZ1a+RHWMYAgcOm/dSht8iPbAmyYYqPoUXpWu2tJRu5
	Z+jyXAktKePsP21ovxmOULvnJoOvfW8PhLmFUSZhNwXMO0r8ADfluXjK/DL0XZRO6cEs
	8z84lVYWP1bFoNftaEe0CgqPoyMznCZ9F/vaY=
Received: by 10.90.98.11 with SMTP id v11mr9086583agb.58.1293046797739; Wed,
	22 Dec 2010 11:39:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 22 Dec 2010 11:39:35 -0800 (PST)
In-Reply-To: <AANLkTimDyv3ouBLRCvrfR9Ywudwf_TqOrBztwmxWLa3x@mail.gmail.com>
References: <AANLkTimDyv3ouBLRCvrfR9Ywudwf_TqOrBztwmxWLa3x@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Dec 2010 11:39:35 -0800
Message-ID: <AANLkTimyubn1G4JOxxnSfo_M=vWqyexHL--bumNa0emf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Subversion depends on Apache2
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
X-List-Received-Date: Wed, 22 Dec 2010 19:40:07 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 22, 2010 at 9:57 AM, AJ ONeal <coolaj86@gmail.com> wrote:
> Overkill?
>

I think apache2 is shipping libapr.so with it which should not be the
case. Apache2 should depend on libapr instead
this seems to be a packaging problem with OE apache. File a bug


