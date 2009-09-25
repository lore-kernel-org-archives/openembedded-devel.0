Received: from [209.85.218.226] (helo=mail-bw0-f226.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Mr7W3-0000Kv-Ig
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Sep 2009 11:55:06 +0200
Received: by bwz26 with SMTP id 26so1809659bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2009 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Ot6Ed6rnjvzlaQbCZmc6ZmV7XAMv5jZ9pydk4qLPJNw=;
	b=llXz/Ik8p4gWNDJ0iKHGhkOjjYc954J67r1eaAUijB+Lo+cZrTdf2Glf18jvFyzKHS
	xx5xLYFi/XZGe3Hau0woB36Wpplc8aim8DmLsOwR5+P7lTZhXV8bHKWzYGg2H+PPMXUX
	Qf7Dzt+dhC/CrGSQ/DWWKlUk80Akjlf8ggD4c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GDp0tALT0VtnqUL8yzq2AKYcmZqMZRb/JIWfjM6PtqOq3kxzX0ygbhQNvIupNsACSd
	yLaAJ0yR+Lebeu96TDXCPrB69g4XJ6erymBzYmEihD+zaxtVLs96mg181YHTjhBWysVx
	d9+faoWI67hAyEggd3WQd2DpAx4FhF7omB/+0=
MIME-Version: 1.0
Received: by 10.239.168.200 with SMTP id l8mr400237hbe.83.1253872463574; Fri, 
	25 Sep 2009 02:54:23 -0700 (PDT)
In-Reply-To: <200908141710.43549.u.luckas@road.de>
References: <200908141710.43549.u.luckas@road.de>
Date: Fri, 25 Sep 2009 11:54:23 +0200
Message-ID: <c384c5ea0909250254h5286548csfcaa473ea663ba28@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: coreutils-native race
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
X-List-Received-Date: Fri, 25 Sep 2009 09:55:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Uli,

On Fri, Aug 14, 2009 at 5:10 PM, Uli Luckas <u.luckas@road.de> wrote:
> build process trys to delete some file. This leads to "rm: text file busy"
> because rm is still open for writing.
>
> Has anyone seen this? And is there a known fix or workaround?
>
Yes I have seen this (every 1 out of 50 builds or so). Thanks for
diving into this one.

(Of course, only seen when building from scratch, which I now default
to because of these kind of bugs.)


Cheers,
-- 
Leon


