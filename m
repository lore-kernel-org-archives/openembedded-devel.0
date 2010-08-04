Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgWvf-0002rK-S2
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 07:54:16 +0200
Received: by bwz10 with SMTP id 10so2644518bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 22:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=o+YQs2BCmdtTCXsz30mt08cNZ4JU1ETvsYYopDLDHMc=;
	b=IQSj0W8AuzKr/Sube+k6LY+d0sZAL70Sl3llaFItDnhUsIi8/T84U6sAD928FpaP+/
	v4tUkNyNs5ylFMif1i6EOUDIJVEeg+Odgia8zOa/eHfaweL+j4yqKF/b2RmnjntGdZXJ
	AnMW3YtIxg6sPnr8edqXJ7zmyB0b8pxpn4buc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Va3XrQ+x0e8IjoZzdj4hqobJa31QRpwdZXxs1oz9K15YX12YmejikXiw4npei1CReJ
	xEke1yX8E8u7unFnnPJaeesIMdx6i1gpwDjuBjpxSwdHpHJIT92z2WqTTiQaj3B4cRds
	SLiBZWUdeP34GQHGZ1JAWyiCOpRglzdE8f5ZU=
MIME-Version: 1.0
Received: by 10.204.82.200 with SMTP id c8mr5928793bkl.102.1280901254049; Tue, 
	03 Aug 2010 22:54:14 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 3 Aug 2010 22:54:13 -0700 (PDT)
In-Reply-To: <20100804021340.GA6206@gmail.com>
References: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i38mr6$ng8$1@dough.gmane.org> <20100803235811.GC17391@denix.org>
	<20100804001040.GE17391@denix.org>
	<AANLkTi=EvHvOcpqYp1rZx-C0hBnQbZneJW2L5og6eBZ4@mail.gmail.com>
	<20100804021340.GA6206@gmail.com>
Date: Wed, 4 Aug 2010 07:54:13 +0200
Message-ID: <AANLkTinxkRqnaxxRWGv8Cqudx2t6YYXfFfK2r4LqOch_@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Wed, 04 Aug 2010 05:54:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/4 Khem Raj <raj.khem@gmail.com>

>
> > I dont think this has been pushed yet. I have it staged in my tree though
> > I am building from scratch lets see.
>
> oh indeed it is pushed. Well well. We should have got rid of inherit
> autotools_stage in mass as well but I have a patch for that.
>
> After gettting two acks and in view of the PR thing, Koen pushed it
yesterday afternoon (his and my TZ).

Wrt your remark about getting rid of autotools_stage in mass and having a
patch:
Can you submit the patch for review so we do not duplicate work

And while we're at it:
Should code like this:

do_install () {
        autotools_do_install
        install -d ${D}${base_bindir}
        mv ${D}${bindir}/grep ${D}${base_bindir}/grep.${PN}
        mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep.${PN}
        mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep.${PN}
}

be changed into:

do_install_append () {
        install -d ${D}${base_bindir}
        mv ${D}${bindir}/grep ${D}${base_bindir}/grep.${PN}
        mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep.${PN}
        mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep.${PN}
}

of course something similar could be done for other autotools_* things like
this one:

do_configure () {
        autotools_do_configure
        cd ${S}

        # prevent libtool from linking libs against libstdc++, libgcc, ...
        cat ${TARGET_PREFIX}libtool | sed -e 's/postdeps=".*"/postdeps=""/'
> ${TARGET_PREFIX}libtool.tmp
        mv ${TARGET_PREFIX}libtool.tmp ${TARGET_PREFIX}libtool
}

Best regards, Frans.

