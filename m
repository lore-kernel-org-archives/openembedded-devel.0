Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Q9wKu-0005wf-PK
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2011 11:26:09 +0200
Received: by pxi1 with SMTP id 1so239340pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Cs7np84ThPdxrlSvHDwU9LUZ+K7aVIOL6eRXlyOhKZQ=;
	b=v0CPIYjT5Un+tTLFFXKRkEaWGtNSvQYrHTWiSmciJ4odAL9L4vUjoWLbWT7QruyWbF
	Khmc6ug7jGr+RdrZuobgdBfuoVFo9R9KT4/lMhKPIPwAzQaiMXRJabZTf2q3rBQPvgbb
	q2ku0hZxEi45pqtRDJi98QPowe5jX/tNl7Nmk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=d3siWWXwwomDOqGZg0k+Dq4/LhRUDjO/M2dpmqAJmNpjZD9J6iVq0GvgjhiqK7Vl6K
	S3LDxsUNOjazsoxxUTQWRRuz2L/JyxI7ODs061IM79tn25zqAktXPdjAR+4CLKd3NZLY
	XM4Ae5y7uIcZCx+DKOYnLt1uhEXNDNlnm6i9o=
MIME-Version: 1.0
Received: by 10.142.59.5 with SMTP id h5mr7085315wfa.0.1302686632617; Wed, 13
	Apr 2011 02:23:52 -0700 (PDT)
Received: by 10.142.237.11 with HTTP; Wed, 13 Apr 2011 02:23:52 -0700 (PDT)
In-Reply-To: <BANLkTim3y5mBwn6Qhfy754Oreioz93xQBw@mail.gmail.com>
References: <1301955176-14829-1-git-send-email-ynezz@true.cz>
	<BANLkTim3y5mBwn6Qhfy754Oreioz93xQBw@mail.gmail.com>
Date: Wed, 13 Apr 2011 11:23:52 +0200
Message-ID: <BANLkTimi6be3U-8PNH9VvDoHnhK=4xb6QQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH RFC] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Wed, 13 Apr 2011 09:26:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

> Just to be sure, I moved udev to 04 after 03 sysfs.

I'll add that /initscripts_1.0.bb expects udev as S04

...
	# udev will run as S04 if installed
	ln -sf		../init.d/sysfs.sh	${D}${sysconfdir}/rcS.d/S03sysfs
...

but udev starts as S03 since commit 523f22b938703b56a823fa9e9c577869669ddb82
(udev: Use udev.inc and add udevadm to udev pacakge instead of udev-utils)

Seems udev needs a fix...


Andrea


