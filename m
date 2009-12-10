Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NIlDp-0006ey-LD
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 16:46:32 +0100
Received: by fxm8 with SMTP id 8so7056905fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2009 07:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=pxSjJp7RgN0TF/PTdMhmz+pUtBbw0EV5BEGUWL+uKpo=;
	b=rKaRvPhsCrnPchnMTm7MsWtU8iVJVtPn+3WeUor8j27EWmGlECoGibYaSCV4TijiDM
	+m8YRM8clx+bBw0d15x6qBv+g5rZSY2G/NU7HfBqeGt5PfRWWEQtRVliBGTFltzJMAB4
	mg7VKzN8ykbOcix6rLFFzH8gOwPMtQ8LGC2MU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=PTH1CWq4ISuI/f5vxTCVjFyNI4Xghhi4UYiTp66j3ActyyPHZAuzYdNhqJCM8IYJE+
	Il4qYNblQpJBqwNJOZb5KygvkZX4llu2/t8zxikFjfwlx1U9m45KntQfynENeFgXET14
	nb04WiSLnSsrh0Z3hiDbt8NtYFYP/mtET76LM=
Received: by 10.223.57.22 with SMTP id a22mr123130fah.4.1260459887244;
	Thu, 10 Dec 2009 07:44:47 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm367947fxm.10.2009.12.10.07.44.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Dec 2009 07:44:45 -0800 (PST)
Date: Thu, 10 Dec 2009 16:44:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: vivek tambakad <vivektambakad@gmail.com>
Message-ID: <20091210154452.GC3430@jama>
References: <ad82c8890912092210n31557da0lc913dcc16261d883@mail.gmail.com>
	<20091210102302.GB3430@jama>
	<ad82c8890912100314o3833d29esf4418a608fdca051@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ad82c8890912100314o3833d29esf4418a608fdca051@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Build error while using bitabake linphone
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
X-List-Received-Date: Thu, 10 Dec 2009 15:46:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 10, 2009 at 04:44:18PM +0530, vivek tambakad wrote:
> Hi Martin,
>            Thanks, GTK error is solved but with following MD5sums mismatch

Thanks for test, pushed in 79f05d8ff76b50edf55c079206d953f0e7c1b2b9

> error.
> ERROR: '/home/vivek/development/em-x270/stuff//openembedded/recipes/gnutls/
> gnutls_2.4.2.bb' failed
> ERROR: '/home/vivek/development/em-x270/stuff//openembedded/recipes/cups/
> cups_1.2.12.bb' failed

Try to remove tarballs from your local downloads directory, if that's
not enough you have to check if upstream really changed tarball without
name change or check other mirrors..

> > On Thu, Dec 10, 2009 at 11:40:22AM +0530, vivek tambakad wrote:
> > >        When i am compiling linphone it shows the following GTK error.
> >
> > > Please tell what changes i have to make in linphone bitbake file so that
> > it
> > > works fine.
> >
> > Can you try to build it with this gtk+ added to dependencies? If you
> > don't have it compiled already for some other recipe than its probably
> > missing in linphone (I guess that gthread is also provided by gtk+).
> >
> > Let me know if it was enough.. and I'll push that patch to repo.
> >
> > Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


