Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OxRAE-0006de-Mf
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Sep 2010 23:11:11 +0200
Received: by iwn2 with SMTP id 2so3755989iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Sep 2010 14:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kZW3VFzwndqYDRTz0bkl5XF/GBdcKgStshY7zlLDSO0=;
	b=X1tL9N+0l1YEAcx0qZh0QDwOkUpagP0d7A1Xh/Z5yLsKcAMTD6tafz7T5T5Qv2T7Q2
	+n2Sq0o+tOgowasX9m+GozOLIgqa+PMsRRHgy2o+j2K1JycfQry2be334ugp5pLQ3OJJ
	0w8gx+0W6wz/FEj0JLGqq4E99OfJaDz1k0CKs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UQQ6YXxd97Y9vBwfkMo+XWq/HgA24wX0A+d0t4QxeXLiJfBiBvBAvv3qeuh7GF0pRR
	bMvvZHLrPv/7X30Hzvb/FXsyeoSvFH5WZ/EmAvfh8klV6xtnTF5w7gIFyVDH2u4VruR9
	UMWzT9lQFVTcFzPfixIBgJn1SUlC7//+9mic4=
MIME-Version: 1.0
Received: by 10.231.191.6 with SMTP id dk6mr9119438ibb.51.1284930618076; Sun,
	19 Sep 2010 14:10:18 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 19 Sep 2010 14:10:18 -0700 (PDT)
In-Reply-To: <4C967589.9080501@eukrea.com>
References: <1284921702-22995-1-git-send-email-fransmeulenbroeks@gmail.com>
	<4C967589.9080501@eukrea.com>
Date: Sun, 19 Sep 2010 23:10:18 +0200
Message-ID: <AANLkTimL2QKeoF545-Vk_f-Kch76dN5A3frF7mhMV0Cy@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python: remove python-dev from python-modules
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
X-List-Received-Date: Sun, 19 Sep 2010 21:11:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/19 Eric B=E9nard <eric@eukrea.com>:
> Hi Frans,
>
> Le 19/09/2010 20:41, Frans Meulenbroeks a =E9crit :
>>
>> python-modules has python-dv in it sdependencies.
>> I'm not a python wiz, but I feel that is no good as it drags in a lot of
>> dev
>> packages. Note too sure if thre should be a depends on python though.
>>
> please see this patch serie which waits for an ack (PR will be increased
> after) :
>
> http://patchwork.openembedded.org/patch/2917/
> http://patchwork.openembedded.org/patch/2919/
> http://patchwork.openembedded.org/patch/2918/
>
> Eric

Hi Eric,

Your patch seems to address the same issue.
Actually saw it before but didn't realize I was facing the same
problem (and didn't know enough from it to ack it)

Frans


