Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rq1k9-0006e7-FS
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 13:14:25 +0100
Received: by dakf10 with SMTP id f10so800504dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 04:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=A0STO3cE49uQORKQCx6uW6a5l8V4bIQCIrle7K2xp8k=;
	b=fh2bR8GNM+sQzpq6/NA7ggxYZoSM8oQsU0MpFh7u3q1eDbKx1Z+Wg/pTvAxB55qZtv
	gnn4CB0J6ypjBW+CyKl7xFUkxDSVoTkc0n6BcIMWes0RWs8RS6FK0tT0TOrBjHexLiyj
	6vK968e73HLdj49dbWyCvZ0ILsjkj1/z3jKVo=
MIME-Version: 1.0
Received: by 10.68.212.40 with SMTP id nh8mr39713076pbc.114.1327493196737;
	Wed, 25 Jan 2012 04:06:36 -0800 (PST)
Received: by 10.142.166.19 with HTTP; Wed, 25 Jan 2012 04:06:36 -0800 (PST)
In-Reply-To: <CAMKF1sor3Gq4VRmiyWKbwJ8J=bcHQq+oOJH3H5a=SAcLAzE1iQ@mail.gmail.com>
References: <1327449958-9778-1-git-send-email-andrea.adami@gmail.com>
	<1327449958-9778-2-git-send-email-andrea.adami@gmail.com>
	<CAMKF1sor3Gq4VRmiyWKbwJ8J=bcHQq+oOJH3H5a=SAcLAzE1iQ@mail.gmail.com>
Date: Wed, 25 Jan 2012 13:06:36 +0100
Message-ID: <CAAQYJAvrtwRDn4Cq8sH4cufF9HiE5uUwpbktz9f2KQWGo1OZRg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] udev: default disabling DEVCACHE
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
X-List-Received-Date: Wed, 25 Jan 2012 12:14:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 25, 2012 at 2:44 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jan 24, 2012 at 4:05 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
>> * Ininfluent when using systemd.
>
> Did you mean inefficient ?
>

No, I meant this patch has any effect when using systemd since commit
5c3ba556836252a0ca4179173cad3c85c15bde77

udev 171: disable cache on systemd setups

....

# disable udev-cache sysv script on systemd installs
	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/udev-cache.service


....

So it looks to me this only (badly) affects images using sysvinit.

Regards

Andrea

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


