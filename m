Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4Tbz-0001m5-Pe
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 09:12:57 +0200
Received: by iwn7 with SMTP id 7so520273iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=b/KDCCEmjv4WxE7edTpihWTgtfB4TCu+VT/STOdpgis=;
	b=jzpJ//J/xe7CLzAj3CVya+a4MeNIrUfK+2qz5+7I2hy/Qop+vKkWmDlyKuUZw2FrjT
	4uuTHOjP72jvxScjS7Vlf3LszcYfEUVDBRrb9GN6mCgAUgfeyYARkNv6w7GqRR6cOLc0
	hzjyKkn1NxEverkBAmmLb0+ZX1W80olaie3OI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=q3VRCDOj9mfsNPJAj569KKzhI0V2Bgm5igSW22o+DmM8TFhviUk9RJbW6eAWn7GL5O
	u9RqWDqQu9F2rAPNNLizPQd43eYtvBDw05X2cQFyOX8bLM/UrzJN55MmMi5lHook9L9h
	GzUnUklVilA9vJ2RE0GeYbh0UN13y90whpWYE=
MIME-Version: 1.0
Received: by 10.231.30.134 with SMTP id u6mr3028810ibc.121.1286608348152; Sat,
	09 Oct 2010 00:12:28 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 00:12:28 -0700 (PDT)
In-Reply-To: <AANLkTikN6gTqrT76Bn2c_BWa=1MHE9cJd1v=5r2QGn8u@mail.gmail.com>
References: <AANLkTikN6gTqrT76Bn2c_BWa=1MHE9cJd1v=5r2QGn8u@mail.gmail.com>
Date: Sat, 9 Oct 2010 09:12:28 +0200
Message-ID: <AANLkTi=t+_mRxVCRcKUN0UwXmd38uNno02rE==A1CiNn@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Prefer wget 1.12 by default
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
X-List-Received-Date: Sat, 09 Oct 2010 07:12:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/9 Khem Raj <raj.khem@gmail.com>:
> Hi
>
> Right now we use wget_1.9.1.bb if someone did not pin wget to other
> versions. We have recipes from later versions
> like 1.12 but they have DEFAULT_PREFERENCE="-1"
> 1.9.1 has problems building with -j > 1 as many times build break with
> Text File busy errors.
>
> I would like to propose that we upgrade defaults to 1.12. If someone
> has objections here is your chance.
>
> Thanks
> -Khem
>
>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


