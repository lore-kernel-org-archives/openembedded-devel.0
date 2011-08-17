Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QtoGR-0001k7-JV
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 00:07:07 +0200
Received: by pzk2 with SMTP id 2so2459221pzk.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=XdMhJuHQiJnxww0fzpFrJUoY55ld7e62b0sMejy/FtI=;
	b=lMaYKdGW5L2j7NiUmiCEemhIGOES/76uupo2nWi958fX6CX+hl3ylwh1cPFuNhCWVj
	6IVdLp1Kp6izTJfY+0KJCLO+FkoRlYbgnwgOqoNHFXrDre4oRDNO5Ym0rv/+RrhHpLF6
	xSh8VGEmREao5W9YHoTFxIRj8MS1ug8aBr6yE=
MIME-Version: 1.0
Received: by 10.142.242.6 with SMTP id p6mr436622wfh.352.1313618547155; Wed,
	17 Aug 2011 15:02:27 -0700 (PDT)
Received: by 10.142.200.1 with HTTP; Wed, 17 Aug 2011 15:02:27 -0700 (PDT)
Date: Thu, 18 Aug 2011 00:02:27 +0200
Message-ID: <CAAQYJAs1K3udDgFUKvj9nOYnYwj-AkuX_Xdgv4R9SLEnTEL0bQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: tzdata-2011g fails to fetch
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
X-List-Received-Date: Wed, 17 Aug 2011 22:07:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Today's build with oe-core + meta-oe was broken by a fetch failure:

ERROR: Function 'Fetcher failure for URL: '
ftp://elsie.nci.nih.gov/pub/tzdata2011g.tar.gz;subdir=tzdata-2011g'.
Unable to fetch URL
ftp://elsie.nci.nih.gov/pub/tzdata2011g.tar.gz;subdir=tzdata-2011g from any
source.'
 failed

Main question is why do we have txdata-2001g in meta-oe when oe-core has
-2011h ?
Can we remove it?

Regards

Andrea

