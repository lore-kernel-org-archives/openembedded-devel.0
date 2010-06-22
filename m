Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OR51q-0006Qv-5g
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 17:04:48 +0200
Received: by pxi2 with SMTP id 2so22732pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=JEhnh/DZmgwdFbXqu56KHZVWtTB1vkOp6fubW4MXEBQ=;
	b=CpwxdJE2QeK37NFR+oyG9tGExfdUE6VkaqM0ve7YSPHHsW7pGYYKnZOdVN0zJmziHd
	33jo4n5bk2kqvLIPWaxXlnmjZ2I2hN4FIq6CN1ljfkmnkYcGBGEoS9Pq/Bo7SKYfF89h
	KPG84Gr8Rk49zM9M0KDWYOTYMxYT/LwRJf+54=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=UwC3IuuxocDptxlFCcyCccu7z2GoOOGsYXZ/rKD+0OdLXY1TOgBsKdsSOj7xpBpE1e
	3ijWLQ9SF1KaaoROQalT3JFsyGEyFamGepkLac/PRbdb8UYrXzCbDEUusVyV5rOcJ/2w
	bbugo0BuTMy0FFfQaq3oTW62uVOxASpYWzIiI=
Received: by 10.143.177.5 with SMTP id e5mr5257042wfp.304.1277218475619;
	Tue, 22 Jun 2010 07:54:35 -0700 (PDT)
Received: from gmail.com ([99.57.141.118])
	by mx.google.com with ESMTPS id h18sm1862950wfg.13.2010.06.22.07.54.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Jun 2010 07:54:34 -0700 (PDT)
Date: Tue, 22 Jun 2010 07:55:37 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100622145537.GC32544@gmail.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CFB6@KCINPUNHJCMS01.kpit.com>
MIME-Version: 1.0
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CFB6@KCINPUNHJCMS01.kpit.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Qt-4.7.0.beta1 Missing or unbuildable dependency chain was: ['qt4-embedded-mkspecs']
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
X-List-Received-Date: Tue, 22 Jun 2010 15:04:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/06/10 11:35), Soumya R wrote:
> Hi All,
> 
>       I am trying to build Qt Embedded SDK for Qt-4.7.0.beta1.. when i run
> bitbake meta-toolchain-avn-qte i got the following error
> 
> 
> NOTE: Handling BitBake files: - (0169/0169) [100 %]
> NOTE: Parsing finished. 163 cached, 5 parsed, 1 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> ERROR: '['/home/likewise-open/KPIT/soumyar/openembedded/recipes/tasks/task-avn-qte-toolchain-target.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'qt4-embedded-mkspecs' but it wasn't found in any PACKAGE or RPROVIDES variables
> NOTE: Runtime target 'qt4-embedded-mkspecs' is unbuildable, removing...

I dont see this recipe in oe repo. Is it your own recipe ?

> Missing or unbuildable dependency chain was: ['qt4-embedded-mkspecs']
> NOTE: Runtime target 'task-avn-qte-toolchain-target' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['task-avn-qte-toolchain-target', 'qt4-embedded-mkspecs']
> ERROR: Required build target 'meta-toolchain-avn-qte' has no buildable providers.
> Missing or unbuildable dependency chain was: ['meta-toolchain-avn-qte', 'task-avn-qte-toolchain-target', 'qt4-embedded-mkspecs']
> 
>      It is asking for runtime dependencies  'qt4-embedded-mkspecs' how do I get these packages???
> 
> Thanks in advance:-)
> 
> 
> Regards,
> Soumya
> 
> This message contains information that may be privileged or confidential and is the property of the KPIT Cummins Infosystems Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Cummins Infosystems Ltd. does not accept any liability for virus infected mails.
> 
> 

Crap. You are talking on public mailing lists and these are archived. These notices dont make sense and in future make
sure that you strip them off when sending emails to public mailing lists.

> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


