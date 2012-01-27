Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Rqnp9-0000wP-Hu
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Jan 2012 16:34:47 +0100
Received: by bkaq10 with SMTP id q10so1517197bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2012 07:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tu9qCC5tIrtow/HhqcRUU2ZI/DRagK/VXNv8c3f4F/I=;
	b=PZqc+QzPRhYS8BXBkrDSgrbnUTfIs/5IbGr/MhasYCStowg/1HkvX/+G9ZQxaL9jWO
	3LOrE8zSwfbroPHQsYp7bpQBXL78KgSYtVgpIDQxrg7ji6UwHuscCWvf7gQCc3HTFejo
	pBitbghqZ8XdlKpNO0t2xyvC03EfGFxT+smEA=
Received: by 10.204.130.129 with SMTP id t1mr3252973bks.33.1327673937089;
	Fri, 27 Jan 2012 06:18:57 -0800 (PST)
Received: from localhost.localdomain (mx2.promwad.com. [195.222.87.218])
	by mx.google.com with ESMTPS id z15sm13571182bkd.7.2012.01.27.06.18.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 06:18:56 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <yauhen.kharuzhy@promwad.com>)
	id 1Rqmdg-0004lF-8Z; Fri, 27 Jan 2012 17:18:52 +0300
Date: Fri, 27 Jan 2012 17:18:52 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120127141852.GA17935@jeknote.loshitsa1.net>
References: <20120126054457.GE5566@sakrah.homelinux.org>
	<1327611041-7681-1-git-send-email-yauhen.kharuzhy@promwad.com>
	<20120127130311.GA18521@mi.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <20120127130311.GA18521@mi.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2] Add recipe for krb5
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
X-List-Received-Date: Fri, 27 Jan 2012 15:34:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 27, 2012 at 02:03:11PM +0100, Henning Heinold wrote:

> > +krb5_do_unpack() {
> > +	tar xzf ${WORKDIR}/krb5-1.8.5.tar.gz -C ${WORKDIR}/
> > +}
> How do this differ from the unpack in the normal classes?
> 
> Are you able to clean it up?
krb5 release tarball contains two files: signature and release tarball :)

> > +
> > +python do_unpack() {
> > +	bb.build.exec_func('base_do_unpack', d)
> > +	bb.build.exec_func('krb5_do_unpack', d)
> > +}
> > +
> > +do_configure() {
> > +	oe_runconf
> > +}
> > +
> > +SRC_URI[md5sum] = "48b17caedf19d07d714a8d7a25422c95"
> > +SRC_URI[sha256sum] = "7d6989efaaf0b3330ce5b329edb1d0bf33250ca78b789fdd117e02c49c238812"
> > -- 
> > 1.7.7.6
> > 
> 
> Did you check if it is a version which do not have security bugs?

1.8.5 is latest maintenance release of 1.8 branch (02 Nov 2011). Maybe
1.9.2 is more suitable for OE, but we tested 1.8 as our customer
required.

-- 
Yauhen Kharuzhy
-----------------------------------------------------------
Promwad Innovation Company
22, Olshevskogo St.
Office 809
220073, Minsk, Belarus
Phone/Fax: +375 (17) 312-1246
E-mail: yauhen.kharuzhy@promwad.com
Skype: jekhor
Web: www.promwad.com


