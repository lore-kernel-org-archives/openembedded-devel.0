Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <isburger@gmail.com>) id 1NwAx5-0000gR-Dm
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 11:08:08 +0200
Received: by fxm20 with SMTP id 20so9145242fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type;
	bh=W0lTdoNt2s86eqUIJPX09jAaNt8fV9H4JpJkO7LTHoQ=;
	b=QlZ5i5asid2q4K8TvZskaEOVgnVIrc/HAQ83YjK01K6TRgNKpzTQWkWPiP+Gm8gJGj
	whuNSXc5oCeUtB+lU0cHmqEiJU6IYzgTjO1pn/03umfMCZ2ZtXwJ3Jw69ldZyXUIu+2e
	EMlDOo5PV3FKUNAGUSO81xkyK2Gs4rkyCYbzs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=O8NVRR2yzccpTCni2vnJocZPu1hEOHP0sE66qMTmXQpYhB1jrjrUcLDRB4og2kHL2n
	qN4UOaYDRrSNEQOe2C76AeRYINfxnTt6ev9h/+YWUJOHvLV+sMr9uACAvSA+PZm6S81x
	aPXpFRs5OfspH7nJBxfUfy//vweXwSNDdl4ss=
MIME-Version: 1.0
Received: by 10.223.108.66 with HTTP; Mon, 29 Mar 2010 02:04:52 -0700 (PDT)
Date: Mon, 29 Mar 2010 11:04:52 +0200
Received: by 10.223.102.214 with SMTP id h22mr4431320fao.105.1269853492666; 
	Mon, 29 Mar 2010 02:04:52 -0700 (PDT)
Message-ID: <e2e2e5501003290204v44f677f0s401d0e729cb05dd6@mail.gmail.com>
From: Izak Burger <isburger@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: isburger@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Downgrading the kernel
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
X-List-Received-Date: Mon, 29 Mar 2010 09:08:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

First post for me on this list, so I appologise if this is documented elsewhere.

I've been given the task of developing a proof of concept on the
dreambox. My hardware was shipped to me, arrived via courier, I built
the first image from your 1.6 tag (apologies if my terminology is
wrong, I'm more familiar with svn), and the hardware promptly did
something strange which eventually revealed the fact that it is a
clone. I didn't even know clones existed until then.

Without getting into the specifics and the ethics of clones, or the
specifics of how I downgraded to bootloader and unbricked it, my goals
are to work around enough of this so I can get on with the task at
hand, and for this I need to downgrade the kernel from 2.6.18 to
2.6.12, in order for the older binary-only kernel modules to work with
it (the older modules don't check the bootloader).

So far I haven't been able to figure out exactly what needs changing
to select the kernel version, and I'm also unsure what other packages
might be affected. Alternatively, I could also just stick with 1.5,
which seems to have the 2.6.12 kernel from a cursory glance. Any
advice will be much appreciated.

regards,
Izak Burger


