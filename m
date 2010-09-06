Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OsSjT-0000x5-Vo
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 05:51:00 +0200
Received: by pvg6 with SMTP id 6so1382425pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 20:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=K4wqX2UmLbqyUXrdjn5XAG+50PeOYZpC+1kNMGD8qps=;
	b=odVdNw4vdaCsAX15qiRLAAMAxbSlVj/I92596ibs/CkiI42/2PDBC5rvT/5MVHAjMV
	XcLfgZpd3PUaKQ5kNf+ig/ESa42seCUXlbP1XhMR0av6ccIQlx1VPpi2BCLBFK5b/Gt9
	5Urci2gHPHMjkt3qAY8FVsnd8FRvdfBNek3eg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=flSDQWqWiRKrYNSGcXjU1EqZ1sfDWN0B7g3TDDzZmBVURJZH5g4da87t1XMF2SSTZo
	Q8TIzNjEYBatfomLf/8QEwXCJ9M6Ul0ZBsDLu4ZPfmB4sq1N/GMBIpCIjfIMQDVgQxnQ
	jKghjMfI+4MYPvdCK7kzlU0cEFtDNtYXQ3qAU=
Received: by 10.142.125.3 with SMTP id x3mr2070716wfc.291.1283745020066;
	Sun, 05 Sep 2010 20:50:20 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 9sm3583512wfd.0.2010.09.05.20.50.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 05 Sep 2010 20:50:19 -0700 (PDT)
Date: Sun, 5 Sep 2010 20:50:02 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100906035002.GB5320@gmail.com>
References: <AANLkTimxWVes3DZQPGn53BZ1cL6BSX5BT3hwgFHrCUA4@mail.gmail.com>
	<AANLkTinBzdnAYv_0O=vXnaJ5VNj56Th74eZ=naVSFcFB@mail.gmail.com>
	<AANLkTikSBQOi6aC0W8QzfEOk6skMcBmbaJdmE4K+Auwd@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikSBQOi6aC0W8QzfEOk6skMcBmbaJdmE4K+Auwd@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: virtclass_install prepend
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
X-List-Received-Date: Mon, 06 Sep 2010 03:51:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (19/08/10 21:14), Frans Meulenbroeks wrote:
> 2010/8/19 Chris Larson <clarson@kergoth.com>:
> > On Thu, Aug 19, 2010 at 4:29 AM, Frans Meulenbroeks <
> > fransmeulenbroeks@gmail.com> wrote:
> >
> >> Hi,
> >>
> >> Found this in our reicpes:
> >>
> >> dbus/dbus-glib_0.86.bb:do_install_virtclass-native_prepend() {
> >>
> >
> > This prepends to do_install_virtclass-native, which will then replace
> > do_install when the overrides are applied.  This is prepending to a variable
> > which overrides, as opposed to the other, which is a conditional prepend.
> >  The two are quite different.  It's unlikely that this is what they
> > intended.  Far more likely that it should be changed to
> > _prepend_virtclass-native.
> 
> I have no idea what is intended and I have no dbus knowledge, so can't fix this.
> I'll leave it to someone else to resolve this.

I think the correct fix is as Chris suggested. Please go ahead and fix it.

> 
> Frans
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


