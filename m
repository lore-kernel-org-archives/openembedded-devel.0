Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1ObSKd-00049k-Cm
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 07:59:04 +0200
Received: by fxm12 with SMTP id 12so3300756fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 22:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=P9FrJoCptKJQGooYndiiPk9SmxSBoz5nbNOssZr8MkE=;
	b=Nkmubvn7RSCJkdDHfx93obiwbVYXlg+lCZKV5pgNJ+AtbrbMmNGhzN9TLb3jg/Pq4h
	S9n3UQq/kzEAgagRLhDcMHRoAKANNlYGjs7+pISf1gq255RZNzt3rbRATQCopBIVIS4E
	C+aSUWw321pggddadN6pAyhpRhNOC9P7HG0BU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HeMJSGZLuGtau6vXYS0QZYUooahvoHK8Doytoc2Gu1tfDxcPkYwuHLXMdbxvtbvZ9F
	AK3WJrjyV5ws3KbZGijqB9GAM26bcoE29V2/fNO3Xi5kZYI7e2i66DREku+N2JkGLKVZ
	p7d1YyH7gGSALsWYSN6zabwXL8rqs7Bt9WW9Q=
MIME-Version: 1.0
Received: by 10.239.131.4 with SMTP id 4mr143479hbl.118.1279691932034; Tue, 20 
	Jul 2010 22:58:52 -0700 (PDT)
Received: by 10.239.181.207 with HTTP; Tue, 20 Jul 2010 22:58:51 -0700 (PDT)
In-Reply-To: <20100720192253.GN1512@excalibur.local>
References: <20100709204055.GA12163@excalibur.local>
	<20100720070108.GE1512@excalibur.local>
	<i23lkm$ftn$1@dough.gmane.org>
	<20100720084026.GI1512@excalibur.local>
	<i24kf7$3d3$1@dough.gmane.org>
	<20100720173425.GL1512@excalibur.local>
	<AANLkTikYdD7jzsJBNEK0MedOmM_jHIEcdCfE0APMSOqt@mail.gmail.com>
	<20100720192253.GN1512@excalibur.local>
Date: Wed, 21 Jul 2010 07:58:51 +0200
Message-ID: <AANLkTinsqL1X3cuCRDedYB3h8rhDP3VehMC6RmKZ_wLw@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Wed, 21 Jul 2010 05:59:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 20, 2010 at 9:22 PM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:

> What does not fit your needs with the current stable handling?

It started out with a rather continous flow of changed from dev,
causing it to be almost as unstable as dev. Now stable/2009 looks
mostly dead.

What I need is a really _STABLE_ branch, but still maintained, on
which it is possible to base products on for customers which do not
want to hear about problems with the chosen upstream build system.
I realize that I am rather alone with my wishes for stable, so I just
rather silently express my wishes here for the record.

> I would like to have a more continous flow of changes from dev over some =
testing
> branch to stable. As indicated in my initial mail. That would people work=
ing on
> this idea and keeping it alive though. Given that no one seemed to be int=
erested
> but man seem to be interested to get a new stable/2010 branch the same wa=
y we
> had for 2009 it seems the most practical way to get one at all, no?
>
> Other models will only work if enough support from the active contributor=
s is
> available. Without this even the best idea might die.

Exactly, and this is why I don't really want to push my idea on how a
stable branch should work, as I realize I would likely end up being
rather alone maintaining it, which is how it is today with my customer
OE projects anyways.

/Esben
--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


