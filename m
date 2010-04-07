Received: from fg-out-1718.google.com ([72.14.220.157])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tarjei.knapstad@gmail.com>) id 1NzTLe-0001KW-J2
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Apr 2010 13:23:11 +0200
Received: by fg-out-1718.google.com with SMTP id e12so1349759fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Apr 2010 04:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type;
	bh=oX7XTBbmVONxROZeF1R7nTjoB+hopySKLpuTPePU/2s=;
	b=Sy1mbgkEUx9GGJhNEy+2Gzl1wexBiiCxPicbwGMOiL9gXhq5xoK0pLLb9IA2dNlQf3
	PG8lyQ5nBRFNS4OInWYqfN1JEJovq04UUgcq6P20olFno7jPLxW9B95KkbqCpsp25DbO
	qgKMAFPmPjex14vZTYG9c++Sg0cDB/GNNK0zY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ZSftQzOrAcnF20aVmBmDypwFa0QOxUD9EtcweIh/cek27NlEALBdM3YZKdSi2MKkPE
	Wu0yL+/n1+RZA8MfypE8AcbUfIEYNe5mHHXrWal1Gc653aqKEDvniwvodA83dsZ7iR04
	MAu12C1Qf/zx4IuiF0YmqcvlxqCJwHQpI7m50=
MIME-Version: 1.0
Received: by 10.86.28.3 with HTTP; Wed, 7 Apr 2010 04:19:36 -0700 (PDT)
Date: Wed, 7 Apr 2010 13:19:36 +0200
Received: by 10.86.239.33 with SMTP id m33mr13273013fgh.31.1270639177005; Wed, 
	07 Apr 2010 04:19:37 -0700 (PDT)
Message-ID: <y2iff5e09cc1004070419rc4d1a8b5pc70183541054163b@mail.gmail.com>
From: Tarjei Knapstad <tarjei.knapstad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: tarjei.knapstad@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Does anyone have a CUPS 1.4.x recipe?
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
X-List-Received-Date: Wed, 07 Apr 2010 11:23:11 -0000
X-Groupsio-MsgNum: 18450
Content-Type: multipart/mixed; boundary=001485e8e512c95d9d0483a3bcbc

--001485e8e512c95d9d0483a3bcbc
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I've been trying to build CUPS 1.4.2 and 1.4.3 on the OE unstable
branch (Angstrom for a BeagleBoard) which seems to work fine after tweaking
the recipes for 1.3.8 slightly. The cupsd daemon segfaults instantly
however, and I'm having
some trouble debugging the cause.

Before I spend more time trying to get to the bottom of this, has
anyone been able to successfully build and run CUPS 1.4.x on the BB
and have a recipe they could share? I found a posting from Jay Snyder
back in January, but couldn't find an actual commit anywhere:
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg02702.html

I have attached my attempt at a recipe (skips building manpages and
testing the ppdc tools).

Cheers,
--
Tarjei

--001485e8e512c95d9d0483a3bcbc
Content-Type: application/x-gzip; name="cups-1.4.3-recipe.tar.gz"
Content-Disposition: attachment; filename="cups-1.4.3-recipe.tar.gz"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g7q1q8lg0

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

--001485e8e512c95d9d0483a3bcbc--
