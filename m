Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NpSZt-0007GO-K0
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 21:32:34 +0100
Received: by gye5 with SMTP id 5so721199gye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 12:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0szNK4YQB4mZjw0VSIZ7Lch1X7o3O0slmaqKjl+cjJg=;
	b=SlkTx4UEdk6fVwxCIuOnacalDwYNlGi8MD/FT7alGP2H6yZuWuI9pLr7NvgQ//P0eA
	GHVnYPwt4l0SKGMPTfnvhZmBZ/nbNNGXYP4hF0UU2QzZuY3IJUN5hBxKqLNiuHmqevcA
	riYqbOx4eAuGeCUxooBAU9nRwrp5fN4+gG/PA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aho9U2RUPSPXtE3osw3LRFFLydSeEeFCZ+2px0Tw5InzLktaJRwxb1hL3L+1PzK2DZ
	UlkeLuG63KcDLSb7OZ8e+g+YnSjKhU/ctuRpSwT9gAu9UsjLJV5zxcmqVmXWwCbzfAMF
	it5utjZGiLjxhaLAeu4SgMCKmCm9xuLDFRqRI=
MIME-Version: 1.0
Received: by 10.101.131.3 with SMTP id i3mr1664357ann.83.1268252967244; Wed, 
	10 Mar 2010 12:29:27 -0800 (PST)
In-Reply-To: <20100310160116.GO31945@jama>
References: <ac9c93b11002281201j44a861e1saa803be9f338ee10@mail.gmail.com>
	<20100228221056.GG30145@xora-desktop.xora.org.uk>
	<ac9c93b11002282328l61356cc1y188b47d0f974369e@mail.gmail.com>
	<ac9c93b11003100744g5eee3250me7f0b668e8727060@mail.gmail.com>
	<20100310160116.GO31945@jama>
Date: Wed, 10 Mar 2010 21:29:27 +0100
Message-ID: <ac9c93b11003101229s6a23a40ayb0ba2f220369086a@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] duplicate recipes
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
X-List-Received-Date: Wed, 10 Mar 2010 20:32:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/10 Martin Jansa <martin.jansa@gmail.com>:
> On Wed, Mar 10, 2010 at 04:44:48PM +0100, Frans Meulenbroeks wrote:
>> Time for a summary I guess:
>>
>> original proposal from me:
>> Probably the best scenario is to remove all versions which
>> - are not the latest version
>> - are not =A0pinned with =A0PREFERRED_VERSION =A0in conf/distro/*
>> - do not have the largest DEFAULT_PREFERENCE
>
> I think this rules are quite strict, in first iteration would be enough
> to keep only latest from each "major" version
>
> where major version is defined by common-sense (ie first 2 version
> number for xorg, but somewhere first number is enough)
>
> ie for xserver-xorg:
> ../dev/recipes/xorg-xserver/xserver-xorg_1.2.0.bb
> ../dev/recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb
> ../dev/recipes/xorg-xserver/xserver-xorg_1.4.2.bb
> mv ../dev/recipes/xorg-xserver/xserver-xorg_1.4.bb
> mv ../dev/recipes/xorg-xserver/xserver-xorg_1.5.1.bb
> ../dev/recipes/xorg-xserver/xserver-xorg_1.5.3.bb
> mv ../dev/recipes/xorg-xserver/xserver-xorg_1.7.1.bb
> ../dev/recipes/xorg-xserver/xserver-xorg_1.7.4.bb
>
> and update preferred-xorg-versions (1.7.1->1.7.4) and other if needed
>
>> opinions:
>
> JaMa: move older minor versions to obsolete, keep latest for each "major"

Noted!

(but for my understanding:why do you see it useful to retain old
versions that are not pinned. For xorg, being a complicated and big
thing I can partly understand it, but is there really a point in
keeping old versions of e.g. transmission? (noting that if needed they
can always be recovered from git).

Frans


