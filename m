Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8g2v-0007yp-Nb
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 23:18:06 +0200
Received: by yxt3 with SMTP id 3so2065302yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 14:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=M+NVPGkSn2TJO5bs8Tlllo5cgZ97hsqpr4JSjxZVuMg=;
	b=hsiXMM9+z5C/mth9xEUDr0l3W6Pg/GjuKOZ/oYIEXFqv06P5SqAZRFkK9wJqmitVsW
	bXLvWbd8ie7DB26FXBYYl15UBEPSVcZZILMbjMP4tD5we/mkf4y1tM8uA9AjDgAOwJKc
	SwAlRNnLXY9Hw2N53HFPWl8iLMtE3gfa1yEeM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=roaXaJi25KLoG9ozHDvqn3qcU3AqLeoSntom47iRuB7cpEbfkAufmja5ZOHHnka2Id
	Tn7hIU1xv40YYCP4z4BqoCl//U1n2gxuZut1q6zqvlHz/xvxxxjmfuAnQaDZQzkXmK3P
	7TxPwvtWG3wW5hP6r1OYCbG+shqUqANaWv64U=
MIME-Version: 1.0
Received: by 10.150.202.21 with SMTP id z21mr2017250ybf.419.1287609449189;
	Wed, 20 Oct 2010 14:17:29 -0700 (PDT)
Received: by 10.151.47.14 with HTTP; Wed, 20 Oct 2010 14:17:29 -0700 (PDT)
In-Reply-To: <20101020203828.GU11514@denix.org>
References: <20101020203828.GU11514@denix.org>
Date: Wed, 20 Oct 2010 23:17:29 +0200
Message-ID: <AANLkTinqUsT2vubiPH-vM4oxSaDhcqvA=khN2q-tXHkA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: LICENSE field format
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
X-List-Received-Date: Wed, 20 Oct 2010 21:18:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/20 Denys Dmytriyenko <denis@denix.org>:
> All,
>
> We've had a number of discussions on the license matter recently. Trying to
> unify those brings us to the question of the LICENSE field format in recipes.
> As some projects are dual/triple licensed or use multiple licenses at the same
> time, it becomes hard to specify it all in the LICENSE field, especially when
> there are no rules defined. We do have several different formats used to
> separate multiple licenses, which is quite confusing and doesn't make it clear
> whether licenses are AND-ed or OR-ed (I know those are not legal terms, but
> for the purpose of this discussion that's fine :)) Here are some examples:
>
> LICENSE = "License1 License2"
> LICENSE = "License1|License2"
> LICENSE = "License1, License2"
> LICENSE = "License1+License2"
> LICENSE = "License1/License2"
>
> LICENSE = "Very Long License Name"
> LICENSE = "License with some exceptions"
>
> To make matters worse, src_distribute.bbclass splits the field at spaces and
> creates directories for each token. So, for the last two examples above, we
> end up with 4 directories for every license - each word is a separate
> directory...
>
> I'd like to raise this issue and start a discussion on unifying the LICENSE
> field format (and fixing src_distribute.bbclass accordingly). Would be nice to
> collect some ideas here on the maillist and/or discuss it further during OEDEM
> next week. Please feel free to comment.
>
> --
> Denys

What do others do?
I know debian has a license file. (and actually that could probably be
a good source of info to set our LICENSE field)

Frans


