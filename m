Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1N8Aoy-00023x-UP
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 11:53:08 +0100
Received: by ewy5 with SMTP id 5so925316ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 02:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=Emm0/ZDz3HLcgYlGpPN9fseuskhc7uA9C6V84Nz52Rc=;
	b=loF2k0CrfAvfbT7XA77qP7FrQj/nI7OFg9VVI1ozWk8poommmPb9b7CpRHKicriwk/
	LqJvQMgzmjr0/92LkCsmIDTz6tO6n6JDhgcnE6/neMwjGhOe0toT0T3HGJMlebAKs3PF
	9YgN5TtF/GeGIgPU15v8BvGYbiR9FfTAnmh/U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:message-id;
	b=g+gP4ho8uWExGYBY+/lz/+U5AtSBOfAlpM346oT6IU/GQvsAjiElET6ynAhMn0AzPP
	+gX96ovbzgm2wh90i31vU+BPTtkfAvmEgCgoKgjI+i6Jm+v8gHaCnFtduHUghVMgXinH
	osOxCTrkenoNDOri9JJwmmqrWU3bPnCN+dDGg=
Received: by 10.213.0.218 with SMTP id 26mr1456954ebc.85.1257934774063;
	Wed, 11 Nov 2009 02:19:34 -0800 (PST)
Received: from is.home (93-81-70-123.broadband.corbina.ru [93.81.70.123])
	by mx.google.com with ESMTPS id 7sm3743944eyg.17.2009.11.11.02.19.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 11 Nov 2009 02:19:32 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2009 13:19:16 +0300
User-Agent: KMail/1.12.2 (Linux/2.6.30-std-def-alt14; KDE/4.3.2; i686; ; )
References: <1257867936.1484.281.camel@mill.internal.reciva.com>
In-Reply-To: <1257867936.1484.281.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200911111319.16947.jay4mail@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: jay4mail@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM 2009 summary: Future plans for stable branch(es)
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
X-List-Received-Date: Wed, 11 Nov 2009 10:53:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello!

> - RP: important not to let backwards compatibility stand in the way of
> progress; development tree needs to move forwards.  There will come a
> point where old stuff cannot be sensibly maintained and must be deleted:
> e.g. old gcc versions do not support sysroot which is needed for staging
> nowadays.
> 
> - Phil B: agreed, but would prefer to keep old versions working as long
> as there is little/no cost in doing so.
> 
> - KG: lots of old cruft in tree makes it hard for new users to find
> examples of best current practice.
> 
> - Phil B: can we move the cruft out of sight rather than deleting it?
> Punt this to discussion on splitting the tree.

I just want to remind about tagging possibility of git :)
We can (and imho definitely must) tag revisions before dropping any of such 
things.

-- 
Yuri Bushmelev


