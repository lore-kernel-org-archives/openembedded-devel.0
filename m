Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pqr0E-0005Ou-Gt
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 18:53:54 +0100
Received: by qwi2 with SMTP id 2so3934254qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 09:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=pXD4Y1pItyhjS5nDKpzfZ6Pf+Xo9LIViYquwteLdGjU=;
	b=rkWJGCl21cgAMC+waaL0zRx5OrOf6iHI/dV+CV/Lio3ci5AWicKDGzFcHglqzY7r8I
	69PF4+wnxpHmZPOcZGxBvkEaViUf6pf6fNKBlMJkchQGIlWG3c3R9BP36H1+7+EZgFma
	h4ZuCIXnNNJ7ZNrp3xAhDcfqqu3mmDB2xg4SU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=lXWgHpCTzotldMlHd76E0R8Zb7WUuubKgsZZEmSaihx3+1orN6JhqFoi+n3/T7SHRq
	xg63LZxHGQb9Dg0GktOHsENnSdgUYGFL6pNKnkPvQNPxMTZ1v9OwBF+Hs/oj3VSAJXaq
	NwdfoSmVoTgyhUexCrl6A93ffyZTmyOVVG+jg=
MIME-Version: 1.0
Received: by 10.229.91.2 with SMTP id k2mr1537852qcm.260.1298137957666; Sat,
	19 Feb 2011 09:52:37 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Sat, 19 Feb 2011 09:52:37 -0800 (PST)
In-Reply-To: <4D5EE9A9.10205@mentor.com>
References: <4D5E45C1.7010504@opendreambox.org>
	<1298063776-2260-1-git-send-email-filip.zyzniewski@gmail.com>
	<4D5EE9A9.10205@mentor.com>
Date: Sat, 19 Feb 2011 18:52:37 +0100
Message-ID: <AANLkTi=THJbX1YVpd28sXXz1JuCS8WQq5P9vj6S1=UE1@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] package_deb.bbclass: armel architecture name for eabi systems.
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
X-List-Received-Date: Sat, 19 Feb 2011 17:53:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/18/11, Tom Rini <tom_rini@mentor.com> wrote:

> I'm a little puzzled. So little endian gnueabi ARM is armel, little
> endian OABI ARM is arm.  What about big endian ARM cases?  Thanks!

According to http://wiki.debian.org/ArmEabiPort:

==================
At the Extremadura emdebian meeting, 12-16 April 2006, the name
"armel" was chosen. If a bigendian arm EABI port will be created, it
will be called "armeb", and it will replace the previous oldabi-based
"armeb" port effort.
==================

bye,
Filip Zyzniewski


