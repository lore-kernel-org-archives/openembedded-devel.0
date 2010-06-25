Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORx0z-0007Cx-Ga
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 02:43:29 +0200
Received: by pxi2 with SMTP id 2so1246547pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 17:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=CdgH+UxQm+rwQYE3v9iBTOpOwPiFtq3cAZCzwg2nxXE=;
	b=gjD8Ij/7Y0DIoUqYVLNeg4Ne8XbBvZQ5f2AFdfz75aiZWAaaY6ckKLc3/raL3pFgnL
	0+hQW/BFvWZxr+818lNyJfViplW3SYbG4pHK19uKfCf5K/Hte9MYCxgXVFm+4X+/RDwn
	uf4WP0zEvFZvz3H28eNnT+wJ2YJdcks+H0F4g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dzgGfjdF4+jd7L88q7zxpjVm8AF9D9+Vuim2187n5AAbtAYQTVB5snFx0ABzfFYxJU
	hKI2Nu8/39tSh4C5pkix4RYmArCmM67fnEiABpff5i8nVynKyBbmI4KKnHVLOpGiPWbP
	B7Atkxc+RDK6pARSguNpZ9pDav2BsTV+suhMQ=
Received: by 10.143.169.5 with SMTP id w5mr9934835wfo.222.1277426330368;
	Thu, 24 Jun 2010 17:38:50 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v41sm4848700wfh.21.2010.06.24.17.38.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 17:38:49 -0700 (PDT)
Date: Thu, 24 Jun 2010 17:39:53 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100625003953.GA27649@gmail.com>
References: <46D92548-C16C-4F1F-9924-946EDAE2EDAA@pilsoft.com>
MIME-Version: 1.0
In-Reply-To: <46D92548-C16C-4F1F-9924-946EDAE2EDAA@pilsoft.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: What is the best way to remove gnome-vfs dependency from gst-plugins-base ?
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
X-List-Received-Date: Fri, 25 Jun 2010 00:43:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/06/10 01:36), David Hemmo wrote:
> Hello All,
> 
> If the answer is read the documentation and you can give me a pointer, it will be enough :-)
> 
> The standard gst-plugins-base recipe depends on gnome-vfs, but if I add --disable-gnome_vfs to configure, that dependency becomes useless.
> 
> Is there a way to add this configuration option and remove the dependency for my specific case without changing the recipe ?

I dont think so. However you can override the recipe in your own collection.

> 
> Thanks
> 
> David Hemmo
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


