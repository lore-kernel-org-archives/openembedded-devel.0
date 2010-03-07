Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NoFos-0001GN-JJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Mar 2010 13:42:58 +0100
Received: by fxm20 with SMTP id 20so5216466fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Mar 2010 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Nxav2A6gdq8S3pUXgCitrOay9TLPdCQqOBxCrOoWY90=;
	b=Mfi0cUAyCv5rJYbdfkeY2yPYPApoCC+vRVLSwguR2j/OB70KcMBPWuFllqiSHGr7O8
	vbIrKJsJ3NcCEhPzl1l7etZGTSeHopyKuKupdqFBCKDB9FeOxQveUWU+vpOdBxaJuaNZ
	AYNU36b6aOccRrxFidYwRUZjq3RloMuOTHTQE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AnDvPd336ff8/bC/nQWSBAEQmZ1m27fUFrlHZp61fbJpd++BXIErZtwZq1FC5+nq9v
	dP+vi+sVmC8S9TFbIBESuEh6fCyl36D4HsDWkoZLxvtANFnmSVWNA1lp6hMoojfOvn2r
	aRyWd4xbsQ+sts+sVKfZDNqztYZ0GjZBpIQko=
Received: by 10.223.58.83 with SMTP id f19mr1373985fah.88.1267965599726;
	Sun, 07 Mar 2010 04:39:59 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm2362930fxm.11.2010.03.07.04.39.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 07 Mar 2010 04:39:57 -0800 (PST)
Date: Sun, 7 Mar 2010 13:40:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100307124047.GH31945@jama>
References: <20100306193907.GA5881@xora-build.xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <20100306193907.GA5881@xora-build.xora.org.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Possible gtk+-native de-breakage
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
X-List-Received-Date: Sun, 07 Mar 2010 12:42:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 06, 2010 at 07:39:07PM +0000, Graeme Gregory wrote:
> Hi, I knocked this up while doing some enterprise java installs this after
> noon and Im too brain fried to deal with it and wont have time in next few
> days.
> 
> So can people checkout the attached patch/improve it.

I can confirm, that this patch solves
http://bugs.openembedded.org/show_bug.cgi?id=5405
as well as gtk+ demos build.

As RP said, maybe we should keep gdk-pixbuf-csource-native for those who
don't need whole gtk+, but for those like me who builds whole
gtk+-native because other apps it's better with
gdk-pixbuf-csource-native provider set to gtk+-native (to build it just
once).

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


