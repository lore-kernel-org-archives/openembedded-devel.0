Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PSV5L-00009f-TQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 14:38:32 +0100
Received: by fxm11 with SMTP id 11so647702fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 05:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=EtbYH/VyhpK6Qup26mcVhD7hBoL0k6fE3ZSLbAnEWCo=;
	b=h/b9uW1oDTxJZUqLiaGjLhVxNirILjKXw+73NjmAxXwV/C+zW+/FUA7SSaVb4qyneL
	zMA8VeWyR6sYbLSuWy8/NUispyqcQ1SE9SwqyEkQGH5b8MyNp6F30eIHlIWojycAqMwF
	7E2Mmc3wS6QIRHNWz+JJXd6uTRokWDe1mwK0g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FZITXjSz/rH7gdTgcE5/VRI9bCRK0Twusr+wq2W4LxLdy60OFJCMS8Pf12vw9N4Ada
	BQASqWfDDxJX0znzdOiDe2cLb6ztgCDA9zLMUlsX7pB4gqPvlaND9i+Tb3Fmzo+n/zkg
	fPY+cne1nAnCCpwrmr5xtdkCG66GToVzvBXEA=
Received: by 10.223.96.69 with SMTP id g5mr1341958fan.64.1292333814631;
	Tue, 14 Dec 2010 05:36:54 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o17sm2123125fal.25.2010.12.14.05.36.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 14 Dec 2010 05:36:53 -0800 (PST)
Date: Tue, 14 Dec 2010 14:37:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101214133729.GE6662@jama>
References: <E1PR45K-0000jK-SU@melo.openembedded.org>
	<01EE9A12-BE87-4EF6-9F0B-EAA20A1DBAAE@vanille-media.de>
	<4D077186.2050708@balister.org>
MIME-Version: 1.0
In-Reply-To: <4D077186.2050708@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Philip Balister : i2c-tools : Stage i2c-dev.h header as i2c-dev-user.h.
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
X-List-Received-Date: Tue, 14 Dec 2010 13:38:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 14, 2010 at 08:30:46AM -0500, Philip Balister wrote:
> On 12/14/2010 07:06 AM, Dr. Michael Lauer wrote:
> > Am 10.12.2010 um 15:36 schrieb git version control:
> >
> >> Module: openembedded.git
> >> Branch: org.openembedded.dev
> >> Commit: 48e6a063370a38a35f31a28efd8f6ce6ebf00840
> >> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=48e6a063370a38a35f31a28efd8f6ce6ebf00840
> >>
> >> Author: Philip Balister<philip@balister.org>
> >> Date:   Fri Dec 10 09:31:01 2010 -0500
> >>
> >> i2c-tools : Stage i2c-dev.h header as i2c-dev-user.h.
> >>
> >> Thanks to John Faith for suggesting this approach on the ML. The problem is
> >> i2c-tools overwrites the header staged by the kernel. This breaks programs
> >> that depend on the kernel header.
> >
> > I don't think this a good solution. Now all programs break which expect
> > this very i2c-dev.h as being staged by i2c-tools. Interestingly, the
> > desktop distros don't bother about staging it differently, so why
> > can't we do the same? Besides, the i2c-dev.h as staged by i2c-tools
> > is supposed to be a superset. If it isn't we should complain with the
> > i2c-tools developers.
> >
> > What can we do in the meantime?
> 
> Can we get a survey of how other distros handle the situation?

Gentoo
i2c-tools-3.0.[012] (all versions)
src_install() {
    emake install prefix="${D}"/usr || die
    rm -rf "${D}"/usr/include # part of linux-headers
...
}

so it's not part of i2c-tools package (gentoo doesn't have concept of
-dev packages as it's always usefull to have all -dev stuff on source
based distribution).

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


