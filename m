Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PHKHm-0005wp-GP
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 18:53:11 +0100
Received: by fxm11 with SMTP id 11so2683758fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Nov 2010 09:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=iijXgpQGL/EDSv0ZpffnKra4RyHAF7ducXUUqvBYROQ=;
	b=aNR6cv/yAWY7690EcFe796yOt9lMSEbHEzSbFS9KGwv/j6qqx36iuHJNClrq5bJmDb
	/B5/7Gbx3TVHjM0OlndEMiIgFYvpO7sfGJtWQMZjWWey4lKOCRj49d3lpLatVWhUsqTS
	m1NJCO8IUcXDXiyNuMLycLggPFzpuvHuS15dY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=SjpGjr2S76QgNi78UJz7myKtw2dtphYrGOg56teXgXZhIQRBB8pAbjSpsV+93/8qUJ
	sc2PG+Vj7+7Yc6InrfnsY/7DZSuYD6pK38ps8laQbuJPthVApsrtfSDpZDjgKXXNyKqD
	QJ87cdtP8xGMiW2i41GhAn20xw7Xr1Ze+i7wU=
Received: by 10.223.72.198 with SMTP id n6mr2860060faj.125.1289670728805;
	Sat, 13 Nov 2010 09:52:08 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y13sm384512fah.2.2010.11.13.09.52.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 13 Nov 2010 09:52:07 -0800 (PST)
Date: Sat, 13 Nov 2010 18:51:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101113175148.GN3843@jama>
References: <E1PHKJt-0002MF-FQ@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1PHKJt-0002MF-FQ@melo.openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Tom Rini : unzip-native: Fix name
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
X-List-Received-Date: Sat, 13 Nov 2010 17:53:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 13, 2010 at 05:55:21PM +0000, git version control wrote:
>  	install -d ${D}${mandir}
>  	mv ${D}${prefix}/man/* ${D}${mandir}
> +
> +do_install_append_pn-unzip() {
>  	mv ${D}${bindir}/unzip ${D}${bindir}/unzip.${PN}
>  }

Looks like missing }

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


