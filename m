Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Oy4xX-0006fs-5I
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 17:40:43 +0200
Received: by bwz2 with SMTP id 2so5579339bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=Fu354LQzfPEi80b5/tJLAD/pLc20CBK2pVETbXYY+GY=;
	b=JMBElj7gRKeq7CahAFAfF6ZULaUoX+nIfZMwtq+jztGhQLn7sQB+nWdxvZQ3c0CeQM
	HCnceEobfBAlu6lspVCYSjUAPTOZR/9zBuE4ozRl8eMHQWyua/AWJxUZ8IrfjkLOoc4x
	PAa3iGpmXaYLQVA3LUeGhrejbhitod8Reju5c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=Nr7QpFWSW4erUq09daPsiYDOvCB1P+aDx9O8eNUTQY7cimR7Kvdx6QQszDimcP8xLu
	zm3BMe1b1JmXA6pBX35Kstf4uqXNUBExIRWUQDLFBHgbjoaasrhxbhbiNtHKoAWUq0h9
	XjT/vm1VgOc2sHZsKY7XHFJH7b01QCM5sJku8=
Received: by 10.204.127.75 with SMTP id f11mr7981846bks.85.1285083639219;
	Tue, 21 Sep 2010 08:40:39 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f10sm7677295bkl.5.2010.09.21.08.40.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Sep 2010 08:40:38 -0700 (PDT)
Date: Tue, 21 Sep 2010 17:40:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100921154038.GC3403@jama>
References: <AANLkTikDibG-qAf2b9U_OuOLbVXNP8QWouTEN7z_v25_@mail.gmail.com>
	<20100921152505.GB3403@jama>
	<AANLkTikTrRMX-5UAso2BgJ8-XqhwtXTnS_vT2Yt4FNnc@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikTrRMX-5UAso2BgJ8-XqhwtXTnS_vT2Yt4FNnc@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: anyone working on recipes for qt 4.7.0 released?
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
X-List-Received-Date: Tue, 21 Sep 2010 15:40:44 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Sep 21, 2010 at 11:34:23AM -0400, Cliff Brake wrote:
> On Tue, Sep 21, 2010 at 11:25 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Tue, Sep 21, 2010 at 11:21:32AM -0400, Cliff Brake wrote:
> >> Qt 4.7.0 is now released:
> >>
> >> http://labs.qt.nokia.com/2010/09/21/qt-4-7-0-now-available/
> >>
> >> Is anyone working on recipes for this yet?  I've been trying to get
> >> 4.7.0-beta2 to build, so wondering if anyone has tried 4.7.0 released
> >> yet.
> >
> > 4.7.0-beta2 is building and working for me (SHR) fine, but no time to
> > work on 4.7.0 now, so would be great if someone else does that.
> 
> Just to verify and get a baseline, what all do you need to set to get
> 4.7.0-beta2 to build properly.  I'm trying:
> 
> ANGSTROM_QT_VERSION = "4.6.3+4.7.0-beta2"

Yes, I also had to use newer postgresql before (not sure if it's still
needed).

http://gitorious.org/~jama/angstrom/jama-shr-experimental/commit/5fcd20c6e939edfec27fccce1e92f82cf0a78b17

> Are you using the X11 or embedded version or Qt?

only X11 version

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


