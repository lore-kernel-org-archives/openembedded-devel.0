Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMOsY-0001Md-DT
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 19:15:51 +0200
Received: by fxm9 with SMTP id 9so3926169fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 10:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=VIF97tGc1Bdo8HoqNb7CiNYpcb/HeBqIdRCiL5tcZUI=;
	b=eHic/P9ZtoE2/6WcPhX+w/GK4ib6iQSvbLJObD92u+OMvR7EmCn1/OJqe2ie7lkrFM
	1xwbLrT8ZvRIWXBWIIqUFTuTZSo6KBbAPpl9V+53yErh9A8FWTNIGVxJCOd10SOYETmr
	iw/okXZIm/T67oN3oO5FEPkKLnIx8A9YGIg1U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=TRhZJEk8nb4umw1tYwat0iJG0cDGqtUKf3iPI5xRq1ltWa7+Ga9Mt1tCRNG8IXPfIL
	cbvxJaPrvJNjK9uJaBPDKWNHa7frPFsMVsl+/+lJ534Eq7AlRB1y0y9vYa8HBdwo7hFY
	K046MeoJsbORFOJBIJb8DAvQQiZH3ziL+zTJs=
Received: by 10.204.132.211 with SMTP id c19mr2266874bkt.184.1276103487949;
	Wed, 09 Jun 2010 10:11:27 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id z20sm30384574bkx.9.2010.06.09.10.11.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 10:11:25 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMOoQ-0000kP-Tk; Wed, 09 Jun 2010 19:11:34 +0200
Date: Wed, 9 Jun 2010 19:11:34 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100609171134.GN14941@mx.loc>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
	<1268415992-19603-3-git-send-email-rep.dot.nop@gmail.com>
	<201004052349.55933.roman@khimov.ru>
	<20100408093014.GD27376@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20100408093014.GD27376@excalibur.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] sane-toolchain: add PREFERRED_UCLIBC_VERSION
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
X-List-Received-Date: Wed, 09 Jun 2010 17:15:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Apr 08, 2010 at 11:30:14AM +0200, Stefan Schmidt wrote:
>Hello.
>
>On Mon, 2010-04-05 at 23:49, Roman I Khimov wrote:
>> В сообщении от Пятница 12 марта 2010 20:46:31 автор Bernhard Reutner-Fischer 
>> написал:
>> > Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>> > ---
>> >  conf/distro/include/sane-toolchain-uclibc.inc |    7 +++++++
>> >  conf/distro/include/sane-toolchain.inc        |    3 +--
>> >  2 files changed, 8 insertions(+), 2 deletions(-)
>> > 
>> 
>> Acked-by: Roman I Khimov <khimov@altell.ru>
>
>Looks fine for me as well. Khem, Henning any comments from the uclibc side?
>(Askign because you two have ulibc as interest in the MAINTAINERS file)

wasn't applied yet, AFAIR. Re-sending updated variant in this thread,
fwiw.


