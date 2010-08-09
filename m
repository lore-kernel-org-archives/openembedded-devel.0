Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OiZb4-0005fH-NG
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 23:09:28 +0200
Received: by fxm6 with SMTP id 6so309725fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 14:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=9Hk5PAu9FMVu3RTqtC2Dd2iwnsZkFABaN0Eq3XMR144=;
	b=MeDn6O/FWGgNUNNfIae9Hf8aR+lfu8DV/HgUxthwRmJUFqIQ2cupLvQxccdqTcJElH
	PvqP4edBi2DjF/shBQ6MAgf3XUj+HxGOFHfhsqV442UGAgquZCgwEZDowf7yi5z9GvK2
	/Ay5bpmHukPJSMujz8C01P2PlV60FvAuKW9Yk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=vr7GrrszLnF/XgLa1MdwLnQA8z4M2bpFq0ZpLQSM5c5PZxxG7xVdfDi9T/SEglmVZ7
	gcqH5fC4BPaTPr3OiBJl0QrDu/DrxDsSbn8VzckWd2jr7M00KzHVGTFzrPZ6o4TClirg
	owY+I9BIzhXKo9htFh8oZ3oDRU+c6HL+akJ5E=
Received: by 10.223.122.147 with SMTP id l19mr17103668far.83.1281388156244;
	Mon, 09 Aug 2010 14:09:16 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r8sm2015752faq.10.2010.08.09.14.09.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 09 Aug 2010 14:09:15 -0700 (PDT)
Date: Mon, 9 Aug 2010 23:09:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100809210919.GB4396@jama>
References: <AANLkTi=nDHL13_Yw7g-2B9XMedBevoemY+wyU4a=i1Y+@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=nDHL13_Yw7g-2B9XMedBevoemY+wyU4a=i1Y+@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: oe-stylize
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
X-List-Received-Date: Mon, 09 Aug 2010 21:09:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2010 at 09:45:35PM +0200, Frans Meulenbroeks wrote:
> Some questions wrt oe-stylize:
> 
> Do we still want to promote this?
> 
> If so, it seems useful to add the new keywords that have been
> introduced last year or so.
> 
> Also a few issues:
> oe-stylize moves the checksums immediately after the SRC_URI.
> Is this desired? Most of the recipes have them near the end.

That's mostly because I moved them with script and appending was much
easier than including just after SRC_URI. But immediately after looks
better IMHO.

> And I noticed that the script moves require lines.
> I'm not too sure if that is ok. By moving them it is possible that
> overriding variables (like depends) are moved from after the requires
> to before the requires.
> Is this a problem?

It is, I always check the resultin recipes and for big batch oe-stylize
calls I update that script a bit to keep require/include where I need
those.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


