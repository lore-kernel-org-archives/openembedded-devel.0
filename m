Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OMn2a-0005cN-2R
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 21:03:48 +0200
Received: by fxm9 with SMTP id 9so222657fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 11:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=p53o2O2o04ZExbe5zeDG5Y4X3y3DWJpl3Tmx4wKPIic=;
	b=ZIErbXlbLRZIUyBS1vqs2LVgmRuQ8oMYZzcOpQ20PeTQU7YsIzaqDbLNloLXjDO7Ej
	pyAYAnJzwuayjgD3ZiuX7Tf7e6fk7enrwPZvWLIg8YDdl2/CuMmHGqNJCyAhK1F6xIRa
	G697mc5kv16mAO0O0wcBFsM+E13APpwzmPZfw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=JVAOCWFqBXShIruEeU5BNg4dBDYRJtUvZ56qIOcZk7QNlELc++VfgluW3bUoRu4R7I
	pzV8BTPD+1IiUTiW7I2VX1Ihx3BgjWIzwpvzleubzUa3OFkeZH976lICKUvhalzAycFz
	B1mXb803r07LeNY1s1jiGRghGM7pWpI9TbWpk=
Received: by 10.223.22.145 with SMTP id n17mr817241fab.23.1276196365108;
	Thu, 10 Jun 2010 11:59:25 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e16sm1237045fak.8.2010.06.10.11.59.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Jun 2010 11:59:24 -0700 (PDT)
Date: Thu, 10 Jun 2010 20:59:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100610185913.GP1403@jama>
References: <1276178833-30841-1-git-send-email-Martin.Jansa@gmail.com>
	<201006102153.49588.roman@khimov.ru>
MIME-Version: 1.0
In-Reply-To: <201006102153.49588.roman@khimov.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] recipes: conform to OE packaging guidelines with RSUGGESTS/RPROVIDES/RCONFLICTS/RREPLACES
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
X-List-Received-Date: Thu, 10 Jun 2010 19:03:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jun 10, 2010 at 09:53:49PM +0400, Roman I Khimov wrote:
> В сообщении от Четверг 10 июня 2010 18:07:13 автор Martin Jansa написал:
> > * even worse than last RDEPENDS/RRECOMMENDS change, because now ie:
> >   opkg info coreutils-doc
> >   Provides: textutils, shellutils, fileutils
> >   Replaces: textutils, shellutils, fileutils
> > 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> Any chance to automatically bump PR for all packages touched?

Hmm maybe it wont be so difficult.. I'll send patch bumping it in
"common" cases.. (hopefully about 95% coverage and remaining recipes can
be checked manually..)


-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


