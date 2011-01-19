Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PfU6B-0005Jf-Ch
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 10:13:03 +0100
Received: by iwn8 with SMTP id 8so614914iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 01:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=HyojEbKGmqF6M25/akMkD7F9CvkuN17/Gl/WBW/TfqA=;
	b=MhAfynsmPVSRfHU0YWdQumBFiuyogFeguzPwB5em8CimytE5PLlL+mWlHazCy+rF8s
	NtIbIaOKlwJP9Ji3HjN1JxnUNJoqqQye9KZ05TueSw6A92pEXGaXBGyq7cMD6KmLV0HU
	ShB0dcMLZNsXm7VyAd1GRGyrJcubg2PrKTHHs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=q0cgNzZ/59pGWaqLOXE3FLrGOTlGx162We5habYuwScYYUoE/XBdulDpq+D3SfdSVC
	yC2pgRkv8vUQxxrCTM3YVC92tjnpQyTeI9dzDH/XhsuLSyocLa9MMXGV+hTqMRIECKVT
	6787gvk4Vaq4DwJxDb61rrx6ow6xuDaezngAo=
MIME-Version: 1.0
Received: by 10.231.34.65 with SMTP id k1mr489228ibd.9.1295428344341; Wed, 19
	Jan 2011 01:12:24 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Wed, 19 Jan 2011 01:12:24 -0800 (PST)
In-Reply-To: <4D36A64E.9060804@xora.org.uk>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com>
	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
	<4D36A64E.9060804@xora.org.uk>
Date: Wed, 19 Jan 2011 10:12:24 +0100
Message-ID: <AANLkTi=8uKvujKLqG2cw3h3gLmmcU=KNfdmSwB5imfsH@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 09:13:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/19 Graeme Gregory <dp@xora.org.uk>:

>> I wholehearthy agree with the proposal that it is left to the package
>> maintainers discretion.
>> Wrt the GPLv2+ version. I suggest to reflect this in the name.
>> E.g. you could have samba and samba-gplv2 (or perhaps samba-gplv2 and
>> samba-gplv3). Then it immediately becomes obvious why there are two
>> versions.
>> Similarly with versions that became a lot fatter over time (which imho
>> is a good reason to keep the old version).
> I am totally against this idea, it just makes a total mess of the
> namespace. We have the ability to put comments in bitbake files use it.

I don't think there are that many recipes for which this is relevant,
so the namespace clutter is limited.
Comments in bb files may work equally well. Problem is that those
comments are not written in the files.

E.g. you mentioned you wanted to keep an older abiword version because
it is much smaller. Fine, but I have no idea which of the 5 versions
you want to keep.
(btw, talking about namespace clutter: there is also
abiword-embedded_2.6.8.bb) and 2.8 recipes including a 2.5 inc seems
also an issue that might be worthwile fixing)

Wrt the message of Martin: I did a quick peek,
include/angstrom-2008-preferred-versions.inc pins about 60 recipes
(actually a litlte bit less if you count libtool libtool-native
libtool-cross libtool-sdk etc as one). Most of them are for libs. This
also seems to hold for other distro's.

Frans


