Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3jXS-0000vO-ML
	for Openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 08:01:12 +0200
Received: by iwn7 with SMTP id 7so27015iwn.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 23:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=FUzvvnRcE8dYek2ml5rVRJpnFTnZpnhlA2cVkpX2duI=;
	b=DYg7whXkbGMoze7VVOXpq24yk4ViDqG7qmQCGO3j5ZWs1E8hQdKxeaoIpzE1DOGc4f
	tTeXeNVFQ6uT93dI1P5ZdiT3C2WpSGdeHw4ZlNU9FnLoiKIfvsmX5BSvxWH/pC4Be07a
	V8RFpzLrcVZTJCmxY+xWvWpHKFlRhrl6FdaT8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=qk5sGivSzOW+diziYnTXBkAyVdACZkDBiFjg3liSNxTe+zpWBCxvKKGQiZ5S0I7Ntw
	76bK5Ce4/HBrVG+avXiTRlkSFojNe+sxdsK1pFCTt3UxZQwlLGoeeniRasrb/5DZkcoR
	zjKrlh07X+UxPO00mc1iZ+FL1E8X8c9Wz9Qo8=
Received: by 10.231.147.202 with SMTP id m10mr363980ibv.2.1286431206930; Wed,
	06 Oct 2010 23:00:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Wed, 6 Oct 2010 22:59:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Oct 2010 22:59:46 -0700
Message-ID: <AANLkTik3=c=HKZ+EHkan8OSZDt8JfS+bbj5ZtBgJgBpM@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: libvpx should not inherit autotools
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
X-List-Received-Date: Thu, 07 Oct 2010 06:01:12 -0000
Content-Type: text/plain; charset=UTF-8

Hi Koen

libvpx recipes are inheriting autotools while it seems to me that they
should not. Yes it does have a configure script but its not autoconf
generated but a hand written one
and there are no other traces of autoconf or automake and stuff that
goes with normal automake autoconf build systems.

Would you take a look at it ?

Thanks
-Khem


